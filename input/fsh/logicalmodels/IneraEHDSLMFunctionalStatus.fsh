// Genererad från TKB clinicalprocess:healthcond:description v3.0.5
// Kontrakt: GetFunctionalStatus v2.0
// Namespace: urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2
// Genererad: 2026-03-19

Logical: IneraEHDSLMFunctionalStatus
Id: inera-ehds-lm-functional-status
Title: "GetFunctionalStatus"
Description: """
  Logisk modell för tjänstekontraktet GetFunctionalStatus
  (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2).
  Representerar responsens informationsstruktur: dokumenterade bedömningar av
  funktionsnedsättningar och/eller aktivitetsförmåga (PADL) för en patient.
  Bedömningskategori styrs av assessmentCategory: 'pad-pad' (PADL) eller 'fun-fun' (funktionsnedsättning).
  En tjänsteproducent måste använda samma värde för categorization i engagemangsindex som
  för assessmentCategory i svaret.
"""
Characteristics: #can-be-target

* functionalStatusAssessment 0..* BackboneElement "Funktionsstatusbedömning" """
    De funktionsstatusbedömningar som matchar begäran.
    Kardinalitet: Valfri, lista.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader 1..1 BackboneElement "Dokumenthuvud (PatientSummaryHeader)" """
    Innehåller basinformation om dokumentet (PatientSummaryHeaderType).
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.documentId 1..1 string "Dokumentets identitet" """
    Funktionsbedömningens identitet som är unik inom källsystemet.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.sourceSystemHSAId 1..1 Identifier "HSA-id för källsystem" """
    HSA-id för det system som tillgängliggör informationen.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.documentTitle 0..0 string "Titel (ej tillämpligt)" """
    N/A — GetFunctionalStatus skickar inte documentTitle. Elementet är 0..0 per TKB.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.documentTime 1..1 dateTime "Bedömningstidpunkt" """
    Bedömningstidpunkt/händelsetidpunkt. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.patientId 1..1 Identifier "Patientidentifierare" """
    Identifierare för patient. id = patientens identifierare (12 tecken).
    type = OID för typ av identifierare.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdsperson" """
    Information om den hälso- och sjukvårdsperson som är ansvarig för informationen.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime 1..1 dateTime "Tidpunkt för registrering" """
    Tidpunkt då informationen registrerades. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "Författarens HSA-id" """
    Författarens HSA-id.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn" """
    Namn på hälso- och sjukvårdspersonal.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning" """
    Information om personens befattning.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet" """
    Den organisation som hälso- och sjukvårdspersonalen är uppdragstagare i.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 1..1 Identifier "HSA-id för organisationsenhet" """
    HSA-id för organisationsenhet.
    Kardinalitet: Obligatorisk (inom OrgUnitType).
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 1..1 string "Namn på organisationsenhet" """
    Namn på organisationsenhet.
    Kardinalitet: Obligatorisk (inom OrgUnitType).
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 Identifier "HSA-id för vårdenhet" """
    HSA-id för vårdenhet. Se regel 1 i TKB.
    Kardinalitet: Valfri (villkorlig, se regel 1).
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 Identifier "HSA-id för vårdgivare" """
    HSA-id för vårdgivaren.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator 0..1 BackboneElement "Signerande person" """
    Information om vem som signerat informationen i dokumentet.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.signatureTime 1..1 dateTime "Tidpunkt för signering" """
    Signaturtidpunkt. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorHSAId 0..1 Identifier "HSA-id för signerande" """
    HSA-id för person som signerat dokumentet.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn på signerande person" """
    Namn i klartext för signerande person.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorRoleCode 0..1 CodeableConcept "Signerande persons befattning" """
    Signerande persons befattning. Om möjligt ska kodverk användas.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.approvedForPatient 1..1 boolean "Godkänd för visning till patient" """
    Anger om information får delas till patient.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.careContactId 0..1 string "Vårdkontakts-id" """
    Id för den vårdkontakt vid vilken bedömningen genomfördes.
    Kardinalitet: Valfri.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.nullified 0..0 boolean "Makulerat (ej tillämpligt)" """
    N/A — GetFunctionalStatus stödjer inte nullified. Elementet är 0..0 per TKB.
  """

* functionalStatusAssessment.functionalStatusAssessmentHeader.nullifiedReason 0..0 string "Makuleringsskäl (ej tillämpligt)" """
    N/A — GetFunctionalStatus stödjer inte nullifiedReason. Elementet är 0..0 per TKB.
  """

* functionalStatusAssessment.functionalStatusAssessmentBody 1..1 BackboneElement "Bedömningens innehåll" """
    FunctionalStatusAssessmentBodyType — bedömningens informationsinnehåll.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.assessmentCategory 1..1 CodeableConcept "Bedömningskategori" """
    Bedömningskategori. 'pad-pad' = PADL-bedömning, 'fun-fun' = funktionsnedsättningsbedömning.
    OBS: tjänsteproducent måste använda samma värde som categorization i engagemangsindex.
    Se AssessmentCategoryCS/AssessmentCategoryVS.
    Kardinalitet: Obligatorisk.
  """
* functionalStatusAssessment.functionalStatusAssessmentBody.assessmentCategory from AssessmentCategoryVS (required)

* functionalStatusAssessment.functionalStatusAssessmentBody.comment 0..1 string "Kommentar" """
    Kommentar till total bedömning.
    Kardinalitet: Valfri.
    Villkor (Regel): Får ENDAST anges om assessmentCategory = 'pad-pad'.
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.padl 0..* BackboneElement "PADL-bedömning" """
    Beskriver gjorda PADL-bedömningar. Får enbart anges om assessmentCategory = 'pad-pad'.
    Kardinalitet: Valfri, lista (villkorlig på assessmentCategory).
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.padl.typeOfAssessment 1..1 CodeableConcept "Typ av PADL-bedömning" """
    Typ av PADL-bedömning. Kan anges med lämpligt kodsystem för PADL.
    Kardinalitet: Obligatorisk.
    Regel 2 (TKB): Då attributet avser Personlig ADL ska ENBART ett av följande värden anges per post: 'personlig hygien', 'på/avklädning', 'förflyttning', 'toalettbesök', 'födointag'.
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.padl.assessment 1..1 string "Textuell PADL-bedömning" """
    Den textuella PADL-bedömning som gjorts i kategorin.
    Kardinalitet: Obligatorisk.
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.disability 0..1 BackboneElement "Funktionsnedsättningsbedömning" """
    Beskriver gjord funktionsnedsättningsbedömning.
    Får enbart anges om assessmentCategory = 'fun-fun'.
    Kardinalitet: Valfri (villkorlig på assessmentCategory).
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.disability.disabilityAssessment 1..1 CodeableConcept "ICF-kod för funktionsnedsättning" """
    Angivelse av kod för den funktion som bedömts nedsatt.
    Kodsystem: ICF, OID 1.2.752.116.1.1.3.
    Exempelkod: b310 = röst- och talfunktioner.
    Kardinalitet: Obligatorisk.
    CVType-begränsningar: codeSystemName och codeSystemVersion är 0..0 (får ej anges) per TKB. Om code anges ska codeSystem och displayName anges, ej originalText. Om originalText anges ska inga andra attribut anges.
  """

* functionalStatusAssessment.functionalStatusAssessmentBody.disability.comment 0..1 string "Kommentar till funktionsnedsättning" """
    Kommentar med ytterligare information om funktionsnedsättningen.
    Kardinalitet: Valfri.
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
