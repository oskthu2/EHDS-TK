// Genererad från TKB clinicalprocess:healthcond:actoutcome v4.2.2
// Kontrakt: GetImagingOutcome v1.0
// Genererad: 2026-03-19

Logical: IneraEHDSLMImagingOutcome
Id: inera-ehds-lm-imaging-outcome
Title: "GetImagingOutcome"
Description: """
  Logisk modell för tjänstekontraktet GetImagingOutcome
  (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetImagingOutcome:1).
  Representerar responsens informationsstruktur — bilddiagnostiska resultat
  för en patient. Baseras på NPÖ RIV 2.2.0-specifikation.
"""
Characteristics: #can-be-target

* imagingOutcome 0..* BackboneElement "Bilddiagnostiskt resultat (ett per undersökning)"

// ── Header ───────────────────────────────────────────
* imagingOutcome.imagingOutcomeHeader 1..1 BackboneElement "PatientSummaryHeader"

* imagingOutcome.imagingOutcomeHeader.documentId 1..1 string "Dokumentets unika id"
* imagingOutcome.imagingOutcomeHeader.sourceSystemHSAId 1..1 Identifier "Källsystemets HSA-id"
* imagingOutcome.imagingOutcomeHeader.documentTitle 0..1 string "Dokumentets titel"
* imagingOutcome.imagingOutcomeHeader.documentTime 0..1 instant "Dokumentets tidpunkt"
* imagingOutcome.imagingOutcomeHeader.patientId 1..1 Identifier "Patientens id"
* imagingOutcome.imagingOutcomeHeader.patientId.value 1..1 string "Patientens personnummer/samordningsnummer"
* imagingOutcome.imagingOutcomeHeader.patientId.system 1..1 uri "OID för identifierartyp (t.ex. urn:oid:1.2.752.129.2.1.3.1)"

* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdspersonal"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.authorTime 1..1 instant "Tidpunkt"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "HSA-id"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Yrkesroll"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Org-enhet"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 0..1 Identifier "OrgUnit HSA-id"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 0..1 string "OrgUnit namn"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "E-post"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Adress"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Plats"
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 0..1 Identifier "Vårdenhetens HSA-id"
  """
  Regel 1: Används för spärrhantering och åtkomstkontroll.
  """
* imagingOutcome.imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 0..1 Identifier "Vårdgivarens HSA-id"
  """
  Regel 1: Används för spärrhantering och åtkomstkontroll.
  """

* imagingOutcome.imagingOutcomeHeader.legalAuthenticator 0..1 BackboneElement "Juridiskt ansvarig"
* imagingOutcome.imagingOutcomeHeader.legalAuthenticator.signatureTime 1..1 instant "Signeringstidpunkt"
* imagingOutcome.imagingOutcomeHeader.legalAuthenticator.legalAuthenticatorHSAId 0..1 Identifier "HSA-id"
* imagingOutcome.imagingOutcomeHeader.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn"

* imagingOutcome.imagingOutcomeHeader.approvedForPatient 1..1 boolean "Godkänd för patientvisning"
* imagingOutcome.imagingOutcomeHeader.careContactId 0..1 string "Vårdkontaktid"
* imagingOutcome.imagingOutcomeHeader.nullified 0..1 boolean "Makulerad"
* imagingOutcome.imagingOutcomeHeader.nullifiedReason 0..1 string "Makuleringsorsak"

// ── Body ─────────────────────────────────────────────
* imagingOutcome.imagingOutcomeBody 1..1 BackboneElement "Bilddiagnostisk information"

* imagingOutcome.imagingOutcomeBody.examinationSpeciality 0..1 CodeableConcept "Undersökningsspecialitet"
* imagingOutcome.imagingOutcomeBody.typeOfResult 1..1 CodeableConcept "Typ av resultat"
  """
  Kodas enligt TypeOfResultCodeEnum. Se QUESTIONS.md ASSUME-003.
  """
* imagingOutcome.imagingOutcomeBody.resultTime 1..1 instant "Resultatets tidpunkt"
* imagingOutcome.imagingOutcomeBody.resultReport 1..1 string "Resultatrapport (fritext)"
* imagingOutcome.imagingOutcomeBody.resultComment 0..1 string "Kommentar till resultatet"
* imagingOutcome.imagingOutcomeBody.radiationDose 0..* Quantity "Stråldos"
* imagingOutcome.imagingOutcomeBody.patientData 0..1 BackboneElement "Patientdata vid undersökningstillfälle"
* imagingOutcome.imagingOutcomeBody.patientData.patientWeight 0..1 Quantity "Patientens vikt"
* imagingOutcome.imagingOutcomeBody.patientData.patientLength 0..1 Quantity "Patientens längd"

* imagingOutcome.imagingOutcomeBody.imageRecording 0..* BackboneElement "Bildtagning"
* imagingOutcome.imagingOutcomeBody.imageRecording.recordingId 0..1 Identifier "Bildtagningens id"
* imagingOutcome.imagingOutcomeBody.imageRecording.examinationActivity 1..1 CodeableConcept "Undersökningsaktivitet"
* imagingOutcome.imagingOutcomeBody.imageRecording.examinationTimePeriod 1..1 Period "Undersökningsperiod"
* imagingOutcome.imagingOutcomeBody.imageRecording.examinationStatus 0..1 CodeableConcept "Undersökningsstatus"
* imagingOutcome.imagingOutcomeBody.imageRecording.examinationUnit 0..1 string "Undersökningsenhet"
* imagingOutcome.imagingOutcomeBody.imageRecording.accountableHealthcareProfessional 0..1 BackboneElement "Ansvarig personal"
* imagingOutcome.imagingOutcomeBody.imageRecording.accountableHealthcareProfessional.authorTime 1..1 instant "Tidpunkt"
* imagingOutcome.imagingOutcomeBody.imageRecording.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "HSA-id"
* imagingOutcome.imagingOutcomeBody.imageRecording.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn"
* imagingOutcome.imagingOutcomeBody.imageRecording.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Yrkesroll"
* imagingOutcome.imagingOutcomeBody.imageRecording.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Org-enhet"
* imagingOutcome.imagingOutcomeBody.imageRecording.numberOfImages 0..1 integer "Antal bilder"
* imagingOutcome.imagingOutcomeBody.imageRecording.modalityData 0..1 BackboneElement "Modalitetsdata"
* imagingOutcome.imagingOutcomeBody.imageRecording.modalityData.typeOfModality 0..1 string "Modalitetstyp (t.ex. CT, MR)"
* imagingOutcome.imagingOutcomeBody.imageRecording.modalityData.manufacturer 0..1 string "Tillverkare"
* imagingOutcome.imagingOutcomeBody.imageRecording.modalityData.modelName 0..1 string "Modellnamn"
* imagingOutcome.imagingOutcomeBody.imageRecording.modalityData.equipmentId 0..1 string "Utrustningens id"
* imagingOutcome.imagingOutcomeBody.imageRecording.modalityData.softwareVersion 0..1 string "Programvaruversion"

* imagingOutcome.imagingOutcomeBody.imageRecording.imageDicomData 0..* BackboneElement "DICOM-bilddata"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageDicomData.dicomSOP 1..1 Identifier "DICOM SOP (UID)"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageDicomData.dicomValue 0..1 base64Binary "DICOM binärdata"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageDicomData.dicomReference 0..1 url "Referens till DICOM-bild"

* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData 0..* BackboneElement "Strukturerad bilddata"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.aperture 0..1 Quantity "Bländare"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.exposureTime 0..1 Quantity "Exponeringstid"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.imageCreationTime 0..1 instant "Bildskapningstidpunkt"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.bodyPartExamined 0..1 CodeableConcept "Undersökt kroppsdel"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.contrastAgentUsed 0..1 string "Kontrastmedel"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.magneticFieldStrength 0..1 Quantity "Magnetfältstyrka"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.copyright 0..1 string "Upphovsrätt"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.imageData 1..1 BackboneElement "Bilddata"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.imageData.mediaType 1..1 CodeableConcept "Medietyp"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.imageData.value 0..1 base64Binary "Binär bild"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.imageData.reference 0..1 url "Referens-URL"
* imagingOutcome.imagingOutcomeBody.imageRecording.imageStructuredData.imageData.burnedInAnnotations 0..1 boolean "Inbrända annotationer"

* imagingOutcome.imagingOutcomeBody.referral 0..1 BackboneElement "Kopplad remiss"
* imagingOutcome.imagingOutcomeBody.referral.referralId 1..1 string "Remissens id"
* imagingOutcome.imagingOutcomeBody.referral.referralReason 0..1 string "Remissorsak"
* imagingOutcome.imagingOutcomeBody.referral.anamnesis 0..1 string "Anamnes"
* imagingOutcome.imagingOutcomeBody.referral.careContactId 0..1 string "Vårdkontaktid"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional 1..1 BackboneElement "Remittent"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.authorTime 1..1 instant "Tidpunkt"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalHSAId 0..1 Identifier "HSA-id"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Yrkesroll"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 1..1 BackboneElement "Org-enhet (obligatorisk i remissen)"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 1..1 Identifier "OrgUnit HSA-id"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 1..1 string "OrgUnit namn"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "E-post"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Adress"
* imagingOutcome.imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Plats"
* imagingOutcome.imagingOutcomeBody.referral.attested 0..1 BackboneElement "Attestering"
* imagingOutcome.imagingOutcomeBody.referral.attested.signatureTime 1..1 instant "Attesttidpunkt"
* imagingOutcome.imagingOutcomeBody.referral.attested.legalAuthenticatorHSAId 0..1 Identifier "HSA-id"
* imagingOutcome.imagingOutcomeBody.referral.attested.legalAuthenticatorName 0..1 string "Namn"
