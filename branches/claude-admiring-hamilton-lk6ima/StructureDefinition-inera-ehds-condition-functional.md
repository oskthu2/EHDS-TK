# SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)**

## Resource Profile: SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-condition-functional | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSConditionFunctional |

 
Profil för funktionstillstånd och ADL-bedömningar mappat från RIVTA-tjänstekontraktet GetFunctionalStatus (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0. 
TKBn har två bedömningskategorier: 'pad-pad' (PADL-bedömning) och 'fun-fun' (funktionsnedsättningsbedömning med ICF-kod). Condition.code mappas mot assessmentCategory (för PADL) eller disability.disabilityAssessment (ICF-kod). Inget statusfält, tidperiod eller svårighetsgradfält finns i TKBn – dessa är härleddda. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-condition-functional)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-condition-functional.csv), [Excel](StructureDefinition-inera-ehds-condition-functional.xlsx), [Schematron](StructureDefinition-inera-ehds-condition-functional.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-condition-functional",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-condition-functional",
  "version" : "0.1.0",
  "name" : "IneraEHDSConditionFunctional",
  "title" : "SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)",
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
  "description" : "Profil för funktionstillstånd och ADL-bedömningar mappat från RIVTA-tjänstekontraktet\nGetFunctionalStatus (clinicalprocess:healthcond:description v2.0).\nTäcker NPÖ 2.0 och 1177 Journal 2.0.\n\nTKBn har två bedömningskategorier: 'pad-pad' (PADL-bedömning) och 'fun-fun'\n(funktionsnedsättningsbedömning med ICF-kod). Condition.code mappas mot\nassessmentCategory (för PADL) eller disability.disabilityAssessment (ICF-kod).\nInget statusfält, tidperiod eller svårighetsgradfält finns i TKBn – dessa är härleddda.",
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
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Condition-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Condition",
      "path" : "Condition"
    },
    {
      "id" : "Condition.meta.source",
      "path" : "Condition.meta.source",
      "short" : "Källsystem HSA-id (functionalStatusAssessmentHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "Condition.clinicalStatus",
      "path" : "Condition.clinicalStatus",
      "short" : "Alltid 'active' – härledd (inget statusfält i TKBn)"
    },
    {
      "id" : "Condition.verificationStatus",
      "path" : "Condition.verificationStatus",
      "short" : "Alltid 'confirmed' – härledd (journaluppgifter anses bekräftade)",
      "mustSupport" : true
    },
    {
      "id" : "Condition.category",
      "path" : "Condition.category",
      "short" : "Bedömningskategori (functionalStatusAssessmentBody.assessmentCategory – pad-pad eller fun-fun)"
    },
    {
      "id" : "Condition.code",
      "path" : "Condition.code",
      "short" : "Bedömningskod: assessmentCategory (pad-pad/fun-fun) eller disability.disabilityAssessment (ICF) – se FUNC-001"
    },
    {
      "id" : "Condition.subject",
      "path" : "Condition.subject",
      "short" : "Patient (functionalStatusAssessmentHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "Condition.recordedDate",
      "path" : "Condition.recordedDate",
      "short" : "Bedömningstidpunkt (functionalStatusAssessmentHeader.documentTime)",
      "mustSupport" : true
    },
    {
      "id" : "Condition.recorder",
      "path" : "Condition.recorder",
      "short" : "Ansvarig hälso- och sjukvårdspersonal (functionalStatusAssessmentHeader.accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.asserter",
      "path" : "Condition.asserter",
      "short" : "Rättslig äkthetsintygsgivare (functionalStatusAssessmentHeader.legalAuthenticator)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.note",
      "path" : "Condition.note",
      "short" : "Fritext och PADL-poster (FUNC-001):\nnote[0].text ← functionalStatusAssessmentBody.comment (helbedömningskommentar)\nnote[n].text ← varje padl-post formaterad som '[typeOfAssessment]: assessment'\nAlternativ (ej valt): separata Observation-resurser per PADL-post med\nObservation.code = typeOfAssessment och Observation.valueString = assessment.",
      "mustSupport" : true
    }]
  }
}

```
