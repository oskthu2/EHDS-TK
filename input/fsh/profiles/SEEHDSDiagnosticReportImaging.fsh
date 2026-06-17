Profile: SEEHDSDiagnosticReportImaging
Parent: DiagnosticReport
Id: se-ehds-diagnostic-report-imaging
Title: "SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)"
Description: "Profil för bilddiagnostiska utlåtanden/fynd från GetImagingOutcome. Används tillsammans med SEEHDSImagingStudy för att representera både undersökning och svar."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId)"

* performer only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer MS
* performer ^short = "Tolkande radiolog/enhet (accountableHealthcareProfessional)"

* issued MS
* issued ^short = "Utlåtandetidpunkt (imagingTime)"

* status 1..1 MS
* status ^short = "Status"

* category 1..* MS

* code 1..1 MS
* code ^short = "Undersökningskod (imagingExaminationCode)"

* imagingStudy MS
* imagingStudy only Reference(SEEHDSImagingStudy)
* imagingStudy ^short = "Koppling till bildundersökning"

* conclusion MS
* conclusion ^short = "Radiologiskt utlåtande (imagingAssessmentComment)"
