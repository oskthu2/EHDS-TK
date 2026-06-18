# Sökparametrar – RIVTA inparametrar och FHIR Search API

## Bakgrund

RIVTA-tjänstekontrakt definierar en **begärantyp** (`GetXxxType`) med obligatoriska och valfria inparametrar som filtrerar vilka poster som returneras. När kontrakten exponeras via ett FHIR-API ersätts dessa inparametrar av FHIR:s standardiserade sökparametrar (`_search`).

Denna sida kartlägger varje RIVTA-inparameter mot lämplig FHIR-sökparameter, redovisar saknade mappningar, och pekar på anpassade sökparametrar som behöver definieras.

> **Avgränsning:** Sidan behandlar *frågesidan* (request). Svarsstrukturen täcks av de logiska modellerna och mappningssidorna.

---

## Gemensamma parametrar

Två inparametrar förekommer i alla (eller nästan alla) tjänstekontrakt:

| RIVTA-inparameter | Kard. | FHIR-sökparameter | Typ | Kommentar |
|---|---|---|---|---|
| `subjectOfCareId` | 1..1 | `patient` | reference/token | Personnummer eller samordningsnummer. I FHIR anges identifierarsystem och värde: `patient.identifier=http://electronichealth.se/identifier/personnummer\|191212121212` |
| `sourceSystemHSAId` | 0..1 | `_source` | uri | Filtrerar på källsystem. Värdet är `meta.source`-URI:n, dvs. `urn:oid:1.2.752.129.2.1.4.1#{hsaId}`. FHIR R4 definierar `_source` som standardparameter men implementationsstödet varierar. |

### Resonemang – subjectOfCareId

`subjectOfCareId` är obligatorisk i alla RIVTA-kontrakt och anger patienten vars data ska returneras. I FHIR är `patient` ett standardiserat sökfält på alla patientcentrerade resurser. För exakt matchning på personnummer bör sökparametern kombineras med identifierarsystemet:

```
GET /Condition?patient.identifier=http://electronichealth.se/identifier/personnummer|191212121212
```

Alternativt, om en intern Patient-resurs skapas med identifieraren länkad, räcker `patient={id}`.

### Resonemang – sourceSystemHSAId

`sourceSystemHSAId` filtrerar svar till data från ett specifikt källsystem. I FHIR lagras detta i `meta.source` (format `urn:oid:1.2.752.129.2.1.4.1#{hsaId}`), och FHIR R4 definierar `_source` som sökparameter för just `meta.source`. Fragmentdelen (`#hsaId`) i URI:n kräver URL-kodning i praktiken. Servern måste stödja `_source` för att filtreringen ska fungera — detta bör verifieras per implementation.

---

## Sammanfattning per tjänstekontrakt

| Tjänstekontrakt | Obligatorisk | Valfria inparametrar | Anmärkning |
|---|---|---|---|
| GetDiagnosis | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetAlertInformation | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetMedicationHistory | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetVaccinationHistory | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetFunctionalStatus | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetMaternityMedicalHistory | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetCarePlans | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetCareContacts | `subjectOfCareId` | `sourceSystemHSAId`, `careUnitHSAId`, `fromDateTime`, `toDateTime` | Datumfilter + vårdenhet |
| GetCareDocumentation | `subjectOfCareId` | `sourceSystemHSAId`, `careUnitHSAId`, `fromDateTime`, `toDateTime` | Datumfilter + vårdenhet; paginering via `hasMore` i svar |
| GetLaboratoryOrderOutcome | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetImagingOutcome | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetReferralOutcome | `subjectOfCareId` | `sourceSystemHSAId` | Inga extra parametrar |
| GetRequestActivities | `subjectOfCareId` | `sourceSystemHSAId`, `fromDate`, `toDate` | Datumfilter |
| GetObservations | `subjectOfCareId` | `sourceSystemHSAId`, `careUnitHSAId`, `observationCode` | Kodfilter på observationstyp |
| GetAccessLogForPatient | `subjectOfCareId` | `sourceSystemHSAId`, `careGiverId`, `fromDate`, `toDate` | Datumfilter + vårdgivare |

---

## Detaljerade mappningar – TK-specifika parametrar

### GetCareContacts och GetCareDocumentation – datumintervall och vårdenhet

Dessa två kontrakt delar mönstret med `fromDateTime`/`toDateTime` och `careUnitHSAId`.

#### fromDateTime / toDateTime → `date`

| RIVTA-inparameter | FHIR-sökparameter | Resurs | Kommentar |
|---|---|---|---|
| `fromDateTime` | `date=ge{datum}` | `Encounter`, `DocumentReference` | FHIR `date`-parametern stöder prefixoperatorer: `ge` (≥), `le` (≤), `gt`, `lt` |
| `toDateTime` | `date=le{datum}` | `Encounter`, `DocumentReference` | Kombineras med `fromDateTime` för intervallsökning |

Exempel för GetCareContacts:
```
GET /Encounter?patient.identifier=...&date=ge2024-01-01&date=le2024-12-31
```

`date`-parametern på `Encounter` söker på `Encounter.period` (start och end), vilket stämmer med `careContactTimePeriod` i TKB. För `DocumentReference` söker `date` på `DocumentReference.date` (publiceringstidpunkt), vilket motsvarar `careDocumentation.header.record.timestamp`.

> **OBS:** RIVTA-kontrakten använder formatet `YYYYMMDDhhmmss`; FHIR kräver ISO 8601. Bryggan måste konvertera formaten.

#### careUnitHSAId

| RIVTA-inparameter | FHIR-sökparameter | Kommentar |
|---|---|---|
| `careUnitHSAId` | Ingen direkt standard | `careUnitHSAId` lagras i `Provenance.agent[author].who.identifier`, inte på resursen själv |

`careUnitHSAId` filtrerar i RIVTA på vårdenhet via Sparr-strukturen. I FHIR-mappningen hamnar detta i `Provenance`, inte på huvud-resursen (Encounter/DocumentReference). Det finns inget standardiserat sökfält för att filtrera resurser efter vilken vårdenhet som producerade dem via Provenance.

Alternativa strategier:
1. **Anpassad sökparameter** (rekommenderas): Definiera en `SearchParameter` som söker på `Provenance?agent.who.identifier` via reverse chaining med `_has`. Exempel: `Encounter?_has:Provenance:target:agent.who.identifier=urn:oid:1.2.752.129.2.1.4.1|HSAID`. Detta kräver att servern stöder `_has` och att Provenance-resurser är konsekvent skapade.
2. **Ignorera filtret**: Returnera alla poster och låta FHIR-klienten filtrera lokalt. Acceptabelt om datamängden är liten men skalas dåligt.
3. **Uttryckt i resursen direkt**: Lagra en kopia av `careUnitHSAId` som ett `identifier` eller `extension` på huvud-resursen och definiera en sökparameter mot det. Tillför redundans men förenklar sökning.

> **Beslut saknas (SP-001):** Valet av strategi för `careUnitHSAId`-filtrering är öppet.

---

### GetObservations – observationskod

| RIVTA-inparameter | Kard. | FHIR-sökparameter | Resurs | Kommentar |
|---|---|---|---|---|
| `observationCode` | 0..1 | `code` | `Observation` | Filtrerar på observationstyp (CVType: code + codeSystem). Sökvärde: `code=http://snomed.info/sct\|{snomedkod}` |

`observationCode` i GetObservations är en CVType med `code` och `codeSystem`. I FHIR-mappningen hamnar detta i `Observation.code.coding`. FHIR:s `code`-sökparameter söker på `code.coding.code` kombinerat med system:

```
GET /Observation?patient.identifier=...&code=http://snomed.info/sct|1153637007
```

Detta täcker den vanligaste användningen i IoÖ Tillväxtkurva (se `SEEHDSObservationGrowth`) där specifika SNOMED CT-koder söks. `displayName` och `originalText` i CVType är presentationsdata och inte relevanta för filtrering.

---

### GetRequestActivities – datumintervall

| RIVTA-inparameter | FHIR-sökparameter | Resurs | Kommentar |
|---|---|---|---|
| `fromDate` | `authored=ge{datum}` | `Task` | `Task.authoredOn` (tidpunkt för skapande av aktivitetsbegäran) |
| `toDate` | `authored=le{datum}` | `Task` | Kombineras med `fromDate` |

`GetRequestActivities` returnerar remisstatus och aktiviteter. I FHIR-mappningen (profil `SEEHDSTask`) är `authored` den närmaste tidssöksparametern. `Task` stöder även `modified` (senast ändrad) och `period` (period för aktiviteten) som alternativa filtreringspunkter beroende på vad `fromDate`/`toDate` faktiskt avser i TKB:n – detta bör verifieras.

---

### GetAccessLogForPatient – datumintervall och vårdgivare

| RIVTA-inparameter | Kard. | FHIR-sökparameter | Resurs | Kommentar |
|---|---|---|---|---|
| `fromDate` | 0..1 | `date=ge{datum}` | `AuditEvent` | `AuditEvent.recorded` (händelsetidpunkt) |
| `toDate` | 0..1 | `date=le{datum}` | `AuditEvent` | Kombineras med `fromDate` |
| `careGiverId` | 0..1 | Se nedan | `Provenance` | Filtrerar på ansvarig vårdgivare (Sparr-nivå yttre); lagras i Provenance, inte direkt på AuditEvent |

#### careGiverId – tre möjliga strategier

`careGiverId` i GetAccessLogForPatient avser den juridiskt ansvariga vårdgivaren (yttre Sparr-nivå), konsekvent med hur `healthcareProfessionalCareGiverHSAId` hanteras i övriga kontrakt. I FHIR-mappningen lagras detta i `Provenance.agent[custodian].who.identifier` — inte på AuditEvent direkt.

Tre strategier för att filtrera på `careGiverId` diskuteras:

**Strategi 1 – Provenance-omvänd kedja (rekommenderas som standard)**

Använd FHIR:s `_has`-parameter för att filtera `AuditEvent`-resurser vars associerade `Provenance` pekar på en viss vårdgivare:

```
GET /AuditEvent?patient.identifier=...&date=ge2024-01-01
  &_has:Provenance:target:agent.who.identifier=urn:oid:1.2.752.129.2.1.4.1|SE2321000016-AB1C
```

Kräver att servern stöder `_has` (reverse chaining) och att Provenance-resurser konsekvent skapas per AuditEvent med korrekt `agent[custodian]`. Fungerar utan serverspecifika tillägg men `_has` implementeras ej i alla FHIR-servrar.

**Strategi 2 – HSA-trädklättring**

HSA-katalogen är hierarkisk: en vårdgivare (`careGiverId`) kan ha ett eller flera hundra HSA-id:n på underordnade enheter. Idén är att bryggan, innan sökningen, slår upp alla HSA-id:n under given vårdgivare i HSA och sedan filtrerar på enhetsnivå via `_source` (sourceSystemHSAId). Fördelen är att inga anpassade FHIR-parametrar behövs; nackdelen är ett externt beroende på HSA-tjänsten och potentiellt ett stort antal enhets-HSA-id:n att söka på.

```
# Pseudokod
enhetslista = hsa.getUnitsUnder(careGiverId)
GET /AuditEvent?patient.identifier=...&_source:in={enhetslista}
```

Kräver att `_source:in` (multi-value) eller upprepade `_source`-parametrar stöds av servern. Prestanda- och träffbarhetsöverväganden tillkommer beroende på HSA-strukturens storlek.

**Strategi 3 – Multitenant FHIR-server**

HAPI FHIR och andra servrar stöder multitenancy där varje tenant (t.ex. en vårdgivare) har en separat del i URL:en:

```
GET /{careGiverId}/fhir/AuditEvent?patient.identifier=...
```

Här är `careGiverId` implicit i URL-kontexten och behöver inte vara en sökparameter. Klienten vet vilken vårdgivare den söker mot via URL:ens bas. Fördelen är enkel söksyntax; nackdelen är att det kräver ett val av serverarkitektur och fungerar dåligt om en klient vill söka över flera vårdgivare i ett anrop.

> **Jämförelse:** Strategi 1 är mest FHIR-standard men kräver `_has`-stöd. Strategi 2 minskar FHIR-serverkraven men lägger komplexitet i bryggan och skapar HSA-beroende. Strategi 3 passar bäst om varje installation alltid representerar exakt en vårdgivare (typiskt för en brygga per region). Beslutet är arkitekturellt och beroende av val av FHIR-serverprodukt — se SP-005.

---

## Saknade standardmappningar

Nedanstående RIVTA-parametrar saknar direkt FHIR-standardmotpart och kräver antingen anpassade sökparametrar eller workarounds:

| RIVTA-inparameter | Förekommer i | Problem | Potentiell lösning |
|---|---|---|---|
| `careUnitHSAId` | GetCareContacts, GetCareDocumentation, GetObservations | Lagras i Provenance, inte på resursen | Anpassad SP med `_has:Provenance:target:agent.who.identifier` (se SP-001) |
| `sourceSystemHSAId` | Alla | `_source` stöds ej universellt och URI-fragmentet kan ge problem | Verifiera `_source`-stöd per server; alternativt anpassad sökparameter på `meta.source` |

---

## Paginering – GetCareDocumentation

GetCareDocumentation stöder implicit paginering via `hasMore`-flaggan i svaret. I FHIR hanteras paginering med `_count` och `Bundle.link[next]` (cursor-baserad eller offset-baserad beroende på server). Bryggimplementationen måste mappa RIVTA:s `hasMore`-logik till FHIR:s Bundle-pagineringsmekanism.

| RIVTA-mekanism | FHIR-ekvivalent |
|---|---|
| `hasMore = true` i svar | `Bundle.link[rel="next"]` med `_count`-parameter |
| Upprepad begäran med offset | Använd `next`-länken från föregående Bundle-svar |

---

## Öppna frågor

| ID | Fråga | Status |
|---|---|---|
| SP-001 | **`careUnitHSAId`-filtrering saknar standardlösning.** Vårdenhet lagras i Provenance, inte på huvud-resursen. Tre strategier diskuteras ovan (anpassad SP med `_has`, ignorera filter, duplicera till resurs). Kräver implementationsbeslut. | Öppen |
| SP-002 | **`_source`-sökparameter – implementationsstöd.** `_source` är standard i R4 men saknas i många FHIR-serverimplementationer. Ska en anpassad sökparameter definieras på `meta.source` som fallback? | Öppen |
| SP-003 | **Datumparametrars semantik.** RIVTA:s `fromDateTime`/`toDateTime` avser i de flesta fall händelsetidpunkten (t.ex. `careContactTimePeriod.start`). Verifiering behövs att rätt FHIR `date`-fält söks per resurstyp (t.ex. `Encounter.period` vs. `Encounter.meta.lastUpdated`). | Öppen |
| SP-004 | **Paginering GetCareDocumentation.** RIVTA `hasMore`-flaggans exakta semantik (hur många poster per sida, max-gräns) är ej specificerad i TKB:n. Behöver klarläggas för korrekt FHIR Bundle-paginering. | Öppen |
| SP-005 | **`careGiverId`-filtrering i GetAccessLogForPatient saknar standardlösning.** Vårdgivare lagras i `Provenance.agent[custodian].who.identifier`, inte på AuditEvent direkt. Tre strategier diskuteras ovan (Provenance `_has` reverse chain, HSA-trädklättring, multitenant FHIR-server). Beslutet är arkitekturellt och beroende av val av FHIR-serverprodukt. | Öppen |
