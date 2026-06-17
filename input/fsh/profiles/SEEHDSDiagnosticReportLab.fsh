Profile: SEEHDSDiagnosticReportLab
Parent: $DiagnosticReport-lab-uv-ips
Id: se-ehds-diagnostic-report-lab
Title: "SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)"
Description: "Profil för laboratorieresultat mappat från RIVTA-tjänstekontraktet GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v3.1, 4.1). Täcker NPÖ 3.1, 4.1 och 1177 Journal 3.1, 4.2."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från laboratoryOrderHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* performer only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer MS
* performer ^short = "Ansvarig laboratorium/personal (responsibleLaboratory)"

* issued MS
* issued ^short = "Svarstidpunkt (registrationTime)"

* status 1..1 MS
* status ^short = "Svarstatus (laboratoryOrderStatus)"

* category 1..* MS
* category ^short = "Laboratoriekategori"

* code 1..1 MS
* code ^short = "Beställningskod (labOrderCode)"

* effectiveDateTime MS
* effectiveDateTime ^short = "Provtagningstid (specimenCollectionTime)"

* result MS
* result only Reference(SEEHDSObservationLab)
* result ^short = "Enskilda provresultat (laboratoryTestResult)"

* conclusion MS
* conclusion ^short = "Utlåtande/bedömning (assessmentComment)"

* specimen MS
* specimen ^short = "Provmaterial (specimenType)"
