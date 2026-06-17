Profile: SEEHDSFlag
Parent: Flag
Id: se-ehds-flag
Title: "SE EHDS Flag – Varningsinformation (GetAlertInformation)"
Description: "Profil för varningsinformation (ej allergi/överkänslighet) från GetAlertInformation. Används när alertType anger en generell varning snarare än allergi."

* subject only Reference(SEEHDSPatient)
* subject 1..1 MS
* subject ^short = "Patient (patientId från alertHeader)"

* status 1..1 MS
* status ^short = "Aktiv/inaktiv (alertStatus)"

* category 1..* MS
* category ^short = "Varningskategori (alertType)"

* code 1..1 MS
* code ^short = "Varningskod (alertCode)"

* period MS
* period ^short = "Giltighetstid (alertTimePeriod)"

* author only Reference($SEBasePractitionerRole)
* author MS
* author ^short = "Ansvarig hälso- och sjukvårdspersonal (accountableHealthcareProfessional)"
