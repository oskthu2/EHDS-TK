# Mappings

Denna sida ger en översikt över hur RIVTA-tjänstekontraktens element mappas till FHIR-profiler i denna IG. Detaljerade mappningstabeller finns på respektive tjänstekontrakts sida.

---

### Syfte

Mappningarna spårar varje element i de logiska modellerna till det FHIR-profil-element som bär informationen. Detta möjliggör verifiering av täckning och vägleder implementörer som behöver förstå relationen mellan kliniska krav och teknisk representation.

---

### Översikt per tjänstekontrakt

| Tjänstekontrakt | Logisk modell | FHIR-profil(er) | Mappningssida |
|---|---|---|---|
| GetDiagnosis | [SEEHDSLMDiagnosis](StructureDefinition-se-ehds-lm-diagnosis.html) | [SEEHDSConditionDiagnosis](StructureDefinition-se-ehds-condition-diagnosis.html) | [mapping-getdiagnosis](mapping-getdiagnosis.html) |
| GetAlertInformation | [SEEHDSLMAlertInformation](StructureDefinition-se-ehds-lm-alert-information.html) | [SEEHDSAllergyIntolerance](StructureDefinition-se-ehds-allergy-intolerance.html) + [SEEHDSFlag](StructureDefinition-se-ehds-flag.html) | [mapping-getalertinformation](mapping-getalertinformation.html) |
| GetMedicationHistory | [SEEHDSLMMedicationHistory](StructureDefinition-se-ehds-lm-medication-history.html) | [SEEHDSMedicationStatement](StructureDefinition-se-ehds-medication-statement.html) | [mapping-getmedicationhistory](mapping-getmedicationhistory.html) |
| GetVaccinationHistory | [SEEHDSLMVaccinationHistory](StructureDefinition-se-ehds-lm-vaccination-history.html) | [SEEHDSImmunization](StructureDefinition-se-ehds-immunization.html) | [mapping-getvaccinationhistory](mapping-getvaccinationhistory.html) |
| GetFunctionalStatus | [SEEHDSLMFunctionalStatus](StructureDefinition-se-ehds-lm-functional-status.html) | [SEEHDSConditionFunctional](StructureDefinition-se-ehds-condition-functional.html) | [mapping-getfunctionalstatus](mapping-getfunctionalstatus.html) |
| GetMaternityMedicalHistory | [SEEHDSLMMaternityMedicalHistory](StructureDefinition-se-ehds-lm-maternity-medical-history.html) | [SEEHDSObservationMaternity](StructureDefinition-se-ehds-observation-maternity.html) | [mapping-getmaternitymedicalhistory](mapping-getmaternitymedicalhistory.html) |
| GetCarePlans | [SEEHDSLMCarePlans](StructureDefinition-se-ehds-lm-care-plans.html) | [SEEHDSCarePlan](StructureDefinition-se-ehds-care-plan.html) | [mapping-getcareplans](mapping-getcareplans.html) |
| GetCareContacts | [SEEHDSLMCareContacts](StructureDefinition-se-ehds-lm-care-contacts.html) | [SEEHDSEncounter](StructureDefinition-se-ehds-encounter.html) | [mapping-getcarecontacts](mapping-getcarecontacts.html) |
| GetCareDocumentation | [SEEHDSLMCareDocumentation](StructureDefinition-se-ehds-lm-care-documentation.html) | [SEEHDSDocumentReference](StructureDefinition-se-ehds-document-reference.html) | [mapping-getcaredocumentation](mapping-getcaredocumentation.html) |
| GetLaboratoryOrderOutcome | [SEEHDSLMLaboratoryOrderOutcome](StructureDefinition-se-ehds-lm-laboratory-order-outcome.html) | [SEEHDSDiagnosticReportLab](StructureDefinition-se-ehds-diagnostic-report-lab.html) + [SEEHDSObservationLab](StructureDefinition-se-ehds-observation-lab.html) | [mapping-getlaboratoryorderoutcome](mapping-getlaboratoryorderoutcome.html) |
| GetImagingOutcome | [SEEHDSLMImagingOutcome](StructureDefinition-se-ehds-lm-imaging-outcome.html) | [SEEHDSImagingStudy](StructureDefinition-se-ehds-imaging-study.html) + [SEEHDSDiagnosticReportImaging](StructureDefinition-se-ehds-diagnostic-report-imaging.html) | [mapping-getimagingoutcome](mapping-getimagingoutcome.html) |
| GetReferralOutcome | [SEEHDSLMReferralOutcome](StructureDefinition-se-ehds-lm-referral-outcome.html) | [SEEHDSServiceRequestReferral](StructureDefinition-se-ehds-service-request-referral.html) + [SEEHDSDiagnosticReportReferral](StructureDefinition-se-ehds-diagnostic-report-referral.html) | [mapping-getreferraloutcome](mapping-getreferraloutcome.html) |
| GetRequestActivities | [SEEHDSLMRequestActivities](StructureDefinition-se-ehds-lm-request-activities.html) | [SEEHDSTask](StructureDefinition-se-ehds-task.html) | [mapping-getrequestactivities](mapping-getrequestactivities.html) |
| GetObservations | [SEEHDSLMObservations](StructureDefinition-se-ehds-lm-observations.html) | [SEEHDSObservationGrowth](StructureDefinition-se-ehds-observation-growth.html) | [mapping-getobservations](mapping-getobservations.html) |
| GetAccessLogForPatient | [SEEHDSLMAccessLog](StructureDefinition-se-ehds-lm-access-log.html) | [SEEHDSAuditEvent](StructureDefinition-se-ehds-audit-event.html) | [mapping-getaccesslogforpatient](mapping-getaccesslogforpatient.html) |

---

### Gemensamt headermönster

Alla tjänstekontrakt (utom GetAccessLogForPatient) delar ett headermönster som mappas på följande sätt:

| Header-element | FHIR-destination | Notering |
|---|---|---|
| `patientId` | `{Resurs}.subject.identifier` | OID→URI-konvertering krävs |
| `sourceSystemHSAId` | `{Resurs}.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `documentTime` | `{Resurs}.recordedDate` (eller primär tidsstämpel) | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm) |
| `accountableHealthcareProfessional` | `{Resurs}.recorder` / `author` / `performer` | Logisk referens via HSA-id |
| `legalAuthenticator` | `{Resurs}.asserter` / `authenticator` | Logisk referens via HSA-id |
| `careProviderHSAId` | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `careUnitHSAId` | `Provenance.agent[author].who.identifier` | Inre Sparr |

> **OBS om server-side filtrering:** Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering baserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver Provenance-spärr-agenterna och `approvedForPatient`-säkerhetsmärkning (se PDL-001) inte inkluderas i svaret — filtreringen sker då redan på servernivå.
