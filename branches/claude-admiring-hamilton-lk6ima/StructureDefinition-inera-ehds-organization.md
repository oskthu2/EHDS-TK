# SE EHDS Organization – Organisationsenhet - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Organization – Organisationsenhet**

## Resource Profile: SE EHDS Organization – Organisationsenhet 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-organization | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSOrganization |

 
Profil för organisationsenheter i EHDS-TK-mappningar (vårdenheter, juridiska vårdgivare m.fl.). 
Identifier-slicen ger stöd för HSA-id och SMI-id (Folkhälsomyndighetens id för vaccinationsenheter i det nationella vaccinationsregistret). Namn, kontaktuppgifter och adress mappar fält som annars inte har plats i resurserna de refereras ifrån. 

**Användningar:**

* Referera till denna Profil: [SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)](StructureDefinition-inera-ehds-immunization.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-organization.csv), [Excel](StructureDefinition-inera-ehds-organization.xlsx), [Schematron](StructureDefinition-inera-ehds-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-organization",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-organization",
  "version" : "0.1.0",
  "name" : "IneraEHDSOrganization",
  "title" : "SE EHDS Organization – Organisationsenhet",
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
  "description" : "Profil för organisationsenheter i EHDS-TK-mappningar (vårdenheter, juridiska vårdgivare m.fl.).\n\nIdentifier-slicen ger stöd för HSA-id och SMI-id (Folkhälsomyndighetens\nid för vaccinationsenheter i det nationella vaccinationsregistret).\nNamn, kontaktuppgifter och adress mappar fält som annars inte har plats\ni resurserna de refereras ifrån.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization"
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:hsaId",
      "path" : "Organization.identifier",
      "sliceName" : "hsaId",
      "short" : "HSA-id för organisationsenhet (orgUnitHSAId)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:hsaId.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "urn:oid:1.2.752.129.2.1.4.1"
    },
    {
      "id" : "Organization.identifier:hsaId.value",
      "path" : "Organization.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:smiId",
      "path" : "Organization.identifier",
      "sliceName" : "smiId",
      "short" : "SMI-id / Verksamhetsid från Folkhälsomyndighetens vaccinationsregister (careUnitSmiId). OID behöver verifieras – se VAC-006.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:smiId.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "urn:oid:1.2.752.194.10.1.1"
    },
    {
      "id" : "Organization.identifier:smiId.value",
      "path" : "Organization.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "short" : "Organisationsenhetens namn (orgUnitName)",
      "mustSupport" : true
    },
    {
      "id" : "Organization.telecom",
      "path" : "Organization.telecom",
      "short" : "Telefon/e-post för organisationsenhet (orgUnitTelecom / orgUnitEmail)",
      "mustSupport" : true
    },
    {
      "id" : "Organization.address",
      "path" : "Organization.address",
      "mustSupport" : true
    },
    {
      "id" : "Organization.address.line",
      "path" : "Organization.address.line",
      "short" : "Gatuadress (orgUnitAddress)",
      "mustSupport" : true
    },
    {
      "id" : "Organization.address.city",
      "path" : "Organization.address.city",
      "short" : "Ort/plats (orgUnitLocation)",
      "mustSupport" : true
    }]
  }
}

```
