Profile: IneraEHDSConditionFunctional
Parent: $Condition-uv-ips
Id: inera-ehds-condition-functional
Title: "SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)"
Description: """
  Profil för funktionstillstånd och ADL-bedömningar mappat från RIVTA-tjänstekontraktet
  GetFunctionalStatus (clinicalprocess:healthcond:description v2.0).
  Täcker NPÖ 2.0 och 1177 Journal 2.0.

  TKBn har två bedömningskategorier: 'pad-pad' (PADL-bedömning) och 'fun-fun'
  (funktionsnedsättningsbedömning med ICF-kod). Condition.code mappas mot
  assessmentCategory (för PADL) eller disability.disabilityAssessment (ICF-kod).
  Inget statusfält, tidperiod eller svårighetsgradfält finns i TKBn – dessa är härleddda.
"""

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (functionalStatusAssessmentHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (functionalStatusAssessmentHeader.sourceSystemHSAId)"

* recorder only Reference(PractitionerRole)
* recorder MS
* recorder ^short = "Ansvarig hälso- och sjukvårdspersonal (functionalStatusAssessmentHeader.accountableHealthcareProfessional)"

* asserter only Reference(PractitionerRole)
* asserter MS
* asserter ^short = "Rättslig äkthetsintygsgivare (functionalStatusAssessmentHeader.legalAuthenticator)"

* recordedDate MS
* recordedDate ^short = "Bedömningstidpunkt (functionalStatusAssessmentHeader.documentTime)"

* code 1..1 MS
* code ^short = "Bedömningskod: assessmentCategory (pad-pad/fun-fun) eller disability.disabilityAssessment (ICF) – se FUNC-001"

* category MS
* category ^short = "Bedömningskategori (functionalStatusAssessmentBody.assessmentCategory – pad-pad eller fun-fun)"

* clinicalStatus MS
* clinicalStatus ^short = "Alltid 'active' – härledd (inget statusfält i TKBn)"

* verificationStatus MS
* verificationStatus ^short = "Alltid 'confirmed' – härledd (journaluppgifter anses bekräftade)"

* note MS
* note ^short = """
    Fritext och PADL-poster (FUNC-001):
    note[0].text ← functionalStatusAssessmentBody.comment (helbedömningskommentar)
    note[n].text ← varje padl-post formaterad som '[typeOfAssessment]: assessment'
    Alternativ (ej valt): separata Observation-resurser per PADL-post med
    Observation.code = typeOfAssessment och Observation.valueString = assessment.
  """

// FUNC-001: PADL-poster kodas som Condition.note med prefixformat '[typeOfAssessment]: assessment'.
// Alternativet med separata Observation-resurser per PADL-post ger bättre strukturerbarhet men
// ökar resurskomplexiteten. Beslutet kan omprövas vid behov av strukturerad sökning på PADL.
