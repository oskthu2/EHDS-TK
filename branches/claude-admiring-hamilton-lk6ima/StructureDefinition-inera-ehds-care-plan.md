# SE EHDS CarePlan – Vårdplan (GetCarePlans) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS CarePlan – Vårdplan (GetCarePlans)**

## Resource Profile: SE EHDS CarePlan – Vårdplan (GetCarePlans) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-care-plan | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSCarePlan |

 
Profil för vård- och omsorgsplaner mappat från RIVTA-tjänstekontraktet GetCarePlans (clinicalprocess:logistics:logistics v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-care-plan)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-care-plan.csv), [Excel](StructureDefinition-inera-ehds-care-plan.xlsx), [Schematron](StructureDefinition-inera-ehds-care-plan.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-care-plan",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-care-plan",
  "version" : "0.1.0",
  "name" : "IneraEHDSCarePlan",
  "title" : "SE EHDS CarePlan – Vårdplan (GetCarePlans)",
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
  "description" : "Profil för vård- och omsorgsplaner mappat från RIVTA-tjänstekontraktet GetCarePlans (clinicalprocess:logistics:logistics v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0.",
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
  "type" : "CarePlan",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CarePlan",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "CarePlan",
      "path" : "CarePlan"
    },
    {
      "id" : "CarePlan.meta.source",
      "path" : "CarePlan.meta.source",
      "short" : "Källsystem HSA-id (sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.extension",
      "path" : "CarePlan.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "CarePlan.extension:approvedForPatient",
      "path" : "CarePlan.extension",
      "sliceName" : "approvedForPatient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/approved-for-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.identifier",
      "path" : "CarePlan.identifier",
      "short" : "Planens identitet inom källsystemet (documentId)",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.status",
      "path" : "CarePlan.status",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.intent",
      "path" : "CarePlan.intent",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.category",
      "path" : "CarePlan.category",
      "short" : "Typ av vård- och omsorgsplan (typeOfCarePlan)",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/typeofcareplan-vs"
      }
    },
    {
      "id" : "CarePlan.title",
      "path" : "CarePlan.title",
      "short" : "Rubrik för planen (documentTitle) – obligatorisk",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.subject",
      "path" : "CarePlan.subject",
      "short" : "Patient (patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.created",
      "path" : "CarePlan.created",
      "short" : "Tidpunkt då planen upprättades (documentTime)",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.author",
      "path" : "CarePlan.author",
      "short" : "Ansvarig personal (accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.note",
      "path" : "CarePlan.note",
      "short" : "Innehåll i planen (content – text/plain, text/html). Stödda MIME-typer: text/plain, text/html, image/jpeg, image/png, image/tiff, application/pdf. Binärt innehåll (base64/URL) kräver extension. content.id är 0..0 (N/A) per TKB. Binärdata max 100 KB per post.",
      "mustSupport" : true
    }]
  }
}

```
