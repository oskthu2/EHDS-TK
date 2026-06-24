Profile: IneraEHDSFlag
Parent: Flag
Id: inera-ehds-flag
Title: "SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)"
Description: """
  Primär profil för ALL uppmärksamhetsinformation från GetAlertInformation
  (clinicalprocess:healthcond:description v2.0).

  Varje alertInformation-post ger alltid en Flag-resurs.
  Om typeOfAlertInformation anger allergi/överkänslighet (body = hypersensitivity)
  skapas dessutom en IneraEHDSAllergyIntolerance-resurs som pekas ut via
  extension[flag-detail] (standard R4-extension; kallas supportingInfo i R5).

  Body-strukturen är XOR: exakt en av hypersensitivity, seriousDisease, treatment,
  communicableDisease, restrictionOfCare, unstructuredAlertInformation anges per post.

  Flag.category[alertType]           = typeOfAlertInformation (obligatorisk).
  Flag.category[hypersensitivityType] = typeOfHypersensitivity (när body = hypersensitivity).
  Flag.code                           = den kliniska koden specifik för body-typen.

  Täcker NPÖ 2.0 och 1177 Journal 2.0.
"""

// ─── AllergyIntolerance-länk (standard R4-extension; R5: supportingInfo) ─────
* extension contains
    http://hl7.org/fhir/StructureDefinition/flag-detail named flagDetail 0..* MS
* extension[flagDetail] ^short = "Referens till AllergyIntolerance när body = hypersensitivity (R4: flag-detail; R5: supportingInfo)"

// ─── Gemensamma body-extensions ──────────────────────────────────────────────
* extension contains AlertInformationComment named alertInformationComment 0..1 MS
* extension contains AlertAscertainedDate named alertAscertainedDate 0..1 MS
* extension contains AlertVerifiedTime named alertVerifiedTime 0..1 MS
* extension contains AlertAssertedDate named alertAssertedDate 0..1 MS
* extension contains AlertAsserter named alertAsserter 0..1 MS
* extension contains RelatedAlertInformation named relatedAlertInformation 0..* MS

// ─── XOR body: hypersensitivity ──────────────────────────────────────────────
* extension contains AlertDegreeOfSeverity named degreeOfSeverity 0..1 MS
* extension contains AlertDegreeOfCertainty named degreeOfCertainty 0..1 MS
* extension contains AlertPharmaceuticalHypersensitivity named pharmaceuticalHypersensitivity 0..1 MS

// ─── XOR body: treatment ─────────────────────────────────────────────────────
* extension contains AlertTreatmentDescription named treatmentDescription 0..1 MS
* extension contains AlertPharmaceuticalTreatment named pharmaceuticalTreatment 0..* MS

// ─── XOR body: communicableDisease ───────────────────────────────────────────
* extension contains AlertRouteOfTransmission named routeOfTransmission 0..1 MS

// ─── XOR body: restrictionOfCare ─────────────────────────────────────────────
* extension contains AlertRestrictionOfCareComment named restrictionOfCareComment 0..1 MS

// ─── Header-fält ─────────────────────────────────────────────────────────────

* identifier MS
* identifier ^short = "Dokumentidentifierare (alertInformationHeader.documentId)"

* subject only Reference(IneraEHDSPatient)
* subject 1..1 MS
* subject ^short = "Patient (alertInformationHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (alertInformationHeader.sourceSystemHSAId)"

* meta.security MS
* meta.security ^short = "PDL-kontroll (alertInformationHeader.approvedForPatient) – se PDL-001"

* status 1..1 MS
* status ^short = "Alltid 'active' – inget statusfält i TKBn; returnerade poster är per definition aktiva"

// ─── Body-fält ────────────────────────────────────────────────────────────────

* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains
    alertType 1..1 MS and
    hypersensitivityType 0..1 MS
* category[alertType] ^short = "Uppmärksamhetstyp (alertInformationBody.typeOfAlertInformation)"
* category[hypersensitivityType] ^short = "Precisering av överkänslighetstyp (alertInformationBody.hypersensitivity.typeOfHypersensitivity)"

* code 1..1 MS
* code ^short = """
    Klinisk kod per body-typ (XOR):
    hypersensitivity: atcSubstance (code.coding) eller hypersensitivityAgentCode (code.coding);
      fritext i code.text (nonATCSubstance / hypersensitivityAgent)
    seriousDisease: seriousDisease.disease (ICD10/SNOMED)
    treatment: treatment.treatmentCode (KVÅ); tomt CodeableConcept om enbart treatmentDescription
    communicableDisease: communicableDiseaseCode (ICD10)
    unstructuredAlertInformation: unstructuredAlertInformationHeading som code.text
    restrictionOfCare: ingen strukturerad kod; tomt CodeableConcept
  """

* period MS
* period.start 1..1 MS
* period.start ^short = "Giltighet från (alertInformationBody.validityTimePeriod.start)"
* period.end MS
* period.end ^short = "Giltighet till: validityTimePeriod.end (planerat slut) eller obsoleteTime (faktisk inaktivering) – det minsta av dessa"

* author only Reference(PractitionerRole)
* author MS
* author ^short = "Ansvarig hälso- och sjukvårdspersonal (alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId)"

* encounter MS
* encounter ^short = "Kopplad vårdkontakt (alertInformationHeader.careContactId)"

// ─── Extension-definitioner ───────────────────────────────────────────────────

Extension: AlertInformationComment
Id: alert-information-comment
Title: "Kommentar till uppmärksamhetssignal"
Description: """
  Kommentar angående uppmärksamhetssignalen (alertInformationBody.alertInformationComment).
  Om obsoleteComment är angivet konkateneras det med prefix 'Inaktiveringskommentar: {obsoleteComment}'.
  För body = unstructuredAlertInformation: unstructuredAlertInformationContent läggs här.
"""
* value[x] only string

Extension: AlertAscertainedDate
Id: alert-ascertained-date
Title: "Datum för konstaterande"
Description: "Datum då förhållandet som föranledde uppmärksamhetssignalen konstaterades (alertInformationBody.ascertainedDate)."
* value[x] only date

Extension: AlertVerifiedTime
Id: alert-verified-time
Title: "Tidpunkt för verifiering"
Description: "Tidpunkt då uppmärksamhetssignalen verifierades i det lokala systemet (alertInformationBody.verifiedTime)."
* value[x] only dateTime

Extension: AlertAssertedDate
Id: alert-asserted-date
Title: "Signeringstidpunkt för uppmärksamhetssignal"
Description: "Tidpunkt för signering av uppmärksamhetsinformation (alertInformationHeader.legalAuthenticator.signatureTime)."
* value[x] only dateTime

Extension: AlertAsserter
Id: alert-asserter
Title: "Juridisk äkthetsintygsgivare för uppmärksamhetssignal"
Description: "HSA-id för juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId)."
* value[x] only Reference(PractitionerRole)

Extension: RelatedAlertInformation
Id: related-alert-information
Title: "Relaterad uppmärksamhetssignal"
Description: "Information om samband med andra uppmärksamhetssignaler (alertInformationBody.relatedAlertInformation)."
* extension contains
    typeOfRelationship 1..1 and
    relationComment 0..1 and
    documentId 1..*
* extension[typeOfRelationship].value[x] only CodeableConcept
* extension[typeOfRelationship] ^short = "Typ av samband (relatedAlertInformation.typeOfAlertInformationRelationship)"
* extension[relationComment].value[x] only string
* extension[relationComment] ^short = "Kommentar till samband (relatedAlertInformation.relationComment)"
* extension[documentId].value[x] only string
* extension[documentId] ^short = "Relaterat dokumentid (relatedAlertInformation.documentId)"

Extension: AlertDegreeOfSeverity
Id: alert-degree-of-severity
Title: "Allvarlighetsgrad för överkänslighet"
Description: "Bedömning av överkänslighetens allvarlighetsgrad (alertInformationBody.hypersensitivity.degreeOfSeverity). KV Allvarlighetsgrad 1.2.752.129.2.2.3.3."
* value[x] only CodeableConcept

Extension: AlertDegreeOfCertainty
Id: alert-degree-of-certainty
Title: "Visshet för överkänslighet"
Description: "Visshetsgrad för överkänsligheten (alertInformationBody.hypersensitivity.degreeOfCertainty). KV Visshetsgrad 1.2.752.129.2.2.3.11."
* value[x] only CodeableConcept

Extension: AlertPharmaceuticalHypersensitivity
Id: alert-pharmaceutical-hypersensitivity
Title: "Läkemedelsöverkänslighet – substansdetaljer"
Description: """
  Kompletterande substansdetaljer för läkemedelsöverkänslighet
  (alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity).
  Primär substans: atcSubstance → Flag.code.coding; nonATCSubstance → Flag.code.text.
  Denna extension bär kvarvarande detaljer: nonATCSubstanceComment och pharmaceuticalProductId.
"""
* extension contains
    nonATCSubstanceComment 0..1 and
    pharmaceuticalProductId 0..*
* extension[nonATCSubstanceComment].value[x] only string
* extension[nonATCSubstanceComment] ^short = "Förklaring till avsaknad ATC-kod (pharmaceuticalHypersensitivity.nonATCSubstanceComment)"
* extension[pharmaceuticalProductId].value[x] only CodeableConcept
* extension[pharmaceuticalProductId] ^short = "Läkemedelsprodukt-id/NPL-id (pharmaceuticalHypersensitivity.pharmaceuticalProductId)"

Extension: AlertTreatmentDescription
Id: alert-treatment-description
Title: "Behandlingsbeskrivning"
Description: "Beskrivning av allvarlig behandling som patienten genomgår (alertInformationBody.treatment.treatmentDescription). Behandlingskod läggs i Flag.code."
* value[x] only string

Extension: AlertPharmaceuticalTreatment
Id: alert-pharmaceutical-treatment
Title: "Läkemedel vid behandling"
Description: "Läkemedel som används vid uppmärksammad behandling, ATC-kod rekommenderas (alertInformationBody.treatment.pharmaceuticalTreatment). Lista med 0..* – ryms ej i Flag.code (1..1)."
* value[x] only CodeableConcept

Extension: AlertRouteOfTransmission
Id: alert-route-of-transmission
Title: "Smittväg"
Description: "Kod för hur sjukdomen smittar (alertInformationBody.communicableDisease.routeOfTransmission). KV Smittväg."
* value[x] only CodeableConcept

Extension: AlertRestrictionOfCareComment
Id: alert-restriction-of-care-comment
Title: "Kommentar om vårdbegränsning"
Description: "Information om uppmärksammat förhållande som inte avser överkänslighet, sjukdom eller behandling (alertInformationBody.restrictionOfCare.restrictionOfCareComment)."
* value[x] only string
