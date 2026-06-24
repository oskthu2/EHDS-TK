// Genererad från TKB clinicalprocess:logistics:logistics v3.0.13
// Kontrakt: GetCareContacts v3.0

Logical: IneraEHDSLMCareContacts
Id: inera-ehds-lm-care-contacts
Title: "GetCareContacts"
Description: """
  Logisk modell för tjänstekontraktet GetCareContacts
  (RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCareContacts:3).
  Representerar responsens informationsstruktur (GetCareContactsResponseType).
  En lista med CareContactType returneras.
"""
Characteristics: #can-be-target

// ---- careContact (0..*) - CareContactType ----
* careContact 0..* BackboneElement "Vårdkontakter som matchar begäran"

// -- careContactHeader (PatientSummaryHeaderType) --
* careContact.documentId 1..1 string "Vårdkontaktens identitet, unik inom källsystemet"
* careContact.sourceSystemHSAId 1..1 string "HSA-id för källsystemet"
* careContact.patientId 1..1 Identifier "Patientens identifierare (personnummer/samordningsnummer)"
* careContact.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdspersonal"
* careContact.accountableHealthcareProfessional.authorTime 1..1 dateTime "Tidpunkt då informationen registrerades (YYYYMMDDhhmmss)"
* careContact.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 string "HSA-id för ansvarig personal"
* careContact.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn på ansvarig personal"
* careContact.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet för ansvarig personal (Regel 4)"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 0..1 string "HSA-id för org.enhet"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 0..1 string "Namn på org.enhet"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon till org.enhet"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "E-post till org.enhet"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Postadress för org.enhet"
* careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Plats för org.enhet"
* careContact.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 string "HSA-id för vårdenhet (Regel 1: PDL/Sparr)"
* careContact.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 string "HSA-id för vårdgivare (Regel 1: PDL/Sparr)"
* careContact.approvedForPatient 1..1 boolean "Informationen godkänd för patient (Regel 3)"

// Fält som är N/A (0..0) för GetCareContacts per TKB
* careContact.documentTitle 0..0 string "Titel (ej tillämpligt)" """
    N/A — GetCareContacts skickar inte documentTitle. Elementet är 0..0 per TKB.
  """
* careContact.documentTime 0..0 dateTime "Tidpunkt (ej tillämpligt)" """
    N/A — GetCareContacts skickar inte documentTime. Elementet är 0..0 per TKB.
  """
* careContact.legalAuthenticator 0..0 BackboneElement "Signering (ej tillämpligt)" """
    N/A — GetCareContacts skickar inte legalAuthenticator. Elementet är 0..0 per TKB.
  """
* careContact.nullified 0..0 boolean "Makulerat (ej tillämpligt)" """
    N/A — GetCareContacts stödjer inte nullified. Elementet är 0..0 per TKB.
  """
* careContact.nullifiedReason 0..0 string "Makuleringsskäl (ej tillämpligt)" """
    N/A — GetCareContacts stödjer inte nullifiedReason. Elementet är 0..0 per TKB.
  """
* careContact.careContactId 0..0 string "Vårdkontakts-id i header (ej tillämpligt)" """
    N/A — careContactId i PatientSummaryHeader är 0..0 per TKB för GetCareContacts.
  """

// -- careContactBody (CareContactBodyType) --
* careContact.careContactCode 0..1 CodeableConcept "Typ av vårdkontakt (KV Vårdkontakttyp OID 1.2.752.129.2.2.2.x)"
* careContact.careContactReason 0..1 string "Orsak till vårdkontakt (fri text från patient/företrädare)"
* careContact.careContactOrgUnit 0..1 BackboneElement "Enhet för vårdkontakten (Regel 5: krävs för NPÖ)"
* careContact.careContactOrgUnit.orgUnitHSAId 1..1 string "HSA-id för kontaktenhet (Regel 4: obligatorisk för NPÖ)"
* careContact.careContactOrgUnit.orgUnitName 1..1 string "Namn på kontaktenhet (Regel 4: obligatorisk för NPÖ)"
* careContact.careContactOrgUnit.orgUnitTelecom 0..1 string "Telefon till kontaktenhet"
* careContact.careContactOrgUnit.orgUnitEmail 0..1 string "E-post till kontaktenhet"
* careContact.careContactOrgUnit.orgUnitAddress 0..1 string "Adress till kontaktenhet"
* careContact.careContactOrgUnit.orgUnitLocation 0..1 string "Plats för kontaktenhet"
* careContact.careContactTimePeriod 0..1 BackboneElement "Tidsintervall för vårdkontakten. Villkor: Minst ett av start och end måste anges."
* careContact.careContactTimePeriod.start 0..1 dateTime "Starttidpunkt (YYYYMMDDhhmmss)"
* careContact.careContactTimePeriod.end 0..1 dateTime "Sluttidpunkt (YYYYMMDDhhmmss)"
* careContact.careContactStatus 0..1 CodeableConcept "Status för vårdkontakten (SNOMED CT SE, OID 1.2.752.116.2.1.1, SCTID 53761000052103)"
* careContact.additionalPatientInformation 0..1 BackboneElement "Ytterligare patientinformation"
* careContact.additionalPatientInformation.dateOfBirth 0..1 date "Patientens födelsedatum (YYYY / YYYYMM / YYYYMMDD)"
* careContact.additionalPatientInformation.gender 0..1 CodeableConcept "Patientens kön (KV Kön OID 1.2.752.129.2.2.1.1)"

// ---- result (ResultType) ----
* result 1..1 BackboneElement "Resultatkod för anropet"
* result.resultCode 1..1 code "Resultatkod: OK, INFO eller ERROR"
* result.errorCode 0..1 code "Felkod vid ERROR (INVALID_REQUEST)"
* result.logId 1..1 string "UUID för felsökning"
* result.subCode 0..1 string "Subkod"
* result.message 0..1 string "Beskrivande meddelande (svenska)"
