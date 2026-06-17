# GetMaternityMedicalHistory – Mödravård

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetMaternityMedicalHistory v2.0  
**FHIR-profil:** [SEEHDSObservationMaternity](StructureDefinition-se-ehds-observation-maternity.html)  
**Logisk modell:** [SEEHDSLMMaternityMedicalHistory](StructureDefinition-se-ehds-lm-maternity-medical-history.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Mödravårdsdata – bakgrundsinformation i Patient Summary

> **Designvarning (MAT-001):** Tjänstekontraktet returnerar en komplex flersektions­struktur
> med tre distinkta avsnitt (`registrationRecord`, `pregnancyCheckupRecord`,
> `postDeliveryRecord`). En enskild FHIR `Observation`-resurs kan **inte** representera
> alla tre avsnitt i ett enda objekt. Se avsnitt
> [Flersektionsdesign (MAT-001)](#flersektionsdesign-mat-001) för vald lösning.

---

## Datamodell – översikt

```
maternityMedicalRecord [0..*]
  maternityMedicalRecordHeader [1..1]          ← standard PatientSummaryHeader
    documentId                  [1..1]
    sourceSystemHSAId           [1..1]
    patientId                   [1..1]
    accountableHealthcareProfessional [1..1]
      healthcareProfessionalHSAId       [1..1]  (OBLIGATORISK i detta TK)
      healthcareProfessionalCareUnitHSAId [1..1] (OBLIGATORISK i detta TK)
      healthcareProfessionalCareGiverHSAId [1..1] (OBLIGATORISK i detta TK)
      authorTime                        [1..1]
    legalAuthenticator          [0..1]
    approvedForPatient          [1..1]  boolean
  maternityMedicalRecordBody [1..1]
    registrationRecord          [0..1]          ← inskrivningsuppgifter
    pregnancyCheckupRecord      [0..1]          ← graviditetskontroll
    postDeliveryRecord          [0..1]          ← eftervård
```

---

## Flersektionsdesign (MAT-001)

Eftersom `maternityMedicalRecordBody` innehåller upp till tre oberoende avsnitt med
var sin semantik, och FHIR `Observation.component` är avsedd för del­mätningar av
**samma** kliniska mätevent, väljs följande strategi:

**En `Observation`-resurs skapas per sektion som är populerad i svaret.** Varje
Observation särskiljs via `Observation.code`:

| Sektion i TKB | `Observation.code` | Lokal kod |
|---|---|---|
| `registrationRecord` | Inskrivning mödravård | `https://fhir.inera.se/ig/ehds-tk/CodeSystem/maternity-section#registration` |
| `pregnancyCheckupRecord` | Graviditetskontroll | `https://fhir.inera.se/ig/ehds-tk/CodeSystem/maternity-section#checkup` |
| `postDeliveryRecord` | Eftervård | `https://fhir.inera.se/ig/ehds-tk/CodeSystem/maternity-section#post-delivery` |

Alla tre Observation-resurser från samma `maternityMedicalRecord` **delar** samma
header-data och länkas samman via ett gemensamt `Observation.basedOn` eller
`Observation.partOf`-fält (se MAT-001).

---

## Mappningstabell – Header (gemensam för alla sektioner)

Header-fälten gäller samtliga Observation-resurser som härleds ur ett
`maternityMedicalRecord`-objekt.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `maternityMedicalRecordHeader.patientId.extension` | 1..1 | `Observation.subject.identifier.value` | Personnummer eller samordningsnummer |
| `maternityMedicalRecordHeader.patientId.root` | 1..1 | `Observation.subject.identifier.system` | OID→URI, se tabell nedan |
| `maternityMedicalRecordHeader.sourceSystemHSAId` | 1..1 | `Observation.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `maternityMedicalRecordHeader.documentId` | 1..1 | `Observation.identifier.value` | Unikt dokument-id; suffix `#{sektionskod}` läggs till för att skilja de tre Observation-resurserna |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Observation.issued` | Dokumentationstidpunkt; YYYYMMDDHHMMSS → ISO 8601 (se GENERAL-001) |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 1..1 | `Observation.performer[0].identifier.value` | HSA-id för ansvarig yrkesperson (OBLIGATORISK i detta TK) |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 1..1 | `Observation.performer[0].organization.identifier.value` | HSA-id för vårdenhet (OBLIGATORISK i detta TK) |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 1..1 | `Provenance.agent[custodian].who.identifier.value` | HSA-id för vårdgivare; yttre Sparr (OBLIGATORISK i detta TK) |
| `maternityMedicalRecordHeader.legalAuthenticator` | 0..1 | `Observation.extension[legalAuthenticator]` | Ingen direkt FHIR R4 Observation-ekvivalent; lokal extension |
| `maternityMedicalRecordHeader.approvedForPatient` | 1..1 | `Observation.extension[approvedForPatient]` | Boolean; styr 1177-synlighet (se PDL-001) |

---

## Mappningstabell – registrationRecord (inskrivningsuppgifter)

Sektionen skapar en Observation med `code = maternity-section#registration` och
samtliga underfält mappas som `Observation.component`-poster.

### Beräknat beräknat nedkomstdatum och graviditetsstatus

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.lastMenstrualPeriod` | 0..1 | `Observation.component[lmp].valueDateTime` | Sista menstruationens första dag; YYYYMMDD → YYYY-MM-DD |
| `registrationRecord.indicationPregnancy` | 0..1 | `Observation.component[indication-pregnancy].valueDateTime` | Datum för graviditetsindikation |
| `registrationRecord.contraceptiveDiscontinued` | 0..1 | `Observation.component[contraceptive-discontinued].valueDateTime` | Datum för preventivmedelsavstängning |
| `registrationRecord.expectedDayOfDeliveryFromLastMenstrualPeriod` | 0..1 | `Observation.component[edd-lmp].valueDateTime` | Beräknat nedkomstdatum från senaste mens; LOINC `11778-8` |
| `registrationRecord.expectedDayOfDeliveryFromUltrasoundScan` | 0..1 | `Observation.component[edd-us].valueDateTime` | Beräknat nedkomstdatum från ultraljud; LOINC `11779-6` |
| `registrationRecord.expectedDayOfDeliveryFromEmbryonicTransfer` | 0..1 | `Observation.component[edd-et].valueDateTime` | Beräknat nedkomstdatum från embryotransfer |

### Antropometri vid inskrivning

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.length` | 0..1 | `Observation.component[body-height].valueQuantity` | Kroppslängd; LOINC `8302-2`; enhet cm (UCUM) |
| `registrationRecord.weight` | 0..1 | `Observation.component[body-weight].valueQuantity` | Kroppsvikt; LOINC `29463-7`; enhet kg (UCUM) |
| `registrationRecord.bodyMassIndex` | 0..1 | `Observation.component[bmi].valueQuantity` | BMI; LOINC `39156-5`; enhet kg/m2 (UCUM) |

### Infertilitetsbehandling

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.infertility` | 0..1 | `Observation.component[infertility-duration].valueQuantity` | Duration av infertilitetsbehandling (år, decimal) |

### Tidigare graviditeter och förlossningar

`previousGravidityAndParity` är en repeterad sektion. Varje post mappas till ett
unikt `component`-set med ett ordningsnummer i `component.code.text`:

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.previousGravidityAndParity[i].year` | 0..* | `Observation.component[prev-delivery-{i}-year].valueDateTime` | Förlossningsår |
| `registrationRecord.previousGravidityAndParity[i].month` | 0..* | `Observation.component[prev-delivery-{i}-month].valueInteger` | Förlossnings­månad |
| `registrationRecord.previousGravidityAndParity[i].delivery` | 0..* | `Observation.component[prev-delivery-{i}-type].valueCodeableConcept` | Förlossningssätt |
| `registrationRecord.previousGravidityAndParity[i].progress` | 0..* | `Observation.component[prev-delivery-{i}-progress].valueString` | Förlopp |
| `registrationRecord.previousGravidityAndParity[i].sex` | 0..* | `Observation.component[prev-delivery-{i}-sex].valueCodeableConcept` | Barnets kön |
| `registrationRecord.previousGravidityAndParity[i].weightOfChild` | 0..* | `Observation.component[prev-delivery-{i}-weight].valueQuantity` | Barnets födslovikt (g) |
| `registrationRecord.previousGravidityAndParity[i].gestation` | 0..* | `Observation.component[prev-delivery-{i}-gestation].valueInteger` | Gestationsålder vid förlossning (veckor) |

### Sjukdomar och riskfaktorer (booleska fält)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.diseasesThrombosis` | 0..1 | `Observation.component[disease-thrombosis].valueBoolean` | Trombossjukdom i anamnes |
| `registrationRecord.diseasesEndocineDiseases` | 0..1 | `Observation.component[disease-endocrine].valueBoolean` | Endokrinsjukdom i anamnes |

> **OBS:** TKB innehåller ytterligare booleska sjukdomsfält utöver de två ovan.
> Samtliga mappas på samma sätt med komponent-kod `disease-{sjukdomstyp}`. Komplett
> lista återfinns i den logiska modellen
> [SEEHDSLMMaternityMedicalHistory](StructureDefinition-se-ehds-lm-maternity-medical-history.html).

### Läkemedel under graviditet

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.medicationDuringPregnacy[*]` | 0..* | `Observation.component[medication-pregnancy-{i}].valueString` | Läkemedelsnamn/-beskrivning; FHIR MedicationStatement är alternativ resurstyp (se MAT-001) |

### Bedömning första kontakt

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.assessmentAtFirstContactStandardCare` | 0..1 | `Observation.component[first-contact-std-care].valueBoolean` | Bedömning: standardvård vid första kontakt |

---

## Mappningstabell – pregnancyCheckupRecord (graviditetskontroll)

Sektionen skapar en Observation med `code = maternity-section#checkup`.

### Gestationsålder och vikt

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.completeWeeksOfGestation` | 0..1 | `Observation.component[gestation-weeks].valueInteger` | Fullgångna graviditetsveckor; LOINC `49051-6` |
| `pregnancyCheckupRecord.weight` | 0..1 | `Observation.component[body-weight].valueQuantity` | Aktuell vikt; LOINC `29463-7`; enhet kg |
| `pregnancyCheckupRecord.symphysisFundalHeight` | 0..1 | `Observation.component[sfh].valueQuantity` | Symfys-fundusavstånd; LOINC `11881-0`; enhet cm |

### Blodstatus

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.haemoglobin` | 0..1 | `Observation.component[haemoglobin].valueQuantity` | Hb; LOINC `718-7`; enhet g/dL |

### Blodtryck

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.bloodPressureSystolic` | 0..1 | `Observation.component[bp-systolic].valueQuantity` | Systoliskt blodtryck; LOINC `8480-6`; enhet mmHg |
| `pregnancyCheckupRecord.bloodPressureDiastolic` | 0..1 | `Observation.component[bp-diastolic].valueQuantity` | Diastoliskt blodtryck; LOINC `8462-4`; enhet mmHg |

### Urinstatus

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.proteinuria` | 0..1 | `Observation.component[proteinuria].valueCodeableConcept` | Proteinuri; kodverk (negativ/spår/+/++/+++); LOINC `2888-6` |
| `pregnancyCheckupRecord.glycosuria` | 0..1 | `Observation.component[glycosuria].valueCodeableConcept` | Glukosuri; kodverk negativ/positiv; LOINC `2349-9` |

### Fosterdata

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.fetalPosition` | 0..1 | `Observation.component[fetal-position].valueCodeableConcept` | Fosterläge; från `FetalPositionCodeCS` |
| `pregnancyCheckupRecord.fetalPresentation` | 0..1 | `Observation.component[fetal-presentation].valueCodeableConcept` | Bjudning |
| `pregnancyCheckupRecord.fetalHeartRate` | 0..1 | `Observation.component[fetal-heart-rate].valueQuantity` | Fosterhjärtfrekvens; LOINC `55283-6`; enhet /min |

### Ledighet

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.typeOfLeave` | 0..1 | `Observation.component[leave-type].valueCodeableConcept` | Ledighetstyp; från `TypeOfLeaveCodeCS` |

### Läkemedel sedan inskrivning

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.medicationSinceRegistration[*]` | 0..* | `Observation.component[medication-since-reg-{i}].valueString` | Läkemedel tillagda sedan inskrivning |

---

## Mappningstabell – postDeliveryRecord (eftervård)

Sektionen skapar en Observation med `code = maternity-section#post-delivery`.
Sektionen är uppdelad i moderuppgifter (`motherPostDeliveryRecord`, kard. 1..1) och
barnuppgifter (`childPostDeliveryRecord`, kard. 1..*).

### Moderuppgifter efter förlossning

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `postDeliveryRecord.motherPostDeliveryRecord.breastfeeding` | 0..1 | `Observation.component[breastfeeding].valueBoolean` | Ammar ja/nej |
| `postDeliveryRecord.motherPostDeliveryRecord.bloodPressureSystolic` | 0..1 | `Observation.component[postpartum-bp-sys].valueQuantity` | Systoliskt BT postpartum; enhet mmHg |
| `postDeliveryRecord.motherPostDeliveryRecord.bloodPressureDiastolic` | 0..1 | `Observation.component[postpartum-bp-dia].valueQuantity` | Diastoliskt BT postpartum; enhet mmHg |
| `postDeliveryRecord.motherPostDeliveryRecord.haemoglobin` | 0..1 | `Observation.component[postpartum-hb].valueQuantity` | Hb postpartum; enhet g/dL |
| `postDeliveryRecord.motherPostDeliveryRecord.bodyTemperature` | 0..1 | `Observation.component[postpartum-temp].valueQuantity` | Kroppstemperatur; LOINC `8310-5`; enhet Cel |

> **OBS:** `motherPostDeliveryRecord` kan innehålla ytterligare fält (t.ex.
> blödning, uteruskontraktion). Komplett lista återfinns i den logiska modellen.

### Barnuppgifter efter förlossning

`childPostDeliveryRecord` är repeterat (ett element per barn). Varje barns data
separeras med ordningsnumret `ordinalNumber` i komponent-koden:

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `postDeliveryRecord.childPostDeliveryRecord[i].ordinalNumber` | 1..* | *(ingår i komponent-kodens suffix `{i}`)* | Skiljer barn 1, 2 osv. vid flerbörd |
| `postDeliveryRecord.childPostDeliveryRecord[i].weight` | 0..* | `Observation.component[child-{i}-birth-weight].valueQuantity` | Födslovikt; LOINC `8339-4`; enhet g |
| `postDeliveryRecord.childPostDeliveryRecord[i].apgarScore1` | 0..* | `Observation.component[child-{i}-apgar-1min].valueInteger` | Apgar 1 minut; LOINC `9272-6`; skala 0–10 |
| `postDeliveryRecord.childPostDeliveryRecord[i].apgarScore5` | 0..* | `Observation.component[child-{i}-apgar-5min].valueInteger` | Apgar 5 minuter; LOINC `9274-2`; skala 0–10 |
| `postDeliveryRecord.childPostDeliveryRecord[i].apgarScore10` | 0..* | `Observation.component[child-{i}-apgar-10min].valueInteger` | Apgar 10 minuter; LOINC `9271-8`; skala 0–10 |

---

## Härledda fält och designbeslut

### Observation.status

Inget explicit statusfält finns i GetMaternityMedicalHistory. `Observation.status`
sätts statiskt till `final` för alla producerade Observation-resurser, eftersom
ett svarsmeddelande från tjänstekontraktet representerar en färdig journalpost.

### Observation.category

Alla Observation-resurser tilldelas kategorin `survey` från
`http://terminology.hl7.org/CodeSystem/observation-category` för att reflektera
att mödravårdsdata samlas in som strukturerade formuläruppgifter.

### Observation.effective[x]

`maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime` används
som approximation för `Observation.effectiveDateTime` när ingen mer specifik
observationstidpunkt finns i body-sektionen.

### Länkning av sektioner (MAT-001)

För att hålla ihop de tre sektions-Observationerna från ett och samma
`maternityMedicalRecord` används:

- Gemensamt `Observation.identifier`-prefix baserat på `documentId`.
- En `List`-resurs (FHIR R4) som refererar alla tre Observation-resurser och
  bär `documentId` som sin `identifier`. Detta är öppen fråga (MAT-001).

### Läkemedel – alternativ representation

`medicationDuringPregnacy` och `medicationSinceRegistration` innehåller
läkemedelsbeskrivningar som i en fullständig implementering bör representeras
som separata `MedicationStatement`-resurser med referens från Observation.
I nuvarande mappning används `valueString` som förenkling i avvaktan på
profilbeslut (se MAT-001).

---

## PDL och Sparr

GetMaternityMedicalHistory använder **standard `PatientSummaryHeader`** med
`accountableHealthcareProfessional` som inkluderar både `healthcareProfessionalCareUnitHSAId`
och `healthcareProfessionalCareGiverHSAId`. Dessa är **OBLIGATORISKA** i detta TK
(till skillnad från att vara valfria i andra TK som delar headertypen).

| PDL/Sparr-begrepp | RIVTA-element | FHIR-destination |
|---|---|---|
| Yttre Sparr (vårdgivare) | `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande (1177) | `maternityMedicalRecordHeader.approvedForPatient` | `Observation.extension[approvedForPatient]` (se PDL-001) |
| Skyddad identitet | *(ej explicit i detta TK – ärvs från patient)* | `Observation.meta.security` |

---

## Provenance

En `Provenance`-resurs skapas per `maternityMedicalRecord`-objekt och refererar
samtliga Observation-resurser producerade från det objektet.

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar alla Observation-resurser från samma post via
`urn:uuid:{Observation.id}`.  
`Provenance.recorded` = `maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime`
(konverterat till ISO 8601).

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

| Id | Fråga | Status |
|---|---|---|
| MAT-001 | Flersektionsstrukturen (registrationRecord / pregnancyCheckupRecord / postDeliveryRecord) passar inte i en enda Observation. Bör en `List`-resurs eller `Composition` användas för att länka sektionerna? Bör `MedicationStatement` användas för läkemedelsdata istället för `valueString`-komponenter? | Öppen |
| PDL-001 | `approvedForPatient` (boolean) styr synlighet i 1177 Journal. Hur ska detta mappas till FHIR på ett interoperabelt sätt? Extension på Observation? `meta.tag` med säkerhetsklassning? Kräver beslut från Inera/1177-förvaltning. | Öppen |
| GENERAL-001 | Gemensam hantering av RIVTA variabelprecisions-tidsstämplar (YYYYMMDDHHMMSS, YYYYMMDD, YYYYMM, YYYY) vid konvertering till ISO 8601 och tidszon Europe/Stockholm behöver dokumenteras i gemensam konverteringsspecifikation. | Öppen |
