// Genererad från TKB clinicalprocess:healthcond:actoutcome v4.2.2
// Kontrakt: GetReferralOutcome v3.2
// Genererad: 2026-03-19

Logical: SEEHDSLMReferralOutcome
Id: se-ehds-lm-referral-outcome
Title: "GetReferralOutcome"
Description: """
  Logisk modell för tjänstekontraktet GetReferralOutcome
  (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetReferralOutcome:3).
  Representerar responsens informationsstruktur — svar på konsultationsremiss
  och begäran om övertagande av vårdansvar. Meddelandeformatet är kompatibelt
  med HL7v3 CDA v.2.
"""
Characteristics: #can-be-target

* referralOutcome 0..* BackboneElement "Remissvar (ett per remiss)"

// ── Header ───────────────────────────────────────────
* referralOutcome.referralOutcomeHeader 1..1 BackboneElement "PatientSummaryHeader"

* referralOutcome.referralOutcomeHeader.documentId 1..1 string "Dokumentets unika id"
* referralOutcome.referralOutcomeHeader.sourceSystemHSAId 1..1 Identifier "Källsystemets HSA-id"
* referralOutcome.referralOutcomeHeader.documentTitle 0..1 string "Dokumentets titel"
* referralOutcome.referralOutcomeHeader.documentTime 1..1 instant "Dokumentets tidpunkt"
* referralOutcome.referralOutcomeHeader.patientId 1..1 Identifier "Patientens id"
* referralOutcome.referralOutcomeHeader.patientId.value 1..1 string "Patientens personnummer/samordningsnummer"
* referralOutcome.referralOutcomeHeader.patientId.system 1..1 string "OID för typ av identifierare"

* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdspersonal"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.authorTime 1..1 instant "Tidpunkt för dokumentation"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "Personalens HSA-id"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Personalens namn"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Yrkesroll"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 0..1 Identifier "OrgUnit HSA-id"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 0..1 string "OrgUnit namn"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "E-post"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Adress"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Plats"
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 Identifier "Vårdenhetens HSA-id"
  """
  Regel 1: Krävs för spärrhantering och åtkomstkontroll.
  """
* referralOutcome.referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 Identifier "Vårdgivarens HSA-id"
  """
  Regel 1: Krävs för spärrhantering och åtkomstkontroll.
  """

* referralOutcome.referralOutcomeHeader.legalAuthenticator 0..1 BackboneElement "Juridiskt ansvarig"
* referralOutcome.referralOutcomeHeader.legalAuthenticator.signatureTime 1..1 instant "Signeringstidpunkt"
* referralOutcome.referralOutcomeHeader.legalAuthenticator.legalAuthenticatorHSAid 0..1 Identifier "HSA-id"
* referralOutcome.referralOutcomeHeader.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn"

* referralOutcome.referralOutcomeHeader.approvedForPatient 1..1 boolean "Godkänd för patientvisning"
* referralOutcome.referralOutcomeHeader.careContactId 0..1 string "Vårdkontaktid"

// ── Body ─────────────────────────────────────────────
* referralOutcome.referralOutcomeBody 1..1 BackboneElement "Remissvarsinformation"

* referralOutcome.referralOutcomeBody.referralOutcomeTypeCode 1..1 CodeableConcept "Typ av remissvar"
  """
  Kodas enligt referralOutcomeTypeCodeEnum. Se QUESTIONS.md ASSUME-002 angående canonicalURL.
  """
* referralOutcome.referralOutcomeBody.referralOutcomeTitle 0..1 string "Remissvarets titel"
* referralOutcome.referralOutcomeBody.referralOutcomeText 1..1 string "Remissvarets text"

* referralOutcome.referralOutcomeBody.clinicalInformation 0..* BackboneElement "Klinisk information"
* referralOutcome.referralOutcomeBody.clinicalInformation.clinicalInformationCode 1..1 CodeableConcept "Klinisk informationskod"
* referralOutcome.referralOutcomeBody.clinicalInformation.clinicalInformationText 1..1 string "Klinisk informationstext"

* referralOutcome.referralOutcomeBody.act 0..* BackboneElement "Åtgärd"
* referralOutcome.referralOutcomeBody.act.actId 0..1 string "Åtgärdens id"
* referralOutcome.referralOutcomeBody.act.actCode 0..1 CodeableConcept "Åtgärdskod"
* referralOutcome.referralOutcomeBody.act.actText 1..1 string "Åtgärdstext"
* referralOutcome.referralOutcomeBody.act.actTime 0..1 instant "Tidpunkt för åtgärd"
* referralOutcome.referralOutcomeBody.act.actResult 0..* BackboneElement "Resultat (multimedia)"
* referralOutcome.referralOutcomeBody.act.actResult.mediaType 1..1 CodeableConcept "Medietyp"
* referralOutcome.referralOutcomeBody.act.actResult.value 0..1 base64Binary "Binärt innehåll"
* referralOutcome.referralOutcomeBody.act.actResult.reference 0..1 url "Referens-URL"

* referralOutcome.referralOutcomeBody.attested 0..1 BackboneElement "Attestering"
* referralOutcome.referralOutcomeBody.attested.attestedTime 1..1 instant "Attest-tidpunkt"
* referralOutcome.referralOutcomeBody.attested.attesterHSAId 0..1 Identifier "Attesterarens HSA-id"
* referralOutcome.referralOutcomeBody.attested.attesterName 0..1 string "Attesterarens namn"

* referralOutcome.referralOutcomeBody.referral 1..1 BackboneElement "Remissens uppgifter"
* referralOutcome.referralOutcomeBody.referral.referralId 1..1 string "Remissens id"
* referralOutcome.referralOutcomeBody.referral.referralReason 1..1 string "Remissorsak"
* referralOutcome.referralOutcomeBody.referral.referralTime 0..1 instant "Remisstidpunkt"
* referralOutcome.referralOutcomeBody.referral.referralAuthor 1..1 BackboneElement "Remittent"
* referralOutcome.referralOutcomeBody.referral.referralAuthor.authorTime 1..1 instant "Tidpunkt"
* referralOutcome.referralOutcomeBody.referral.referralAuthor.healthcareProfessionalHSAId 0..1 Identifier "HSA-id"
* referralOutcome.referralOutcomeBody.referral.referralAuthor.healthcareProfessionalName 0..1 string "Namn"
* referralOutcome.referralOutcomeBody.referral.referralAuthor.healthcareProfessionalRoleCode 0..1 CodeableConcept "Yrkesroll"
* referralOutcome.referralOutcomeBody.referral.referralAuthor.healthcareProfessionalOrgUnit 0..1 BackboneElement "Org-enhet"
* referralOutcome.referralOutcomeBody.referral.careContactId 0..1 string "Vårdkontaktid"
