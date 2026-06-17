# GetLaboratoryOrderOutcome – Provsvar

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetLaboratoryOrderOutcome v3.1, 4.1  
**FHIR-profiler:** [SEEHDSDiagnosticReportLab](StructureDefinition-se-ehds-diagnostic-report-lab.html) | [SEEHDSObservationLab](StructureDefinition-se-ehds-observation-lab.html)  
**Logisk modell:** [SEEHDSLMLaboratoryOrderOutcome](StructureDefinition-se-ehds-lm-laboratory-order-outcome.html)  
**Krävs för NPÖ:** Ja (v3.1, 4.1) | **Krävs för 1177 Journal:** Ja (v3.1, 4.2)  
**EHDS-koppling:** Medical test results – matchar EHDS inkl. laboratorie- och diagnostiska resultat

---

## Resurshierarki

```
SEEHDSDiagnosticReportLab (1 per beställning)
  └── SEEHDSObservationLab (1 per analys/parameter)
```

---

## Mappningstabell – SEEHDSDiagnosticReportLab

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `laboratoryOrderHeader.patientId` | 1..1 | `DiagnosticReport.subject.identifier` | OID→URI |
| `laboratoryOrderHeader.sourceSystemHSAId` | 1..1 | `DiagnosticReport.meta.source` | |
| `laboratoryOrderHeader.documentTime` | 1..1 | `DiagnosticReport.issued` | |
| `laboratoryOrderHeader.accountableHealthcareProfessional` | 1..1 | `DiagnosticReport.performer` | Reference(SEBasePractitionerRole) |
| `laboratoryOrderHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `laboratoryOrderHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `labOrderCode` | 1..1 | `DiagnosticReport.code` | |
| `labOrderStatus` | 1..1 | `DiagnosticReport.status` | |
| `registrationTime` | 1..1 | `DiagnosticReport.issued` | |
| `specimenCollectionTime` | 0..1 | `DiagnosticReport.effectiveDateTime` | |
| `specimenType` | 0..1 | `DiagnosticReport.specimen` | |
| `responsibleLaboratory` | 1..1 | `DiagnosticReport.performer` | Reference(SEBaseOrganization) |
| `assessmentComment` | 0..1 | `DiagnosticReport.conclusion` | |

---

## Mappningstabell – SEEHDSObservationLab

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `laboratoryTestResult.analysisCode` | 1..1 | `Observation.code` | NPU/LOINC |
| `laboratoryTestResult.analysisStatus` | 1..1 | `Observation.status` | |
| `laboratoryTestResult.analysisValue` | 0..1 | `Observation.value[x]` | valueQuantity, valueString etc. |
| `laboratoryTestResult.referenceInterval` | 0..1 | `Observation.referenceRange` | |
| `laboratoryTestResult.referenceIntervalOutOfRange` | 0..1 | `Observation.interpretation` | H/L/A |
| `laboratoryTestResult.analysisComment` | 0..1 | `Observation.note.text` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
