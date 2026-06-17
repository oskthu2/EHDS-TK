# GetVaccinationHistory – Vaccinationshistorik

**Tjänstekontrakt:** `clinicalprocess:activityprescription:actoutcome` GetVaccinationHistory v2.0  
**FHIR-profil:** [SEEHDSImmunization](StructureDefinition-se-ehds-immunization.html)  
**Logisk modell:** [SEEHDSLMVaccinationHistory](StructureDefinition-se-ehds-lm-vaccination-history.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v1.0, 2.0)  
**EHDS-koppling:** Patient Summary – Vaccinationer

---

> **VIKTIGT – Namnkonvention för header-element i detta TK**
>
> GetVaccinationHistory v2.0 använder `accountableHealth**C**areProfessional` (versalt 'C' i 'Care')
> som namn på header-elementet – i stället för `accountableHealthcareProfessional` (lowercase 'c')
> som används i de flesta övriga TK:er. Det är samma information; stavningen i element-sökvägen
> skiljer sig. Bryggkoden måste hantera detta explicit.

---

## Resurshierarki

```
SEEHDSImmunization (1 per administrationRecord)
  └── performer[0].actor → PractitionerRole (administrationRecord.performer)
  └── performer[1].actor → Organization (administrationRecord.performerOrg)
  └── protocolApplied[0] (vaccineTargetDisease, doseOrdinalNumber, numberOfPrescribedDoses)
```

Varje `vaccinationMedicalRecord`-post kan innehålla ett `registrationRecord 1..1` med noll till
många `administrationRecord 0..*`. En `Immunization`-resurs skapas per `administrationRecord`.
Fält från `registrationRecord` som saknar specifikt `administrationRecord`-fält delas/ärvs
av alla Immunization-resurser från samma post. Se [VAC-001](#öppna-frågor).

---

## Mappningstabell – vaccinationMedicalRecordHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `vaccinationMedicalRecordHeader.documentId` | 1..1 | `Immunization.identifier` | Källsystemets dokumentidentifierare |
| `vaccinationMedicalRecordHeader.sourceSystemHSAId` | 1..1 | `Immunization.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `vaccinationMedicalRecordHeader.patientId.extension` | 1..1 | `Immunization.patient.identifier.value` | Personnummer eller samordningsnummer |
| `vaccinationMedicalRecordHeader.patientId.root` | 1..1 | `Immunization.patient.identifier.system` | OID→URI, se tabell nedan |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.authorTime` | 1..1 | `Immunization.occurrenceDateTime` | Tidpunkt för genomförd vaccination; YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalHSAId` | 0..1 | `Immunization.performer[0].actor` (Reference(PractitionerRole)) | Ansvarig yrkesutövares HSA-id |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | **Yttre Sparr** – versalt 'C' i 'Care' |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | **Inre Sparr** – versalt 'C' i 'Care' |
| `vaccinationMedicalRecordHeader.nullified` | 1..1 | `Immunization.status` | true→`entered-in-error`, false→`completed`; se DES-007 |
| `vaccinationMedicalRecordHeader.nullifiedReason` | 0..1 | `Immunization.statusReason.text` | Makuleringsorsak (fritext) |
| `vaccinationMedicalRecordHeader.approvedForPatient` | 1..1 | (ej mappad) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

---

## Mappningstabell – registrationRecord

`registrationRecord 1..1` innehåller registreringsmetadata som gäller för alla
`administrationRecord` inom samma `vaccinationMedicalRecord`.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `vaccinationMedicalRecordBody.registrationRecord.date` | 1..1 | `Immunization.recorded` | Datum då vaccination dokumenterades (inte genomfördes) |
| `vaccinationMedicalRecordBody.registrationRecord.patientPostalCode` | 0..1 | `Immunization.extension[patientPostalCode]` | Patientens postnummer vid vaccinationstillfället |
| `vaccinationMedicalRecordBody.registrationRecord.vaccinationUnstructuredNote` | 0..1 | `Immunization.note[].text` | Ostrukturerad anteckning om vaccinationsregistreringen |
| `vaccinationMedicalRecordBody.registrationRecord.riskCategory` | 0..* | `Immunization.extension[riskCategory]` | Riskgrupp (CodeableConcept); inget standard Immunization-fält |
| `vaccinationMedicalRecordBody.registrationRecord.patientAdverseEffect` | 0..* | `Immunization.reaction[].detail` | Patientens biverkningar kopplade till registreringen |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitHSAId` | 1..1 | `Immunization.performer[1].actor.identifier.value` | Registrerande vårdenhetens HSA-id |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitName` | 1..1 | `Immunization.performer[1].actor.display` | Registrerande vårdenhetens namn |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemName` | 1..1 | `Immunization.extension[sourceSystem].systemName` | Källsystemets namn |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductName` | 0..1 | `Immunization.extension[sourceSystem].productName` | Källsystemets produktnamn |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductVersion` | 0..1 | `Immunization.extension[sourceSystem].productVersion` | Källsystemets version |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact` | 1..1 | `Immunization.extension[sourceSystem].contact` | Kontaktuppgift till källsystem |
| `vaccinationMedicalRecordBody.registrationRecord.careUnitSmiId` | 0..1 | `Immunization.extension[careUnitSmiId]` | SMI-id för vårdenheten (Folkhälsomyndigheten) |

---

## Mappningstabell – administrationRecord (per Immunization-resurs)

En `Immunization`-resurs skapas för varje `administrationRecord`. Fält nedan mappas per post.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `administrationRecord.vaccinationProgramName` | 0..1 | `Immunization.protocolApplied[0].series` | Vaccinationsprogrammets namn (t.ex. "Nationellt barnvaccinationsprogram") |
| `administrationRecord.prescriberOrg.orgUnitHSAId` | 0..1 | `Immunization.extension[prescriber].orgHSAId` | Förskrivande vårdenhet |
| `administrationRecord.prescriberPerson.healthcareProfessionalHSAId` | 0..1 | `Immunization.extension[prescriber].personHSAId` | Förskrivande yrkesutövare |
| `administrationRecord.performerOrg.orgUnitHSAId` | 0..1 | `Immunization.performer[1].actor.identifier.value` | Administrerande vårdenhetens HSA-id |
| `administrationRecord.performerOrg.orgUnitName` | 0..1 | `Immunization.performer[1].actor.display` | Administrerande vårdenhetens namn |
| `administrationRecord.performer.healthcareProfessionalHSAId` | 0..1 | `Immunization.performer[0].actor.identifier.value` | Administrerande yrkesutövares HSA-id |
| `administrationRecord.performer.healthcareProfessionalName` | 0..1 | `Immunization.performer[0].actor.display` | Administrerande yrkesutövares namn |
| `administrationRecord.anatomicalSite` | 0..1 | `Immunization.site` | Anatomisk injektionsplats (CodeableConcept) |
| `administrationRecord.route` | 0..1 | `Immunization.route` | Administreringssätt (CodeableConcept) |
| `administrationRecord.dose.quantity` | 0..1 | `Immunization.doseQuantity` | Dos med mängd och enhet |
| `administrationRecord.dose.displayName` | 1..1 | `Immunization.doseQuantity.unit` | Dosens visningsnamn/enhetsetikett |
| `administrationRecord.isDoseComplete` | 0..1 | `Immunization.extension[isDoseComplete]` | Anger om hela dosen administrerades (boolean) |
| `administrationRecord.doseOrdinalNumber` | 0..1 | `Immunization.protocolApplied[0].doseNumberPositiveInt` | Ordningsnummer för denna dos i serien |
| `administrationRecord.numberOfPrescribedDoses` | 0..1 | `Immunization.protocolApplied[0].seriesDosesPositiveInt` | Totalt antal ordinerade doser i serien |
| `administrationRecord.sourceDescription` | 0..1 | `Immunization.extension[sourceDescription]` | Beskrivning av informationskällan |
| `administrationRecord.commentPrescription` | 0..1 | `Immunization.note[1].text` | Kommentar från förskrivningen |
| `administrationRecord.commentAdministration` | 0..1 | `Immunization.note[0].text` | Kommentar från administreringen |
| `administrationRecord.patientAdverseEffect` | 0..* | `Immunization.reaction[].detail` | Biverkningar specifika för denna dos |
| `administrationRecord.typeOfVaccine` | 0..1 | `Immunization.vaccineCode.coding` | Vaccintyp (CodeableConcept; t.ex. ATC eller nationellt kodverk) |
| `administrationRecord.vaccineName` | 0..1 | `Immunization.vaccineCode.text` | Vaccinets namn (fritext) |
| `administrationRecord.vaccineBatchId` | 0..1 | `Immunization.lotNumber` | Vaccinsats-/partinummer |
| `administrationRecord.vaccineManufacturer` | 0..1 | `Immunization.manufacturer.display` | Tillverkarens namn (fritext) |
| `administrationRecord.vaccineTargetDisease` | 0..* | `Immunization.protocolApplied[0].targetDisease` | Målsjukdom(ar) som vaccinet riktar sig mot |
| `administrationRecord.vaccinationUniqueReference` | 0..1 | `Immunization.identifier[1]` | Unik vaccinationsreferens (t.ex. WHOs identifierare) |

---

## Härledda fält / Designbeslut

### Immunization.status (från nullified)

`vaccinationMedicalRecordHeader.nullified 1..1 boolean` styr statusen för alla `Immunization`-resurser
i posten (DES-007):

| nullified | Immunization.status | Immunization.statusReason |
|---|---|---|
| `false` | `completed` | (sätts ej) |
| `true` | `entered-in-error` | `nullifiedReason` (om satt) |

### En Immunization per administrationRecord (VAC-001)

`registrationRecord 1..1` är behållaren; `administrationRecord 0..*` är de enskilda
vaccinationshändelserna. Designbeslut: en `Immunization` per `administrationRecord`.

- Fält från `registrationRecord` (datum, riskCategory, careGiverOrg etc.) kopieras/delas
  till alla Immunization-resurser från samma `vaccinationMedicalRecord`.
- Om `administrationRecord` är tom (0 poster) skapas en `Immunization` baserad enbart på
  `registrationRecord`-data med minimal information.

### Immunization.occurrenceDateTime

`accountableHealthCareProfessional.authorTime` används som `occurrenceDateTime` (tidpunkt för
genomförd vaccination) eftersom `administrationRecord` inte har ett eget datum-fält för
administreringstidpunkten. `registrationRecord.date` (date, ej dateTime) används som
`Immunization.recorded`.

---

## PDL och Sparr

PDL-styrning utgår från `accountableHealthCareProfessional`-blocket i headern.
**OBS:** Elementnamnet har versalt 'C' i 'Care' (avvikelse från andra TK:ers stavning):

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `vaccinationMedicalRecordHeader.approvedForPatient` (boolean) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar `Immunization` via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.authorTime` (ISO 8601).

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| VAC-001 | **`registrationRecord` (1..1) + `administrationRecord` (0..*) – en Immunization per administrationRecord.** Om `administrationRecord` är tomt skapas en Immunization med enbart registreringsdata. Behöver verifieras om detta är önskat beteende eller om sådana poster ska filtreras bort. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** Inget standardiserat `meta.security`-kodsystem. Behöver gemensamt beslut; se central issue i [mapping-issues](mapping-issues.html). |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält. |
