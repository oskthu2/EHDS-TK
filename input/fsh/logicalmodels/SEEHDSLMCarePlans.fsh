// Genererad från TKB clinicalprocess:logistics:logistics v3.0.13
// Kontrakt: GetCarePlans v2.0

Invariant: getcareplans-content-xor
Description: "Antingen value eller reference ska anges i content, inte båda"
Expression: "(value.exists() or reference.exists()) and (value.exists().not() or reference.exists().not())"
Severity: #error

Logical: SEEHDSLMCarePlans
Id: se-ehds-lm-care-plans
Title: "LM – Vårdplan (GetCarePlans v2.0)"
Description: """
  Logisk modell för tjänstekontraktet GetCarePlans
  (RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCarePlans:2).
  Representerar responsens informationsstruktur (GetCarePlansResponseType).
  En lista med CarePlanType returneras, var och en med header- och body-element.
"""
Characteristics: #can-be-target

// ---- carePlan (0..*) - CarePlanType ----
* carePlan 0..* BackboneElement "Vård- och omsorgsplaner som matchar begäran"
    """
    Lista med vård- och omsorgsplaner för patienten. Varje post innehåller
    header (basinformation) och body (planspecifik information).
    """

// -- carePlanHeader (PatientSummaryHeaderType) --
* carePlan.documentId 1..1 string "Planens identitet, unik inom källsystemet"
* carePlan.sourceSystemHSAId 1..1 string "HSA-id för källsystemet"
* carePlan.documentTitle 1..1 string "Rubrik för vård- och omsorgsplanen"
* carePlan.documentTime 0..1 dateTime "Tidpunkt då planen upprättades (YYYYMMDDhhmmss)"
* carePlan.patientId 1..1 Identifier "Patientens identifierare (personnummer/samordningsnummer)"
* carePlan.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdspersonal"
* carePlan.accountableHealthcareProfessional.authorTime 1..1 dateTime "Tidpunkt då informationen registrerades (YYYYMMDDhhmmss)"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 string "HSA-id för ansvarig personal"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn på ansvarig personal"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet för ansvarig personal"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 0..1 string "HSA-id för org.enhet"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 0..1 string "Namn på org.enhet"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon till org.enhet"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "E-post till org.enhet"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Postadress för org.enhet"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Plats för org.enhet"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 string "HSA-id för vårdenhet (Regel 1: PDL/Sparr)"
* carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 string "HSA-id för vårdgivare (Regel 1: PDL/Sparr)"
* carePlan.legalAuthenticator 0..1 BackboneElement "Signeringsinformation"
* carePlan.legalAuthenticator.signatureTime 1..1 dateTime "Tidpunkt för signering (YYYYMMDDhhmmss)"
* carePlan.legalAuthenticator.legalAuthenticatorHSAId 0..1 string "HSA-id för signerare"
* carePlan.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn på signerare"
* carePlan.approvedForPatient 1..1 boolean "Informationen godkänd för patient (Regel 3)"
* carePlan.careContactId 0..1 string "Refererad vårdkontakt-id"

// -- carePlanBody (CarePlanBodyType) --
* carePlan.content 0..* BackboneElement "Innehåll i vård- och omsorgsplanen (MultimediaType)" """
    MultimediaType-element med planens innehåll. Binärdata max 100 KB per TKB.
  """
* carePlan.content obeys getcareplans-content-xor
* carePlan.content.mediaType 1..1 code "Mediatyp (MIME-typ): text/plain, text/html, image/jpeg, image/png, image/tiff, application/pdf"
* carePlan.content.value 0..1 base64Binary "Binärdata (base64) – XOR med reference"
* carePlan.content.reference 0..1 url "Referens till extern fil (URL) – XOR med value"
* carePlan.content.id 0..0 string "id (ej tillämpligt)" """
    N/A — content.id är 0..0 per TKB för GetCarePlans.
  """
* carePlan.participatingCareUnitHSAId 0..* Identifier "Deltagande vårdenheters HSA-id (IIType)"
* carePlan.typeOfCarePlan 0..1 CodeableConcept "Typ av vård- och omsorgsplan"
* carePlan.typeOfCarePlan from TypeOfCarePlanVS (required)

// ---- result (ResultType) ----
* result 1..1 BackboneElement "Resultatkod för anropet"
* result.resultCode 1..1 code "Resultatkod: OK, INFO eller ERROR"
* result.errorCode 0..1 code "Felkod vid ERROR (INVALID_REQUEST)"
* result.logId 1..1 string "UUID för felsökning"
* result.subCode 0..1 string "Subkod"
* result.message 0..1 string "Beskrivande meddelande (svenska)"
