Profile: SEEHDSServiceRequestReferral
Parent: ServiceRequest
Id: se-ehds-service-request-referral
Title: "SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome)"
Description: "Profil för konsultationsremisser mappat från RIVTA-tjänstekontraktet GetReferralOutcome (clinicalprocess:healthcond:actoutcome v3.1). Täcker NPÖ 3.1 och 1177 Journal 3.1."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från referralHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* requester only Reference($SEBasePractitionerRole)
* requester MS
* requester ^short = "Remitterande läkare (referralAuthor)"

* performer only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer MS
* performer ^short = "Mottagande enhet/specialist (referralReceiver)"

* authoredOn MS
* authoredOn ^short = "Remissdatum (documentTime från referralHeader)"

* status 1..1 MS
* status ^short = "Remissstatus (referralStatus)"

* intent 1..1 MS

* priority MS
* priority ^short = "Prioritet (referralPriority)"

* category MS
* category ^short = "Remisstyp (referralType)"

* code 1..1 MS
* code ^short = "Remissfrågeställning (referralReason)"

* reasonCode MS
* reasonCode ^short = "Diagnos/orsak (referralDiagnosis)"

* note MS
* note ^short = "Remisstext (referralBody)"
