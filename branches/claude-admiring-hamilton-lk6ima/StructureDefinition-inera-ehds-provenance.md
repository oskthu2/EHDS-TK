# SE EHDS Provenance - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Provenance**

## Resource Profile: SE EHDS Provenance 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-provenance | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSProvenance |

 
Provenance-profil för EHDS-TK. Varje klinisk resurs åtföljs av en Provenance med två agenter som speglar spärr-hierarkin enligt PDL: 
* custodian (yttre Sparr) — den juridiskt ansvariga vårdgivaren
* author (inre Sparr) — den informationsägande vårdenheten
 
OBS: Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering baserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver Provenance-agenterna för spärr och `meta.security` för `approvedForPatient` inte inkluderas i svaret — filtreringen sker då redan på servernivå. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-provenance)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-provenance.csv), [Excel](StructureDefinition-inera-ehds-provenance.xlsx), [Schematron](StructureDefinition-inera-ehds-provenance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-provenance",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-provenance",
  "version" : "0.1.0",
  "name" : "IneraEHDSProvenance",
  "title" : "SE EHDS Provenance",
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
  "description" : "Provenance-profil för EHDS-TK. Varje klinisk resurs åtföljs av en Provenance\nmed två agenter som speglar spärr-hierarkin enligt PDL:\n- custodian (yttre Sparr) — den juridiskt ansvariga vårdgivaren\n- author (inre Sparr) — den informationsägande vårdenheten\n\nOBS: Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering\nbaserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver\nProvenance-agenterna för spärr och `meta.security` för `approvedForPatient` inte\ninkluderas i svaret — filtreringen sker då redan på servernivå.",
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
    "identity" : "w3c.prov",
    "uri" : "http://www.w3.org/ns/prov",
    "name" : "W3C PROV"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "fhirauditevent",
    "uri" : "http://hl7.org/fhir/auditevent",
    "name" : "FHIR AuditEvent Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Provenance",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Provenance",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Provenance",
      "path" : "Provenance"
    },
    {
      "id" : "Provenance.target",
      "path" : "Provenance.target",
      "short" : "Referens till resursen som Provenance gäller",
      "mustSupport" : true
    },
    {
      "id" : "Provenance.recorded",
      "path" : "Provenance.recorded",
      "short" : "Tidpunkt för dokumentation (documentTime från RIVTA, UTC ISO 8601)",
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent",
      "path" : "Provenance.agent",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type.coding.code"
        }],
        "rules" : "open"
      },
      "min" : 2,
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent:custodian",
      "path" : "Provenance.agent",
      "sliceName" : "custodian",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent:custodian.type",
      "path" : "Provenance.agent.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
          "code" : "custodian"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent:custodian.who",
      "path" : "Provenance.agent.who",
      "short" : "Vårdgivare (careProviderHSAId / accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId) – yttre Sparr",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent:author",
      "path" : "Provenance.agent",
      "sliceName" : "author",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent:author.type",
      "path" : "Provenance.agent.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
          "code" : "author"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Provenance.agent:author.who",
      "path" : "Provenance.agent.who",
      "short" : "Vårdenhet (careUnitHSAId / accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId) – inre Sparr",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    }]
  }
}

```
