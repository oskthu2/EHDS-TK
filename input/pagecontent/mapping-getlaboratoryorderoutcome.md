# GetLaboratoryOrderOutcome – Provsvar

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetLaboratoryOrderOutcome v4.2  
**FHIR-profiler:** [SEEHDSDiagnosticReportLab](StructureDefinition-se-ehds-diagnostic-report-lab.html) | [SEEHDSObservationLab](StructureDefinition-se-ehds-observation-lab.html)  
**Logisk modell:** [SEEHDSLMLaboratoryOrderOutcome](StructureDefinition-se-ehds-lm-laboratory-order-outcome.html)  
**Krävs för NPÖ:** Ja (v4.2) | **Krävs för 1177 Journal:** Ja (v4.2)  
**EHDS-koppling:** Medical test results – laboratorie- och diagnostiska resultat

---

> **VIKTIGT – JoL-header (inte PatientSummaryHeader)**
>
> GetLaboratoryOrderOutcome v4.2 använder en **JoL-header** (`header.accessControlHeader`), inte det vanliga PatientSummaryHeader-mönstret. PDL-fälten `accountableCareGiver` och `accountableCareUnit` finns direkt i `accessControlHeader`, **inte** nästlade under ett `accountableHealthcareProfessional`-block. Headern innehåller dessutom ett separat `header.author`-block för vårdfacklig information. Se [PDL och Sparr](#pdl-och-sparr).

---

## Resurshierarki

```
laboratoryOrderOutcome 0..*
│
SEEHDSDiagnosticReportLab  (1 per laboratoryOrderOutcome)
  └── SEEHDSObservationLab (1 per groupOfAnalyses.analysis)
        └── Specimen        (0..* per analysis.specimen)
```

En `laboratoryOrderOutcome` representerar en beställning (order) med tillhörande analysresultat. Varje analys inom `groupOfAnalyses.analysis` mappas till en separat `SEEHDSObservationLab`. Provrör/specimen kopplas till respektive `Observation` och kan delas mellan analyser med samma specimen-identifierare.

---

## Mappningstabell – SEEHDSDiagnosticReportLab

Rotelementet `laboratoryOrderOutcome` (ett per svar) mappas till en DiagnosticReport-instans.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header.accessControlHeader.patientId.extension` | 1..1 | `DiagnosticReport.subject.identifier.value` | Personnummer eller samordningsnummer |
| `header.accessControlHeader.patientId.root` | 1..1 | `DiagnosticReport.subject.identifier.system` | OID→URI, se tabell nedan |
| `header.accessControlHeader.accountableCareGiver` | 1..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – juridiskt ansvarig vårdgivare |
| `header.accessControlHeader.accountableCareUnit` | 1..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – informationsägande vårdenhet |
| `header.accessControlHeader.blockComparisonTime` | 1..1 | (intern PDL-hantering) | Används av Sparr-tjänsten; ingår ej i FHIR-resursen |
| `header.accessControlHeader.approvedForPatient` | 1..1 | (ej mappad) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |
| `header.sourceSystemId` | 1..1 | `DiagnosticReport.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `header.record.id` | 1..1 | `DiagnosticReport.identifier[record]` | Källsystemets postidentifierare |
| `header.record.timestamp` | 1..1 | `DiagnosticReport.issued` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `header.author.id` | 0..1 | `DiagnosticReport.performer[author].identifier` | HSA-id för ansvarig person |
| `header.author.name` | 0..1 | `DiagnosticReport.performer[author].display` | Visningsnamn |
| `header.author.timestamp` | 1..1 (om author) | `Provenance.recorded` | Tidpunkt för författarens åtgärd |
| `header.author.byRole` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `header.author.orgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `header.author.orgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `header.signature.id` | 0..1 | (se noter) | Används ej direkt i DiagnosticReport |
| `header.signature.name` | 0..1 | (se noter) | Används ej direkt i DiagnosticReport |
| `header.signature.timestamp` | 0..1 | `DiagnosticReport.extension[signatureTime]` | Signeringstidpunkt om extension definieras |
| `body.identifier` | 1..1 | `DiagnosticReport.identifier[order]` | Beställnings-id (remiss-/ordernummer) |
| `body.laboratoryIdentifier` | 0..1 | `DiagnosticReport.identifier[lab]` | Laboratoriets eget interna id |
| `body.type` | 1..1 | `DiagnosticReport.code` | Typ av laboratoriebeställning (NPU/LOINC/lokalt) |
| `body.text` | 0..1 | `DiagnosticReport.conclusion` | Fritext-sammanfattning av beställningssvaret |
| `body.referral.referralId` | 0..1 | `DiagnosticReport.basedOn.identifier` | Remiss-id → logisk referens till ServiceRequest |
| `body.referral.timestamp` | 0..1 | (ingår i ServiceRequest) | Remissens tidpunkt; ej repeterat i DiagnosticReport |
| `body.referral.question` | 0..1 | (ingår i ServiceRequest.note) | Frågeställning från remittenten |
| `body.referral.requestedCareService` | 0..1 | (ingår i ServiceRequest.code) | Begärd tjänst |
| `body.referral.requester` | 0..1 | (ingår i ServiceRequest.requester) | Remittent |
| `body.referral.referralInformation` | 0..1 | (ingår i ServiceRequest.note) | Övrig remissinformation |
| `body.recipientUnit.id` | 1..1 | `DiagnosticReport.resultsInterpreter.identifier` | Mottagande vårdenhet (svarmottagare) |
| `body.recipientUnit.name` | 0..1 | `DiagnosticReport.resultsInterpreter.display` | Svarmottagarens namn |
| `body.recipientSignature` | 0..1 | (ej mappad) | Kvittens av svaret; ej standardiserat i FHIR |
| `body.contactInformation` | 0..1 | (ej mappad) | Kontaktinformation; ej mappad i nuläget |
| (härledd från analysis.status) | — | `DiagnosticReport.status` | Se [Härledda fält – DiagnosticReport.status](#diagnosticreportstatus) |
| (groupOfAnalyses.analysis → ObservationLab) | — | `DiagnosticReport.result` | Reference(SEEHDSObservationLab) per analys |

---

## Mappningstabell – SEEHDSObservationLab (per analysis)

Varje element i `body.groupOfAnalyses[*].analysis[*]` mappas till en separat `SEEHDSObservationLab`-instans.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `groupOfAnalyses.analysis.identifier` | 1..1 | `Observation.identifier` | Analysens unika id i källsystemet |
| `groupOfAnalyses.analysis.timestamp` | 0..1 | `Observation.effectiveDateTime` | Tidpunkt för mätningen; YYYYMMDDHHMMSS → ISO 8601 |
| `groupOfAnalyses.analysis.code` | 1..1 | `Observation.code` | NPU- eller LOINC-kod för analysen |
| `groupOfAnalyses.analysis.code.code` | 1..1 | `Observation.code.coding.code` | Kod, t.ex. NPU-kod |
| `groupOfAnalyses.analysis.code.codeSystem` | 1..1 | `Observation.code.coding.system` | OID→URI, t.ex. NPU-OID |
| `groupOfAnalyses.analysis.code.displayName` | 0..1 | `Observation.code.coding.display` | Kodverkets benämning |
| `groupOfAnalyses.analysis.method` | 0..1 | `Observation.method` | Analysmetod |
| `groupOfAnalyses.analysis.status` | 1..1 | `Observation.status` | Se statusmappning nedan |
| `groupOfAnalyses.analysis.comment` | 0..1 | `Observation.note[0].text` | Kommentar till analysen |
| `groupOfAnalyses.analysis.accredited` | 0..1 | `Observation.extension[accredited]` | Boolean; ackrediteringsstatus för analysen |
| `groupOfAnalyses.analysis.result.type` | 0..1 | `Observation.extension[resultType]` | Typ av resultat (kvantitativt, kvalitativt etc.) |
| `groupOfAnalyses.analysis.result.value` | 1..1 | `Observation.value[x]` | Se [LAB-001](#öppna-frågor) – AnyValueType; mappas primärt till `valueString` |
| `groupOfAnalyses.analysis.result.comment` | 0..1 | `Observation.note[1].text` | Kommentar till enskilt resultat |
| `groupOfAnalyses.analysis.result.interpretation` | 0..* | `Observation.interpretation` | H/L/A/N – tolkning av resultatet |
| `groupOfAnalyses.analysis.result.reference.interval` | 0..1 | `Observation.referenceRange.text` | Referensintervall som fritext |
| `groupOfAnalyses.analysis.result.reference.description` | 0..1 | `Observation.referenceRange.text` | Beskrivning; kombineras med interval om båda finns |
| `groupOfAnalyses.analysis.result.reference.population` | 0..1 | `Observation.referenceRange.appliesTo` | Population som referensintervallet gäller |
| `groupOfAnalyses.analysis.result.reference.comment` | 0..1 | `Observation.referenceRange.text` | Kommentar om referensintervallet |
| `groupOfAnalyses.analysis.result.recipientSignature` | 0..1 | (ej mappad) | Kvittens; ej standardiserat i FHIR |
| `groupOfAnalyses.analysis.result.performerSignature` | 0..1 | (se noter) | Utförarens signatur |
| `groupOfAnalyses.analysis.device` | 0..* | `Observation.device` | Mätutrustning; Reference(Device) |
| (härledd) | — | `Observation.subject` | Logisk referens till DiagnosticReport.subject (samma patient) |
| (härledd) | — | `Observation.partOf` | Reference till DiagnosticReport |

### Mappningstabell – Specimen (per analysis.specimen)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `analysis.specimen.identifier` | 0..1 | `Specimen.identifier` | Provrörets/provets id |
| `analysis.specimen.material` | 0..1 | `Specimen.type` | Provsort (blod, urin, etc.) |
| `analysis.specimen.timestamp` | 0..1 | `Specimen.collection.collectedDateTime` | Provtagningstid; YYYYMMDDHHMMSS → ISO 8601 |
| `analysis.specimen.anatomicalLocation` | 0..1 | `Specimen.collection.bodySite` | Kroppsdel/provtagningslokal |
| `analysis.specimen.activity` | 0..1 | `Specimen.collection.fastingStatus` | Aktivitetsstatus vid provtagning (t.ex. fasta) |
| `analysis.specimen.container` | 0..1 | `Specimen.container.type` | Provrörstyp |
| (härledd) | — | `Observation.specimen` | Reference(Specimen) per analys |

### Mappningstabell – groupOfAnalyses-metadata

`groupOfAnalyses` har egna fält som fångar metadata om gruppen av analyser (t.ex. ett analyspaket).

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `groupOfAnalyses.name` | 0..1 | `Observation.note.text` (på DiagnosticReport) | Paketnamn; alternativt `DiagnosticReport.category.text` |
| `groupOfAnalyses.comment` | 0..1 | `DiagnosticReport.note.text` | Kommentar till analysgruppen |
| `groupOfAnalyses.code` | 0..1 | `DiagnosticReport.category` | Kod för analysgruppen/paketet |

---

## Härledda fält / Designbeslut

### DiagnosticReport.status

`DiagnosticReport.status` finns inte explicit i TKB:n och måste härledas från statusarna hos de ingående analyserna (`analysis.status`). Mappningsreglerna är:

| Villkor (baserat på analysis.status-värden) | `DiagnosticReport.status` |
|---|---|
| Alla analyser har status `final` | `final` |
| Minst en analys har status `preliminary` (och ingen är `registered`) | `preliminary` |
| Minst en analys har status `registered` (ej påbörjad/inkommande) | `registered` |
| Minst en analys har status `cancelled` och inga andra | `cancelled` |
| Blandade statusar (t.ex. `final` + `preliminary`) | `partial` |
| Okänd/omappningsbar status | `unknown` |

Analysstatus från RIVTA mappas till FHIR `ObservationStatus` enligt:

| RIVTA analysis.status | FHIR Observation.status |
|---|---|
| `REG` / `registered` | `registered` |
| `PREL` / `preliminary` | `preliminary` |
| `FINAL` / `final` | `final` |
| `KVAL` / `corrected` | `corrected` |
| `AVED` / `cancelled` | `cancelled` |

### body.text – conclusion kontra narrative

`body.text` är en fritext som antingen representerar en samlad kommentar eller ett sammandrag av beställningssvaret. Mappas till `DiagnosticReport.conclusion`. Om texten ska presenteras som XHTML-narrativ sätts även `DiagnosticReport.text.div` (med `text.status = generated`).

### result.value – AnyValueType (LAB-001)

`analysis.result.value` är av typen `AnyValueType` i TKB:n, vilket innebär att det kan bära kvantitativa, kvalitativa, textuella eller kodade värden. I FHIR representeras detta via polymorfin `Observation.value[x]`:

| AnyValueType-innehåll | FHIR value[x] |
|---|---|
| Numeriskt värde med enhet | `valueQuantity` |
| Fri text | `valueString` |
| Kodat svar (t.ex. pos/neg) | `valueCodeableConcept` |
| Intervall (lågt–högt) | `valueRange` |
| Ratio | `valueRatio` |

Primär mappning är `valueString` när typen är okänd eller innehåller blandad information. Se [LAB-001](#öppna-frågor) för öppen designfråga.

### performerSignature → Observation.performer

`analysis.result.performerSignature` representerar den utförande analytikers signatur. Mappas till `Observation.performer` som Reference(PractitionerRole) med logisk referens via HSA-id om id finns tillgängligt.

### Referral → ServiceRequest

Om `body.referral.referralId` finns skapas en logisk referens till en `ServiceRequest`-resurs via `DiagnosticReport.basedOn`. Bryggan ansvarar för att matcha referralId mot befintliga ServiceRequest-instanser (från GetReferralOutcome eller GetRequestActivities) eller skapa en minimal stub-ServiceRequest med enbart identifier satt.

---

## PDL och Sparr

GetLaboratoryOrderOutcome v4.2 använder **JoL-header** (inte PatientSummaryHeader). PDL-fälten skiljer sig från andra TK:er:

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `header.accessControlHeader.accountableCareGiver` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `header.accessControlHeader.accountableCareUnit` | `Provenance.agent[author].who.identifier` |
| Jämförelsetid (Sparr) | `header.accessControlHeader.blockComparisonTime` | Används av Sparr-tjänsten vid filtrering; ingår ej i FHIR-resursen |
| Patientgodkännande | `header.accessControlHeader.approvedForPatient` (boolean) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

Observera att `accountableCareGiver` och `accountableCareUnit` är direkt under `accessControlHeader` – det finns inget mellanliggande `accountableHealthcareProfessional`-block i JoL-headern.

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `header.accessControlHeader.accountableCareGiver` |
| `agent[author]` | Informationsägande vårdenhet | `header.accessControlHeader.accountableCareUnit` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` (env-variabel) |

`Provenance.target` refererar `DiagnosticReport` (och transitivt alla `Observation`-instanser) via `urn:uuid:{DiagnosticReport.id}`.  
`Provenance.recorded` = `header.record.timestamp` (ISO 8601).  
`Provenance.agent[author].onBehalfOf` = `header.accessControlHeader.accountableCareGiver` (vårdgivare).

---

## OID-till-URI-tabell

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| LAB-001 | **`analysis.result.value` är av typen AnyValueType.** TKB:n modellerar värdet som en polymorf typ som kan bära kvantitativa, kvalitativa, textuella och kodade värden. FHIR:s `Observation.value[x]` har stöd för detta men kräver att bryggan tolkar innehållet och väljer rätt valuetype. Om innehållet är en sträng utan enhet och utan strukturerad information är `valueString` säkraste fallback. Behöver formella regler för typbestämning. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** Fältet finns i JoL-headern via `accessControlHeader.approvedForPatient` men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |
