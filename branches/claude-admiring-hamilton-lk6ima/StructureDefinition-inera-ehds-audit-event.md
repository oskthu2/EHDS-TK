# SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient)**

## Resource Profile: SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-audit-event | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSAuditEvent |

 
Profil för åtkomstloggar mappat från RIVTA-tjänstekontraktet GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Täcker 1177 Journal 1.1, 2.0. Krävs ej för NPÖ. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-audit-event)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-audit-event.csv), [Excel](StructureDefinition-inera-ehds-audit-event.xlsx), [Schematron](StructureDefinition-inera-ehds-audit-event.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-audit-event",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-audit-event",
  "version" : "0.1.0",
  "name" : "IneraEHDSAuditEvent",
  "title" : "SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient)",
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
  "description" : "Profil för åtkomstloggar mappat från RIVTA-tjänstekontraktet GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Täcker 1177 Journal 1.1, 2.0. Krävs ej för NPÖ.",
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
    "identity" : "dicom",
    "uri" : "http://nema.org/dicom",
    "name" : "DICOM Tag Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "w3c.prov",
    "uri" : "http://www.w3.org/ns/prov",
    "name" : "W3C PROV"
  },
  {
    "identity" : "fhirprovenance",
    "uri" : "http://hl7.org/fhir/provenance",
    "name" : "FHIR Provenance Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AuditEvent",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/AuditEvent",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "AuditEvent",
      "path" : "AuditEvent"
    },
    {
      "id" : "AuditEvent.type",
      "path" : "AuditEvent.type",
      "short" : "Händelsetyp (accessType)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.subtype",
      "path" : "AuditEvent.subtype",
      "short" : "Händelseundertyp (accessSubType)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.action",
      "path" : "AuditEvent.action",
      "short" : "Åtgärd (R=Read)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.recorded",
      "path" : "AuditEvent.recorded",
      "short" : "Loggtidpunkt (accessTime)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.outcome",
      "path" : "AuditEvent.outcome",
      "short" : "Utfall (accessOutcome)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent",
      "path" : "AuditEvent.agent",
      "short" : "Aktörer i loggposten",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.who",
      "path" : "AuditEvent.agent.who",
      "short" : "Användare/system (userId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Device"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.requestor",
      "path" : "AuditEvent.agent.requestor",
      "short" : "Är aktören den som initierade händelsen",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.purposeOfUse",
      "path" : "AuditEvent.agent.purposeOfUse",
      "short" : "Åtkomstsyfte (accessPurpose)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.source",
      "path" : "AuditEvent.source",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.source.observer",
      "path" : "AuditEvent.source.observer",
      "short" : "Loggkälla/system (sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity",
      "path" : "AuditEvent.entity",
      "short" : "Objekt/patient som åtkomsten gäller",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity.what",
      "path" : "AuditEvent.entity.what",
      "short" : "Patientidentifierare (patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity.role",
      "path" : "AuditEvent.entity.role",
      "short" : "Objektets roll i händelsen",
      "mustSupport" : true
    }]
  }
}

```
