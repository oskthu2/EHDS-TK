# Mappings

Denna sida ger en översikt över hur RIVTA-tjänstekontraktens element mappas till FHIR-profiler i denna IG. Detaljerade mappningstabeller finns på respektive tjänstekontrakts sida.

---

### Syfte

Mappningarna spårar varje element i de logiska modellerna till det FHIR-profil-element som bär informationen. Detta möjliggör verifiering av täckning och vägleder implementörer som behöver förstå relationen mellan kliniska krav och teknisk representation.

---

### Översikt per tjänstekontrakt

| Tjänstekontrakt | Logisk modell | FHIR-profil(er) | Mappningssida |
|---|---|---|---|
| GetDiagnosis | [IneraEHDSLMDiagnosis](StructureDefinition-inera-ehds-lm-diagnosis.html) | [IneraEHDSConditionDiagnosis](StructureDefinition-inera-ehds-condition-diagnosis.html) | [mapping-getdiagnosis](mapping-getdiagnosis.html) |
| GetAlertInformation | [IneraEHDSLMAlertInformation](StructureDefinition-inera-ehds-lm-alert-information.html) | [IneraEHDSAllergyIntolerance](StructureDefinition-inera-ehds-allergy-intolerance.html) + [IneraEHDSFlag](StructureDefinition-inera-ehds-flag.html) | [mapping-getalertinformation](mapping-getalertinformation.html) |
| GetMedicationHistory | [IneraEHDSLMMedicationHistory](StructureDefinition-inera-ehds-lm-medication-history.html) | [IneraEHDSMedicationStatement](StructureDefinition-inera-ehds-medication-statement.html) | [mapping-getmedicationhistory](mapping-getmedicationhistory.html) |
| GetVaccinationHistory | [IneraEHDSLMVaccinationHistory](StructureDefinition-inera-ehds-lm-vaccination-history.html) | [IneraEHDSImmunization](StructureDefinition-inera-ehds-immunization.html) | [mapping-getvaccinationhistory](mapping-getvaccinationhistory.html) |
| GetFunctionalStatus | [IneraEHDSLMFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.html) | [IneraEHDSConditionFunctional](StructureDefinition-inera-ehds-condition-functional.html) | [mapping-getfunctionalstatus](mapping-getfunctionalstatus.html) |
| GetMaternityMedicalHistory | [IneraEHDSLMMaternityMedicalHistory](StructureDefinition-inera-ehds-lm-maternity-medical-history.html) | [IneraEHDSObservationMaternity](StructureDefinition-inera-ehds-observation-maternity.html) | [mapping-getmaternitymedicalhistory](mapping-getmaternitymedicalhistory.html) |
| GetCarePlans | [IneraEHDSLMCarePlans](StructureDefinition-inera-ehds-lm-care-plans.html) | [IneraEHDSCarePlan](StructureDefinition-inera-ehds-care-plan.html) | [mapping-getcareplans](mapping-getcareplans.html) |
| GetCareContacts | [IneraEHDSLMCareContacts](StructureDefinition-inera-ehds-lm-care-contacts.html) | [IneraEHDSEncounter](StructureDefinition-inera-ehds-encounter.html) | [mapping-getcarecontacts](mapping-getcarecontacts.html) |
| GetCareDocumentation | [IneraEHDSLMCareDocumentation](StructureDefinition-inera-ehds-lm-care-documentation.html) | [IneraEHDSDocumentReference](StructureDefinition-inera-ehds-document-reference.html) | [mapping-getcaredocumentation](mapping-getcaredocumentation.html) |
| GetLaboratoryOrderOutcome | [IneraEHDSLMLaboratoryOrderOutcome](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.html) | [IneraEHDSDiagnosticReportLab](StructureDefinition-inera-ehds-diagnostic-report-lab.html) + [IneraEHDSObservationLab](StructureDefinition-inera-ehds-observation-lab.html) | [mapping-getlaboratoryorderoutcome](mapping-getlaboratoryorderoutcome.html) |
| GetImagingOutcome | [IneraEHDSLMImagingOutcome](StructureDefinition-inera-ehds-lm-imaging-outcome.html) | [IneraEHDSImagingStudy](StructureDefinition-inera-ehds-imaging-study.html) + [IneraEHDSDiagnosticReportImaging](StructureDefinition-inera-ehds-diagnostic-report-imaging.html) | [mapping-getimagingoutcome](mapping-getimagingoutcome.html) |
| GetReferralOutcome | [IneraEHDSLMReferralOutcome](StructureDefinition-inera-ehds-lm-referral-outcome.html) | [IneraEHDSServiceRequestReferral](StructureDefinition-inera-ehds-service-request-referral.html) + [IneraEHDSDiagnosticReportReferral](StructureDefinition-inera-ehds-diagnostic-report-referral.html) | [mapping-getreferraloutcome](mapping-getreferraloutcome.html) |
| GetRequestActivities | [IneraEHDSLMRequestActivities](StructureDefinition-inera-ehds-lm-request-activities.html) | [IneraEHDSTask](StructureDefinition-inera-ehds-task.html) | [mapping-getrequestactivities](mapping-getrequestactivities.html) |
| GetObservations | [IneraEHDSLMObservations](StructureDefinition-inera-ehds-lm-observations.html) | [IneraEHDSObservationGrowth](StructureDefinition-inera-ehds-observation-growth.html) | [mapping-getobservations](mapping-getobservations.html) |
| GetAccessLogForPatient | [IneraEHDSLMAccessLog](StructureDefinition-inera-ehds-lm-access-log.html) | [IneraEHDSAuditEvent](StructureDefinition-inera-ehds-audit-event.html) | [mapping-getaccesslogforpatient](mapping-getaccesslogforpatient.html) |

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
