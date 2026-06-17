Profile: SEEHDSObservationMaternity
Parent: $Observation-results-uv-ips
Id: se-ehds-observation-maternity
Title: "SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)"
Description: "Profil för medicinsk historik inom mödravård mappat från RIVTA-tjänstekontraktet GetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från maternityHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* performer only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer MS
* performer ^short = "Ansvarig personal/enhet (accountableHealthcareProfessional)"

* issued MS
* issued ^short = "Registreringsdatum (documentTime)"

* status 1..1 MS
* status ^short = "Status"

* category 1..* MS
* category ^short = "Kategori (maternityMedicalHistoryType)"

* code 1..1 MS
* code ^short = "Mödravårdstyp (maternityMedicalHistoryCode)"

* effective[x] MS
* effective[x] ^short = "Tidpunkt/period (maternityMedicalHistoryTime)"

* value[x] MS
* value[x] ^short = "Värde/resultat (maternityMedicalHistoryResult)"

* note MS
* note ^short = "Kommentar (maternityMedicalHistoryComment)"
