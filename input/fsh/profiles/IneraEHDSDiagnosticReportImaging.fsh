Profile: IneraEHDSDiagnosticReportImaging
Parent: DiagnosticReport
Id: inera-ehds-diagnostic-report-imaging
Title: "SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)"
Description: "Profil för bilddiagnostiska utlåtanden/fynd från GetImagingOutcome. Används tillsammans med IneraEHDSImagingStudy för att representera både undersökning och svar."

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (imagingOutcomeHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (imagingOutcomeHeader.sourceSystemHSAId)"

* performer only Reference(PractitionerRole or Organization)
* performer MS
* performer ^short = "Tolkande radiolog/enhet (imagingOutcomeHeader.accountableHealthcareProfessional)"

* issued MS
* issued ^short = "Dokumentets tidpunkt (imagingOutcomeHeader.documentTime)"

* effectiveDateTime MS
* effectiveDateTime ^short = "Resultattidpunkt (imagingOutcomeBody.resultTime)"

* status 1..1 MS
* status ^short = "Härledd från imagingOutcomeBody.typeOfResult (PREL→preliminary, DEF→final, TILL→amended, nullified=true→entered-in-error, se IMG-001)"

* category 1..* MS

* code 1..1 MS
* code ^short = "Undersökningsspecialitet (imagingOutcomeBody.examinationSpeciality)"

* imagingStudy MS
* imagingStudy only Reference(IneraEHDSImagingStudy)
* imagingStudy ^short = "Koppling till bildundersökning"

* conclusion MS
* conclusion ^short = "Radiologiskt utlåtande (imagingOutcomeBody.resultReport / imagingOutcomeBody.resultComment)"
