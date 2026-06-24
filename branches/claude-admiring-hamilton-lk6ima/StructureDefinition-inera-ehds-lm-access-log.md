# GetAccessLogForPatient - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetAccessLogForPatient**

## Logical Model: GetAccessLogForPatient 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-access-log | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMAccessLog |

 
Logisk modell för patientens åtkomstloggar hämtad via GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Krävs för 1177 Journal 1.1, 2.0 men ej för NPÖ. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-access-log)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-access-log.csv), [Excel](StructureDefinition-inera-ehds-lm-access-log.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-access-log",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-access-log",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMAccessLog",
  "title" : "GetAccessLogForPatient",
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
  "description" : "Logisk modell för patientens åtkomstloggar hämtad via GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Krävs för 1177 Journal 1.1, 2.0 men ej för NPÖ.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-access-log",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-access-log",
      "path" : "inera-ehds-lm-access-log",
      "short" : "GetAccessLogForPatient",
      "definition" : "Logisk modell för patientens åtkomstloggar hämtad via GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Krävs för 1177 Journal 1.1, 2.0 men ej för NPÖ."
    },
    {
      "id" : "inera-ehds-lm-access-log.accessLogId",
      "path" : "inera-ehds-lm-access-log.accessLogId",
      "short" : "Loggpostens identifierare",
      "definition" : "Loggpostens identifierare",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.patientId",
      "path" : "inera-ehds-lm-access-log.patientId",
      "short" : "Patientidentifierare",
      "definition" : "Patientidentifierare",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.accessTime",
      "path" : "inera-ehds-lm-access-log.accessTime",
      "short" : "Åtkomsttidpunkt (UTC)",
      "definition" : "Åtkomsttidpunkt (UTC)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.accessType",
      "path" : "inera-ehds-lm-access-log.accessType",
      "short" : "Åtkomsttyp (Läsning/Sökning)",
      "definition" : "Åtkomsttyp (Läsning/Sökning)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.accessSubType",
      "path" : "inera-ehds-lm-access-log.accessSubType",
      "short" : "Åtkomstundertyp",
      "definition" : "Åtkomstundertyp",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.accessOutcome",
      "path" : "inera-ehds-lm-access-log.accessOutcome",
      "short" : "Utfall (Beviljad/Nekad)",
      "definition" : "Utfall (Beviljad/Nekad)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.accessPurpose",
      "path" : "inera-ehds-lm-access-log.accessPurpose",
      "short" : "Åtkomstsyfte (Vård/Administration)",
      "definition" : "Åtkomstsyfte (Vård/Administration)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.userId",
      "path" : "inera-ehds-lm-access-log.userId",
      "short" : "Användarens HSA-id",
      "definition" : "Användarens HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.userRole",
      "path" : "inera-ehds-lm-access-log.userRole",
      "short" : "Användarroll",
      "definition" : "Användarroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.userOrganization",
      "path" : "inera-ehds-lm-access-log.userOrganization",
      "short" : "Användarens organisations HSA-id",
      "definition" : "Användarens organisations HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.sourceSystemHSAId",
      "path" : "inera-ehds-lm-access-log.sourceSystemHSAId",
      "short" : "Källsystem (loggkälla)",
      "definition" : "Källsystem (loggkälla)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-access-log.accessedResource",
      "path" : "inera-ehds-lm-access-log.accessedResource",
      "short" : "Resurs/tjänst som åtkoms",
      "definition" : "Resurs/tjänst som åtkoms",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
