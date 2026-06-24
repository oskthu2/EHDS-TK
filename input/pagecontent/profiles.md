# Profiles

Denna sida listar alla FHIR-profiler definierade i denna IG, grupperade per FHIR-grupp. Se [Mappings](mappings.html) för hur respektive profil relaterar till RIVTA-tjänstekontrakten.

---

### Gemensamma profiler

| Profil | Basresurs | Beskrivning |
|---|---|---|
| [IneraEHDSPatient](StructureDefinition-inera-ehds-patient.html) | Patient-uv-ips | Patient med svenska identifierarslicar (personnummer, samordningsnummer, nationelltReservnummer). |
| [IneraEHDSProvenance](StructureDefinition-inera-ehds-provenance.html) | Provenance | Provenance med tre agenter: custodian (vårdgivare), author (vårdenhet), assembler (EHDS-bryggan). |

---

### Patientöversikt

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [IneraEHDSConditionDiagnosis](StructureDefinition-inera-ehds-condition-diagnosis.html) | Condition-uv-ips | GetDiagnosis |
| [IneraEHDSAllergyIntolerance](StructureDefinition-inera-ehds-allergy-intolerance.html) | AllergyIntolerance-uv-ips | GetAlertInformation (allergi/överkänslighet) |
| [IneraEHDSFlag](StructureDefinition-inera-ehds-flag.html) | Flag | GetAlertInformation (varning) |
| [IneraEHDSMedicationStatement](StructureDefinition-inera-ehds-medication-statement.html) | MedicationStatement-uv-ips | GetMedicationHistory |
| [IneraEHDSImmunization](StructureDefinition-inera-ehds-immunization.html) | Immunization-uv-ips | GetVaccinationHistory |
| [IneraEHDSConditionFunctional](StructureDefinition-inera-ehds-condition-functional.html) | Condition-uv-ips | GetFunctionalStatus |
| [IneraEHDSObservationMaternity](StructureDefinition-inera-ehds-observation-maternity.html) | Observation-results-uv-ips | GetMaternityMedicalHistory |
| [IneraEHDSCarePlan](StructureDefinition-inera-ehds-care-plan.html) | CarePlan | GetCarePlans |
| [IneraEHDSEncounter](StructureDefinition-inera-ehds-encounter.html) | Encounter | GetCareContacts |
| [IneraEHDSDocumentReference](StructureDefinition-inera-ehds-document-reference.html) | DocumentReference | GetCareDocumentation |

---

### Laboratorie och diagnostik

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [IneraEHDSDiagnosticReportLab](StructureDefinition-inera-ehds-diagnostic-report-lab.html) | DiagnosticReport-lab-uv-ips | GetLaboratoryOrderOutcome |
| [IneraEHDSObservationLab](StructureDefinition-inera-ehds-observation-lab.html) | Observation-results-laboratory-uv-ips | GetLaboratoryOrderOutcome |

---

### Bilddiagnostik

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [IneraEHDSImagingStudy](StructureDefinition-inera-ehds-imaging-study.html) | ImagingStudy-uv-ips | GetImagingOutcome |
| [IneraEHDSDiagnosticReportImaging](StructureDefinition-inera-ehds-diagnostic-report-imaging.html) | DiagnosticReport | GetImagingOutcome |

---

### Remiss och process

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [IneraEHDSServiceRequestReferral](StructureDefinition-inera-ehds-service-request-referral.html) | ServiceRequest | GetReferralOutcome |
| [IneraEHDSDiagnosticReportReferral](StructureDefinition-inera-ehds-diagnostic-report-referral.html) | DiagnosticReport | GetReferralOutcome |
| [IneraEHDSTask](StructureDefinition-inera-ehds-task.html) | Task | GetRequestActivities |

---

### Tillväxtkurva barn

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [IneraEHDSObservationGrowth](StructureDefinition-inera-ehds-observation-growth.html) | Observation-results-uv-ips | GetObservations |

---

### Logg

| Profil | Basresurs | Tjänstekontrakt |
|---|---|---|
| [IneraEHDSAuditEvent](StructureDefinition-inera-ehds-audit-event.html) | AuditEvent | GetAccessLogForPatient |
