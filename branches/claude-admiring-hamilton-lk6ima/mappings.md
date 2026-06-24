# Mappings - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Mappings**

## Mappings

# Mappings

Denna sida ger en översikt över hur RIVTA-tjänstekontraktens element mappas till FHIR-profiler i denna IG. Detaljerade mappningstabeller finns på respektive tjänstekontrakts sida.

-------

### Syfte

Mappningarna spårar varje element i de logiska modellerna till det FHIR-profil-element som bär informationen. Detta möjliggör verifiering av täckning och vägleder implementörer som behöver förstå relationen mellan kliniska krav och teknisk representation.

-------

### Översikt per tjänstekontrakt

| | | | |
| :--- | :--- | :--- | :--- |
| GetDiagnosis | [IneraEHDSLMDiagnosis](StructureDefinition-inera-ehds-lm-diagnosis.md) | [IneraEHDSConditionDiagnosis](StructureDefinition-inera-ehds-condition-diagnosis.md) | [mapping-getdiagnosis](mapping-getdiagnosis.md) |
| GetAlertInformation | [IneraEHDSLMAlertInformation](StructureDefinition-inera-ehds-lm-alert-information.md) | [IneraEHDSAllergyIntolerance](StructureDefinition-inera-ehds-allergy-intolerance.md)+[IneraEHDSFlag](StructureDefinition-inera-ehds-flag.md) | [mapping-getalertinformation](mapping-getalertinformation.md) |
| GetMedicationHistory | [IneraEHDSLMMedicationHistory](StructureDefinition-inera-ehds-lm-medication-history.md) | [IneraEHDSMedicationStatement](StructureDefinition-inera-ehds-medication-statement.md) | [mapping-getmedicationhistory](mapping-getmedicationhistory.md) |
| GetVaccinationHistory | [IneraEHDSLMVaccinationHistory](StructureDefinition-inera-ehds-lm-vaccination-history.md) | [IneraEHDSImmunization](StructureDefinition-inera-ehds-immunization.md) | [mapping-getvaccinationhistory](mapping-getvaccinationhistory.md) |
| GetFunctionalStatus | [IneraEHDSLMFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.md) | [IneraEHDSConditionFunctional](StructureDefinition-inera-ehds-condition-functional.md) | [mapping-getfunctionalstatus](mapping-getfunctionalstatus.md) |
| GetMaternityMedicalHistory | [IneraEHDSLMMaternityMedicalHistory](StructureDefinition-inera-ehds-lm-maternity-medical-history.md) | [IneraEHDSObservationMaternity](StructureDefinition-inera-ehds-observation-maternity.md) | [mapping-getmaternitymedicalhistory](mapping-getmaternitymedicalhistory.md) |
| GetCarePlans | [IneraEHDSLMCarePlans](StructureDefinition-inera-ehds-lm-care-plans.md) | [IneraEHDSCarePlan](StructureDefinition-inera-ehds-care-plan.md) | [mapping-getcareplans](mapping-getcareplans.md) |
| GetCareContacts | [IneraEHDSLMCareContacts](StructureDefinition-inera-ehds-lm-care-contacts.md) | [IneraEHDSEncounter](StructureDefinition-inera-ehds-encounter.md) | [mapping-getcarecontacts](mapping-getcarecontacts.md) |
| GetCareDocumentation | [IneraEHDSLMCareDocumentation](StructureDefinition-inera-ehds-lm-care-documentation.md) | [IneraEHDSDocumentReference](StructureDefinition-inera-ehds-document-reference.md) | [mapping-getcaredocumentation](mapping-getcaredocumentation.md) |
| GetLaboratoryOrderOutcome | [IneraEHDSLMLaboratoryOrderOutcome](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.md) | [IneraEHDSDiagnosticReportLab](StructureDefinition-inera-ehds-diagnostic-report-lab.md)+[IneraEHDSObservationLab](StructureDefinition-inera-ehds-observation-lab.md) | [mapping-getlaboratoryorderoutcome](mapping-getlaboratoryorderoutcome.md) |
| GetImagingOutcome | [IneraEHDSLMImagingOutcome](StructureDefinition-inera-ehds-lm-imaging-outcome.md) | [IneraEHDSImagingStudy](StructureDefinition-inera-ehds-imaging-study.md)+[IneraEHDSDiagnosticReportImaging](StructureDefinition-inera-ehds-diagnostic-report-imaging.md) | [mapping-getimagingoutcome](mapping-getimagingoutcome.md) |
| GetReferralOutcome | [IneraEHDSLMReferralOutcome](StructureDefinition-inera-ehds-lm-referral-outcome.md) | [IneraEHDSServiceRequestReferral](StructureDefinition-inera-ehds-service-request-referral.md)+[IneraEHDSDiagnosticReportReferral](StructureDefinition-inera-ehds-diagnostic-report-referral.md) | [mapping-getreferraloutcome](mapping-getreferraloutcome.md) |
| GetRequestActivities | [IneraEHDSLMRequestActivities](StructureDefinition-inera-ehds-lm-request-activities.md) | [IneraEHDSTask](StructureDefinition-inera-ehds-task.md) | [mapping-getrequestactivities](mapping-getrequestactivities.md) |
| GetObservations | [IneraEHDSLMObservations](StructureDefinition-inera-ehds-lm-observations.md) | [IneraEHDSObservationGrowth](StructureDefinition-inera-ehds-observation-growth.md) | [mapping-getobservations](mapping-getobservations.md) |
| GetAccessLogForPatient | [IneraEHDSLMAccessLog](StructureDefinition-inera-ehds-lm-access-log.md) | [IneraEHDSAuditEvent](StructureDefinition-inera-ehds-audit-event.md) | [mapping-getaccesslogforpatient](mapping-getaccesslogforpatient.md) |

-------

### Gemensamt headermönster

Alla tjänstekontrakt (utom GetAccessLogForPatient) delar ett headermönster som mappas på följande sätt:

| | | |
| :--- | :--- | :--- |
| `patientId` | `{Resurs}.subject.identifier` | OID→URI-konvertering krävs |
| `sourceSystemHSAId` | `{Resurs}.meta.source` | Format:`urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `documentTime` | `{Resurs}.recordedDate`(eller primär tidsstämpel) | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm) |
| `accountableHealthcareProfessional` | `{Resurs}.recorder`/`author`/`performer` | Logisk referens via HSA-id |
| `legalAuthenticator` | `{Resurs}.asserter`/`authenticator` | Logisk referens via HSA-id |
| `careProviderHSAId` | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `careUnitHSAId` | `Provenance.agent[author].who.identifier` | Inre Sparr |

> **OBS om server-side filtrering:** Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering baserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver Provenance-spärr-agenterna och `approvedForPatient`-säkerhetsmärkning (se PDL-001) inte inkluderas i svaret — filtreringen sker då redan på servernivå.

