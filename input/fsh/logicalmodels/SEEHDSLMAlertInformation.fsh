// Genererad från TKB clinicalprocess:healthcond:description v3.0.5
// Kontrakt: GetAlertInformation v2.0
// Namespace: urn:riv:clinicalprocess:healthcond:description:GetAlertInformationResponder:2
// Uppdaterad: 2026-06-17 med fullständig body-struktur per faktisk TKB

Logical: SEEHDSLMAlertInformation
Id: se-ehds-lm-alert-information
Title: "GetAlertInformation"
Description: """
  Logisk modell för tjänstekontraktet GetAlertInformation
  (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetAlertInformationResponder:2).
  Representerar responsens informationsstruktur: uppmärksamhetsinformation för en patient,
  exempelvis överkänslighet mot läkemedel, allvarlig sjukdom, behandling, smittsam sjukdom,
  vårdbegränsning eller historisk varning.

  Body-strukturen är XOR – exakt en av hypersensitivity, seriousDisease, treatment,
  communicableDisease, restrictionOfCare, unstructuredAlertInformation ska anges per post.
"""
Characteristics: #can-be-target

* alertInformation 0..* BackboneElement "Uppmärksamhetsinformation" """
    Den uppmärksamhetsinformation som matchar begäran.
    Kardinalitet: Valfri, lista.
  """

// ─── Header ──────────────────────────────────────────────────────────────────

* alertInformation.alertInformationHeader 1..1 BackboneElement "Dokumenthuvud (PatientSummaryHeader)" """
    Innehåller basinformation om dokumentet (PatientSummaryHeaderType).
    OBS: documentTitle, documentTime, nullified och nullifiedReason är N/A (0..0) för detta TK.
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

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode 0..1 CodeableConcept "Befattning (CVType)" """
    Information om personens befattning. KV Befattning (OID 1.2.752.129.2.2.1.4).
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

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom 0..1 string "Telefon till organisationsenhet" """
    Telefon till organisationsenhet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail 0..1 string "Epost till organisationsenhet" """
    Epost till organisationsenhet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress 0..1 string "Postadress för organisationsenhet" """
    Postadress för organisationsenhet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation 0..1 string "Fysisk plats för organisationsenhet" """
    Text som anger namn på plats eller ort för organisationens fysiska placering.
    Kardinalitet: Valfri.
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

// ─── Body ────────────────────────────────────────────────────────────────────

* alertInformation.alertInformationBody 1..1 BackboneElement "Uppmärksamhetsinformationens innehåll (AlertInformationBodyType)" """
    AlertInformationBodyType — uppmärksamhetsinformationens informationsinnehåll.
    Exakt en av hypersensitivity, seriousDisease, treatment, communicableDisease,
    restrictionOfCare, unstructuredAlertInformation ska anges (XOR).
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.typeOfAlertInformation 1..1 CodeableConcept "Typ av uppmärksamhetssignal (CVType)" """
    Kod som anger vilken typ av uppmärksamhetssignal som avses.
    Bör tas från KV Uppmärksamhetstyp eller KV Informationstyp (OID 1.2.752.129.2.2.2.1).
    OID för KV Uppmärksamhetstyp saknas – använd KV Informationstyp som fallback.
    Kardinalitet: Obligatorisk.
    Regel 2 (NPÖ): För att uppmärksamhetssignaler ska skickas till NPÖ måste en av följande
    KV Informationstyp-koder anges: upp-ube, upp-ube-beh, upp-ube-lbe, upp-ube-kod, upp-uas,
    upp-uas-sjd, upp-vbe, upp-vbe-vbe, upp-arb, upp-arb-smf, upp-arb-smf-vag, upp-arb-smf-sjd,
    upp-est, upp-est-rub, upp-est-inh. Alternativt KV Uppmärksamhetstyp-koder: Överkänslighet,
    Allvarlig sjukdom, Allvarlig behandling, Smittsam sjukdom, Vårdbegränsning,
    Historisk varningsinformation.
  """

* alertInformation.alertInformationBody.ascertainedDate 0..1 date "Datum för konstaterande" """
    Datum då förhållandet som föranledde uppmärksamhetssignalen konstaterades.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.verifiedTime 0..1 dateTime "Tidpunkt för verifiering" """
    Tidpunkt då uppmärksamhetssignalen verifierades i det lokala systemet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.validityTimePeriod 1..1 BackboneElement "Giltighetstid" """
    Tidsintervallet inom vilket uppmärksamhetssignalen är giltig.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.validityTimePeriod.start 1..1 dateTime "Startdatum för giltighet" """
    Startdatum/tidpunkt för giltighetstiden. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.validityTimePeriod.end 0..1 dateTime "Slutdatum för giltighet" """
    Slutdatum/tidpunkt för giltighetstiden. Format: YYYYMMDDhhmmss.
    Anges när man bedömer att uppmärksamhetssignalen har en känd sluttidpunkt.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.alertInformationComment 0..1 string "Kommentar" """
    Kommentar av ansvarig hälso- och sjukvårdspersonal angående uppmärksamhetssignalen.
    Vid läkemedelsöverkänslighet kan kommentaren avse anamnes, reaktionsbeskrivning, möjliga agens.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.obsoleteTime 0..1 dateTime "Tidpunkt för inaktivering" """
    Tidpunkt då uppmärksamhetssignalen registrerades som inaktuell i det lokala systemet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.obsoleteComment 0..1 string "Kommentar till inaktivering" """
    Information om varför uppmärksamhetssignalen gjorts inaktuell.
    Kardinalitet: Valfri.
  """

// ─── Body – XOR: hypersensitivity ──────────────────────────────────────────

* alertInformation.alertInformationBody.hypersensitivity 0..1 BackboneElement "Överkänslighet (HyperSensitivityType)" """
    XOR med seriousDisease, treatment, communicableDisease, restrictionOfCare, unstructuredAlertInformation.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.typeOfHypersensitivity 0..1 CodeableConcept "Typ av överkänslighet (CVType)" """
    Precisering av överkänslighetstyp (ICD10/SNOMED).
    T.ex. läkemedelsöverkänslighet, överkänslighet mot födoämne, djur, växt eller kemikalie.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.degreeOfSeverity 0..1 CodeableConcept "Allvarlighetsgrad (CVType)" """
    Bedömning av överkänslighetens allvarlighet. KV Allvarlighetsgrad (1.2.752.129.2.2.3.3).
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.degreeOfCertainty 0..1 CodeableConcept "Visshet (CVType)" """
    Visshetsgrad för överkänsligheten. KV Visshetsgrad (1.2.752.129.2.2.3.11).
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity 0..1 BackboneElement "Läkemedelsöverkänslighet (PharmaceuticalHypersensitivityType)" """
    Mer detaljerad information om läkemedelsöverkänslighet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.atcSubstance 0..1 CodeableConcept "ATC-substans (CVType)" """
    Substans eller grupp av substanser som kan orsaka överkänslighetsreaktion.
    ATC-kod på minst treställig nivå ska anges vid livshotande/skadande allvarlighetsgrad.
    OID: 1.2.752.129.2.2.3.1.1.
    Kardinalitet: Valfri (villkorlig, se TKB).
    CVType-begränsningar (TKB): codeSystem är fast 1.2.752.129.2.2.3.1.1 (ATC).
    codeSystemName, codeSystemVersion och originalText är 0..0 (får ej anges).
    code och displayName är 1..1 (obligatoriska) när atcSubstance anges.
  """

* alertInformation.alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.nonATCSubstance 0..1 string "Substans utan ATC-kod" """
    Benämning på aktiv substans utan ATC-kod.
    Ska anges om atcSubstance saknas.
    Kardinalitet: Valfri.
    Villkor (TKB): nonATCSubstance och nonATCSubstanceComment ska BÅDA anges om atcSubstance saknas.
  """

* alertInformation.alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.nonATCSubstanceComment 0..1 string "Kommentar till avsaknad ATC-kod" """
    Förklaring till varför ATC-kod inte används.
    Ska anges om atcSubstance saknas.
    Kardinalitet: Valfri.
    Villkor (TKB): Ska anges om atcSubstance saknas (tillsammans med nonATCSubstance).
  """

* alertInformation.alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.pharmaceuticalProductId 0..* CodeableConcept "Läkemedelsprodukt-id (CVType)" """
    Identifierare för läkemedelsprodukt som kan orsaka överkänslighet. NPL-id (1.2.752.129.2.1.5.1).
    Kardinalitet: Valfri, lista.
  """

* alertInformation.alertInformationBody.hypersensitivity.otherHypersensitivity 0..1 BackboneElement "Annan överkänslighet (OtherHypersensitivityType)" """
    Mer detaljerad information om överkänslighet som ej är läkemedelsöverkänslighet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.otherHypersensitivity.hypersensitivityAgent 0..1 string "Agens" """
    Text som beskriver det agens som bedöms kunna orsaka överkänslighetsreaktion.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.hypersensitivity.otherHypersensitivity.hypersensitivityAgentCode 0..1 CodeableConcept "Agenskod (CVType)" """
    Kod för det agens som bedöms kunna orsaka överkänslighetsreaktion.
    T.ex. LMK-kod (foderkänslighet) eller CAS-kod (kemikalie).
    Kardinalitet: Valfri.
  """

// ─── Body – XOR: seriousDisease ─────────────────────────────────────────────

* alertInformation.alertInformationBody.seriousDisease 0..1 BackboneElement "Allvarlig sjukdom (SeriousDiseaseType)" """
    XOR med hypersensitivity, treatment, communicableDisease, restrictionOfCare, unstructuredAlertInformation.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.seriousDisease.disease 1..1 CodeableConcept "Sjukdomskod (CVType)" """
    Allvarlig sjukdom som patienten har. ICD10/SNOMED rekommenderas.
    Kardinalitet: Obligatorisk.
  """

// ─── Body – XOR: treatment ──────────────────────────────────────────────────

* alertInformation.alertInformationBody.treatment 0..1 BackboneElement "Behandling (TreatmentType)" """
    XOR med hypersensitivity, seriousDisease, communicableDisease, restrictionOfCare, unstructuredAlertInformation.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.treatment.treatmentDescription 1..1 string "Behandlingsbeskrivning" """
    Beskrivning av allvarlig behandling som patienten genomgår.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.treatment.treatmentCode 0..1 CodeableConcept "Behandlingskod (CVType)" """
    Preciserad uppgift om behandlingen. KVÅ-kod (1.2.752.116.1.3.2.1.4) rekommenderas.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.treatment.pharmaceuticalTreatment 0..* CodeableConcept "Läkemedel vid behandling (CVType)" """
    Läkemedel som används vid uppmärksammad behandling. ATC-kod (1.2.752.129.2.2.3.1.1) rekommenderas.
    Kardinalitet: Valfri, lista.
  """

// ─── Body – XOR: communicableDisease ─────────────────────────────────────────

* alertInformation.alertInformationBody.communicableDisease 0..1 BackboneElement "Smittsam sjukdom (CommunicableDiseaseType)" """
    XOR med hypersensitivity, seriousDisease, treatment, restrictionOfCare, unstructuredAlertInformation.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.communicableDisease.communicableDiseaseCode 1..1 CodeableConcept "Smittsam sjukdomskod (CVType)" """
    Kod för smittsam sjukdom. ICD10 rekommenderas.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.communicableDisease.routeOfTransmission 0..1 CodeableConcept "Smittväg (CVType)" """
    Kod för hur sjukdomen smittar. KV Smittväg.
    Kardinalitet: Valfri.
  """

// ─── Body – XOR: restrictionOfCare ───────────────────────────────────────────

* alertInformation.alertInformationBody.restrictionOfCare 0..1 BackboneElement "Vårdbegränsning (RestrictionOfCareType)" """
    XOR med hypersensitivity, seriousDisease, treatment, communicableDisease, unstructuredAlertInformation.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.restrictionOfCare.restrictionOfCareComment 1..1 string "Kommentar om vårdbegränsning" """
    Information om uppmärksammat förhållande som inte avser överkänslighet, sjukdom eller behandling.
    Kardinalitet: Obligatorisk.
  """

// ─── Body – XOR: unstructuredAlertInformation ────────────────────────────────

* alertInformation.alertInformationBody.unstructuredAlertInformation 0..1 BackboneElement "Historisk varning (UnstructuredAlertInformationType)" """
    XOR med hypersensitivity, seriousDisease, treatment, communicableDisease, restrictionOfCare.
    Används för tidigare varningsinformation som inte följer NPÖ-strukturen.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.unstructuredAlertInformation.unstructuredAlertInformationHeading 1..1 string "Rubrik för historisk varning" """
    Beskrivande rubrik för tidigare utfärdad varning.
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.unstructuredAlertInformation.unstructuredAlertInformationContent 1..1 string "Innehåll för historisk varning" """
    Beskrivning av vad varningen gäller samt viss administrativ information.
    Kardinalitet: Obligatorisk.
  """

// ─── Body – relaterade uppmärksamhetssignaler ────────────────────────────────

* alertInformation.alertInformationBody.relatedAlertInformation 0..* BackboneElement "Relaterad uppmärksamhetssignal (RelatedAlertInformationType)" """
    Information om samband med andra uppmärksamhetssignaler.
    Kardinalitet: Valfri, lista.
  """

* alertInformation.alertInformationBody.relatedAlertInformation.typeOfAlertInformationRelationship 1..1 CodeableConcept "Typ av samband (CVType)" """
    Typ av samband. KV Samband (1.2.752.129.2.2.2.4).
    Kardinalitet: Obligatorisk.
  """

* alertInformation.alertInformationBody.relatedAlertInformation.relationComment 0..1 string "Kommentar till samband" """
    Kommentar till det aktuella sambandet.
    Kardinalitet: Valfri.
  """

* alertInformation.alertInformationBody.relatedAlertInformation.documentId 1..* string "Relaterad dokumentidentitet" """
    Lokalt unik identitet för relaterad uppmärksamhetssignal.
    Kardinalitet: Obligatorisk, lista (minst en).
  """

// ─── Teknisk respons ─────────────────────────────────────────────────────────

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

* result.subcode 0..1 string "Subkod" """
    Inga subkoder specificerade.
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
