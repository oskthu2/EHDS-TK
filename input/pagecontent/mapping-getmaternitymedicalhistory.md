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
    documentTitle               [0..1]
    documentTime                [1..1]
    patientId                   [1..1]
      patientId.value           [1..1]
      patientId.system          [1..1]
    accountableHealthcareProfessional [1..1]
      authorTime                        [1..1]
      healthcareProfessionalHSAId       [1..1]  (OBLIGATORISK i detta TK)
      healthcareProfessionalName        [0..1]
      healthcareProfessionalRoleCode    [0..1]
      healthcareProfessionalOrgUnit     [0..1]
        orgUnitHSAId            [1..1]
        orgUnitName             [1..1]
        orgUnitTelecom          [0..1]
        orgUnitEmail            [0..1]
        orgUnitAddress          [0..1]
        orgUnitLocation         [0..1]
      healthcareProfessionalCareUnitHSAId [1..1] (OBLIGATORISK i detta TK)
      healthcareProfessionalCareGiverHSAId [1..1] (OBLIGATORISK i detta TK)
    legalAuthenticator          [0..1]
      signatureTime             [1..1]
      legalAuthenticatorHSAId   [0..1]
      legalAuthenticatorName    [0..1]
    approvedForPatient          [1..1]  boolean
    careContactId               [0..1]
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

### Dokumentidentitet och patient

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `maternityMedicalRecordHeader.documentId` | 1..1 | `Observation.identifier[0].value` | Unikt dokument-id; suffix `#{sektionskod}` läggs till för att skilja de tre Observation-resurserna |
| `maternityMedicalRecordHeader.sourceSystemHSAId` | 1..1 | `Observation.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `maternityMedicalRecordHeader.documentTitle` | 0..1 | Ej mappad | Dokumenttitel finns inte som strukturerat fält i Observation; kan eventuellt läggas i `Observation.note[0].text` men anses ej kliniskt relevant för FHIR-konsumtion (se MAT-002) |
| `maternityMedicalRecordHeader.documentTime` | 1..1 | `Observation.issued` | Dokumentets registreringstidpunkt; YYYYMMDDHHMMSS → ISO 8601. OBS: `authorTime` (se nedan) används för `effectiveDateTime` |
| `maternityMedicalRecordHeader.patientId.value` | 1..1 | `Observation.subject.identifier.value` | Personnummer eller samordningsnummer |
| `maternityMedicalRecordHeader.patientId.system` | 1..1 | `Observation.subject.identifier.system` | OID→URI-konvertering; se OID-tabell nedan |

### Ansvarig hälso- och sjukvårdspersonal

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Observation.effectiveDateTime` | Dokumentationstidpunkt; YYYYMMDDHHMMSS → ISO 8601 (se GENERAL-001) |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 1..1 | `Observation.performer[0].identifier.value` | HSA-id för ansvarig yrkesperson (OBLIGATORISK i detta TK) |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `Observation.performer[0].display` | Namn i klartext; komplement till HSA-id |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Befattningskod; via PractitionerRole-resurs refererad från `Observation.performer` |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 1..1 | `PractitionerRole.organization.identifier.value` | HSA-id för organisationsenhet |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 1..1 | `PractitionerRole.organization.display` | Namn på organisationsenhet |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Enhetens telefonnummer – kontaktuppgifter för enheten representeras via Organization-resursen men ingen mappning fastlagd; se MAT-002 |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | Enhetens e-post – kontaktuppgifter för enheten representeras via Organization-resursen men ingen mappning fastlagd; se MAT-002 |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Enhetens adress – kontaktuppgifter för enheten representeras via Organization-resursen men ingen mappning fastlagd; se MAT-002 |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Enhetens plats/lokalbeteckning – ej strukturerat fält i FHIR Observation; se MAT-002 |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 1..1 | `Provenance.agent[author].who.identifier.value` | HSA-id för vårdenhet; Inre Sparr (OBLIGATORISK i detta TK) |
| `maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 1..1 | `Provenance.agent[custodian].who.identifier.value` | HSA-id för vårdgivare; Yttre Sparr (OBLIGATORISK i detta TK) |

### Juridisk autentisering

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `maternityMedicalRecordHeader.legalAuthenticator.signatureTime` | 1..1 | `Observation.extension[assertedDate]` | Signeringstidpunkt; lokal extension (ingen standardekvivalent i R4 Observation) |
| `maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `Observation.asserter.identifier.value` | HSA-id för juridiskt ansvarig signatär; via asserter-referens till Practitioner |
| `maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens; namn hämtas från HSA-katalogen vid behov |

### PDL och övriga headerfält

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `maternityMedicalRecordHeader.approvedForPatient` | 1..1 | `Observation.meta.security` | Boolean; styr 1177-synlighet (se PDL-001); mappas till säkerhetsmärkning i `meta.security` |
| `maternityMedicalRecordHeader.careContactId` | 0..1 | `Observation.encounter.identifier` | Logisk referens till Encounter via identifierare |

---

## Mappningstabell – tekniska responsfält (result.*)

Dessa fält är en del av RIVTA-transportlagrets standardsvar och bär ingen klinisk information. De hanteras av infrastrukturlagret och mappas inte till FHIR-resurser.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod (OK/ERROR) – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.logId` | 0..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## Mappningstabell – registrationRecord (inskrivningsuppgifter)

Sektionen skapar en Observation med `code = maternity-section#registration` och
samtliga underfält mappas som `Observation.component`-poster.

### Beräknat nedkomstdatum och graviditetsstatus

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
| `registrationRecord.previousGravidityAndParity[i].year` | 1..1 | `Observation.component[prev-delivery-{i}-year].valueInteger` | Förlossningsår |
| `registrationRecord.previousGravidityAndParity[i].month` | 1..1 | `Observation.component[prev-delivery-{i}-month].valueInteger` | Förlossnings­månad |
| `registrationRecord.previousGravidityAndParity[i].delivery` | 0..1 | `Observation.component[prev-delivery-{i}-type].valueCodeableConcept` | Förlossningssätt |
| `registrationRecord.previousGravidityAndParity[i].healthcareFacility` | 0..1 | `Observation.component[prev-delivery-{i}-facility].valueString` | Vårdinrättningens namn i fritext; ingen strukturerad referens tillgänglig från TKB |
| `registrationRecord.previousGravidityAndParity[i].progress` | 0..1 | `Observation.component[prev-delivery-{i}-progress].valueString` | Förlopp i fritext |
| `registrationRecord.previousGravidityAndParity[i].sex` | 0..1 | `Observation.component[prev-delivery-{i}-sex].valueCodeableConcept` | Barnets kön |
| `registrationRecord.previousGravidityAndParity[i].weightOfChild` | 0..1 | `Observation.component[prev-delivery-{i}-weight].valueQuantity` | Barnets födslovikt (g) |
| `registrationRecord.previousGravidityAndParity[i].gestation` | 0..1 | `Observation.component[prev-delivery-{i}-gestation].valueInteger` | Gestationsålder vid förlossning (veckor) |

### Sjukdomar och riskfaktorer (booleska fält)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.diseasesThrombosis` | 0..1 | `Observation.component[disease-thrombosis].valueBoolean` | Trombossjukdom i anamnes |
| `registrationRecord.diseasesEndocineDiseases` | 0..1 | `Observation.component[disease-endocrine].valueBoolean` | Endokrinsjukdom i anamnes |
| `registrationRecord.diseasesRecurrentUrinaryTractInfections` | 0..1 | `Observation.component[disease-uti-recurrent].valueBoolean` | Recidiverande urinvägsinfektioner i anamnes |
| `registrationRecord.diseasesDiabetesMellitus` | 0..1 | `Observation.component[disease-diabetes].valueBoolean` | Diabetes mellitus i anamnes |

### Läkemedel under graviditet

`medicationDuringPregnacy` är en repeterad sektion. Varje läkemedel mappas som
ett komponent-par (namn + dosering) med löpande index:

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `registrationRecord.medicationDuringPregnacy[i].medicament` | 1..1 | `Observation.component[medication-pregnancy-{i}-name].valueString` | Läkemedelsnamn/-beskrivning; FHIR MedicationStatement är alternativ resurstyp (se MAT-001) |
| `registrationRecord.medicationDuringPregnacy[i].dosage` | 0..1 | `Observation.component[medication-pregnancy-{i}-dosage].valueString` | Doseringsbeskrivning i fritext |

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
| `pregnancyCheckupRecord.fetalPosition` | 0..* | `Observation.component[fetal-position].valueCodeableConcept` | Fosterläge; från `FetalPositionCodeCS`; repeterbara komponenter vid flera foster |
| `pregnancyCheckupRecord.fetalPresentation` | 0..* | `Observation.component[fetal-presentation].valueCodeableConcept` | Bjudning; repeterbara komponenter vid flera foster |
| `pregnancyCheckupRecord.fetalHeartRate` | 0..* | `Observation.component[fetal-heart-rate].valueQuantity` | Fosterhjärtfrekvens; LOINC `55283-6`; enhet /min; repeterbara vid flera foster |

### Ledighet

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.typeOfLeave` | 0..* | `Observation.component[leave-type].valueCodeableConcept` | Ledighetstyp; från `TypeOfLeaveCodeCS`; repeterbara |

### Läkemedel sedan inskrivning

`medicationSinceRegistration` är en repeterad sektion. Varje läkemedel mappas som
ett komponent-par (namn + dosering) med löpande index:

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `pregnancyCheckupRecord.medicationSinceRegistration[i].medicament` | 1..1 | `Observation.component[medication-since-reg-{i}-name].valueString` | Läkemedel tillagt sedan inskrivning |
| `pregnancyCheckupRecord.medicationSinceRegistration[i].dosage` | 0..1 | `Observation.component[medication-since-reg-{i}-dosage].valueString` | Doseringsbeskrivning i fritext |

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
| `postDeliveryRecord.motherPostDeliveryRecord.scarsOK` | 0..1 | `Observation.component[postpartum-scars-ok].valueBoolean` | Ärr utan anmärkning |
| `postDeliveryRecord.motherPostDeliveryRecord.sutureRemoved` | 0..1 | `Observation.component[postpartum-suture-removed].valueBoolean` | Suturer/stygn borttagna |
| `postDeliveryRecord.motherPostDeliveryRecord.perineumComfortable` | 0..1 | `Observation.component[postpartum-perineum-ok].valueBoolean` | Perineum utan anmärkning |
| `postDeliveryRecord.motherPostDeliveryRecord.vulvaVaginaPortioOK` | 0..1 | `Observation.component[postpartum-vulva-ok].valueBoolean` | Vulva/vagina/portio utan anmärkning |
| `postDeliveryRecord.motherPostDeliveryRecord.uterusContracted` | 0..1 | `Observation.component[postpartum-uterus-contracted].valueBoolean` | Uterus kontraherad |
| `postDeliveryRecord.motherPostDeliveryRecord.uterusNote` | 0..1 | `Observation.component[postpartum-uterus-note].valueString` | Fri anteckning om uterus |

### Barnuppgifter efter förlossning

`childPostDeliveryRecord` är repeterat (ett element per barn). Varje barns data
separeras med ordningsnumret `ordinalNumber` i komponent-koden:

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `postDeliveryRecord.childPostDeliveryRecord[i].ordinalNumber` | 1..1 | *(ingår i komponent-kodens suffix `{i}`)* | Skiljer barn 1, 2 osv. vid flerbörd; ingår ej som separat komponent utan används som index |
| `postDeliveryRecord.childPostDeliveryRecord[i].weight` | 0..1 | `Observation.component[child-{i}-birth-weight].valueQuantity` | Födslovikt; LOINC `8339-4`; enhet g |
| `postDeliveryRecord.childPostDeliveryRecord[i].apgarScore1` | 0..1 | `Observation.component[child-{i}-apgar-1min].valueInteger` | Apgar 1 minut; LOINC `9272-6`; skala 0–10 |
| `postDeliveryRecord.childPostDeliveryRecord[i].apgarScore5` | 0..1 | `Observation.component[child-{i}-apgar-5min].valueInteger` | Apgar 5 minuter; LOINC `9274-2`; skala 0–10 |
| `postDeliveryRecord.childPostDeliveryRecord[i].apgarScore10` | 0..1 | `Observation.component[child-{i}-apgar-10min].valueInteger` | Apgar 10 minuter; LOINC `9271-8`; skala 0–10 |

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
som `Observation.effectiveDateTime`. `documentTime` (registreringstidpunkt) mappas
till `Observation.issued` om de skiljer sig åt.

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

### OrgUnit-kontaktuppgifter (orgUnitTelecom, orgUnitEmail, orgUnitAddress, orgUnitLocation)

Dessa fyra fält representerar enhetens kontaktinformation. De saknar en naturlig
plats i Observation-resursen och tillhör egentligen Organization-resursen i FHIR.
I en fullständig implementation bör de mappas till `Organization.telecom`, 
`Organization.address`, och `Organization.address.line` på den Organization som
PractitionerRole refererar. Ingen mappning fastlagd i nuläget; se MAT-002.

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
| Patientgodkännande (1177) | `maternityMedicalRecordHeader.approvedForPatient` | `Observation.meta.security` (se PDL-001) |
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

---

## Föreslagna nya issues

| Id | Fråga | Prioritet |
|---|---|---|
| MAT-002 | `orgUnitTelecom`, `orgUnitEmail`, `orgUnitAddress` och `orgUnitLocation` saknar fastlagd FHIR-mappning. Dessa bör mappas till `Organization.telecom` och `Organization.address` på den Organization-resurs som PractitionerRole refererar. Kräver beslut om Organization-profil och om kontaktuppgifter ska inkluderas i svaret. | Medium |
| MAT-003 | `documentTitle` (0..1 string i header) saknar naturligt mottagarfält i Observation. Behöver utredas om `Observation.note[0].text`, en lokal extension, eller `Composition.title` (om MAT-001 löses med Composition) ska användas. | Låg |
| MAT-004 | `legalAuthenticator.signatureTime` saknar standardfält i FHIR R4 Observation. Nuvarande förslag är lokal extension `assertedDate`. Bör utredas om FHIR R5-mönstret (`Observation.note` med tidsstämpel) eller en Provenance-baserad lösning är att föredra för R4-kompatibilitet. | Medium |
