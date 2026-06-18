// Genererad från TKB clinicalprocess:healthcond:description v3.0.5
// Kontrakt: GetDiagnosis v2.0
// Namespace: urn:riv:clinicalprocess:healthcond:description:GetDiagnosisResponder:2
// Genererad: 2026-03-19

Logical: SEEHDSLMDiagnosis
Id: se-ehds-lm-diagnosis
Title: "GetDiagnosis"
Description: """
  Logisk modell för tjänstekontraktet GetDiagnosis
  (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetDiagnosisResponder:2).
  Representerar responsens informationsstruktur: registrerade diagnoser för en patient
  inklusive diagnoskod per ursprungligt diagnosticeringstillfälle.
"""
Characteristics: #can-be-target

* diagnosis 0..* BackboneElement "Diagnos" """
    De diagnoser som matchar begäran. En instans per diagnos.
    Kardinalitet: Valfri, lista.
  """

* diagnosis.diagnosisHeader 1..1 BackboneElement "Dokumenthuvud (PatientSummaryHeader)" """
    Innehåller basinformation om dokumentet (PatientSummaryHeaderType).
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.documentId 1..1 string "Dokumentets identitet" """
    Dokumentets identitet som är unik inom källsystemet.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.sourceSystemHSAId 1..1 Identifier "HSA-id för källsystem" """
    HSA-id för det system som tillgängliggör informationen.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.documentTitle 0..0 string "Titel (ej tillämpligt)" """
    N/A — GetDiagnosis skickar inte documentTitle. Elementet är 0..0 per TKB.
  """

* diagnosis.diagnosisHeader.documentTime 0..0 dateTime "Tidpunkt (ej tillämpligt)" """
    N/A — GetDiagnosis skickar inte documentTime. Elementet är 0..0 per TKB.
  """

* diagnosis.diagnosisHeader.patientId 1..1 Identifier "Patientidentifierare" """
    Identifierare för patient. id = patientens identifierare (12 tecken).
    type = OID för typ av identifierare. För personnummer: 1.2.752.129.2.1.3.1.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdsperson" """
    Information om den hälso- och sjukvårdsperson som är ansvarig för informationen.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.authorTime 1..1 dateTime "Tidpunkt för registrering" """
    Tidpunkt då informationen registrerades. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "Författarens HSA-id" """
    Författarens HSA-id.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn på hälso- och sjukvårdspersonal" """
    Namn på hälso- och sjukvårdspersonal. Om tillgängligt ska detta anges.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning" """
    Information om personens befattning.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet" """
    Den organisation som hälso- och sjukvårdspersonalen är uppdragstagare i.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 1..1 Identifier "HSA-id för organisationsenhet" """
    HSA-id för organisationsenhet.
    Kardinalitet: Obligatorisk (inom OrgUnitType).
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 1..1 string "Namn på organisationsenhet" """
    Namnet på den organisation som hälso- och sjukvårdspersonalen är uppdragstagare i.
    Kardinalitet: Obligatorisk (inom OrgUnitType).
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 Identifier "HSA-id för vårdenhet" """
    HSA-id för vårdenhet. Se regel 1 i TKB.
    Kardinalitet: Valfri (villkorlig, se regel 1).
  """

* diagnosis.diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 Identifier "HSA-id för vårdgivare" """
    HSA-id för vårdgivaren, som är vårdgivare för den vårdenhet där personalen verkar.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.legalAuthenticator 0..1 BackboneElement "Signerande person" """
    Information om vem som signerat informationen i dokumentet.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.legalAuthenticator.signatureTime 1..1 dateTime "Tidpunkt för signering" """
    Tidpunkt för signering. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.legalAuthenticator.legalAuthenticatorHSAId 0..1 Identifier "HSA-id för signerande person" """
    HSA-id för person som signerat dokumentet.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn på signerande person" """
    Namn i klartext för signerande person.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisHeader.approvedForPatient 1..1 boolean "Godkänd för visning till patient" """
    Anger om information får delas till patient.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisHeader.careContactId 0..1 string "Vårdkontakts-id" """
    Identitet för den hälso- och sjukvårdskontakt som diagnosen dokumenterades vid.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisBody 1..1 BackboneElement "Diagnosens innehåll" """
    DiagnosisBodyType — diagnosens informationsinnehåll.
    Kardinalitet: Obligatorisk.
  """

* diagnosis.diagnosisBody.typeOfDiagnosis 1..1 CodeableConcept "Typ av diagnos" """
    Anges som "Huvuddiagnos" eller "Bidiagnos". Se DiagnosisTypeCS/DiagnosisTypeVS.
    Kardinalitet: Obligatorisk.
  """
* diagnosis.diagnosisBody.typeOfDiagnosis from DiagnosisTypeVS (required)

* diagnosis.diagnosisBody.chronicDiagnosis 0..1 boolean "Kronisk diagnos" """
    Sätts till true om diagnosen är kronisk, false om den inte är kronisk.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisBody.diagnosisTime 0..1 dateTime "Tidpunkt för diagnos" """
    Tidpunkt då bedömningen gjordes. Format: YYYYMMDDhhmmss.
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisBody.diagnosisCode 0..1 CodeableConcept "Diagnoskod" """
    Diagnoskod. Normalt ICD-10-SE (OID okänt — se ASSUME-001 i QUESTIONS.md).
    Kardinalitet: Valfri.
  """

* diagnosis.diagnosisBody.relatedDiagnosis 0..* BackboneElement "Relaterad diagnos" """
    Relaterad diagnos. Associationen används för att koppla en bidiagnos till sin huvuddiagnos.
    Kardinalitet: Valfri, lista.
  """

* diagnosis.diagnosisBody.relatedDiagnosis.documentId 1..1 string "Relaterad diagnos dokumentid" """
    Unik identitet för den relaterade diagnosen.
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
