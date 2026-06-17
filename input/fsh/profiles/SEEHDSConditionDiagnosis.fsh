Profile: SEEHDSConditionDiagnosis
Parent: $Condition-uv-ips
Id: se-ehds-condition-diagnosis
Title: "SE EHDS Condition – Diagnos (GetDiagnosis)"
Description: "Profil för diagnos/problem mappat från RIVTA-tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description). Täcker NPÖ 2.0 och 1177 Journal 2.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från diagnosHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId från diagnosHeader)"

* recorder only Reference($SEBasePractitionerRole)
* recorder MS
* recorder ^short = "Ansvarig hälso- och sjukvårdspersonal (accountableHealthcareProfessional)"

* asserter only Reference($SEBasePractitionerRole)
* asserter MS
* asserter ^short = "Rättslig äkthetsintygsgivare (legalAuthenticator)"

* recordedDate MS
* recordedDate ^short = "Registreringsdatum (documentTime från diagnosHeader)"

* code 1..1 MS
* code ^short = "Diagnoskod (diagnosCode)"
* code.coding MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains icd10se 0..1 MS
* code.coding[icd10se].system = $ICD10SE
* code.coding[icd10se] ^short = "ICD-10-SE diagnoskod"

* clinicalStatus 1..1 MS
* clinicalStatus ^short = "Diagnosstatus (diagnosisStatus)"

* category MS
* category ^short = "Diagnostyp (diagnosisType – kv_diagnostyp)"

* onsetDateTime MS
* onsetDateTime ^short = "Debutdatum (diagnosisTimePeriod.start)"

* abatementDateTime MS
* abatementDateTime ^short = "Slutdatum (diagnosisTimePeriod.end)"

* note MS
* note ^short = "Diagnoskommentar (diagnosisComment)"
