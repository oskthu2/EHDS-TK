# Profiles

Denna sida listar alla FHIR-profiler definierade i denna IG, grupperade per FHIR-grupp. Se [Mappings](mappings.html) för hur respektive profil relaterar till RIVTA-tjänstekontrakten.

---

### Gemensamma profiler

| Profil | Basresurs | Beskrivning |
|---|---|---|
| [SEEHDSPatient](StructureDefinition-se-ehds-patient.html) | Patient-uv-ips | Patient med svenska identifierarslicar (personnummer, samordningsnummer, nationelltReservnummer). |
| [SEEHDSProvenance](StructureDefinition-se-ehds-provenance.html) | Provenance | Provenance med tre agenter: custodian (vårdgivare), author (vårdenhet), assembler (EHDS-bryggan). |

---

### Patientöversikt

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [SEEHDSConditionDiagnosis](StructureDefinition-se-ehds-condition-diagnosis.html) | Condition-uv-ips | GetDiagnosis |
| [SEEHDSAllergyIntolerance](StructureDefinition-se-ehds-allergy-intolerance.html) | AllergyIntolerance-uv-ips | GetAlertInformation (allergi/överkänslighet) |
| [SEEHDSFlag](StructureDefinition-se-ehds-flag.html) | Flag | GetAlertInformation (varning) |
| [SEEHDSMedicationStatement](StructureDefinition-se-ehds-medication-statement.html) | MedicationStatement-uv-ips | GetMedicationHistory |
| [SEEHDSImmunization](StructureDefinition-se-ehds-immunization.html) | Immunization-uv-ips | GetVaccinationHistory |
| [SEEHDSConditionFunctional](StructureDefinition-se-ehds-condition-functional.html) | Condition-uv-ips | GetFunctionalStatus |
| [SEEHDSObservationMaternity](StructureDefinition-se-ehds-observation-maternity.html) | Observation-results-uv-ips | GetMaternityMedicalHistory |
| [SEEHDSCarePlan](StructureDefinition-se-ehds-care-plan.html) | CarePlan | GetCarePlans |
| [SEEHDSEncounter](StructureDefinition-se-ehds-encounter.html) | Encounter | GetCareContacts |
| [SEEHDSDocumentReference](StructureDefinition-se-ehds-document-reference.html) | DocumentReference | GetCareDocumentation |

---

### Laboratorie och diagnostik

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [SEEHDSDiagnosticReportLab](StructureDefinition-se-ehds-diagnostic-report-lab.html) | DiagnosticReport-lab-uv-ips | GetLaboratoryOrderOutcome |
| [SEEHDSObservationLab](StructureDefinition-se-ehds-observation-lab.html) | Observation-results-laboratory-uv-ips | GetLaboratoryOrderOutcome |

---

### Bilddiagnostik

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [SEEHDSImagingStudy](StructureDefinition-se-ehds-imaging-study.html) | ImagingStudy-uv-ips | GetImagingOutcome |
| [SEEHDSDiagnosticReportImaging](StructureDefinition-se-ehds-diagnostic-report-imaging.html) | DiagnosticReport | GetImagingOutcome |

---

### Remiss och process

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [SEEHDSServiceRequestReferral](StructureDefinition-se-ehds-service-request-referral.html) | ServiceRequest | GetReferralOutcome |
| [SEEHDSDiagnosticReportReferral](StructureDefinition-se-ehds-diagnostic-report-referral.html) | DiagnosticReport | GetReferralOutcome |
| [SEEHDSTask](StructureDefinition-se-ehds-task.html) | Task | GetRequestActivities |

---

### Tillväxtkurva barn

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [SEEHDSObservationGrowth](StructureDefinition-se-ehds-observation-growth.html) | Observation-results-uv-ips | GetObservations |

---

### Logg

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [SEEHDSAuditEvent](StructureDefinition-se-ehds-audit-event.html) | AuditEvent | GetAccessLogForPatient |
