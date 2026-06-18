# Mappningsprinciper: RIVTA-tjänstekontrakt → FHIR

## 1. Förberedelse

Innan mappning påbörjas behöver du:
- Logiska modeller och beskrivning från Ineras tjänstekatalog
- Identifierad motsvarande FHIR R4-resurstyp
- EU EPS obligations-profilen för resursen (paket `hl7.fhir.eu.eps`)
- IPS-profilen för resursen (paket `hl7.fhir.uv.ips`)
- HL7 Sweden basprofiler (paket `hl7se.fhir.base`, canonical `http://hl7.se/fhir/ig/base`)

---

## 2. EU EPS och IPS som grund

- **Ärv från IPS-profilen** för resursen om en sådan finns (`Parent: Condition-uv-ips` etc.)
- **EU EPS obligations-profilen** (`{resurs}-obl-eu-eps`) sätts i `meta.profile` vid runtime — den behöver inte vara `Parent` i FSH, men alla obligatoriska krav i den ska uppfyllas
- **Frivilliga element** i EU EPS/IPS (rekommenderade kodverk, extensions, slicings) ska nyttjas om tjänstekontraktet har semantiskt motsvarande data
- Varje producerad resurs bär **två profiler** i `meta.profile`: vår EHDS-TK-profil + EU EPS obligations-profilen

---

## 3. Patient, Practitioner, Organization

### Patient
- Skapa en **SEEHDSPatient-profil** med `Parent: Patient-uv-ips` (IPS Patient)
- Lägg till svenska identifier-slicar manuellt i enlighet med SEBasePatient (HL7 Sweden basprofiler):
  - `personnummer` — system `http://electronichealth.se/identifier/personnummer`
  - `samordningsnummer` — system `http://electronichealth.se/identifier/samordningsnummer`
  - `nationelltReservnummer` — system `http://electronichealth.se/identifier/nationelltReservnummer`
- **Viktigt:** Använd **inte** `Reference(SEBasePatient)` direkt om resursen ärver från IPS — IPS låser subject till `Reference(Patient-uv-ips)` och SEBasePatient ärver från bas-Patient, inte IPS Patient

### PractitionerRole
- Referera alltid `Reference(SEBasePractitionerRole)` från `hl7se.fhir.base`
- SEBasePractitionerRole har en `hsaid`-slice med system `urn:oid:1.2.752.29.4.19`
- Definiera **inga egna identifier-underregler** på PractitionerRole-referensen — slicingen ärvs från SEBasePractitionerRole

### Organization
- Referera `Reference(SEBaseOrganization)` från `hl7se.fhir.base`

---

## 4. Terminologi och kodverk

### Officiella URL:ar
Använd alltid officiella URL:ar för kodverk — **aldrig** OID-form som `urn:oid:...` för kodsystem:

| Kodverk | URL |
|---|---|
| ICD-10-SE | `https://www.icd10.se/` |
| SNOMED CT SE | `http://snomed.info/sct\|http://snomed.info/sct/45991000052106` |
| Ineras kodverk (t.ex. kv_diagnostyp) | `https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/{kodverksnamn}` |
| LOINC | `http://loinc.org` |
| HSA-id (HL7 Sweden basprofiler) | `urn:oid:1.2.752.29.4.19` |
| HSA-id (Inera NTjP/RIVTA) | `urn:oid:1.2.752.129.2.1.4.1` |
| Personnummer | `http://electronichealth.se/identifier/personnummer` |
| Samordningsnummer | `http://electronichealth.se/identifier/samordningsnummer` |

### Slicings vid överlappning
- Om FHIR-resursen har ett **obligatoriskt/rekommenderat** valueset på ett element: skapa en **slicing** där det svenska kodverket utgör ett eget namngivet snitt
- Om FHIR-resursen **saknar** fast binding: det svenska kodverket sätts direkt utan slicing

### Namngivning
- ValueSet och CodeSystem namnges efter kodverket, t.ex. `SEDiagnosisTypeVS` för kv_diagnostyp
- **CodeSystem med extern officiell URL** definieras alltid som `Instance: … InstanceOf: CodeSystem` — använd **inte** `CodeSystem:`-syntax med `* ^url = "..."` (SUSHI v3.20 tolkar `^url` på CodeSystem som en canonisk referens-lookup och kastar ett fatalt fel)

---

## 5. Profildefinition (FSH)

### Identifiering
```
Profile: SEEHDS{Resurstyp}
Parent: {IPS-profil eller FHIR-basresurs}
Id: se-ehds-{resurstyp-kebab}
```
Canonical URL auto-genereras som `https://fhir.inera.se/StructureDefinition/se-ehds-{id}`.

### Must Support och beskrivning
Varje element som mappas från tjänstekontraktet ska:
- Märkas `MS`
- Ha `^short` med klartext och RIVTA-fältnamnet, t.ex.:
  ```fsh
  * recordedDate MS
  * recordedDate ^short = "Registreringsdatum (diagnosisHeader.documentTime från RIVTA)"
  ```

### Kardinalitet
Om tjänstekontraktet kräver ett fält (1..1 eller 1..*) ska profilen skärpa FHIR:s kardinalitet i enlighet med detta.
Tjänstekontrakt har ofta fältregler i fritext som ofta fångar fler obligatorier än vad logiska modellen uttrycker. 


### Extensions
- Använd **befintliga** IPS/EU EPS-extensions före Inera-egna
- Om en Inera-extension ändå behövs: definiera den med `Extension:`-syntax (caret-url auto-genereras korrekt för Extension, till skillnad från CodeSystem)

---

## 6. PatientSummaryHeader-mappning

Alla tjänstekontrakt med `PatientSummaryHeader` (eller motsvarande header) mappas enligt detta fasta mönster:

| Header-fält | FHIR-destination | Syfte |
|---|---|---|
| `patientId` | `{Resurs}.subject.identifier` | Personnummer/samordningsnummer via OID→URI |
| `sourceSystemHSAId` | `{Resurs}.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `documentTime` | `{Resurs}.recordedDate` (eller resursens primära tidsstämpel) | YYYYMMDDHHMMSS → ISO 8601, tolkas som Europe/Stockholm |
| `accountableHealthcareProfessional` | `{Resurs}.recorder` eller `author` (Reference(SEBasePractitionerRole)) | Ansvarig hälso- och sjukvårdspersonal |
| `legalAuthenticator` | `{Resurs}.asserter` eller `authenticator` (Reference(SEBasePractitionerRole)) | Rättslig äkthetsintygsgivare |
| `legalAuthenticator` (datum) | `{Resurs}.extension[assertedDate]` | YYYYMMDD → YYYY-MM-DD |
| `careProviderHSAId` | `Provenance.agent[custodian].who.identifier` | Juridiskt ansvarig vårdgivare — yttre Sparr |
| `careUnitHSAId` | `Provenance.agent[author].who.identifier` | Informationsägare vårdenhet — inre Sparr |
| `approvedForPatient = false` | `{Resurs}.meta.security` kod `NOPATIENT` | PDL — information ej avsedd att visas för patient (se avsnitt 10) |

> `recorder`/`asserter` används för Condition. `author`/`authenticator` används för DocumentReference. Välj det fält i FHIR-resursen som semantiskt bäst motsvarar rollen.

PractitionerRole uttrycks alltid som **logisk referens** via HSA-id:
```json
{ "identifier": { "system": "urn:oid:1.2.752.29.4.19", "value": "{hsaId}" } }
```

---

## 7. Provenance

En `Provenance`-resurs skapas per FHIR-resurs och inkluderas i sökbundeln med `searchMode = include`.

| Agent | Roll | Källa |
|---|---|---|
| `agent[0]` | `custodian` | `careProviderHSAId` |
| `agent[1]` | `author` | `careUnitHSAId` |
| `agent[2]` | `assembler` | `EHDS_BRIDGE_HSA_ID` (env-variabel) |

- `Provenance.target` refererar resursen via `urn:uuid:{resurs.id}`
- `Provenance.recorded` sätts till `documentTime` (ISO 8601 + UTC)

---

## 8. Leverabler per tjänstekontrakt

| Artefakt | Placering |
|---|---|
| Profil | `input/fsh/profiles/SEEHDS{Resurs}.fsh` |
| CodeSystem (extern URL) | `input/fsh/codesystems/{Namn}CS.fsh` — Instance-syntax |
| ValueSet | `input/fsh/valuesets/{Namn}VS.fsh` |
| ConceptMap (vid kodtransformation) | `input/fsh/conceptmaps/{Mappning}Map.fsh` |
| Mappningssida | `input/pagecontent/mapping-{kontraktnamn}.md` |
| Uppdatera OID-tabell vid nya OID:er | `input/pagecontent/naming-systems.md` |
| Menypost | `input/includes/menu.xml` + `sushi-config.yaml` pages-sektion |

### Mappningssidan ska innehålla
- Mappningstabell (RIVTA-element → FHIR-element → Kommentar)
- Avsnitt om healthcareProfessionalType → PractitionerRole (om tillämpligt)
- OID-till-URI-tabell
- Provenance-tabell med agentroller
- Sparr-avsnitt (yttre/inre)
- PoC-begränsningar

---

## 9. Fattade designbeslut

Dessa beslut har fattats under implementationsarbetet och dokumenteras här som referens.

### PDL-001 – approvedForPatient

`approvedForPatient = false` (1..1 boolean i alla PatientSummaryHeader-kontrakt) mappas till `{Resurs}.meta.security` med kod `NOPATIENT` från `http://terminology.hl7.org/CodeSystem/v3-ActCode`. Kod `NOPATIENT` signalerar att resursen inte ska visas för patienten via t.ex. 1177.

```json
"meta": {
  "security": [
    {
      "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "code": "NOPATIENT"
    }
  ]
}
```

För GetObservations gäller samma semantik men med `confidentialityIndicator` som källa för skyddad identitet (se mappningssida).

### OBS-001 – Variabelprecisions-tidsstämpel (ts)

`observationBody.observationValue.ts` och `observationBody.time.ts` är RIVTA `ts`-strängar med variabel precision. Beslutad hantering:

| Precision | Fält | FHIR-hantering |
|---|---|---|
| `YYYY` eller `YYYYMM` | `observationValue.ts` | `Observation.valueString` (behålls som sträng) |
| `YYYYMMDD` | `observationValue.ts` | `Observation.valueDateTime` (konverteras till `YYYY-MM-DD`) |
| `YYYYMMDDHHMMSS` | `observationValue.ts` | `Observation.valueDateTime` (ISO 8601 + Europe/Stockholm) |
| `YYYYMMDD` eller fullständig | `time.ts` | `Observation.effectiveDateTime` |
| `YYYY` eller `YYYYMM` | `time.ts` | `Observation.effectiveDateTime` med `_effectiveDateTime.extension[originalText]` för att bevara källsträngen |

### OBS-002 – valueNegation

`observationBody.valueNegation = true` mappas till `Observation.dataAbsentReason.coding.code = "not-detected"` från `http://terminology.hl7.org/CodeSystem/data-absent-reason`. `value[x]` utelämnas.

### OBS-003 – observationStatus ConceptMap

SNOMED CT-koder (urvals-id `56431000052106`) → FHIR `ObservationStatus`:

| SNOMED CT | Display | FHIR |
|---|---|---|
| `385676005` | Under utförande | `preliminary` |
| `385651009` | Slutlig | `final` |
| `272393004` | Korrigerad | `amended` |
| `59776000` | Avbeställd/annullerad | `cancelled` |
| `444301002` | Avböjd av patient | `cancelled` |

ConceptMap finns i `input/fsh/conceptmaps/ObservationStatusMap.fsh`. Okänd kod → `unknown` + `OperationOutcome`-varning.

### OBS-004 – targetSite (0..*)

`observationBody.targetSite` är `0..*` i TKB men `Observation.bodySite` är `0..1` i FHIR R4. Beslutad hantering:

1. `targetSite[0]` → `Observation.bodySite`
2. `targetSite[1..*]` → `Observation.extension[additionalBodySite]` (lokal extension)

Extension `additionalBodySite` är en övergångslösning för FHIR R4. I FHIR R5 är `Observation.bodySite` `0..*` och extensionen behövs ej längre — ta bort vid R5-migration.

### FUNC-001 – PADL-poster

`functionalStatusAssessmentBody.padl[*]` mappas till `Condition.note` med formatet `[typeOfAssessment]: assessment` per post. Alternativet med separata `Observation`-resurser per PADL-post ger bättre strukturerbarhet men ökar resurskomplexiteten och kan omprövas vid behov av strukturerad PADL-sökning.

---

## 10. Checklista

- [ ] SUSHI: 0 errors
- [ ] `meta.profile` innehåller vår profil + EU EPS obligations-profil
- [ ] Alla mappade fält har `MS` och `^short` med RIVTA-fältnamn
- [ ] Inga `* ^url`-regler på `CodeSystem:`-syntax (använd Instance-syntax)
- [ ] Alla kodverk-URL:ar är officiella (ej `urn:oid:` för kodsystem)
- [ ] `subject only Reference(SEEHDSPatient)` — inte SEBasePatient eller bas-Patient
- [ ] `recorder`/`asserter`/`author`/`authenticator only Reference(SEBasePractitionerRole)`
- [ ] Provenance-mönstret med tre agenter är implementerat
- [ ] Kardinalitet från RIVTA (1..1, 1..*) är överfört till profilen
- [ ] `approvedForPatient = false` → `meta.security` kod `NOPATIENT` (se avsnitt 9)
- [ ] ig.ini pekar på `ImplementationGuide-{id}.json` (filnamn genereras från `id`-fältet i sushi-config, inte `name`)
