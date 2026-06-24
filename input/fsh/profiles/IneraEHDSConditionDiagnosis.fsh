Profile: IneraEHDSConditionDiagnosis
Parent: $Condition-uv-ips
Id: inera-ehds-condition-diagnosis
Title: "SE EHDS Condition – Diagnos (GetDiagnosis)"
Description: "Profil för diagnos/problem mappat från RIVTA-tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0."

* extension contains
    http://hl7.org/fhir/StructureDefinition/condition-assertedDate named assertedDate 0..1 MS

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (diagnosisHeader.patientId) – OID→URI för personnummer/samordningsnummer"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (diagnosisHeader.sourceSystemHSAId) – urn:oid:1.2.752.129.2.1.4.1#{hsaId}"

* recorder only Reference(PractitionerRole)
* recorder MS
* recorder ^short = "Ansvarig personal (diagnosisHeader.accountableHealthcareProfessional) – logisk referens via HSA-id"

* asserter only Reference(PractitionerRole)
* asserter MS
* asserter ^short = "Rättslig äkthetsintygsgivare (diagnosisHeader.legalAuthenticator) – logisk referens via HSA-id"

* recordedDate MS
* recordedDate ^short = "Registreringstidpunkt (diagnosisHeader.accountableHealthcareProfessional.authorTime) – YYYYMMDDHHMMSS → ISO 8601"

* clinicalStatus 1..1 MS
* clinicalStatus ^short = "Alltid 'active' – härledd (inget statusfält i TKBn)"

* verificationStatus MS
* verificationStatus ^short = "Alltid confirmed (RIVTA-svar representerar bekräftade journaluppgifter)"

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains diagnostyp 1..1 MS
* category[diagnostyp].coding 1..1 MS
* category[diagnostyp].coding.system 1..1 MS
* category[diagnostyp].coding.system = "https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp"
* category[diagnostyp].coding.code 1..1 MS
* category[diagnostyp] ^short = "Diagnostyp (diagnosisBody.typeOfDiagnosis) – HD (Huvuddiagnos) eller BY (Bidiagnos)"

* code 1..1 MS
* code ^short = "Diagnoskod (diagnosisBody.diagnosisCode)"
* code.coding MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains ICD10SE 0..1 MS
* code.coding[ICD10SE].system = $ICD10SE
* code.coding[ICD10SE].code MS
* code.coding[ICD10SE].code ^short = "ICD-10-SE kod (diagnosisBody.diagnosisCode.code)"
* code.coding[ICD10SE].display MS
* code.coding[ICD10SE].display ^short = "Kodbenämning (diagnosisBody.diagnosisCode.displayName)"
* code.text MS
* code.text ^short = "Fritext (diagnosisBody.diagnosisCode.originalText) – fallback: displayName"

* onsetDateTime MS
* onsetDateTime ^short = "Bedömningstidpunkt (diagnosisBody.diagnosisTime) – YYYYMMDDHHMMSS → ISO 8601"
