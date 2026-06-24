# SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)**

## Resource Profile: SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-diagnostic-report-lab | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSDiagnosticReportLab |

 
Profil för laboratorieresultat mappat från RIVTA-tjänstekontraktet GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v4.2). Täcker NPÖ v4.2 och 1177 Journal v4.2. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-diagnostic-report-lab)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-diagnostic-report-lab.csv), [Excel](StructureDefinition-inera-ehds-diagnostic-report-lab.xlsx), [Schematron](StructureDefinition-inera-ehds-diagnostic-report-lab.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-diagnostic-report-lab",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-diagnostic-report-lab",
  "version" : "0.1.0",
  "name" : "IneraEHDSDiagnosticReportLab",
  "title" : "SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)",
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
  "description" : "Profil för laboratorieresultat mappat från RIVTA-tjänstekontraktet GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v4.2). Täcker NPÖ v4.2 och 1177 Journal v4.2.",
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
      "short" : "Källsystem HSA-id (header.sourceSystemId)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Svarstatus – härledd (inget statusfält i TKBn)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.category",
      "path" : "DiagnosticReport.category",
      "short" : "Laboratoriekategori",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code",
      "path" : "DiagnosticReport.code",
      "short" : "Beställningskod (laboratoryOrderOutcome.body.type)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "short" : "Patient (header.accessControlHeader.patientId – JoL-header)",
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
      "short" : "Kliniskt relevant tidpunkt (härledd; specimen.timestamp → Specimen.collection.collectedDateTime)",
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
      "short" : "Svarstidpunkt (header.record.timestamp)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.performer",
      "path" : "DiagnosticReport.performer",
      "short" : "Ansvarig laboratorium/personal (header.author.orgUnit)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.specimen",
      "path" : "DiagnosticReport.specimen",
      "short" : "Provmaterial (groupOfAnalyses.analysis.specimen.material)",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Enskilda analysresultat (groupOfAnalyses.analysis)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-lab"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Beställningsinformation/fritext (laboratoryOrderOutcome.body.text)",
      "mustSupport" : true
    }]
  }
}

```
