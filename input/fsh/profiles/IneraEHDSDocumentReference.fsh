Profile: IneraEHDSDocumentReference
Parent: DocumentReference
Id: inera-ehds-document-reference
Title: "SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)"
Description: """
  Profil för vårdanteckningar mappat från RIVTA-tjänstekontraktet GetCareDocumentation
  (clinicalprocess:healthcond:description v3.0). Täcker NPÖ 3.0 och 1177 Journal 3.0.

  Använder JoL-header v2.2 (ej PatientSummaryHeader): accessControlHeader för PDL,
  record för journaluppgift-metadata, author för dokumentationsansvarig,
  signature för signeringsinformation.
"""

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (careDocumentation.header.accessControlHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (careDocumentation.header.sourceSystemId)"

* author only Reference(PractitionerRole)
* author MS
* author ^short = "Dokumentationsansvarig (careDocumentation.header.author.authorId – JoL-header)"

* authenticator only Reference(PractitionerRole)
* authenticator MS
* authenticator ^short = "Signerande person (careDocumentation.header.signature.signatureId – JoL-header)"

* date MS
* date ^short = "Journaluppgiftens skapandetidpunkt (careDocumentation.header.record.timestamp)"

* status 1..1 MS
* status ^short = "Dokumentstatus – 'current' normalt; härledd"

* type MS
* type ^short = "Anteckningstyp (careDocumentation.body.clinicalDocumentNoteCode – KV Anteckningstyp)"

* category MS
* category ^short = "Dokumentkategori"

* content 1..* MS
* content.attachment 1..1 MS
* content.attachment.contentType MS
* content.attachment.contentType ^short = "Mimetyp (careDocumentation.body.multimediaEntry.mediaType)"
* content.attachment.data MS
* content.attachment.data ^short = "Anteckningstext/binärinnehåll (careDocumentation.body.clinicalDocumentNoteText / multimediaEntry.value)"
* content.attachment.url MS
* content.attachment.url ^short = "Referens till extern fil (careDocumentation.body.multimediaEntry.reference)"
* content.attachment.title MS
* content.attachment.title ^short = "Anteckningsrubrik (careDocumentation.body.clinicalDocumentNoteTitle)"

* context MS
* context.encounter only Reference(IneraEHDSEncounter)
* context.encounter MS
* context.encounter ^short = "Tillhörande vårdkontakt (careDocumentation.header.accessControlHeader – koppling via vårdkontakt-id)"
