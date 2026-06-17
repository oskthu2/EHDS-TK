# GetCarePlans – Vårdplan

**Tjänstekontrakt:** `clinicalprocess:logistics:logistics` GetCarePlans v2.0  
**FHIR-profil:** [SEEHDSCarePlan](StructureDefinition-se-ehds-care-plan.html)  
**Logisk modell:** [SEEHDSLMCarePlans](StructureDefinition-se-ehds-lm-care-plans.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  

---

## Struktur

GetCarePlans returnerar en lista `carePlan` (0..*) med en flat struktur – alla fält finns direkt på `carePlan`, utan separata header/body-undernivåer i TKB.

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.documentId` | 1..1 | `CarePlan.identifier.value` | Unik identitet inom källsystemet |
| `carePlan.patientId` | 1..1 | `CarePlan.subject.identifier` | OID→URI-konvertering |
| `carePlan.sourceSystemHSAId` | 1..1 | `CarePlan.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `carePlan.documentTitle` | 1..1 | `CarePlan.title` | Obligatorisk (1..1) |
| `carePlan.documentTime` | 0..1 | `CarePlan.created` | YYYYMMDDHHMMSS → ISO 8601 |
| `carePlan.accountableHealthcareProfessional.authorTime` | 1..1 | `CarePlan.meta.lastUpdated` | Tidpunkt för registrering |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `CarePlan.author` (identifier) | Logisk referens |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr (Regel 1) |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr (Regel 1) |
| `carePlan.legalAuthenticator.signatureTime` | 1..1 (om angiven) | `CarePlan.meta.extension[signatureTime]` | Signeringstidpunkt |
| `carePlan.approvedForPatient` | 1..1 | `CarePlan.extension[approved-for-patient]` | Regel 3: filter vid direktåtkomst |
| `carePlan.careContactId` | 0..1 | `CarePlan.basedOn` | Referens till relaterad Encounter |
| `carePlan.typeOfCarePlan` | 0..1 | `CarePlan.category` | Bunden till TypeOfCarePlanVS (required) |
| `carePlan.participatingCareUnitHSAId` | 0..* | `CarePlan.contributor` | Deltagande vårdenheters HSA-id |
| `carePlan.content[].mediaType` | 1..1 | `CarePlan.note` (mediaType i extension) | MIME-typ |
| `carePlan.content[].value` | 0..1 | Extension (base64Binary) | XOR med reference; max 100 KB |
| `carePlan.content[].reference` | 0..1 | Extension (url) | XOR med value |

> **OBS – Innehåll:** FHIR R4 CarePlan har inget inbyggt multimedia-fält. `carePlan.content` (MultimediaType) kräver extensions vid implementering. Text-innehåll (`text/plain`, `text/html`) kan lagras i `CarePlan.note.text`; binärt innehåll kräver separat extension.

> **Invariant:** `carePlan.content` – antingen `value` eller `reference` måste anges, ej båda (`getcareplans-content-xor` i logisk modell).

---

## PDL och Sparr

PDL-fälten `healthcareProfessionalCareUnitHSAId` och `healthcareProfessionalCareGiverHSAId` är **inte** toppnivå-header-fält utan finns under `carePlan.accountableHealthcareProfessional`. De är valfria i kontraktet men krävs av Regel 1 för korrekt Sparr-hantering.

| RIVTA PDL-element | FHIR-destination | Sparr-nivå |
|---|---|---|
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` | Inre Sparr |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `healthcareProfessionalCareUnitHSAId` |

---

## TypeOfCarePlan – kodverk

| Kod | Display | Beskrivning |
|---|---|---|
| `SIP` | SIP | Samordnad individuell plan |
| `SPLPTLRV` | SPLPTLRV | Samordnad plan enligt LPT och LRV |
| `SPU` | SPU | Samordnad plan vid utskrivning |
| `VP` | VP | Vårdplan |
| `HP` | HP | Habiliteringsplan |
| `RP` | RP | Rehabiliteringsplan |
| `GP` | GP | Genomförandeplan |
| `SVP` | SVP | Standardiserad vårdplan |
