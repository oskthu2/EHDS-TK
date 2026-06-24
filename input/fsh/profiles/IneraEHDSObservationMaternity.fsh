Profile: IneraEHDSObservationMaternity
Parent: $Observation-results-uv-ips
Id: inera-ehds-observation-maternity
Title: "SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)"
Description: """
  Generisk profil för medicinsk historik inom mödravård mappat från RIVTA-tjänstekontraktet
  GetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0).
  Täcker NPÖ 2.0 och 1177 Journal 2.0.

  OBS: TKBn har tre separata sektioner (registrationRecord, pregnancyCheckupRecord,
  postDeliveryRecord) med egna sektionsspecifika fält. En Observation skapas per sektion
  med Observation.code som diskriminator (se MAT-001 i mapping-issues). Fältnamnen
  i ^short nedan refererar till sektionsspecifika element – implementatören väljer rätt
  sektionselement baserat på Observation.code.
"""

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (maternityMedicalRecordHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (maternityMedicalRecordHeader.sourceSystemHSAId)"

* performer MS
* performer ^short = "Ansvarig personal/enhet (maternityMedicalRecordHeader.accountableHealthcareProfessional)"

* issued MS
* issued ^short = "Dokumentets registreringstidpunkt (maternityMedicalRecordHeader.documentTime)"

* status 1..1 MS
* status ^short = "Status"

* category 1..* MS
* category ^short = "Kategori – härledd från sektionstyp (registrationRecord/pregnancyCheckupRecord/postDeliveryRecord)"

* code 1..1 MS
* code ^short = "Sektionskod – diskriminator för vilken av de tre sektionerna som Observation representerar"

* effective[x] MS
* effective[x] ^short = "Tidpunkt för dokumentation (maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime)"

* value[x] MS
* value[x] ^short = "Sektionsspecifikt mätvärde (t.ex. pregnancyCheckupRecord.bloodPressure, postDeliveryRecord.birthWeight)"

* component MS
* component ^short = "Sektionsspecifika delfält kodas som component (se MAT-001)"

* note MS
* note ^short = "Sektionsspecifik kommentar"
