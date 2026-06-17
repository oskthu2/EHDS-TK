Profile: SEEHDSEncounter
Parent: Encounter
Id: se-ehds-encounter
Title: "SE EHDS Encounter – Vårdkontakter (GetCareContacts)"
Description: "Profil för vårdkontakter mappat från RIVTA-tjänstekontraktet GetCareContacts (clinicalprocess:logistics:logistics v2.0, 3.0). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från careContactHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* status 1..1 MS
* status ^short = "Kontaktstatus (careContactStatus)"

* class 1..1 MS
* class ^short = "Kontakttyp (careContactType – kv_kontakttyp)"

* type MS
* type ^short = "Kontaktform (careContactReason)"

* serviceType MS
* serviceType ^short = "Verksamhetstyp (careContactSpecialty)"

* period 1..1 MS
* period ^short = "Kontaktperiod"
* period.start 1..1 MS
* period.start ^short = "Kontaktstart (careContactRegistrationTime)"
* period.end MS
* period.end ^short = "Kontaktslut (careContactEndTime)"

* participant MS
* participant.individual only Reference($SEBasePractitionerRole)
* participant.individual MS
* participant.individual ^short = "Ansvarig personal (accountableHealthcareProfessional)"

* serviceProvider only Reference($SEBaseOrganization)
* serviceProvider MS
* serviceProvider ^short = "Vårdenhet (careUnitHSAId)"

* reasonCode MS
* reasonCode ^short = "Kontaktorsak (careContactReason)"
