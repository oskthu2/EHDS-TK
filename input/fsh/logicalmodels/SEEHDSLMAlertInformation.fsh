// Genererad från TKB clinicalprocess:healthcond:description v3.0.5
// Kontrakt: GetAlertInformation v2.0
// Namespace: urn:riv:clinicalprocess:healthcond:description:GetAlertInformationResponder:2
// Genererad: 2026-03-19

Logical: SEEHDSLMAlertInformation
Id: se-ehds-lm-alert-information
Title: "GetAlertInformation"
Description: """
  Logisk modell för tjänstekontraktet GetAlertInformation
  (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetAlertInformationResponder:2).
  Representerar responsens informationsstruktur: uppmärksamhetsinformation för en patient,
  exempelvis överkänslighet mot läkemedel, allvarlig sjukdom eller vårdbegränsningar.
"""
Characteristics: #can-be-target

* alertInformation 0..* BackboneElement "Uppmärksamhetsinformation" """
    Den uppmärksamhetsinformation som matchar begäran.
    Kardinalitet: Valfri, lista.
  """

* alertInformation.alertInformationHeader 1..1 BackboneElement "Dokumenthuvud (PatientSummaryHeader)" """
    Innehåller basinformation om dokumentet (PatientSummaryHeaderType).
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.documentId 1..1 string "Dokumentets identitet" """
    Dokumentets identitet som är unik inom källsystemet.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.sourceSystemHSAId 1..1 Identifier "HSA-id för källsystem" """
    HSA-id för det system som tillgängliggör informationen.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.patientId 1..1 Identifier "Patientidentifierare" """
    Identifierare för patient. id = patientens identifierare (12 tecken).
    type = OID för typ av identifierare.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdsperson" """
    Information om den hälso- och sjukvårdsperson som är ansvarig för informationen.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.authorTime 1..1 dateTime "Tidpunkt för registrering" """
    Tidpunkt då informationen registrerades. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "HSA-id för hälso- och sjukvårdspersonal" """
    HSA-id för hälso- och sjukvårdspersonal.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn" """
    Namn på hälso- och sjukvårdspersonal.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning" """
    Information om personens befattning.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet" """
    Den organisation som hälso- och sjukvårdspersonalen är uppdragstagare i.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 1..1 Identifier "HSA-id för organisationsenhet" """
    HSA-id för organisationsenhet.
    Kardinalitet: Obligatorisk (inom OrgUnitType).
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 1..1 string "Namn på organisationsenhet" """
    Namn på organisationsenhet.
    Kardinalitet: Obligatorisk (inom OrgUnitType).
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 Identifier "HSA-id för vårdenhet" """
    HSA-id för vårdenhet. Se regel 1 i TKB.
    Kardinalitet: Valfri (villkorlig, se regel 1).
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 Identifier "HSA-id för vårdgivare" """
    HSA-id för vårdgivaren.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.legalAuthenticator 0..1 BackboneElement "Signerande person" """
    Information om vem som signerat informationen i dokumentet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.legalAuthenticator.signatureTime 1..1 dateTime "Tidpunkt för signering" """
    Tidpunkt för signering. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId 0..1 Identifier "HSA-id för signerande" """
    HSA-id för person som signerat dokumentet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn på signerande person" """
    Namn i klartext för signerande person.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.approvedForPatient 1..1 boolean "Godkänd för visning till patient" """
    Anger om information får delas till patient.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationHeader.careContactId 0..1 string "Vårdkontakts-id" """
    Identitet för den hälso- och sjukvårdskontakt som uppmärksamhetsinformationen gäller.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody 1..1 BackboneElement "Uppmärksamhetsinformationens innehåll" """
    AlertInformationBodyType — uppmärksamhetsinformationens informationsinnehåll.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.typeOfAlertInformation 1..1 CodeableConcept "Typ av uppmärksamhetssignal" """
    Kod som anger vilken typ av uppmärksamhetssignal som avses.
    Bör tas från ett lokalt kodsystem eller från nationell standard.
    Kodsystem: okänt externt/lokalt (se ASSUME-002 i QUESTIONS.md).
    Kardinalitet: Obligatorisk.
  """

* result 1..1 BackboneElement "Resultat" """
    Innehåller information om begäran gick bra eller ej.
    Kardinalitet: Obligatorisk.
  """

* result.resultCode 1..1 code "Resultatkod" """
    Kan endast vara OK, INFO eller ERROR.
    Kardinalitet: Obligatorisk.
  """

* result.errorCode 0..1 code "Felkod" """
    Sätts endast om resultCode är ERROR. Tillåtna värden: INVALID_REQUEST.
    Kardinalitet: Valfri.
  """

* result.logId 1..1 string "Log-id" """
    En UUID som kan användas vid felanmälan för att spåra felet.
    Kardinalitet: Obligatorisk.
  """

* result.message 0..1 string "Meddelande" """
    En beskrivande text som kan visas för användaren.
    Kardinalitet: Valfri.
  """
