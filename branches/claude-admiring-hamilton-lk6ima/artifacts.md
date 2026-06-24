# Artifacts Summary - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [GetAccessLogForPatient](StructureDefinition-inera-ehds-lm-access-log.md) | Logisk modell för patientens åtkomstloggar hämtad via GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Krävs för 1177 Journal 1.1, 2.0 men ej för NPÖ. |
| [GetAlertInformation](StructureDefinition-inera-ehds-lm-alert-information.md) | Logisk modell för tjänstekontraktet GetAlertInformation (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetAlertInformationResponder:2). Representerar responsens informationsstruktur: uppmärksamhetsinformation för en patient, exempelvis överkänslighet mot läkemedel, allvarlig sjukdom, behandling, smittsam sjukdom, vårdbegränsning eller historisk varning.Body-strukturen är XOR – exakt en av hypersensitivity, seriousDisease, treatment, communicableDisease, restrictionOfCare, unstructuredAlertInformation ska anges per post. |
| [GetCareContacts](StructureDefinition-inera-ehds-lm-care-contacts.md) | Logisk modell för tjänstekontraktet GetCareContacts (RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCareContacts:3). Representerar responsens informationsstruktur (GetCareContactsResponseType). En lista med CareContactType returneras. |
| [GetCareDocumentation](StructureDefinition-inera-ehds-lm-care-documentation.md) | Logisk modell för tjänstekontraktet GetCareDocumentation (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetCareDocumentationResponder:3). Representerar responsens informationsstruktur: journalanteckningar för en patient. Anteckningstyper: utredning, åtgärd/behandling, sammanfattning, samordning, inskrivning, slutanteckning, anteckning utan fysiskt möte, slutenvårdsanteckning och besöksanteckning. Meddelandeformatet är kompatibelt med HL7 v3 CDA v2. |
| [GetCarePlans](StructureDefinition-inera-ehds-lm-care-plans.md) | Logisk modell för tjänstekontraktet GetCarePlans (RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCarePlans:2). Representerar responsens informationsstruktur (GetCarePlansResponseType). En lista med CarePlanType returneras, var och en med header- och body-element. |
| [GetDiagnosis](StructureDefinition-inera-ehds-lm-diagnosis.md) | Logisk modell för tjänstekontraktet GetDiagnosis (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetDiagnosisResponder:2). Representerar responsens informationsstruktur: registrerade diagnoser för en patient inklusive diagnoskod per ursprungligt diagnosticeringstillfälle. |
| [GetFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.md) | Logisk modell för tjänstekontraktet GetFunctionalStatus (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2). Representerar responsens informationsstruktur: dokumenterade bedömningar av funktionsnedsättningar och/eller aktivitetsförmåga (PADL) för en patient. Bedömningskategori styrs av assessmentCategory: 'pad-pad' (PADL) eller 'fun-fun' (funktionsnedsättning). En tjänsteproducent måste använda samma värde för categorization i engagemangsindex som för assessmentCategory i svaret. |
| [GetImagingOutcome](StructureDefinition-inera-ehds-lm-imaging-outcome.md) | Logisk modell för tjänstekontraktet GetImagingOutcome (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetImagingOutcome:1). Representerar responsens informationsstruktur — bilddiagnostiska resultat för en patient. Baseras på NPÖ RIV 2.2.0-specifikation. |
| [GetLaboratoryOrderOutcome](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.md) | Logisk modell för tjänstekontraktet GetLaboratoryOrderOutcome (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetLaboratoryOrderOutcome:4). Representerar responsens informationsstruktur — multidisciplinära laboratoriesvar för en patient. |
| [GetMaternityMedicalHistory](StructureDefinition-inera-ehds-lm-maternity-medical-history.md) | Logisk modell för tjänstekontraktet GetMaternityMedicalHistory (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetMaternityMedicalHistory:2). Representerar responsens informationsstruktur — mödravårdsjournal för en patient. |
| [GetMedicationHistory](StructureDefinition-inera-ehds-lm-medication-history.md) | Logisk modell för tjänstekontraktet GetMedicationHistory (RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetMedicationHistoryResponder:2). Representerar responsens informationsstruktur — läkemedelshistorik per patient.OBS: Kontraktet är tämligen omfattande. Se tillämpningsanvisningen (AB_clinicalprocess_activityprescription_actoutcome.docx) för implementationsdetaljer. |
| [GetObservations](StructureDefinition-inera-ehds-lm-observations.md) | Logisk modell för tjänstekontraktet GetObservations (RIV-TA urn:riv:clinicalprocess:healthcond:basic:GetObservationsInteraction:2). Representerar responsens informationsstruktur — en samling observationer som matchar sökkriterier i begäran, inklusive header-information. Meddelandemodellen från avsnitt 5.1 V-MIM — Observationer i TKB motsvarar en observation i svarsmeddelandet. |
| [GetReferralOutcome](StructureDefinition-inera-ehds-lm-referral-outcome.md) | Logisk modell för tjänstekontraktet GetReferralOutcome (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetReferralOutcome:3). Representerar responsens informationsstruktur — svar på konsultationsremiss och begäran om övertagande av vårdansvar. Meddelandeformatet är kompatibelt med HL7v3 CDA v.2. |
| [GetRequestActivities](StructureDefinition-inera-ehds-lm-request-activities.md) | Logisk modell för remisstatus och processaktiviteter hämtad via GetRequestActivities (crm:requeststatus v2.0). |
| [GetVaccinationHistory](StructureDefinition-inera-ehds-lm-vaccination-history.md) | Logisk modell för tjänstekontraktet GetVaccinationHistory (RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetVaccinationHistoryResponder:2). Representerar responsens informationsstruktur — vaccinationsjournal per patient. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation)](StructureDefinition-inera-ehds-allergy-intolerance.md) | Sekundär profil för allergier och överkänslighet från GetAlertInformation.Skapas ENBART när alertInformationBody = hypersensitivity. Den tillhörande IneraEHDSFlag-resursen är alltid primär och pekar på denna resurs via Flag.extension[flag-detail] (standard R4-extension; R5: supportingInfo).Populeras med klinisk information från hypersensitivity-blocket:* atcSubstance/hypersensitivityAgentCode → AllergyIntolerance.code
* degreeOfSeverity → AllergyIntolerance.reaction.severity
* degreeOfCertainty → AllergyIntolerance.verificationStatus (se ALERT-004)
* ascertainedDate → AllergyIntolerance.onsetDateTime
* alertInformationComment → AllergyIntolerance.note
* pharmaceuticalProductId → AllergyIntolerance.reaction.substance.coding (NPL-id)
Täcker NPÖ 2.0 och 1177 Journal 2.0. |
| [SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient)](StructureDefinition-inera-ehds-audit-event.md) | Profil för åtkomstloggar mappat från RIVTA-tjänstekontraktet GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Täcker 1177 Journal 1.1, 2.0. Krävs ej för NPÖ. |
| [SE EHDS CarePlan – Vårdplan (GetCarePlans)](StructureDefinition-inera-ehds-care-plan.md) | Profil för vård- och omsorgsplaner mappat från RIVTA-tjänstekontraktet GetCarePlans (clinicalprocess:logistics:logistics v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0. |
| [SE EHDS Condition – Diagnos (GetDiagnosis)](StructureDefinition-inera-ehds-condition-diagnosis.md) | Profil för diagnos/problem mappat från RIVTA-tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0. |
| [SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)](StructureDefinition-inera-ehds-condition-functional.md) | Profil för funktionstillstånd och ADL-bedömningar mappat från RIVTA-tjänstekontraktet GetFunctionalStatus (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0.TKBn har två bedömningskategorier: 'pad-pad' (PADL-bedömning) och 'fun-fun' (funktionsnedsättningsbedömning med ICF-kod). Condition.code mappas mot assessmentCategory (för PADL) eller disability.disabilityAssessment (ICF-kod). Inget statusfält, tidperiod eller svårighetsgradfält finns i TKBn – dessa är härleddda. |
| [SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord)](StructureDefinition-inera-ehds-device.md) | Profil för det källsystem som registrerat en vaccination i GetVaccinationHistory v2.0.Representerar vaccinationMedicalRecordBody.registrationRecord.sourceSystem* och sourceSystemContact. Refereras från IneraEHDSImmunization via extension[registrationDevice].deviceName[systemName] = sourceSystemName (1..1, obligatorisk) deviceName[productName] = sourceSystemProductName (0..1) version = sourceSystemProductVersion (0..1) extension[sourceSystemContact] = sourceSystemContact.actorId/actorName (0..1) |
| [SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)](StructureDefinition-inera-ehds-diagnostic-report-imaging.md) | Profil för bilddiagnostiska utlåtanden/fynd från GetImagingOutcome. Används tillsammans med IneraEHDSImagingStudy för att representera både undersökning och svar. |
| [SE EHDS DiagnosticReport – Konsultationssvar (GetReferralOutcome)](StructureDefinition-inera-ehds-diagnostic-report-referral.md) | Profil för konsultationssvar (outcome) från GetReferralOutcome. Används tillsammans med IneraEHDSServiceRequestReferral. |
| [SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)](StructureDefinition-inera-ehds-diagnostic-report-lab.md) | Profil för laboratorieresultat mappat från RIVTA-tjänstekontraktet GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v4.2). Täcker NPÖ v4.2 och 1177 Journal v4.2. |
| [SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)](StructureDefinition-inera-ehds-document-reference.md) | Profil för vårdanteckningar mappat från RIVTA-tjänstekontraktet GetCareDocumentation (clinicalprocess:healthcond:description v3.0). Täcker NPÖ 3.0 och 1177 Journal 3.0.Använder JoL-header v2.2 (ej PatientSummaryHeader): accessControlHeader för PDL, record för journaluppgift-metadata, author för dokumentationsansvarig, signature för signeringsinformation. |
| [SE EHDS Encounter – Vårdkontakter (GetCareContacts)](StructureDefinition-inera-ehds-encounter.md) | Profil för vårdkontakter mappat från RIVTA-tjänstekontraktet GetCareContacts (clinicalprocess:logistics:logistics v3.0). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0. |
| [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md) | Primär profil för ALL uppmärksamhetsinformation från GetAlertInformation (clinicalprocess:healthcond:description v2.0).Varje alertInformation-post ger alltid en Flag-resurs. Om typeOfAlertInformation anger allergi/överkänslighet (body = hypersensitivity) skapas dessutom en IneraEHDSAllergyIntolerance-resurs som pekas ut via extension[flag-detail] (standard R4-extension; kallas supportingInfo i R5).Body-strukturen är XOR: exakt en av hypersensitivity, seriousDisease, treatment, communicableDisease, restrictionOfCare, unstructuredAlertInformation anges per post.Flag.category[alertType] = typeOfAlertInformation (obligatorisk). Flag.category[hypersensitivityType] = typeOfHypersensitivity (när body = hypersensitivity). Flag.code = den kliniska koden specifik för body-typen.Täcker NPÖ 2.0 och 1177 Journal 2.0. |
| [SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)](StructureDefinition-inera-ehds-imaging-study.md) | Profil för bilddiagnostiska undersökningar mappat från RIVTA-tjänstekontraktet GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0). Täcker NPÖ 1.0 och 1177 Journal 1.0. |
| [SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)](StructureDefinition-inera-ehds-immunization.md) | Profil för vaccinationer mappat från RIVTA-tjänstekontraktet GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0. |
| [SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)](StructureDefinition-inera-ehds-medication-statement.md) | Profil för läkemedelsordinationer, förskrivningar och administrerade läkemedel mappat från RIVTA-tjänstekontraktet GetMedicationHistory (clinicalprocess:activityprescription:actoutcome v2.2). Täcker NPÖ 2.2 och 1177 Journal 2.2. |
| [SE EHDS Observation Base – GetObservations](StructureDefinition-inera-ehds-observation-base.md) | Basprofil för alla observationer från GetObservations (clinicalprocess:healthcond:basic v2.0).Profilen fångar den generella TK-mappningen och används som förälder av domänspecifika profiler (t.ex. IneraEHDSObservationGrowth för tillväxtkurva).Nyckeldesignbeslut:* observationBody.observationValue är XOR-union av sju värdetyper (cv/pq/ivlpq/ts/ivlts/st/int). Varje gren mappas till respektive FHIR value[x]-variant.
* Om valueNegation=true utelämnas value[x] och dataAbsentReason sätts.
* observationBody.time (ts/ivlts) → effective[x]; registrationTime → issued.
* participation är polymorf (healthcareProfessional/patient/otherPerson/locationRole/resource/organisation). Välj FHIR-element per deltagartyp (se mappningssida).
* PDL-fält (Sparr) hanteras via Provenance och meta.security (se mappningssida).
Täcker NPÖ 1.2 och 1177 Journal 1.2. |
| [SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome)](StructureDefinition-inera-ehds-observation-lab.md) | Profil för enskilda laboratorieresultat/analyser mappat från GetLaboratoryOrderOutcome. Används i kombination med IneraEHDSDiagnosticReportLab. |
| [SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)](StructureDefinition-inera-ehds-observation-maternity.md) | Generisk profil för medicinsk historik inom mödravård mappat från RIVTA-tjänstekontraktet GetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0.OBS: TKBn har tre separata sektioner (registrationRecord, pregnancyCheckupRecord, postDeliveryRecord) med egna sektionsspecifika fält. En Observation skapas per sektion med Observation.code som diskriminator (se MAT-001 i mapping-issues). Fältnamnen i ^short nedan refererar till sektionsspecifika element – implementatören väljer rätt sektionselement baserat på Observation.code. |
| [SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)](StructureDefinition-inera-ehds-observation-growth.md) | Profil för tillväxtobservationer (längd, vikt, huvudomfång, beräknad graviditetslängd) för barn och ungdom, baserad på:* GetObservations (clinicalprocess:healthcond:basic v2.0)
* Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15)
Ärver IneraEHDSObservationBase och lägger till:* code bunden till GrowthObservationTypeVS (IoÖ-specificerade SNOMED CT-koder)
* value[x] begränsad till Quantity (pq-grenen; IoÖ anger alltid PQ-värden)
* Enhet (UCUM) per mättyp: cm (längd/hC), kg (vikt), d (gestationslängd)
* LOINC-kod-slice på code.coding för EHDS/EPS-interoperabilitet
* category = vital-signs
Kodsystem för observationType.type: SNOMED CT SE, OID 1.2.752.116.2.1.1.Täcker NPÖ 1.2 och 1177 Journal 1.2. |
| [SE EHDS Organization – Organisationsenhet](StructureDefinition-inera-ehds-organization.md) | Profil för organisationsenheter i EHDS-TK-mappningar (vårdenheter, juridiska vårdgivare m.fl.).Identifier-slicen ger stöd för HSA-id och SMI-id (Folkhälsomyndighetens id för vaccinationsenheter i det nationella vaccinationsregistret). Namn, kontaktuppgifter och adress mappar fält som annars inte har plats i resurserna de refereras ifrån. |
| [SE EHDS Patient](StructureDefinition-inera-ehds-patient.md) | Patientprofil för EHDS-TK IG. Ärver från IPS Patient och lägger till svenska identifierarslicar. |
| [SE EHDS Provenance](StructureDefinition-inera-ehds-provenance.md) | Provenance-profil för EHDS-TK. Varje klinisk resurs åtföljs av en Provenance med två agenter som speglar spärr-hierarkin enligt PDL:* custodian (yttre Sparr) — den juridiskt ansvariga vårdgivaren
* author (inre Sparr) — den informationsägande vårdenheten
OBS: Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering baserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver Provenance-agenterna för spärr och `meta.security` för `approvedForPatient` inte inkluderas i svaret — filtreringen sker då redan på servernivå. |
| [SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome)](StructureDefinition-inera-ehds-service-request-referral.md) | Profil för konsultationsremisser mappat från RIVTA-tjänstekontraktet GetReferralOutcome (clinicalprocess:healthcond:actoutcome v3.2). Täcker NPÖ 3.2 och 1177 Journal 3.2.Notera: GetReferralOutcome returnerar remissvaret, inte remissen i sig. Remissens metadata finns under referralOutcomeBody.referral och är begränsad till id, orsak, tid och avsändare. Inget mottagarfält, prioritet, typ eller diagnos finns i TKBn för remissens del. |
| [SE EHDS Task – Remisstatus (GetRequestActivities)](StructureDefinition-inera-ehds-task.md) | Profil för remisstatus och processaktiviteter mappat från RIVTA-tjänstekontraktet GetRequestActivities (crm:requeststatus v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Allvarlighetsgrad för överkänslighet](StructureDefinition-alert-degree-of-severity.md) | Bedömning av överkänslighetens allvarlighetsgrad (alertInformationBody.hypersensitivity.degreeOfSeverity). KV Allvarlighetsgrad 1.2.752.129.2.2.3.3. |
| [Behandlingsbeskrivning](StructureDefinition-alert-treatment-description.md) | Beskrivning av allvarlig behandling som patienten genomgår (alertInformationBody.treatment.treatmentDescription). Behandlingskod läggs i Flag.code. |
| [Datum för konstaterande](StructureDefinition-alert-ascertained-date.md) | Datum då förhållandet som föranledde uppmärksamhetssignalen konstaterades (alertInformationBody.ascertainedDate). |
| [Fullständig dos administrerad](StructureDefinition-immunization-is-dose-complete.md) | Anger om hela den ordinerade dosen administrerades (administrationRecord.isDoseComplete). |
| [Godkänd för patient](StructureDefinition-approved-for-patient.md) | Anger om information är godkänd för delning med patient (approvedForPatient, Regel 3). |
| [Juridisk äkthetsintygsgivare för uppmärksamhetssignal](StructureDefinition-alert-asserter.md) | HSA-id för juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId). |
| [Juridisk äkthetsintygsgivare för vaccination](StructureDefinition-immunization-legal-authenticator.md) | Signeringstidpunkt och HSA-id för juridisk äkthetsintygsgivare (vaccinationMedicalRecordHeader.legalAuthenticator). |
| [Kommentar om vårdbegränsning](StructureDefinition-alert-restriction-of-care-comment.md) | Information om uppmärksammat förhållande som inte avser överkänslighet, sjukdom eller behandling (alertInformationBody.restrictionOfCare.restrictionOfCareComment). |
| [Kommentar till uppmärksamhetssignal](StructureDefinition-alert-information-comment.md) | Kommentar angående uppmärksamhetssignalen (alertInformationBody.alertInformationComment). Om obsoleteComment är angivet konkateneras det med prefix 'Inaktiveringskommentar: {obsoleteComment}'. För body = unstructuredAlertInformation: unstructuredAlertInformationContent läggs här. |
| [Källsystem för vaccinationsregistrering](StructureDefinition-immunization-registration-device.md) | Referens till den Device-resurs som beskriver källsystemet varifrån vaccinationsregistreringen härstammar (registrationRecord.sourceSystemName/productName/productVersion/sourceSystemContact). |
| [Källsystemskontakt](StructureDefinition-device-source-system-contact.md) | Ansvarig kontaktperson för källsystemet (registrationRecord.sourceSystemContact.actorId/actorName). |
| [Läkemedel vid behandling](StructureDefinition-alert-pharmaceutical-treatment.md) | Läkemedel som används vid uppmärksammad behandling, ATC-kod rekommenderas (alertInformationBody.treatment.pharmaceuticalTreatment). Lista med 0..* – ryms ej i Flag.code (1..1). |
| [Läkemedelsöverkänslighet – substansdetaljer](StructureDefinition-alert-pharmaceutical-hypersensitivity.md) | Kompletterande substansdetaljer för läkemedelsöverkänslighet (alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity). Primär substans: atcSubstance → Flag.code.coding; nonATCSubstance → Flag.code.text. Denna extension bär kvarvarande detaljer: nonATCSubstanceComment och pharmaceuticalProductId. |
| [Patientens postnummer vid vaccination](StructureDefinition-immunization-patient-postal-code.md) | Patientens postnummer vid vaccinationstillfället (registrationRecord.patientPostalCode). |
| [Relaterad uppmärksamhetssignal](StructureDefinition-related-alert-information.md) | Information om samband med andra uppmärksamhetssignaler (alertInformationBody.relatedAlertInformation). |
| [Signeringstidpunkt för uppmärksamhetssignal](StructureDefinition-alert-asserted-date.md) | Tidpunkt för signering av uppmärksamhetsinformation (alertInformationHeader.legalAuthenticator.signatureTime). |
| [Smittväg](StructureDefinition-alert-route-of-transmission.md) | Kod för hur sjukdomen smittar (alertInformationBody.communicableDisease.routeOfTransmission). KV Smittväg. |
| [Tidpunkt för verifiering](StructureDefinition-alert-verified-time.md) | Tidpunkt då uppmärksamhetssignalen verifierades i det lokala systemet (alertInformationBody.verifiedTime). |
| [Visshet för överkänslighet](StructureDefinition-alert-degree-of-certainty.md) | Visshetsgrad för överkänsligheten (alertInformationBody.hypersensitivity.degreeOfCertainty). KV Visshetsgrad 1.2.752.129.2.2.3.11. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [AssessmentCategory — ValueSet](ValueSet-assessmentcategory-vs.md) | Tillåtna värden för fältet assessmentCategory i GetFunctionalStatus. |
| [DeliveryCode — ValueSet](ValueSet-deliverycode-vs.md) | Tillåtna värden för förlossningssätt i GetMaternityMedicalHistory. |
| [DiagnosisType — ValueSet](ValueSet-diagnosistype-vs.md) | Tillåtna värden för fältet typeOfDiagnosis i GetDiagnosis. |
| [ErrorCode — ValueSet](ValueSet-errorcode-vs.md) | Tillåtna värden för errorCode i svar. |
| [ExaminationStatusCode — ValueSet](ValueSet-examinationstatuscode-vs.md) | Tillåtna värden för examinationStatus i GetImagingOutcome. |
| [FetalPositionCode — ValueSet](ValueSet-fetalpositioncode-vs.md) | Tillåtna värden för fosterläge i GetMaternityMedicalHistory. |
| [KV Anteckningstyp — ValueSet](ValueSet-clinicaldocumentnotecode-vs.md) | Tillåtna värden för fältet clinicalDocumentNoteCode i GetCareDocumentation enligt KV Anteckningstyp (OID: 1.2.752.129.2.2.2.11). |
| [PrescriptionStatus — ValueSet](ValueSet-prescriptionstatus-vs.md) | Tillåtna värden för prescriptionStatus i GetMedicationHistory. |
| [ReferralOutcomeTypeCode — ValueSet](ValueSet-referraloutcometypecode-vs.md) | Tillåtna värden för referralOutcomeTypeCode i GetReferralOutcome. |
| [ResultCode — ValueSet](ValueSet-resultcode-vs.md) | Tillåtna värden för resultCode i svar. |
| [SE Observation Status (SNOMED CT urval 56431000052106)](ValueSet-se-observation-status-vs.md) | Tillåtna statusvärden för GetObservations observationStatus. Urvals-id 56431000052106, SNOMED CT SE (OID 1.2.752.116.2.1.1). Mappning till FHIR ObservationStatus via ConceptMap observation-status-map. |
| [SexCode — ValueSet](ValueSet-sexcode-vs.md) | Tillåtna värden för kön i GetMaternityMedicalHistory. |
| [Tillväxtkurva – observationstyper (IoÖ Tillväxtkurva v3)](ValueSet-growth-observation-type-vs.md) | SNOMED CT-koder för tillväxtmätningar enligt Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15).Alla koder från kodsystemet SNOMED CT SE (OID 1.2.752.116.2.1.1).Koder:*  

| | | |
| :--- | :--- | :--- |
| 1153637007 | Kroppslängd | (primärkod för längd) |

 
*  

| | | |
| :--- | :--- | :--- |
| 50373000 | Mått på kroppslängd | (alternativkod för längd) |

 
*  

| | | |
| :--- | :--- | :--- |
| 248334005 | Längd i liggande | (bakåtkompatibel – ej för nyanslutning) |

 
*  

| | |
| :--- | :--- |
| 27113001 | Kroppsvikt |

 
*  

| | |
| :--- | :--- |
| 363812007 | Huvudomfång |

 
*  

| | |
| :--- | :--- |
| 412726003 | Graviditetslängd vid födelse |

 
 |
| [TypeOfCarePlan — ValueSet](ValueSet-typeofcareplan-vs.md) | Tillåtna värden för typeOfCarePlan i GetCarePlans enligt clinicalprocess:logistics:logistics. |
| [TypeOfLeaveCode — ValueSet](ValueSet-typeofleavecode-vs.md) | Tillåtna värden för typ av ledighet i GetMaternityMedicalHistory. |
| [TypeOfPrescription — ValueSet](ValueSet-typeofprescription-vs.md) | Tillåtna värden för typeOfPrescription i GetMedicationHistory. |
| [TypeOfResultCode — ValueSet](ValueSet-typeofresultcode-vs.md) | Tillåtna värden för typeOfResult i GetImagingOutcome. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [AssessmentCategory](CodeSystem-assessmentcategory-cs.md) | Bedömningskategori för funktionsstatus. Tillåtna värden är 'pad-pad' (PADL-bedömning) och 'fun-fun' (funktionsnedsättningsbedömning). Definierat i enum XSD v2.1 för domänen. |
| [DeliveryCode](CodeSystem-deliverycode-cs.md) | Kodverk för förlossningssätt (DeliveryCodeEnum). Används i GetMaternityMedicalHistory. |
| [DiagnosisType](CodeSystem-diagnosistype-cs.md) | Kodverk för typ av diagnos (huvud- respektive bidiagnos). Definierat i XSD för domänen. |
| [ErrorCode](CodeSystem-errorcode-cs.md) | Kodverk för felkoder i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome. |
| [ExaminationStatusCode](CodeSystem-examinationstatuscode-cs.md) | Kodverk för undersökningsstatus (ExaminationStatusCodeEnum). Används i GetImagingOutcome. |
| [FetalPositionCode](CodeSystem-fetalpositioncode-cs.md) | Kodverk för fosterläge (FetalPositionCodeEnum). Används i GetMaternityMedicalHistory. |
| [KV Anteckningstyp](CodeSystem-clinicaldocumentnotecode-cs.md) | Kodverk för typ av journalanteckning enligt KV Anteckningstyp. OID: 1.2.752.129.2.2.2.11. |
| [MaternityMedicalSection](CodeSystem-maternity-section.md) | Diskriminatorkoder för de tre sektionerna i mödravårdsjournalen (GetMaternityMedicalHistory v2.0). Varje Observation-resurs som skapas ur ett maternityMedicalRecord sätter Observation.code till en av dessa koder. |
| [NonReplaceable](CodeSystem-nonreplaceable-cs.md) | Kodverk för aktör som har angett att ett läkemedel inte är utbytbart i GetMedicationHistory (DispensationAuthorizationType). |
| [PrescriptionStatus](CodeSystem-prescriptionstatus-cs.md) | Kodverk för ordinationsstatus i GetMedicationHistory. Anger om en ordination är aktiv eller inaktiv. |
| [ReferralOutcomeTypeCode](CodeSystem-referraloutcometypecode-cs.md) | Kodverk för typ av remissvar (ReferralOutcomeTypeCodeEnum). Används i GetReferralOutcome. |
| [ResultCode](CodeSystem-resultcode-cs.md) | Kodverk för resultatkod i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome. |
| [SexCode](CodeSystem-sexcode-cs.md) | Kodverk för kön (SexCodeEnum). Används i GetMaternityMedicalHistory för barnets kön. OBS: Överväg att använda HL7 AdministrativeGender istället. |
| [TypeOfCarePlan](CodeSystem-typeofcareplan-cs.md) | Typ av vård- och omsorgsplan enligt clinicalprocess:logistics:logistics v3.0. Definierad i clinicalprocess_logistics_logistics_enum_3.0.xsd. |
| [TypeOfLeaveCode](CodeSystem-typeofleavecode-cs.md) | Kodverk för typ av ledighet (TypeOfLeaveCodeEnum). Används i GetMaternityMedicalHistory. |
| [TypeOfPrescription](CodeSystem-typeofprescription-cs.md) | Kodverk för ordinationstyp i GetMedicationHistory. Anger om en ordination är en insättnings- eller utsättningsordination. |
| [TypeOfResultCode](CodeSystem-typeofresultcode-cs.md) | Kodverk för typ av resultat (TypeOfResultCodeEnum). Används i GetImagingOutcome och GetReferralOutcome. |

### Terminology: Concept Maps 

These define transformations to convert between codes by systems conforming with this implementation guide.

| | |
| :--- | :--- |
| [GetObservations – observationStatus (SNOMED CT) → FHIR ObservationStatus](ConceptMap-observation-status-map.md) | Mappning från RIVTA GetObservations observationStatus-koder (SNOMED CT, urvals-id 56431000052106) till FHIR R4 ObservationStatus (OBS-003).Kodsystem: SNOMED CT SE, OID 1.2.752.116.2.1.1 → URI http://snomed.info/sct. Om en okänd kod tas emot sätts status till 'unknown' och en OperationOutcome-varning genereras av bryggan. |

