# GetLaboratoryOrderOutcome – Provsvar

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetLaboratoryOrderOutcome v4.2  
**FHIR-profiler:** [SEEHDSDiagnosticReportLab](StructureDefinition-se-ehds-diagnostic-report-lab.html) | [SEEHDSObservationLab](StructureDefinition-se-ehds-observation-lab.html)  
**Logisk modell:** [SEEHDSLMLaboratoryOrderOutcome](StructureDefinition-se-ehds-lm-laboratory-order-outcome.html)  
**Krävs för NPÖ:** Ja (v4.2) | **Krävs för 1177 Journal:** Ja (v4.2)  
**EHDS-koppling:** Medical test results – laboratorie- och diagnostiska resultat

---

> **VIKTIGT – JoL-header (inte PatientSummaryHeader)**
>
> GetLaboratoryOrderOutcome v4.2 använder en **JoL-header** (`header.accessControlHeader`), inte det vanliga PatientSummaryHeader-mönstret. PDL-fälten `accountableCareGiver` och `accountableCareUnit` finns direkt i `accessControlHeader`, **inte** nästlade under ett `accountableHealthcareProfessional`-block. Headern innehåller dessutom ett separat `header.author`-block för vårdfacklig information och ett `header.signature`-block för signatär. Se [PDL och Sparr](#pdl-och-sparr).

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

### Header – accessControlHeader (PDL/Sparr)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header.accessControlHeader.patientId.extension` | 1..1 | `DiagnosticReport.subject.identifier.value` | Personnummer eller samordningsnummer |
| `header.accessControlHeader.patientId.root` | 1..1 | `DiagnosticReport.subject.identifier.system` | OID→URI, se tabell nedan |
| `header.accessControlHeader.originalPatientId` | 0..1 | Ej mappad | Administrativt reservfält för ursprunglig patientidentitet; ingen FHIR-motpart i DiagnosticReport |
| `header.accessControlHeader.careProcessId` | 0..1 | Ej mappad | Vårdprocessidentifierare; inget standardiserat FHIR-fält i DiagnosticReport; kan hanteras via Encounter.identifier om vårdprocess är känd |
| `header.accessControlHeader.accountableCareGiver` | 1..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – juridiskt ansvarig vårdgivare |
| `header.accessControlHeader.accountableCareUnit` | 1..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – informationsägande vårdenhet |
| `header.accessControlHeader.blockComparisonTime` | 1..1 | Ej mappad | Används av Sparr-tjänsten vid filtrering; transportlagerdata, ingår ej i FHIR-resursen |
| `header.accessControlHeader.approvedForPatient` | 1..1 | `DiagnosticReport.meta.security` | PDL-kontroll – se [PDL-001](#öppna-frågor) |

### Header – sourceSystemId och record

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header.sourceSystemId` | 1..1 | `DiagnosticReport.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `header.record.recordId` | 1..1 | `DiagnosticReport.identifier[record]` | Källsystemets postidentifierare |
| `header.record.timestamp` | 1..1 | `DiagnosticReport.issued` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |

### Header – author (vårdfacklig information)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header.author.authorId` | 0..1 | `PractitionerRole.identifier.value` | HSA-id för ansvarig person; via performer-referens |
| `header.author.name` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `header.author.timestamp` | 1..1 | `Provenance.recorded` | Tidpunkt för författarens åtgärd; YYYYMMDDHHMMSS → ISO 8601 |
| `header.author.byRole` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `header.author.orgUnit.orgUnitId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `header.author.orgUnit.name` | 1..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |

### Header – signature (signatär)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header.signature.signatureId` | 0..1 | `DiagnosticReport.extension[signatureId]` | Signatärens HSA-id; kräver lokal extension om ej finns |
| `header.signature.name` | 0..1 | Ej mappad | Signatärens namn i klartext; HSA-id räcker för logisk referens |
| `header.signature.timestamp` | 1..1 | `DiagnosticReport.extension[signatureTime]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `header.signature.byRole` | 0..1 | Ej mappad | Yrkesroll vid signering; ingen standardiserad motpart på DiagnosticReport; kan inkluderas i signatärens PractitionerRole om den skapas |

### Body – beställningsinformation

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `body.identifier` | 1..1 | `DiagnosticReport.identifier[order]` | Beställnings-id (remiss-/ordernummer) |
| `body.laboratoryIdentifier` | 0..1 | `DiagnosticReport.identifier[lab]` | Laboratoriets eget interna id |
| `body.type` | 1..1 | `DiagnosticReport.code` | Typ av laboratoriebeställning (NPU/LOINC/lokalt) |
| `body.text` | 0..1 | `DiagnosticReport.conclusion` | Fritext-sammanfattning av beställningssvaret |

### Body – referral (kopplad remiss)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `body.referral.identifier` | 1..1 | `DiagnosticReport.basedOn.identifier` | Remiss-id → logisk referens till ServiceRequest |
| `body.referral.timestamp` | 1..1 | Ej mappad till DiagnosticReport | Remissens tidpunkt tillhör ursprungsremissen (ServiceRequest.authoredOn) |
| `body.referral.version` | 0..1 | Ej mappad | Remissversion; inget standardiserat FHIR-fält; kan ev. lagras i ServiceRequest.extension |
| `body.referral.question` | 0..1 | Ej mappad till DiagnosticReport | Frågeställning från remittenten tillhör ursprungsremissen (ServiceRequest.note) |
| `body.referral.requestedCareService` | 0..* | Ej mappad till DiagnosticReport | Begärd tjänst tillhör ursprungsremissen (ServiceRequest.code) |
| `body.referral.requester.requesterId` | 0..1 | Ej mappad till DiagnosticReport | Remittentens HSA-id tillhör ursprungsremissen (ServiceRequest.requester) |
| `body.referral.requester.name` | 0..1 | Ej mappad till DiagnosticReport | Remittentens namn tillhör ursprungsremissen |
| `body.referral.requester.byRole` | 0..1 | Ej mappad till DiagnosticReport | Remittentens yrkesroll tillhör ursprungsremissen |
| `body.referral.requester.orgUnit.orgUnitId` | 0..1 | Ej mappad till DiagnosticReport | Remittentens org-enhets HSA-id tillhör ursprungsremissen |
| `body.referral.requester.orgUnit.name` | 1..1 | Ej mappad till DiagnosticReport | Remittentens org-enhets namn tillhör ursprungsremissen |
| `body.referral.referralInformation.referralComment` | 0..1 | Ej mappad till DiagnosticReport | Remisskommentar tillhör ursprungsremissen (ServiceRequest.note) |
| `body.referral.referralInformation.referralMedicalInformation` | 0..1 | Ej mappad till DiagnosticReport | Medicinsk remissinformation tillhör ursprungsremissen (ServiceRequest.note) |

> Alla `body.referral.*`-fält är attribut till ursprungsremissen. En logisk referens via `DiagnosticReport.basedOn` → `ServiceRequest.identifier` är tillräcklig. Bryggan skapar en minimal stub-ServiceRequest om ingen matchning finns. Se [Referral → ServiceRequest](#referral--servicerequest).

### Body – mottagande enhet och kontakt

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `body.recipientUnit.unitId` | 0..1 | `DiagnosticReport.resultsInterpreter.identifier` | Mottagande vårdenhet (svarmottagare) via logisk referens |
| `body.recipientUnit.name` | 1..1 | `DiagnosticReport.resultsInterpreter.display` | Svarmottagarens namn |
| `body.recipientSignature.signatoryId` | 0..1 | Ej mappad | Kvittens av svaret; inget standardiserat FHIR-fält i DiagnosticReport |
| `body.recipientSignature.name` | 0..1 | Ej mappad | Kvittensnamn; inget standardiserat FHIR-fält |
| `body.recipientSignature.timestamp` | 1..1 | Ej mappad | Kvittenstidpunkt; inget standardiserat FHIR-fält |
| `body.recipientSignature.byRole` | 0..1 | Ej mappad | Yrkesroll vid kvittens; inget standardiserat FHIR-fält |
| `body.contactInformation.text` | 1..1 | Ej mappad | Kontaktinformation i fritext; inget standardiserat FHIR-fält i DiagnosticReport; kan läggas i DiagnosticReport.text.div som narrativ |

### Härledda fält – DiagnosticReport

| Källa | FHIR-element | Kommentar |
|---|---|---|
| (härledd från analysis.status) | `DiagnosticReport.status` | Se [Härledda fält – DiagnosticReport.status](#diagnosticreportstatus) |
| (groupOfAnalyses.analysis → ObservationLab) | `DiagnosticReport.result` | Reference(SEEHDSObservationLab) per analys |

---

## Mappningstabell – groupOfAnalyses-metadata

`groupOfAnalyses` har egna fält som fångar metadata om gruppen av analyser (t.ex. ett analyspaket).

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `groupOfAnalyses.name` | 0..1 | `DiagnosticReport.category.text` | Paketnamn; alternativt som `DiagnosticReport.note.text` om category används för klassificering |
| `groupOfAnalyses.comment` | 0..1 | `DiagnosticReport.note.text` | Kommentar till analysgruppen |
| `groupOfAnalyses.code` | 0..1 | `DiagnosticReport.category` | Kod för analysgruppen/paketet |

---

## Mappningstabell – SEEHDSObservationLab (per analysis)

Varje element i `body.groupOfAnalyses[*].analysis[*]` mappas till en separat `SEEHDSObservationLab`-instans.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `groupOfAnalyses.analysis.identifier` | 0..1 | `Observation.identifier` | Analysens unika id i källsystemet |
| `groupOfAnalyses.analysis.timestamp` | 0..1 | `Observation.effectiveDateTime` | Tidpunkt för mätningen; YYYYMMDDHHMMSS → ISO 8601 |
| `groupOfAnalyses.analysis.code` | 1..1 | `Observation.code` | NPU- eller LOINC-kod för analysen |
| `groupOfAnalyses.analysis.method` | 0..1 | `Observation.method` | Analysmetod |
| `groupOfAnalyses.analysis.status` | 0..1 | `Observation.status` | Se statusmappning nedan |
| `groupOfAnalyses.analysis.comment` | 0..1 | `Observation.note[0].text` | Kommentar till analysen |
| `groupOfAnalyses.analysis.accredited` | 0..1 | `Observation.extension[accredited]` | Boolean; ackrediteringsstatus för analysen |

### Resultat (analysis.result)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `groupOfAnalyses.analysis.result.type` | 0..1 | `Observation.extension[resultType]` | Typ av resultat (kvantitativt, kvalitativt etc.) |
| `groupOfAnalyses.analysis.result.value` | 1..1 | `Observation.value[x]` | Se [LAB-001](#öppna-frågor) – AnyValueType; mappas primärt till `valueString` |
| `groupOfAnalyses.analysis.result.comment` | 0..1 | `Observation.note[1].text` | Kommentar till enskilt resultat |
| `groupOfAnalyses.analysis.result.interpretation` | 0..* | `Observation.interpretation` | H/L/A/N – tolkning av resultatet |
| `groupOfAnalyses.analysis.result.reference.interval` | 0..1 | `Observation.referenceRange.text` | Referensintervall som fritext (PQIntervalType) |
| `groupOfAnalyses.analysis.result.reference.description` | 0..1 | `Observation.referenceRange.text` | Beskrivning; kombineras med interval om båda finns |
| `groupOfAnalyses.analysis.result.reference.population` | 0..1 | `Observation.referenceRange.appliesTo` | Population som referensintervallet gäller |
| `groupOfAnalyses.analysis.result.reference.comment` | 0..1 | `Observation.referenceRange.text` | Kommentar om referensintervallet; kombineras i referenceRange.text |
| `groupOfAnalyses.analysis.result.recipientSignature.signatoryId` | 0..1 | Ej mappad | Mottagarkvittens; inget standardiserat FHIR-fält i Observation |
| `groupOfAnalyses.analysis.result.recipientSignature.name` | 0..1 | Ej mappad | Mottagarkvittens namn; inget standardiserat FHIR-fält |
| `groupOfAnalyses.analysis.result.recipientSignature.timestamp` | 1..1 | Ej mappad | Mottagarkvittenstidpunkt; inget standardiserat FHIR-fält |
| `groupOfAnalyses.analysis.result.recipientSignature.byRole` | 0..1 | Ej mappad | Yrkesroll vid mottagarkvittens; inget standardiserat FHIR-fält |
| `groupOfAnalyses.analysis.result.performerSignature.signatoryId` | 0..1 | `Observation.performer.identifier` | Utförarens HSA-id; via Reference(PractitionerRole) |
| `groupOfAnalyses.analysis.result.performerSignature.name` | 0..1 | `Observation.performer.display` | Utförarens namn |
| `groupOfAnalyses.analysis.result.performerSignature.timestamp` | 1..1 | Ej mappad | Signeringstidpunkt för utförarens signatur; inget dedikerat fält i Observation; kan lagras i Provenance om kritiskt |
| `groupOfAnalyses.analysis.result.performerSignature.byRole` | 0..1 | Ej mappad | Utförarens yrkesroll; ingår via PractitionerRole.code om performer-referens skapas |
| `groupOfAnalyses.analysis.result.related` | 0..* | Ej mappad | Relaterade analyser; inget strukturerat fält i Observation R4; alternativ: `Observation.hasMember` eller `Observation.derivedFrom` beroende på relationstyp – se [LAB-002](#öppna-frågor) |

### Mätinstrument (analysis.device)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `groupOfAnalyses.analysis.device.identifier` | 1..1 | `Observation.device.identifier` | Mätinstrumentets id; Reference(Device) via logisk referens |

### Härledda fält – Observation

| Källa | FHIR-element | Kommentar |
|---|---|---|
| (härledd) | `Observation.subject` | Logisk referens till DiagnosticReport.subject (samma patient) |
| (härledd) | `Observation.partOf` | Reference till DiagnosticReport |

---

## Mappningstabell – Specimen (per analysis.specimen)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `analysis.specimen.identifier` | 0..1 | `Specimen.identifier` | Provrörets/provets id |
| `analysis.specimen.material` | 0..1 | `Specimen.type` | Provsort (blod, urin, etc.) |
| `analysis.specimen.timestamp` | 1..1 | `Specimen.collection.collectedDateTime` | Provtagningstid; YYYYMMDDHHMMSS → ISO 8601 |
| `analysis.specimen.anatomicalLocation` | 0..1 | `Specimen.collection.bodySite` | Kroppsdel/provtagningslokal |
| `analysis.specimen.comment` | 0..1 | `Specimen.note.text` | Kommentar om provet |
| `analysis.specimen.activity[i].code` | 1..1 | `Specimen.collection.extension[activity][i].code` | Aktivitetskod (t.ex. fasta, medicinering); kräver lokal extension |
| `analysis.specimen.activity[i].time` | 1..1 | `Specimen.collection.extension[activity][i].period` | Aktivitetens tidsperiod; Period-typ |
| `analysis.specimen.activity[i].method` | 0..1 | `Specimen.collection.extension[activity][i].method` | Aktivitetsmetod |
| `analysis.specimen.container[i].identifier` | 0..* | `Specimen.container[i].identifier` | Behållarens id (ett eller flera) |
| `analysis.specimen.container[i].type` | 1..1 | `Specimen.container[i].type` | Behållartyp (provrörstyp) |
| (härledd) | `Observation.specimen` | Reference(Specimen) per analys |

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

Om `body.referral.identifier` finns skapas en logisk referens till en `ServiceRequest`-resurs via `DiagnosticReport.basedOn`. Bryggan ansvarar för att matcha `identifier` mot befintliga ServiceRequest-instanser (från GetReferralOutcome eller GetRequestActivities) eller skapa en minimal stub-ServiceRequest med enbart identifier satt. Remissens övriga fält (timestamp, question, requestedCareService, requester, referralInformation) tillhör ServiceRequest och repeteras inte i DiagnosticReport.

### result.related → Observation-relation

`analysis.result.related 0..*` refererar till relaterade analyser men saknar specificerat relationsmönster i TKB:n. FHIR Observation har två relevanta fält:

- `Observation.hasMember` – om den relaterade analysen ingår i samma panel
- `Observation.derivedFrom` – om den är ett härledd resultat

Bryggan behöver tilldelningsregler för att avgöra vilken relationstyp som gäller. Se [LAB-002](#öppna-frågor).

---

## PDL och Sparr

GetLaboratoryOrderOutcome v4.2 använder **JoL-header** (inte PatientSummaryHeader). PDL-fälten skiljer sig från andra TK:er:

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `header.accessControlHeader.accountableCareGiver` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `header.accessControlHeader.accountableCareUnit` | `Provenance.agent[author].who.identifier` |
| Jämförelsetid (Sparr) | `header.accessControlHeader.blockComparisonTime` | Används av Sparr-tjänsten vid filtrering; ingår ej i FHIR-resursen |
| Patientgodkännande | `header.accessControlHeader.approvedForPatient` (boolean) | `DiagnosticReport.meta.security`; se [PDL-001](#öppna-frågor) |

Observera att `accountableCareGiver` och `accountableCareUnit` är direkt under `accessControlHeader` – det finns inget mellanliggande `accountableHealthcareProfessional`-block i JoL-headern.

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `header.accessControlHeader.accountableCareGiver` |
| `agent[author]` | Informationsägande vårdenhet | `header.accessControlHeader.accountableCareUnit` |

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
| PDL-001 | **`approvedForPatient` (boolean) saknar standardiserad FHIR-motsvarighet.** Fältet finns i JoL-headern via `accessControlHeader.approvedForPatient`. Nuvarande approach: `DiagnosticReport.meta.security` med ett lokalt definierat kodsystem. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |

## Föreslagna nya issues

| ID | Fråga |
|---|---|
| LAB-002 | **`analysis.result.related 0..*` – relationstyp okänd.** Fältet anger relaterade analyser men TKB:n specificerar inte om relationen är "ingår i panel" (`Observation.hasMember`) eller "härledd från" (`Observation.derivedFrom`). Bryggan behöver en tolkningsregel. Behöver klarläggande från TKB-förvaltningen. |
| LAB-003 | **`analysis.specimen.activity` saknar standard Specimen-element.** `activity[i].code`, `activity[i].time` och `activity[i].method` (t.ex. fasta-aktivitet) har ingen direkt motpart i Specimen R4. Nuvarande förslag: lokal extension på `Specimen.collection`. Alternativ: `Specimen.collection.fastingStatusCodeableConcept` om aktiviteten avser fasta. Beslut behövs. |
| LAB-004 | **`header.signature.byRole` – ingen standardiserad plats på DiagnosticReport.** Signatärens yrkesroll vid signering kan ev. placeras i en PractitionerRole-resurs om signatären representeras som en separat Practitioner. I nuläget markerad som ej mappad. Behöver beslut om en lokal extension ska definieras. |
