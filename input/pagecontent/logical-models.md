# Logical Models

Denna sida dokumenterar de logiska informationsmodeller som utgör grunden för profilerna i denna IG. De logiska modellerna fångar informationskraven från Ineras RIVTA-tjänstekontrakt oberoende av teknisk representation.

---

### Syfte

De logiska modellerna nedan representerar de informationskrav som definieras av respektive tjänstekontrakt i Ineras tjänstekatalog. De tjänar som auktoritativ källa för vilka data som ska utväxlas och utgör grunden för FHIR-profilerna i IG:t.

---

### Modeller

| Logisk modell | Tjänstekontrakt | FHIR-grupp |
|---|---|---|
| [IneraEHDSLMDiagnosis](StructureDefinition-inera-ehds-lm-diagnosis.html) | GetDiagnosis | Patientöversikt |
| [IneraEHDSLMAlertInformation](StructureDefinition-inera-ehds-lm-alert-information.html) | GetAlertInformation | Patientöversikt |
| [IneraEHDSLMMedicationHistory](StructureDefinition-inera-ehds-lm-medication-history.html) | GetMedicationHistory | Patientöversikt |
| [IneraEHDSLMVaccinationHistory](StructureDefinition-inera-ehds-lm-vaccination-history.html) | GetVaccinationHistory | Patientöversikt |
| [IneraEHDSLMFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.html) | GetFunctionalStatus | Patientöversikt |
| [IneraEHDSLMMaternityMedicalHistory](StructureDefinition-inera-ehds-lm-maternity-medical-history.html) | GetMaternityMedicalHistory | Patientöversikt |
| [IneraEHDSLMCarePlans](StructureDefinition-inera-ehds-lm-care-plans.html) | GetCarePlans | Patientöversikt |
| [IneraEHDSLMCareContacts](StructureDefinition-inera-ehds-lm-care-contacts.html) | GetCareContacts | Patientöversikt |
| [IneraEHDSLMCareDocumentation](StructureDefinition-inera-ehds-lm-care-documentation.html) | GetCareDocumentation | Patientöversikt |
| [IneraEHDSLMLaboratoryOrderOutcome](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.html) | GetLaboratoryOrderOutcome | Laboratorie och diagnostik |
| [IneraEHDSLMImagingOutcome](StructureDefinition-inera-ehds-lm-imaging-outcome.html) | GetImagingOutcome | Bilddiagnostik |
| [IneraEHDSLMReferralOutcome](StructureDefinition-inera-ehds-lm-referral-outcome.html) | GetReferralOutcome | Remiss och process |
| [IneraEHDSLMRequestActivities](StructureDefinition-inera-ehds-lm-request-activities.html) | GetRequestActivities | Remiss och process |
| [IneraEHDSLMObservations](StructureDefinition-inera-ehds-lm-observations.html) | GetObservations | Tillväxtkurva barn |
| [IneraEHDSLMAccessLog](StructureDefinition-inera-ehds-lm-access-log.html) | GetAccessLogForPatient | Logg |

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
