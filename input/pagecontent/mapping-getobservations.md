# GetObservations – Kliniska observationer och mätvärden

**Tjänstekontrakt:** `clinicalprocess:healthcond:basic` GetObservations v2.0  
**FHIR-profil:** [SEEHDSObservationGrowth](StructureDefinition-se-ehds-observation-growth.html) (parent: IPS Observation-results)  
**Logisk modell:** [SEEHDSLMObservations](StructureDefinition-se-ehds-lm-observations.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Kliniska mätresultat och tillväxtdata

> **OBS – Avvikande headerstruktur:** GetObservations använder en specifik headertyp som
> **inte** är `PatientSummaryHeader`. Det finns inget `careProviderHSAId`/`careUnitHSAId`
> på toppnivå i headern. PDL- och Sparr-fält hanteras separat – se avsnitt
> [PDL och Sparr](#pdl-och-sparr) nedan.

---

## Datamodell – översikt

Tjänstekontraktet returnerar en lista med `observations 0..*`. Varje observation
består av ett `header`-element och ett `observationBody`-element:

```
observations [0..*]
  header [1..1]
  observationBody [1..1]
    observationId          [1..1]  Identifier
    registrationTime       [1..1]  instant
    observationType        [0..1]  CodeableConcept
    observationValue       [1..1]  (XOR-union, se nedan)
      cv                   [0..1]  CodeableConcept
      pq                   [0..1]  Quantity
      ivlpq                [0..1]  Range
      ts                   [0..1]  string  (variabelprecisions-tidsstämpel)
      ivlts                [0..1]  Period
      st                   [0..1]  string
      intValue             [0..1]  integer
    scale                  [0..1]  CodeableConcept
    observationStatus      [1..1]  CodeableConcept  (SNOMED CT urvals-id 56431000052106)
    targetSite             [0..*]  CodeableConcept
    description            [0..1]  string
    time                   [0..1]  (TimeType: ts 0..1 string | ivlts 0..1 Period)
    valueNegation          [1..1]  boolean
    patient                [1..1]  PatientInformationType
      patientId            [0..1]  Identifier
      person               [1..1]  (personId, givenName, surname, gender, dateOfBirth, …)
    participation          [0..*]  BackboneElement
    relation               [0..*]  BackboneElement
```

---

## Mappningstabell

### Header

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header` (headertyp specifik för GetObservations) | 1..1 | — | Ej standard `PatientSummaryHeader`; se avsnitt PDL och Sparr |

### observationBody – identitet och tidpunkt

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationId.extension` | 1..1 | `Observation.identifier.value` | Unikt id satt av källsystemet |
| `observationBody.observationId.root` | 1..1 | `Observation.identifier.system` | OID för vårdgivarens HSA-id; format `urn:oid:{root}` |
| `observationBody.registrationTime` | 1..1 | `Observation.issued` | Dokumentationstidpunkt; YYYYMMDDHHMMSS → ISO 8601 (se GENERAL-001) |

### observationType – klassificering och kod

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationType` | 0..1 | `Observation.category` | Klassificering av observationstyp |
| `observationBody.observationType` | 0..1 | `Observation.code` | Koden används dubbelt: som kategori och som Observation.code om ingen separat kod finns |

### observationValue – XOR-union av värdetyper

Exakt ett av nedanstående fält används per observation (XOR). FHIR-elementet väljs
baserat på vilken gren som är populerad i källdata.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationValue.cv` | 0..1 | `Observation.valueCodeableConcept` | Kodad observation |
| `observationBody.observationValue.pq` | 0..1 | `Observation.valueQuantity` | Numeriskt värde med enhet (UCUM) |
| `observationBody.observationValue.ivlpq` | 0..1 | `Observation.valueRange` | Intervall av Quantity-värden |
| `observationBody.observationValue.ts` | 0..1 | `Observation.valueString` | Variabelprecisions-tidsstämpel som sträng – **kan ej mappas till dateTime** (se OBS-001) |
| `observationBody.observationValue.ivlts` | 0..1 | `Observation.valuePeriod` | Tidsintervall |
| `observationBody.observationValue.st` | 0..1 | `Observation.valueString` | Fritextsvar |
| `observationBody.observationValue.intValue` | 0..1 | `Observation.valueInteger` | Heltalsvärde |

### Negation och frånvaro av värde

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.valueNegation` | 1..1 | `Observation.dataAbsentReason` | Om `true` sätts `dataAbsentReason`; se OBS-002 |

### Status

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationStatus` | 1..1 | `Observation.status` | SNOMED CT (urvals-id 56431000052106) → FHIR ObservationStatus; kräver ConceptMap, se OBS-003 |
| `observationBody.scale` | 0..1 | `Observation.method` | Mätskala eller mätmetod |

### Anatomisk lokalisation

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.targetSite[0]` | 0..1 | `Observation.bodySite` | Endast första elementet mappas; FHIR är 0..1, se OBS-004 |
| `observationBody.targetSite[1..*]` | 0..* | `Observation.note.text` (tillägg) | Överskjutande lokaliseringar noteras i fritexter |

### Beskrivning och kommentar

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.description` | 0..1 | `Observation.note.text` | Klinisk fritext |

### Effektiv tid

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.time.ts` | 0..1 | `Observation.effectiveDateTime` | Variabelprecisions-sträng; konverteras till ISO 8601 (se GENERAL-001) |
| `observationBody.time.ivlts` | 0..1 | `Observation.effectivePeriod` | Tidsintervall för observationen; XOR med `time.ts` |

### Patient

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.patient.person.personId.extension` | 0..1 | `Observation.subject.identifier.value` | Personnummer eller samordningsnummer (föredragen källa) |
| `observationBody.patient.person.personId.root` | 0..1 | `Observation.subject.identifier.system` | OID→URI-konvertering, se tabell nedan |
| `observationBody.patient.patientId.extension` | 0..1 | `Observation.subject.identifier.value` | Alternativ om `person.personId` saknas |
| `observationBody.patient.patientId.root` | 0..1 | `Observation.subject.identifier.system` | OID→URI |
| `observationBody.patient.person.givenName` | 0..1 | *(ej FHIR Observation)* | Lagras ej i Observation; kan bifogas i Patient-resurs om skapad |
| `observationBody.patient.person.surname` | 0..1 | *(ej FHIR Observation)* | Se ovan |
| `observationBody.patient.person.gender` | 0..1 | *(ej FHIR Observation)* | Se ovan |
| `observationBody.patient.person.dateOfBirth` | 0..1 | *(ej FHIR Observation)* | Se ovan |
| `observationBody.patient.person.confidentialityIndicator` | 0..1 | `Observation.meta.security` | Skyddade uppgifter – `http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R` |

### Utförare (participation)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].healthcareProfessional` | 0..* | `Observation.performer` (Reference(PractitionerRole)) | En post per participation; logisk referens via HSA-id |
| `observationBody.participation[*].participationType` | 0..* | `Observation.performer.extension[participationType]` | Roller t.ex. utförare, ansvarig; lokalt kodverk |
| `observationBody.participation[*].authorTime` | 0..* | `Observation.issued` (om ej redan satt) | Tidpunkt för medverkan |

### Relationer (relation)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.relation[*]` | 0..* | `Observation.derivedFrom` eller `Observation.hasMember` | Val beror på `relationType`; se OBS-005 |
| `observationBody.relation[*].relationType` | 0..* | *(styr val av FHIR-element)* | Typ av relation avgör om det är derivedFrom eller hasMember |
| `observationBody.relation[*].targetObservationId` | 0..* | `Observation.derivedFrom.identifier` / `Observation.hasMember.identifier` | Referens via id |

---

## Härledda fält och designbeslut

### Observation.status (OBS-003)

`observationBody.observationStatus` använder SNOMED CT-koder ur urvalsuppsättningen
med id `56431000052106`. En ConceptMap krävs för att översätta dessa till FHIR
`ObservationStatus`-värden:

| SNOMED CT-kod | SNOMED CT-display | FHIR ObservationStatus |
|---|---|---|
| `385676005` | Under utförande | `preliminary` |
| `385651009` | Slutlig | `final` |
| `272393004` | Korrigerad | `amended` |
| `59776000` | Avbeställd/annullerad | `cancelled` |
| `444301002` | Avböjd av patient | `cancelled` |

Saknad mappning: status sätts till `unknown` och en `OperationOutcome`-varning genereras.

### Observation.category – statisk kod

Alla Observation-resurser producerade från GetObservations tilldelas
`Observation.category` med kod `exam` från
`http://terminology.hl7.org/CodeSystem/observation-category` för att markera att
de härrör från kliniska undersökningar/mätningar.

### Observation.code – fallback

Om `observationBody.observationType` saknas och ingen annan kod kan härledas sätts
`Observation.code` till en lokal platshållarkod
`https://fhir.inera.se/ig/ehds-tk/CodeSystem/observation-placeholder#unspecified`
med display *"Okänd observationstyp"* för att uppfylla FHIR-profilens krav på minst
en kod.

### valueNegation (OBS-002)

När `observationBody.valueNegation = true` innebär det att observationens värde
explicit förnekats eller är frånvarande av klinisk orsak. Mappning:

| `valueNegation` | FHIR-handling |
|---|---|
| `false` (normalfall) | `value[x]` populeras som normalt; `dataAbsentReason` utelämnas |
| `true` | `value[x]` utelämnas; `Observation.dataAbsentReason.coding.code = "not-applicable"` |

Koden `not-applicable` hämtas från
`http://terminology.hl7.org/CodeSystem/data-absent-reason`.

### ts-fältet (OBS-001) – variabelprecisions-tidsstämpel

`observationBody.observationValue.ts` och `observationBody.time.ts` är RIVTA
`TimeType/ts`-strängar med variabel precision, t.ex. `202306`, `20230601`,
`20230601120000`. Dessa kan **inte** alltid konverteras till FHIR `dateTime` utan
att förlora precisionssemantik. Hantering:

| Precision i ts-strängen | FHIR-typ | Konvertering |
|---|---|---|
| `YYYY` (år) | `Observation.valueString` | Behålls som sträng |
| `YYYYMM` (år+månad) | `Observation.valueString` | Behålls som sträng |
| `YYYYMMDD` (datum) | `Observation.valueDateTime` | Konverteras till `YYYY-MM-DD` |
| `YYYYMMDDHHMMSS` (full) | `Observation.valueDateTime` | Konverteras till ISO 8601 med zon Europe/Stockholm |

För `time.ts`: om precision ≥ dag mappas till `Observation.effectiveDateTime`,
annars till `Observation.effectiveDateTime` med en implementationsspecifik
utfyllnadsstrategi (t.ex. start av period, se GENERAL-001).

### targetSite – kardinalitetskollision (OBS-004)

`observationBody.targetSite` är definierad som `0..*` i TKB men
`Observation.bodySite` är `0..1` i FHIR R4. Implementationsstrategi:

1. Det **första** elementet i `targetSite`-listan mappas till `Observation.bodySite`.
2. Eventuella ytterligare element (index ≥ 1) läggs till som fritextnotis i
   `Observation.note.text`, med prefix `"Ytterligare lokal: "` och kodens
   `displayName`.
3. Öppen fråga om tilläggsextension – se OBS-004.

### relation – relationstyper (OBS-005)

`observationBody.relation` innehåller referenser till andra observationer med en
`relationType`-kod. Mapping:

| `relationType` (RIVTA) | FHIR-element | Motivering |
|---|---|---|
| Härledd från / deriverad | `Observation.derivedFrom` | Källobservation för beräknad observation |
| Ingår i grupp / komponent | `Observation.hasMember` | Deltagande observation i panel |
| Övriga typer | `Observation.extension[observationRelation]` | Lokal extension – se OBS-005 |

---

## PDL och Sparr

> GetObservations v2.0 har en **avvikande headerstruktur** jämfört med
> `PatientSummaryHeader`. Det finns inga dedikerade fält `careProviderHSAId` och
> `careUnitHSAId` på standardplats i headern.

PDL- och Sparr-information hämtas istället ur följande källor när de är
tillgängliga:

| PDL/Sparr-begrepp | Alternativ källa i GetObservations | FHIR-destination |
|---|---|---|
| Vårdgivare (yttre Sparr) | `observationBody.participation[*]` där `participationType` avser ansvarig vårdgivare | `Provenance.agent[custodian].who.identifier` |
| Vårdenhet (inre Sparr) | `observationBody.participation[*]` där `participationType` avser vårdenhet | `Provenance.agent[author].who.identifier` |
| Skyddad identitet | `observationBody.patient.person.confidentialityIndicator` | `Observation.meta.security` |

Implementationer **måste** hantera avsaknaden av standard-Sparr-fält och antingen
vägra returnera posten utan tydlig Sparr-attributering, eller flagga posten med
`meta.security` och dokumentera beslutet i implementationsguiden.

---

## Provenance

En `Provenance`-resurs skapas per `Observation`-resurs.

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `observationBody.participation` (se PDL-avsnitt) |
| `agent[author]` | Informationsägande vårdenhet | `observationBody.participation` (se PDL-avsnitt) |

`Provenance.target` refererar `Observation` via `urn:uuid:{Observation.id}`.  
`Provenance.recorded` = `observationBody.registrationTime` (konverterat till ISO 8601).

---

## OID-till-URI-tabell

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |
| `2.16.840.1.113883.6.96` | `http://snomed.info/sct` | SNOMED CT |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| Id | Fråga | Status |
|---|---|---|
| OBS-001 | Hur hanteras `ts`-strängar med lägre precision än datum (år, år+månad) i `Observation.effectiveDateTime`? Bör en extension `_effectiveDateTime` med `valueString` användas? | Öppen |
| OBS-002 | Vilken `dataAbsentReason`-kod bäst representerar `valueNegation=true`? `not-applicable` eller `not-performed`? | Öppen |
| OBS-003 | ConceptMap för SNOMED CT-urval `56431000052106` → FHIR ObservationStatus är ej komplett. Saknade koder behöver inventeras mot TKB. | Öppen |
| OBS-004 | `targetSite` är `0..*` i TKB men `Observation.bodySite` är `0..1` i FHIR R4. Bör en extension `bodySite` med `0..*` läggas till profilen, eller accepteras informationsförlust med notering? | Öppen |
| OBS-005 | `relation` med `relationType` har inget standardiserat FHIR-uttryck för alla relationstyper. Behöver lokal extension definieras i profilen? | Öppen |
| GENERAL-001 | Gemensam hantering av RIVTA variabelprecisions-tidsstämplar (YYYYMMDDHHMMSS, YYYYMMDD, YYYYMM, YYYY) vid konvertering till ISO 8601 och tidszon Europe/Stockholm behöver dokumenteras i gemensam konverteringsspecifikation. | Öppen |
