Profile: SEEHDSAllergyIntolerance
Parent: $AllergyIntolerance-uv-ips
Id: se-ehds-allergy-intolerance
Title: "SE EHDS AllergyIntolerance – Uppmärksamhetsinformation (GetAlertInformation)"
Description: "Profil för allergier och överkänslighet mappat från RIVTA-tjänstekontraktet GetAlertInformation (clinicalprocess:healthcond:description). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0."

* patient only Reference(SEEHDSPatient)
* patient MS
* patient ^short = "Patient (patientId från alertHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId från alertHeader)"

* recorder only Reference($SEBasePractitionerRole)
* recorder MS
* recorder ^short = "Ansvarig hälso- och sjukvårdspersonal (accountableHealthcareProfessional)"

* asserter only Reference($SEBasePractitionerRole)
* asserter MS
* asserter ^short = "Rättslig äkthetsintygsgivare (legalAuthenticator)"

* recordedDate MS
* recordedDate ^short = "Registreringsdatum (documentTime från alertHeader)"

* clinicalStatus MS
* clinicalStatus ^short = "Status (alertStatus)"

* category 1..* MS
* category ^short = "Uppmärksamhetskategori (alertType – kv_uppmärksamhetstyp)"

* code 1..1 MS
* code ^short = "Orsak till uppmärksamhet (alertCode)"

* reaction MS
* reaction.substance MS
* reaction.substance ^short = "Ämne som orsakar reaktionen (causeCode)"
* reaction.manifestation MS
* reaction.manifestation ^short = "Reaktionsbeskrivning (reaction.description)"

* note MS
* note ^short = "Kommentar (alertComment)"
