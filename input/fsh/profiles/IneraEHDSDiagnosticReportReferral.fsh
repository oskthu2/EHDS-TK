Profile: IneraEHDSDiagnosticReportReferral
Parent: DiagnosticReport
Id: inera-ehds-diagnostic-report-referral
Title: "SE EHDS DiagnosticReport – Konsultationssvar (GetReferralOutcome)"
Description: "Profil för konsultationssvar (outcome) från GetReferralOutcome. Används tillsammans med IneraEHDSServiceRequestReferral."

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (referralOutcomeHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (referralOutcomeHeader.sourceSystemHSAId)"

* performer only Reference(PractitionerRole or Organization)
* performer MS
* performer ^short = "Svarande specialist/enhet (referralOutcomeHeader.accountableHealthcareProfessional)"

* issued MS
* issued ^short = "Svarstidpunkt (referralOutcomeHeader.documentTime)"

* status 1..1 MS
* status ^short = "Härledd från referralOutcomeBody.referralOutcomeTypeCode"

* basedOn MS
* basedOn only Reference(IneraEHDSServiceRequestReferral)
* basedOn ^short = "Koppling till ursprungsremiss"

* code 1..1 MS
* code ^short = "Fast LOINC 11488-4 (Consult note) – referralOutcomeTypeCode avgör DiagnosticReport.status (se mappning)"

* conclusion MS
* conclusion ^short = "Konsultationssvar/bedömning (referralOutcomeBody.referralOutcomeText)"
