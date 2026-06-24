# Logical Models - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Logical Models**

## Logical Models

# Logical Models

Denna sida dokumenterar de logiska informationsmodeller som utgör grunden för profilerna i denna IG. De logiska modellerna fångar informationskraven från Ineras RIVTA-tjänstekontrakt oberoende av teknisk representation.

-------

### Syfte

De logiska modellerna nedan representerar de informationskrav som definieras av respektive tjänstekontrakt i Ineras tjänstekatalog. De tjänar som auktoritativ källa för vilka data som ska utväxlas och utgör grunden för FHIR-profilerna i IG:t.

-------

### Modeller

| | | |
| :--- | :--- | :--- |
| [IneraEHDSLMDiagnosis](StructureDefinition-inera-ehds-lm-diagnosis.md) | GetDiagnosis | Patientöversikt |
| [IneraEHDSLMAlertInformation](StructureDefinition-inera-ehds-lm-alert-information.md) | GetAlertInformation | Patientöversikt |
| [IneraEHDSLMMedicationHistory](StructureDefinition-inera-ehds-lm-medication-history.md) | GetMedicationHistory | Patientöversikt |
| [IneraEHDSLMVaccinationHistory](StructureDefinition-inera-ehds-lm-vaccination-history.md) | GetVaccinationHistory | Patientöversikt |
| [IneraEHDSLMFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.md) | GetFunctionalStatus | Patientöversikt |
| [IneraEHDSLMMaternityMedicalHistory](StructureDefinition-inera-ehds-lm-maternity-medical-history.md) | GetMaternityMedicalHistory | Patientöversikt |
| [IneraEHDSLMCarePlans](StructureDefinition-inera-ehds-lm-care-plans.md) | GetCarePlans | Patientöversikt |
| [IneraEHDSLMCareContacts](StructureDefinition-inera-ehds-lm-care-contacts.md) | GetCareContacts | Patientöversikt |
| [IneraEHDSLMCareDocumentation](StructureDefinition-inera-ehds-lm-care-documentation.md) | GetCareDocumentation | Patientöversikt |
| [IneraEHDSLMLaboratoryOrderOutcome](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.md) | GetLaboratoryOrderOutcome | Laboratorie och diagnostik |
| [IneraEHDSLMImagingOutcome](StructureDefinition-inera-ehds-lm-imaging-outcome.md) | GetImagingOutcome | Bilddiagnostik |
| [IneraEHDSLMReferralOutcome](StructureDefinition-inera-ehds-lm-referral-outcome.md) | GetReferralOutcome | Remiss och process |
| [IneraEHDSLMRequestActivities](StructureDefinition-inera-ehds-lm-request-activities.md) | GetRequestActivities | Remiss och process |
| [IneraEHDSLMObservations](StructureDefinition-inera-ehds-lm-observations.md) | GetObservations | Tillväxtkurva barn |
| [IneraEHDSLMAccessLog](StructureDefinition-inera-ehds-lm-access-log.md) | GetAccessLogForPatient | Logg |

-------

### Gemensamma headerelement

Alla tjänstekontrakt med klinisk information delar ett headermönster (`PatientSummaryHeader` eller liknande) med dessa obligatoriska element:

| | | |
| :--- | :--- | :--- |
| `patientId` | Identifier | Personnummer, samordningsnummer eller reservnummer |
| `sourceSystemHSAId` | string | Källsystemets HSA-id |
| `documentTime` | dateTime | Registreringstidpunkt (YYYYMMDDHHMMSS, Europe/Stockholm) |
| `accountableHealthcareProfessional` | Identifier | Ansvarig hälso- och sjukvårdspersonals HSA-id |
| `careProviderHSAId` | string | Vårdgivarens HSA-id (yttre Sparr) |
| `careUnitHSAId` | string | Vårdenhetens HSA-id (inre Sparr) |

Se [Mappings](mappings.md) för hur dessa headerElement mappas till FHIR.

> **Vägledning för författare:** Logiska modeller definieras som FHIR `StructureDefinition`-resurser med `kind = logical` i FSH. De finns i `input/fsh/logicalmodels/`.

