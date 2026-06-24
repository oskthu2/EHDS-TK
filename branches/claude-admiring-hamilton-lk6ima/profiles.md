# Profiles - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Profiles**

## Profiles

# Profiles

Denna sida listar alla FHIR-profiler definierade i denna IG, grupperade per FHIR-grupp. Se [Mappings](mappings.md) för hur respektive profil relaterar till RIVTA-tjänstekontrakten.

-------

### Gemensamma profiler

| | | |
| :--- | :--- | :--- |
| [IneraEHDSPatient](StructureDefinition-inera-ehds-patient.md) | Patient-uv-ips | Patient med svenska identifierarslicar (personnummer, samordningsnummer, nationelltReservnummer). |
| [IneraEHDSProvenance](StructureDefinition-inera-ehds-provenance.md) | Provenance | Provenance med tre agenter: custodian (vårdgivare), author (vårdenhet), assembler (EHDS-bryggan). |

-------

### Patientöversikt

| | | |
| :--- | :--- | :--- |
| [IneraEHDSConditionDiagnosis](StructureDefinition-inera-ehds-condition-diagnosis.md) | Condition-uv-ips | GetDiagnosis |
| [IneraEHDSAllergyIntolerance](StructureDefinition-inera-ehds-allergy-intolerance.md) | AllergyIntolerance-uv-ips | GetAlertInformation (allergi/överkänslighet) |
| [IneraEHDSFlag](StructureDefinition-inera-ehds-flag.md) | Flag | GetAlertInformation (varning) |
| [IneraEHDSMedicationStatement](StructureDefinition-inera-ehds-medication-statement.md) | MedicationStatement-uv-ips | GetMedicationHistory |
| [IneraEHDSImmunization](StructureDefinition-inera-ehds-immunization.md) | Immunization-uv-ips | GetVaccinationHistory |
| [IneraEHDSConditionFunctional](StructureDefinition-inera-ehds-condition-functional.md) | Condition-uv-ips | GetFunctionalStatus |
| [IneraEHDSObservationMaternity](StructureDefinition-inera-ehds-observation-maternity.md) | Observation-results-uv-ips | GetMaternityMedicalHistory |
| [IneraEHDSCarePlan](StructureDefinition-inera-ehds-care-plan.md) | CarePlan | GetCarePlans |
| [IneraEHDSEncounter](StructureDefinition-inera-ehds-encounter.md) | Encounter | GetCareContacts |
| [IneraEHDSDocumentReference](StructureDefinition-inera-ehds-document-reference.md) | DocumentReference | GetCareDocumentation |

-------

### Laboratorie och diagnostik

| | | |
| :--- | :--- | :--- |
| [IneraEHDSDiagnosticReportLab](StructureDefinition-inera-ehds-diagnostic-report-lab.md) | DiagnosticReport-lab-uv-ips | GetLaboratoryOrderOutcome |
| [IneraEHDSObservationLab](StructureDefinition-inera-ehds-observation-lab.md) | Observation-results-laboratory-uv-ips | GetLaboratoryOrderOutcome |

-------

### Bilddiagnostik

| | | |
| :--- | :--- | :--- |
| [IneraEHDSImagingStudy](StructureDefinition-inera-ehds-imaging-study.md) | ImagingStudy-uv-ips | GetImagingOutcome |
| [IneraEHDSDiagnosticReportImaging](StructureDefinition-inera-ehds-diagnostic-report-imaging.md) | DiagnosticReport | GetImagingOutcome |

-------

### Remiss och process

| | | |
| :--- | :--- | :--- |
| [IneraEHDSServiceRequestReferral](StructureDefinition-inera-ehds-service-request-referral.md) | ServiceRequest | GetReferralOutcome |
| [IneraEHDSDiagnosticReportReferral](StructureDefinition-inera-ehds-diagnostic-report-referral.md) | DiagnosticReport | GetReferralOutcome |
| [IneraEHDSTask](StructureDefinition-inera-ehds-task.md) | Task | GetRequestActivities |

-------

### Tillväxtkurva barn

| | | |
| :--- | :--- | :--- |
| [IneraEHDSObservationGrowth](StructureDefinition-inera-ehds-observation-growth.md) | Observation-results-uv-ips | GetObservations |

-------

### Logg

| | | |
| :--- | :--- | :--- |
| [IneraEHDSAuditEvent](StructureDefinition-inera-ehds-audit-event.md) | AuditEvent | GetAccessLogForPatient |

