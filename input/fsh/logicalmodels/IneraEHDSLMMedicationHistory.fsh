// Genererad från TKB clinicalprocess:activityprescription:actoutcome v2.2.1
// Kontrakt: GetMedicationHistory v2.2
// Genererad: 2026-03-19

Logical: IneraEHDSLMMedicationHistory
Id: inera-ehds-lm-medication-history
Title: "GetMedicationHistory"
Description: """
  Logisk modell för tjänstekontraktet GetMedicationHistory
  (RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetMedicationHistoryResponder:2).
  Representerar responsens informationsstruktur — läkemedelshistorik per patient.

  OBS: Kontraktet är tämligen omfattande. Se tillämpningsanvisningen
  (AB_clinicalprocess_activityprescription_actoutcome.docx) för implementationsdetaljer.
"""
Characteristics: #can-be-target

* medicationMedicalRecord 0..* BackboneElement "Patientens läkemedelshistorik"
  """
  En läkemedelsjournalpost per ordination. En patient kan ha många poster.
  Kardinalitet: Valfri, lista.
  """
  * medicationMedicalRecordHeader 1..1 BackboneElement "Basinformation om dokumentet"
    * documentId 1..1 string "Identifierare för uppgift (vanligtvis ordinations-id)"
      """
      Vanligtvis ordinations-id eller ordinations-id kompletterat med löpnummer.
      """
    * sourceSystemHSAId 1..1 Identifier "Källsystemets HSA-id"
    * documentTitle 0..0 string "Titel (ej tillämpligt — 0..0 per TKB)"
    * patientId 1..1 Identifier "Personidentifierare för patienten"
    * accountableHealthcareProfessional 1..1 BackboneElement "Dokumentationsansvarig"
      * authorTime 1..1 instant "Tidpunkt för dokumentation"
      * healthcareProfessionalHSAId 0..1 Identifier "HSA-id för personal"
      * healthcareProfessionalName 0..1 string "Namn på personal"
      * healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)"
      * healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisationsenhet"
        * orgUnitHSAId 0..1 Identifier "HSA-id för organisationsenhet"
        * orgUnitName 0..1 string "Namn på organisationsenhet"
        * orgUnitTelecom 0..1 string "Telefon"
        * orgUnitEmail 0..1 string "E-post"
        * orgUnitAddress 0..1 string "Postadress"
        * orgUnitLocation 0..1 string "Plats/ort"
      * healthcareProfessionalcareUnitHSAId 0..1 Identifier "HSA-id för vårdenhet"
      * healthcareProfessionalcareGiverHSAId 0..1 Identifier "HSA-id/id för vårdgivare"
    * legalAuthenticator 0..1 BackboneElement "Information om signering"
      * signatureTime 1..1 instant "Tidpunkt för signering"
      * legalAuthenticatorHSAId 0..1 Identifier "HSA-id för signerande personal"
      * legalAuthenticatorName 0..1 string "Namn på signerande personal"
      * legalAuthenticatorRoleCode 0..0 CodeableConcept "Signerandes befattning (ej tillämpligt)" """
          N/A — legalAuthenticatorRoleCode är 0..0 per TKB för GetMedicationHistory.
        """
    * approvedForPatient 1..1 boolean "Ansvarig vårdpersonals beslut om synlighet (PDL-prövning)"
    * careContactId 0..1 string "Identitet för vård- och omsorgskontakt"
    * nullified 0..0 boolean "Makulerat (ej tillämpligt)" """
        N/A — GetMedicationHistory stödjer inte nullified. Elementet är 0..0 per TKB.
      """
    * nullifiedReason 0..0 string "Makuleringsskäl (ej tillämpligt)" """
        N/A — GetMedicationHistory stödjer inte nullifiedReason. Elementet är 0..0 per TKB.
      """
  * medicationMedicalRecordBody 1..1 BackboneElement "Läkemedelshistorikens innehåll"
    * medicationPrescription 1..1 BackboneElement "Läkemedelsordination"
      * prescriptionId 1..1 Identifier "Ordinations-id"
        """
        Unik identifierare för aktuell läkemedelsordination.
        root = UUID eller OID som pekar på källsystem.
        extension = ordinations-id unikt inom källsystemet.
        """
      * typeOfPrescription 1..1 code "Ordinationstyp (I=insättning, U=utsättning)"
      * typeOfPrescription from TypeOfPrescriptionVS (required)
      * prescriptionStatus 1..1 code "Ordinationsstatus (Active/Inactive)"
      * prescriptionStatus from PrescriptionStatusVS (required)
      * prescriptionNote 0..1 string "Notat om ordinationen (del av Läkemedelsberättelse)"
      * principalPrescriptionReason 0..* BackboneElement "Ordinationshuvudorsak"
        """
        Den eller de viktigaste av de ordinationsorsaker som anges.
        Anges med Socialstyrelsens kodsystem för ordinationsorsaker.
        """
        * reason 1..1 CodeableConcept "Ordinationsorsak (Socialstyrelsens kodsystem)"
        * otherReason 0..1 string "Beskrivning om 'Annan ordinationsorsak' väljs"
      * additionalPrescriptionReason 0..* BackboneElement "Övriga ordinationsorsaker"
        """
        Anges en övrig ordinationsorsak måste minst en ordinationshuvudorsak vara angiven.
        """
        * reason 1..1 CodeableConcept "Ordinationsorsak"
        * otherReason 0..1 string "Beskrivning om 'Annan ordinationsorsak' väljs"
      * evaluationTime 0..1 instant "Nästa planerade utvärderingstidpunkt"
      * treatmentPurpose 0..1 string "Behandlingsändamål"
      * prescriptionChainId 0..1 Identifier "Ordinationskedje-id"
      * precedingPrescriptionId 0..1 Identifier "Föregående ordinations-id"
      * succeedingPrescriptionId 0..1 Identifier "Efterföljande ordinations-id"
      * prescriber 0..1 BackboneElement "Ordinatör"
        """
        Icke att beblandas med accountableHealthcareProfessional (den som registrerat).
        Villkor (Regel 1.8): Obligatorisk om selfMedication = false.
        """
        * authorTime 1..1 instant "Beslutstidpunkt/ordinationstidpunkt"
        * healthcareProfessionalHSAId 0..1 Identifier "Ordinatörens HSA-id"
        * healthcareProfessionalName 0..1 string "Namn på ordinatören"
        * healthcareProfessionalRoleCode 0..1 CodeableConcept "Ordinatörens befattning"
        * healthcareProfessionalOrgUnit 0..1 BackboneElement "Organisation ordinatören är uppdragstagare på"
          * orgUnitHSAId 0..1 Identifier "HSA-id"
          * orgUnitName 0..1 string "Namn"
          * orgUnitTelecom 0..1 string "Telefon"
          * orgUnitEmail 0..1 string "E-post"
          * orgUnitAddress 0..1 string "Postadress"
          * orgUnitLocation 0..1 string "Plats/ort"
      * evaluator 0..1 BackboneElement "'Utvärderat av' — person som utvärderat utfallet"
        * authorTime 1..1 instant "Faktisk utvärderingstidpunkt"
        * healthcareProfessionalHSAId 0..1 Identifier "Utvärderande persons HSA-id"
        * healthcareProfessionalName 0..1 string "Namn på utvärderande person"
        * healthcareProfessionalRoleCode 0..1 CodeableConcept "Utvärderande persons befattning"
        * healthcareProfessionalOrgUnit 0..1 BackboneElement "Utvärderande persons organisation"
          * orgUnitHSAId 0..1 Identifier "HSA-id"
          * orgUnitName 0..1 string "Namn"
      * startOfFirstTreatment 0..1 instant "Första insättningstidpunkt (beräknad från ordinationskedjan)"
      * startOfTreatment 0..1 instant "Insättningstidpunkt. Villkor (Regel 1.8): Obligatorisk om typeOfPrescription = 'I' (insättning)."
      * endOfTreatment 0..1 instant "Utsättningstidpunkt"
      * endOfTreatmentReason 0..1 CodeableConcept "Utsättningsorsak"
      * selfMedication 1..1 boolean "Anger om ordination är utfärdad av patienten själv"
      * drug 0..1 BackboneElement "Läkemedelsval (ett av: unstructured/merchandise/drugArticle/drug/generics)"
        """
        OBS: Ett och endast ett av följande alternativ ska anges.
        ASSUME-ACT-003: XOR-villkor kan inte uttryckas direkt i FSH-kardinaliteten (alla är 0..1).
        """
        * comment 0..1 string "Kommentar om läkemedelsval"
        * unstructuredDrugInformation 0..1 BackboneElement "Fritextval (extemporeberedning, licensläkemedel m.m.)"
          * unstructuredInformation 1..1 string "Fritextbeskrivning"
        * merchandise 0..1 BackboneElement "Handelsvara"
          * articleNumber 1..1 CodeableConcept "Varunummer (från SIL)"
        * drugArticle 0..1 BackboneElement "Läkemedelsartikel"
          * nplPackId 1..1 CodeableConcept "NPL pack-id (OID 1.2.752.129.2.1.5.2)"
        * drug 0..1 BackboneElement "Läkemedelsprodukt"
          * nplId 0..1 CodeableConcept "NPL-id (OID 1.2.752.129.2.1.5.1)"
          * atcCode 0..1 CodeableConcept "ATC-kod (OID 1.2.752.129.2.2.3.1.1)"
          * routeOfAdministration 0..1 CodeableConcept "Administreringssätt"
          * pharmaceuticalForm 0..1 string "Läkemedelsform (t.ex. Tablett)"
          * strength 0..1 decimal "Styrka (t.ex. 20.0)"
          * strengthUnit 0..1 string "Enhet på styrka (t.ex. mg)"
        * generics 0..1 BackboneElement "Generiskt läkemedelsval"
          * substance 0..1 string "Substansgrupp"
          * strength 0..1 Quantity "Önskad styrka"
          * form 0..1 string "Läkemedelsform"
      * dosage 0..* BackboneElement "Dosering"
        * lengthOfTreatment 0..1 BackboneElement "Behandlingstid"
          * treatmentInterval 1..1 Range "Tidsintervall för behandling (PQIntervalType)"
          * isMaximumTreatmentTime 1..1 boolean "Om true: maximalt tillåten tid"
        * dosageInstruction 1..1 string "Doseringsanvisning"
        * unitDose 0..1 CodeableConcept "Doseringsenhet"
        * shortNotation 0..1 string "Kortnotation, t.ex. '1x2'"
        * setDosage 0..1 BackboneElement "Fastdosering"
          """
          Dosering där ordinatören har bestämt mängd och periodicitet.
          """
        * maximumDosage 0..1 BackboneElement "Maxdosering"
          """
          Den högsta tillåtna mängden under en viss period.
          """
        * conditionalDosage 0..1 BackboneElement "Villkorsdosering"
          """
          Ordinerad mängd och periodicitet som gäller om ett visst villkor är uppfyllt.
          """
          * conditionDescription 0..1 string "Villkorstext"
      * dispensationAuthorization 0..1 BackboneElement "Förskrivning"
        """
        Se XSD DispensationAuthorizationType för fullständig struktur.
        Nyckelfält: dispensationAuthorizationId (1..1), dispensationAuthorizer (1..1,
        careUnitHSAId/careGiverHSAId=0..0), prescriptionSignatura (1..1),
        drug (0..1 XOR: unstructured/merchandise/drugArticle/drug/generics, samma mönster som ordination),
        totalAmount/packageUnit (båda eller ingetdera — Regel 1.8), validUntil (0..1),
        nonReplaceable (0..1, enum Prescriber/Patient).
        """
      * administration 0..* BackboneElement "Information om administrering av läkemedel"
        """
        Bara administreringstillfällen som faktiskt ägt rum kan anges.
        Se XSD AdministrationType för fullständig struktur.
        Nyckelfält: administrationId (1..1), administrationTime (1..1, start/end —
        minst ett av start/end — Regel 1.8), administeringHealthcareProfessional (1..1,
        careUnitHSAId/careGiverHSAId=0..0), routeOfAdministration (0..1),
        drug (0..1 XOR), administrationComment (0..1).
        """
      * relation 0..* BackboneElement "Sambandsklass"
        """
        Alla meddelandeposter som i ordinationen pekas ut med samma relationstyp.
        Se XSD RelationType för fullständig struktur.
        Nyckelfält: code (1..1 CVType), referredInformation (1..*:
        id/IIType 1..1, type/CVType 1..1 originalText 'caa-ga'/'chb-go',
        informationOwner/InformationOwnerType 1..1).
        """
    * additionalPatientInformation 0..1 BackboneElement "Ytterligare patientinformation"
      * dateOfBirth 1..1 date "Patientens födelsedatum"
      * gender 0..1 CodeableConcept "Patientens kön. KV Kön (OID 1.2.752.129.2.2.1.1) bör användas. CVType-begränsning (Regel 1.6): originalText är förbjudet (0..0) för könsfältet — code, codeSystem och displayName ska anges."
* result 1..1 BackboneElement "Svarsstatus"
  * resultCode 1..1 code "OK, INFO eller ERROR"
  * resultCode from ResultCodeVS (required)
  * errorCode 0..1 code "Sätts om resultCode är ERROR"
  * errorCode from ErrorCodeVS (required)
  * subcode 0..1 string "Inga subkoder specificerade"
  * logId 1..1 string "UUID för felsökning hos producent"
  * message 0..1 string "Beskrivande text för användaren"
