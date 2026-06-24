# SE EHDS Task – Remisstatus (GetRequestActivities) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Task – Remisstatus (GetRequestActivities)**

## Resource Profile: SE EHDS Task – Remisstatus (GetRequestActivities) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-task | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSTask |

 
Profil för remisstatus och processaktiviteter mappat från RIVTA-tjänstekontraktet GetRequestActivities (crm:requeststatus v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-task)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-task.csv), [Excel](StructureDefinition-inera-ehds-task.xlsx), [Schematron](StructureDefinition-inera-ehds-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-task",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-task",
  "version" : "0.1.0",
  "name" : "IneraEHDSTask",
  "title" : "SE EHDS Task – Remisstatus (GetRequestActivities)",
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
  "description" : "Profil för remisstatus och processaktiviteter mappat från RIVTA-tjänstekontraktet GetRequestActivities (crm:requeststatus v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Task",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Task",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task",
      "path" : "Task"
    },
    {
      "id" : "Task.meta.source",
      "path" : "Task.meta.source",
      "short" : "Källsystem HSA-id (requestHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "short" : "Aktivitetsstatus (requestStatus – kv_requestStatus)",
      "mustSupport" : true
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "mustSupport" : true
    },
    {
      "id" : "Task.code",
      "path" : "Task.code",
      "short" : "Aktivitetstyp (activityType)",
      "mustSupport" : true
    },
    {
      "id" : "Task.description",
      "path" : "Task.description",
      "short" : "Aktivitetsbeskrivning (activityComment)",
      "mustSupport" : true
    },
    {
      "id" : "Task.focus",
      "path" : "Task.focus",
      "short" : "Koppling till remiss (requestId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-service-request-referral"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "short" : "Patient (requestHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.authoredOn",
      "path" : "Task.authoredOn",
      "short" : "Registreringsdatum (requestHeader.documentTime)",
      "mustSupport" : true
    },
    {
      "id" : "Task.lastModified",
      "path" : "Task.lastModified",
      "short" : "Senaste statusändring (activityTime)",
      "mustSupport" : true
    },
    {
      "id" : "Task.owner",
      "path" : "Task.owner",
      "short" : "Mottagande enhet (requestReceiver)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    }]
  }
}

```
