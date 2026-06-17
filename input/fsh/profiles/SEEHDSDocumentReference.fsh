Profile: SEEHDSDocumentReference
Parent: DocumentReference
Id: se-ehds-document-reference
Title: "SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)"
Description: "Profil för vårdanteckningar mappat från RIVTA-tjänstekontraktet GetCareDocumentation (clinicalprocess:healthcond:description v2.1, 3.0). Täcker NPÖ 2.1, 3.0 och 1177 Journal 2.1, 3.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från careDocumentationHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* author only Reference($SEBasePractitionerRole)
* author MS
* author ^short = "Anteckningsförfattare (accountableHealthcareProfessional)"

* authenticator only Reference($SEBasePractitionerRole)
* authenticator MS
* authenticator ^short = "Rättslig äkthetsintygsgivare (legalAuthenticator)"

* date MS
* date ^short = "Dokumentdatum (documentTime från careDocumentationHeader)"

* status 1..1 MS
* status ^short = "Dokumentstatus"

* type MS
* type ^short = "Dokumenttyp (careDocumentationType)"

* category MS
* category ^short = "Dokumentkategori"

* content 1..* MS
* content.attachment 1..1 MS
* content.attachment.contentType MS
* content.attachment.contentType ^short = "Mimetyp"
* content.attachment.data MS
* content.attachment.data ^short = "Anteckningstext (careDocumentationBody)"
* content.attachment.title MS
* content.attachment.title ^short = "Dokumenttitel (careDocumentationTitle)"

* context MS
* context.encounter only Reference(SEEHDSEncounter)
* context.encounter MS
* context.encounter ^short = "Tillhörande vårdkontakt (careContactId)"
* context.period MS
* context.period ^short = "Giltighetstid (careDocumentationTimePeriod)"
