Profile: SEEHDSDiagnosticReportReferral
Parent: DiagnosticReport
Id: se-ehds-diagnostic-report-referral
Title: "SE EHDS DiagnosticReport – Konsultationssvar (GetReferralOutcome)"
Description: "Profil för konsultationssvar (outcome) från GetReferralOutcome. Används tillsammans med SEEHDSServiceRequestReferral."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId)"

* performer only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer MS
* performer ^short = "Svarande specialist/enhet (referralOutcomeAuthor)"

* issued MS
* issued ^short = "Svarstidpunkt (outcomeTime)"

* status 1..1 MS
* status ^short = "Svarstatus (referralOutcomeStatus)"

* basedOn MS
* basedOn only Reference(SEEHDSServiceRequestReferral)
* basedOn ^short = "Koppling till ursprungsremiss"

* code 1..1 MS
* code ^short = "Svarstyp"

* conclusion MS
* conclusion ^short = "Konsultationssvar/bedömning (referralOutcomeBody)"

* note MS
* note ^short = "Kommentar (referralOutcomeComment)"
