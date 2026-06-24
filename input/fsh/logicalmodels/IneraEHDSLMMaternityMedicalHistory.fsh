// Genererad från TKB clinicalprocess:healthcond:actoutcome v4.2.2
// Kontrakt: GetMaternityMedicalHistory v2.0
// Genererad: 2026-03-19

Logical: IneraEHDSLMMaternityMedicalHistory
Id: inera-ehds-lm-maternity-medical-history
Title: "GetMaternityMedicalHistory"
Description: """
  Logisk modell för tjänstekontraktet GetMaternityMedicalHistory
  (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetMaternityMedicalHistory:2).
  Representerar responsens informationsstruktur — mödravårdsjournal för en patient.
"""
Characteristics: #can-be-target

* maternityMedicalRecord 0..* BackboneElement "Mödravårdsjournalpost"

// ── Header ───────────────────────────────────────────
* maternityMedicalRecord.maternityMedicalRecordHeader 1..1 BackboneElement "PatientSummaryHeader"

* maternityMedicalRecord.maternityMedicalRecordHeader.documentId 1..1 string "Dokumentets unika id"
* maternityMedicalRecord.maternityMedicalRecordHeader.sourceSystemHSAId 1..1 Identifier "Källsystemets HSA-id"
* maternityMedicalRecord.maternityMedicalRecordHeader.documentTitle 0..1 string "Dokumentets titel"
* maternityMedicalRecord.maternityMedicalRecordHeader.documentTime 1..1 instant "Dokumentets tidpunkt"
* maternityMedicalRecord.maternityMedicalRecordHeader.patientId 1..1 Identifier "Patientens id"
* maternityMedicalRecord.maternityMedicalRecordHeader.patientId.value 1..1 string "Patientens personnummer/samordningsnummer"
* maternityMedicalRecord.maternityMedicalRecordHeader.patientId.system 1..1 uri "OID för identifierartyp (t.ex. urn:oid:1.2.752.129.2.1.3.1)"

* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional 1..1 BackboneElement "Ansvarig hälso- och sjukvårdspersonal"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime 1..1 instant "Tidpunkt"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId 1..1 Identifier "HSA-id (obligatorisk i mödrahälsovård)"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName 0..1 string "Namn"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Yrkesroll"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId 1..1 Identifier "OrgUnit HSA-id"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName 1..1 string "OrgUnit namn"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "E-post"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Adress"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Plats"
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId 1..1 Identifier "Vårdenhetens HSA-id"
  """
  Regel 1: Obligatorisk i GetMaternityMedicalHistory.
  """
* maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId 1..1 Identifier "Vårdgivarens HSA-id"
  """
  Regel 1: Obligatorisk i GetMaternityMedicalHistory.
  """

* maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator 0..1 BackboneElement "Juridiskt ansvarig"
* maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.signatureTime 1..1 instant "Signeringstidpunkt"
* maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId 0..1 Identifier "HSA-id"
* maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName 0..1 string "Namn"

* maternityMedicalRecord.maternityMedicalRecordHeader.approvedForPatient 1..1 boolean "Godkänd för patientvisning"
* maternityMedicalRecord.maternityMedicalRecordHeader.careContactId 0..1 string "Vårdkontaktid"

// ── Body ─────────────────────────────────────────────
* maternityMedicalRecord.maternityMedicalRecordBody 1..1 BackboneElement "Mödravårdsjournaldata"

// Registrering
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord 0..1 BackboneElement "Inskrivningsuppgifter"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.lastMenstrualPeriod 0..1 date "Sista menstruationsdag"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.indicationPregnancy 0..1 date "Graviditetsindikation datum"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.contraceptiveDiscontinued 0..1 date "Datum p-medel avslutades"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromLastMenstrualPeriod 0..1 date "Beräknat förlossningsdatum (LMP)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromUltrasoundScan 0..1 date "Beräknat förlossningsdatum (UL)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromEmbryonicTransfer 0..1 date "Beräknat förlossningsdatum (embryoöverföring)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.length 0..1 Quantity "Kroppslängd (cm)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.weight 0..1 Quantity "Kroppsvikt (kg)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.bodyMassIndex 0..1 Quantity "BMI"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.infertility 0..1 decimal "Infertilitet (år)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity 0..* BackboneElement "Tidigare graviditeter"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.year 1..1 integer "År"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.month 1..1 integer "Månad"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.delivery 0..1 CodeableConcept "Förlossningssätt"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.healthcareFacility 0..1 string "Vårdinrättning"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.progress 0..1 string "Förlopp"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.sex 0..1 CodeableConcept "Barnets kön"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.weightOfChild 0..1 Quantity "Barnets vikt"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.gestation 0..1 integer "Gestationsålder (veckor)"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesThrombosis 0..1 boolean "Trombos"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesEndocineDiseases 0..1 boolean "Endokrina sjukdomar"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesRecurrentUrinaryTractInfections 0..1 boolean "Recidiverande urinvägsinfektioner"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesDiabetesMellitus 0..1 boolean "Diabetes mellitus"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy 0..* BackboneElement "Läkemedel under graviditet"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy.medicament 1..1 string "Läkemedel"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy.dosage 0..1 string "Dosering"
* maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.assessmentAtFirstContactStandardCare 0..1 boolean "Bedömning vid inskrivning standardvård"

// Graviditetskontroll
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord 0..1 BackboneElement "Graviditetskontroll"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.completeWeeksOfGestation 0..1 integer "Kompletta graviditetsveckor"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.weight 0..1 Quantity "Vikt"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.symphysisFundalHeight 0..1 Quantity "Symfondusmått (cm)"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.haemoglobin 0..1 Quantity "Hemoglobin"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.bloodPressureSystolic 0..1 Quantity "Systoliskt blodtryck"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.bloodPressureDiastolic 0..1 Quantity "Diastoliskt blodtryck"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.proteinuria 0..1 Quantity "Proteinuri"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.glycosuria 0..1 Quantity "Glykosuri"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalPosition 0..* CodeableConcept "Fosterläge"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalPresentation 0..* CodeableConcept "Fosterpresentation"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalHeartRate 0..* Quantity "Fosterhjärtfrekvens"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.typeOfLeave 0..* CodeableConcept "Typ av ledighet"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration 0..* BackboneElement "Läkemedel sedan inskrivning"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration.medicament 1..1 string "Läkemedel"
* maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration.dosage 0..1 string "Dosering"

// Eftervård
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord 0..1 BackboneElement "Eftervård"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord 1..1 BackboneElement "Moderns eftervård"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.breastfeeding 0..1 boolean "Amning"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bloodPressureSystolic 0..1 Quantity "Systoliskt blodtryck"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bloodPressureDiastolic 0..1 Quantity "Diastoliskt blodtryck"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.haemoglobin 0..1 Quantity "Hemoglobin"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bodyTemperature 0..1 Quantity "Kroppstemperatur"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.scarsOK 0..1 boolean "Ärr OK"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.sutureRemoved 0..1 boolean "Suturer borttagna"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.perineumComfortable 0..1 boolean "Perineum OK"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.vulvaVaginaPortioOK 0..1 boolean "Vulva/vagina/portio OK"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.uterusContracted 0..1 boolean "Uterus kontraherad"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.uterusNote 0..1 string "Uterusnotering"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord 1..* BackboneElement "Barnets eftervård"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.ordinalNumber 1..1 integer "Löpnummer för barn (vid flerbörd)"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.weight 0..1 Quantity "Barnets vikt"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore1 0..1 integer "Apgar-poäng 1 min"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore5 0..1 integer "Apgar-poäng 5 min"
* maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore10 0..1 integer "Apgar-poäng 10 min"
