# GetRequestActivities - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetRequestActivities**

## Logical Model: GetRequestActivities 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-request-activities | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMRequestActivities |

 
Logisk modell för remisstatus och processaktiviteter hämtad via GetRequestActivities (crm:requeststatus v2.0). 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-request-activities)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-request-activities.csv), [Excel](StructureDefinition-inera-ehds-lm-request-activities.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-request-activities",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-request-activities",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMRequestActivities",
  "title" : "GetRequestActivities",
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
  "description" : "Logisk modell för remisstatus och processaktiviteter hämtad via GetRequestActivities (crm:requeststatus v2.0).",
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
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-request-activities",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-request-activities",
      "path" : "inera-ehds-lm-request-activities",
      "short" : "GetRequestActivities",
      "definition" : "Logisk modell för remisstatus och processaktiviteter hämtad via GetRequestActivities (crm:requeststatus v2.0)."
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestHeader",
      "path" : "inera-ehds-lm-request-activities.requestHeader",
      "short" : "Header med metadata",
      "definition" : "Header med metadata",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestHeader.patientId",
      "path" : "inera-ehds-lm-request-activities.requestHeader.patientId",
      "short" : "Patientidentifierare",
      "definition" : "Patientidentifierare",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestHeader.sourceSystemHSAId",
      "path" : "inera-ehds-lm-request-activities.requestHeader.sourceSystemHSAId",
      "short" : "Källsystemets HSA-id",
      "definition" : "Källsystemets HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestHeader.documentTime",
      "path" : "inera-ehds-lm-request-activities.requestHeader.documentTime",
      "short" : "Registreringstidpunkt",
      "definition" : "Registreringstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestHeader.careProviderHSAId",
      "path" : "inera-ehds-lm-request-activities.requestHeader.careProviderHSAId",
      "short" : "Vårdgivarens HSA-id",
      "definition" : "Vårdgivarens HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestHeader.careUnitHSAId",
      "path" : "inera-ehds-lm-request-activities.requestHeader.careUnitHSAId",
      "short" : "Vårdenhetens HSA-id",
      "definition" : "Vårdenhetens HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestId",
      "path" : "inera-ehds-lm-request-activities.requestId",
      "short" : "Remissidentifierare (koppling till remiss)",
      "definition" : "Remissidentifierare (koppling till remiss)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestStatus",
      "path" : "inera-ehds-lm-request-activities.requestStatus",
      "short" : "Remisstatus (kv_requestStatus)",
      "definition" : "Remisstatus (kv_requestStatus)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.requestReceiver",
      "path" : "inera-ehds-lm-request-activities.requestReceiver",
      "short" : "Mottagande enhets HSA-id",
      "definition" : "Mottagande enhets HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.activityType",
      "path" : "inera-ehds-lm-request-activities.activityType",
      "short" : "Aktivitetstyp",
      "definition" : "Aktivitetstyp",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.activityTime",
      "path" : "inera-ehds-lm-request-activities.activityTime",
      "short" : "Aktivitetstidpunkt",
      "definition" : "Aktivitetstidpunkt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-request-activities.activityComment",
      "path" : "inera-ehds-lm-request-activities.activityComment",
      "short" : "Aktivitetsbeskrivning/kommentar",
      "definition" : "Aktivitetsbeskrivning/kommentar",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
