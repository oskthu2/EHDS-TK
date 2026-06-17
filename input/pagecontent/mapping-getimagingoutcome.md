# GetImagingOutcome – Bilddiagnostik

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetImagingOutcome v1.0  
**FHIR-profiler:** [SEEHDSImagingStudy](StructureDefinition-se-ehds-imaging-study.html) | [SEEHDSDiagnosticReportImaging](StructureDefinition-se-ehds-diagnostic-report-imaging.html)  
**Logisk modell:** [SEEHDSLMImagingOutcome](StructureDefinition-se-ehds-lm-imaging-outcome.html)  
**Krävs för NPÖ:** Ja (v1.0) | **Krävs för 1177 Journal:** Ja (v1.0)  
**EHDS-koppling:** Medical imaging studies – matchar delvis EHDS (främst bilddiagnostiska utlåtanden)

---

## Resurshierarki

```
SEEHDSDiagnosticReportImaging (utlåtande)
  └── SEEHDSImagingStudy (undersökning/DICOM-data)
```

---

## Mappningstabell – SEEHDSImagingStudy

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imagingHeader.patientId` | 1..1 | `ImagingStudy.subject.identifier` | OID→URI |
| `imagingHeader.sourceSystemHSAId` | 1..1 | `ImagingStudy.meta.source` | |
| `imagingExaminationCode` | 1..1 | `ImagingStudy.procedureCode` | |
| `imagingTime` | 1..1 | `ImagingStudy.started` | |
| `imagingModality` | 0..1 | `ImagingStudy.modality` | DICOM-kod |
| `referralSource` | 0..1 | `ImagingStudy.referrer` | Reference(SEBasePractitionerRole) |
| `seriesUID` | 0..* | `ImagingStudy.series.uid` | DICOM UID |

---

## Mappningstabell – SEEHDSDiagnosticReportImaging

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imagingHeader.accountableHealthcareProfessional` | 1..1 | `DiagnosticReport.performer` | Tolkande radiolog |
| `imagingDescription` | 0..1 | `DiagnosticReport.code.text` | |
| `imagingAssessmentComment` | 0..1 | `DiagnosticReport.conclusion` | Radiologiskt utlåtande |
| (länk till undersökning) | – | `DiagnosticReport.imagingStudy` | Reference(SEEHDSImagingStudy) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
