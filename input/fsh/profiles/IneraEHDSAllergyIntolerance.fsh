Profile: IneraEHDSAllergyIntolerance
Parent: $AllergyIntolerance-uv-ips
Id: inera-ehds-allergy-intolerance
Title: "SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation)"
Description: """
  Sekundär profil för allergier och överkänslighet från GetAlertInformation.

  Skapas ENBART när alertInformationBody = hypersensitivity.
  Den tillhörande IneraEHDSFlag-resursen är alltid primär och pekar på denna
  resurs via Flag.extension[flag-detail] (standard R4-extension; R5: supportingInfo).

  Populeras med klinisk information från hypersensitivity-blocket:
  - atcSubstance/hypersensitivityAgentCode → AllergyIntolerance.code
  - degreeOfSeverity → AllergyIntolerance.reaction.severity
  - degreeOfCertainty → AllergyIntolerance.verificationStatus (se ALERT-004)
  - ascertainedDate → AllergyIntolerance.onsetDateTime
  - alertInformationComment → AllergyIntolerance.note
  - pharmaceuticalProductId → AllergyIntolerance.reaction.substance.coding (NPL-id)

  Täcker NPÖ 2.0 och 1177 Journal 2.0.
"""

* patient only Reference(IneraEHDSPatient)
* patient MS
* patient ^short = "Patient (alertInformationHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (alertInformationHeader.sourceSystemHSAId)"

* recorder only Reference(PractitionerRole)
* recorder MS
* recorder ^short = "Dokumentationsansvarig (alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId)"

* asserter only Reference(PractitionerRole)
* asserter MS
* asserter ^short = "Juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId)"

* recordedDate MS
* recordedDate ^short = "Registreringstidpunkt (alertInformationHeader.accountableHealthcareProfessional.authorTime)"

* clinicalStatus MS
* clinicalStatus ^short = "Alltid 'active' – härledd; inget statusfält i TKBn"

* verificationStatus MS
* verificationStatus ^short = "Visshet (alertInformationBody.hypersensitivity.degreeOfCertainty → ConceptMap till verificationStatus); se ALERT-004"

* type MS
* type ^short = "Alltid 'allergy' – härledd av att body = hypersensitivity"

* code 1..1 MS
* code ^short = """
    Agens/substans:
    - pharmaceuticalHypersensitivity.atcSubstance → code.coding (ATC, primär)
    - pharmaceuticalHypersensitivity.nonATCSubstance → code.text
    - otherHypersensitivity.hypersensitivityAgentCode → code.coding
    - otherHypersensitivity.hypersensitivityAgent → code.text
  """

* onsetDateTime MS
* onsetDateTime ^short = "Datum för konstaterande (alertInformationBody.ascertainedDate)"

* note MS
* note ^short = "Kommentar (alertInformationBody.alertInformationComment)"

* reaction MS
* reaction ^short = "Reaktionsinformation (delar av hypersensitivity)"

* reaction.severity MS
* reaction.severity ^short = "Allvarlighetsgrad (hypersensitivity.degreeOfSeverity → ConceptMap till reaction.severity)"

* reaction.substance MS
* reaction.substance ^short = "Läkemedelsprodukt (pharmaceuticalHypersensitivity.pharmaceuticalProductId → reaction.substance.coding med NPL-id)"
