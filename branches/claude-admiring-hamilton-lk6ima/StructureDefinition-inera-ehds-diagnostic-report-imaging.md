# SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)**

## Resource Profile: SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-diagnostic-report-imaging | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSDiagnosticReportImaging |

 
Profil för bilddiagnostiska utlåtanden/fynd från GetImagingOutcome. Används tillsammans med IneraEHDSImagingStudy för att representera både undersökning och svar. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-diagnostic-report-imaging)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-diagnostic-report-imaging.csv), [Excel](StructureDefinition-inera-ehds-diagnostic-report-imaging.xlsx), [Schematron](StructureDefinition-inera-ehds-diagnostic-report-imaging.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-diagnostic-report-imaging",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-diagnostic-report-imaging",
  "version" : "0.1.0",
  "name" : "IneraEHDSDiagnosticReportImaging",
  "title" : "SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)",
  "status" : "draft",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Profil för bilddiagnostiska utlåtanden/fynd från GetImagingOutcome. Används tillsammans med IneraEHDSImagingStudy för att representera både undersökning och svar.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport"
    },
    {
      "id" : "DiagnosticReport.meta.source",
      "path" : "DiagnosticReport.meta.source",
      "short" : "Källsystem HSA-id (imagingOutcomeHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Härledd från imagingOutcomeBody.typeOfResult (PREL→preliminary, DEF→final, TILL→amended, nullified=true→entered-in-error, se IMG-001)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.category",
      "path" : "DiagnosticReport.category",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code",
      "path" : "DiagnosticReport.code",
      "short" : "Undersökningsspecialitet (imagingOutcomeBody.examinationSpeciality)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "short" : "Patient (imagingOutcomeHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.effective[x]",
      "path" : "DiagnosticReport.effective[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "DiagnosticReport.effective[x]:effectiveDateTime",
      "path" : "DiagnosticReport.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Resultattidpunkt (imagingOutcomeBody.resultTime)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.issued",
      "path" : "DiagnosticReport.issued",
      "short" : "Dokumentets tidpunkt (imagingOutcomeHeader.documentTime)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.performer",
      "path" : "DiagnosticReport.performer",
      "short" : "Tolkande radiolog/enhet (imagingOutcomeHeader.accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.imagingStudy",
      "path" : "DiagnosticReport.imagingStudy",
      "short" : "Koppling till bildundersökning",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-imaging-study"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Radiologiskt utlåtande (imagingOutcomeBody.resultReport / imagingOutcomeBody.resultComment)",
      "mustSupport" : true
    }]
  }
}

```
