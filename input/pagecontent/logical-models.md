# Logical Models

Denna sida dokumenterar de logiska informationsmodeller som utgör grunden för profilerna i denna IG. De logiska modellerna fångar informationskraven från Ineras RIVTA-tjänstekontrakt oberoende av teknisk representation.

---

### Syfte

De logiska modellerna nedan representerar de informationskrav som definieras av respektive tjänstekontrakt i Ineras tjänstekatalog. De tjänar som auktoritativ källa för vilka data som ska utväxlas och utgör grunden för FHIR-profilerna i IG:t.

---

### Modeller

| Logisk modell | Tjänstekontrakt | FHIR-grupp |
|---|---|---|
| [SEEHDSLMDiagnosis](StructureDefinition-se-ehds-lm-diagnosis.html) | GetDiagnosis | Patientöversikt |
| [SEEHDSLMAlertInformation](StructureDefinition-se-ehds-lm-alert-information.html) | GetAlertInformation | Patientöversikt |
| [SEEHDSLMMedicationHistory](StructureDefinition-se-ehds-lm-medication-history.html) | GetMedicationHistory | Patientöversikt |
| [SEEHDSLMVaccinationHistory](StructureDefinition-se-ehds-lm-vaccination-history.html) | GetVaccinationHistory | Patientöversikt |
| [SEEHDSLMFunctionalStatus](StructureDefinition-se-ehds-lm-functional-status.html) | GetFunctionalStatus | Patientöversikt |
| [SEEHDSLMMaternityMedicalHistory](StructureDefinition-se-ehds-lm-maternity-medical-history.html) | GetMaternityMedicalHistory | Patientöversikt |
| [SEEHDSLMCarePlans](StructureDefinition-se-ehds-lm-care-plans.html) | GetCarePlans | Patientöversikt |
| [SEEHDSLMCareContacts](StructureDefinition-se-ehds-lm-care-contacts.html) | GetCareContacts | Patientöversikt |
| [SEEHDSLMCareDocumentation](StructureDefinition-se-ehds-lm-care-documentation.html) | GetCareDocumentation | Patientöversikt |
| [SEEHDSLMLaboratoryOrderOutcome](StructureDefinition-se-ehds-lm-laboratory-order-outcome.html) | GetLaboratoryOrderOutcome | Laboratorie och diagnostik |
| [SEEHDSLMImagingOutcome](StructureDefinition-se-ehds-lm-imaging-outcome.html) | GetImagingOutcome | Bilddiagnostik |
| [SEEHDSLMReferralOutcome](StructureDefinition-se-ehds-lm-referral-outcome.html) | GetReferralOutcome | Remiss och process |
| [SEEHDSLMRequestActivities](StructureDefinition-se-ehds-lm-request-activities.html) | GetRequestActivities | Remiss och process |
| [SEEHDSLMObservations](StructureDefinition-se-ehds-lm-observations.html) | GetObservations | Tillväxtkurva barn |
| [SEEHDSLMAccessLog](StructureDefinition-se-ehds-lm-access-log.html) | GetAccessLogForPatient | Logg |

---

### Gemensamma headerelement

Alla tjänstekontrakt med klinisk information delar ett headermönster (`PatientSummaryHeader` eller liknande) med dessa obligatoriska element:

| Element | Typ | Beskrivning |
|---|---|---|
| `patientId` | Identifier | Personnummer, samordningsnummer eller reservnummer |
| `sourceSystemHSAId` | string | Källsystemets HSA-id |
| `documentTime` | dateTime | Registreringstidpunkt (YYYYMMDDHHMMSS, Europe/Stockholm) |
| `accountableHealthcareProfessional` | Identifier | Ansvarig hälso- och sjukvårdspersonals HSA-id |
| `careProviderHSAId` | string | Vårdgivarens HSA-id (yttre Sparr) |
| `careUnitHSAId` | string | Vårdenhetens HSA-id (inre Sparr) |

Se [Mappings](mappings.html) för hur dessa headerElement mappas till FHIR.

> **Vägledning för författare:** Logiska modeller definieras som FHIR `StructureDefinition`-resurser med `kind = logical` i FSH. De finns i `input/fsh/logicalmodels/`.
