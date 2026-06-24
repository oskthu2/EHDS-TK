# SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome)**

## Resource Profile: SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-lab | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSObservationLab |

 
Profil för enskilda laboratorieresultat/analyser mappat från GetLaboratoryOrderOutcome. Används i kombination med IneraEHDSDiagnosticReportLab. 

**Användningar:**

* Referera till denna Profil: [SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)](StructureDefinition-inera-ehds-diagnostic-report-lab.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-observation-lab)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-observation-lab.csv), [Excel](StructureDefinition-inera-ehds-observation-lab.xlsx), [Schematron](StructureDefinition-inera-ehds-observation-lab.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-observation-lab",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-lab",
  "version" : "0.1.0",
  "name" : "IneraEHDSObservationLab",
  "title" : "SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome)",
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
  "description" : "Profil för enskilda laboratorieresultat/analyser mappat från GetLaboratoryOrderOutcome. Används i kombination med IneraEHDSDiagnosticReportLab.",
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
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
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
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-laboratory-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Analysstatus (groupOfAnalyses.analysis.status)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Analyskod (groupOfAnalyses.analysis.code – NPU/LOINC)"
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patient (header.accessControlHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "Analystidpunkt (groupOfAnalyses.analysis.timestamp)"
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Analysresultat (groupOfAnalyses.analysis.result.value – AnyValueType, se LAB-001)"
    },
    {
      "id" : "Observation.interpretation",
      "path" : "Observation.interpretation",
      "short" : "Tolkning av resultat (groupOfAnalyses.analysis.result.interpretation)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Analyskommentar (groupOfAnalyses.analysis.comment)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.referenceRange",
      "path" : "Observation.referenceRange",
      "short" : "Referensintervall (groupOfAnalyses.analysis.result.reference)",
      "mustSupport" : true
    }]
  }
}

```
