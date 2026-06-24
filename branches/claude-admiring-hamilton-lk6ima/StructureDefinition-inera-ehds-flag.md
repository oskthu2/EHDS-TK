# SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)**

## Resource Profile: SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-flag | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSFlag |

 
Primär profil för ALL uppmärksamhetsinformation från GetAlertInformation (clinicalprocess:healthcond:description v2.0). 
Varje alertInformation-post ger alltid en Flag-resurs. Om typeOfAlertInformation anger allergi/överkänslighet (body = hypersensitivity) skapas dessutom en IneraEHDSAllergyIntolerance-resurs som pekas ut via extension[flag-detail] (standard R4-extension; kallas supportingInfo i R5). 
Body-strukturen är XOR: exakt en av hypersensitivity, seriousDisease, treatment, communicableDisease, restrictionOfCare, unstructuredAlertInformation anges per post. 
Flag.category[alertType] = typeOfAlertInformation (obligatorisk). Flag.category[hypersensitivityType] = typeOfHypersensitivity (när body = hypersensitivity). Flag.code = den kliniska koden specifik för body-typen. 
Täcker NPÖ 2.0 och 1177 Journal 2.0. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-flag)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-flag.csv), [Excel](StructureDefinition-inera-ehds-flag.xlsx), [Schematron](StructureDefinition-inera-ehds-flag.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-flag",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-flag",
  "version" : "0.1.0",
  "name" : "IneraEHDSFlag",
  "title" : "SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)",
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
  "description" : "Primär profil för ALL uppmärksamhetsinformation från GetAlertInformation\n(clinicalprocess:healthcond:description v2.0).\n\nVarje alertInformation-post ger alltid en Flag-resurs.\nOm typeOfAlertInformation anger allergi/överkänslighet (body = hypersensitivity)\nskapas dessutom en IneraEHDSAllergyIntolerance-resurs som pekas ut via\nextension[flag-detail] (standard R4-extension; kallas supportingInfo i R5).\n\nBody-strukturen är XOR: exakt en av hypersensitivity, seriousDisease, treatment,\ncommunicableDisease, restrictionOfCare, unstructuredAlertInformation anges per post.\n\nFlag.category[alertType]           = typeOfAlertInformation (obligatorisk).\nFlag.category[hypersensitivityType] = typeOfHypersensitivity (när body = hypersensitivity).\nFlag.code                           = den kliniska koden specifik för body-typen.\n\nTäcker NPÖ 2.0 och 1177 Journal 2.0.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  "type" : "Flag",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Flag",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Flag",
      "path" : "Flag"
    },
    {
      "id" : "Flag.meta.source",
      "path" : "Flag.meta.source",
      "short" : "Källsystem HSA-id (alertInformationHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "Flag.meta.security",
      "path" : "Flag.meta.security",
      "short" : "PDL-kontroll (alertInformationHeader.approvedForPatient) – se PDL-001",
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension",
      "path" : "Flag.extension",
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
      "id" : "Flag.extension:flagDetail",
      "path" : "Flag.extension",
      "sliceName" : "flagDetail",
      "short" : "Referens till AllergyIntolerance när body = hypersensitivity (R4: flag-detail; R5: supportingInfo)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/flag-detail"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:alertInformationComment",
      "path" : "Flag.extension",
      "sliceName" : "alertInformationComment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-information-comment"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:alertAscertainedDate",
      "path" : "Flag.extension",
      "sliceName" : "alertAscertainedDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-ascertained-date"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:alertVerifiedTime",
      "path" : "Flag.extension",
      "sliceName" : "alertVerifiedTime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-verified-time"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:alertAssertedDate",
      "path" : "Flag.extension",
      "sliceName" : "alertAssertedDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserted-date"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:alertAsserter",
      "path" : "Flag.extension",
      "sliceName" : "alertAsserter",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserter"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:relatedAlertInformation",
      "path" : "Flag.extension",
      "sliceName" : "relatedAlertInformation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/related-alert-information"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:degreeOfSeverity",
      "path" : "Flag.extension",
      "sliceName" : "degreeOfSeverity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-severity"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:degreeOfCertainty",
      "path" : "Flag.extension",
      "sliceName" : "degreeOfCertainty",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-certainty"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:pharmaceuticalHypersensitivity",
      "path" : "Flag.extension",
      "sliceName" : "pharmaceuticalHypersensitivity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-hypersensitivity"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:treatmentDescription",
      "path" : "Flag.extension",
      "sliceName" : "treatmentDescription",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-treatment-description"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:pharmaceuticalTreatment",
      "path" : "Flag.extension",
      "sliceName" : "pharmaceuticalTreatment",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-treatment"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:routeOfTransmission",
      "path" : "Flag.extension",
      "sliceName" : "routeOfTransmission",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-route-of-transmission"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.extension:restrictionOfCareComment",
      "path" : "Flag.extension",
      "sliceName" : "restrictionOfCareComment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-restriction-of-care-comment"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.identifier",
      "path" : "Flag.identifier",
      "short" : "Dokumentidentifierare (alertInformationHeader.documentId)",
      "mustSupport" : true
    },
    {
      "id" : "Flag.status",
      "path" : "Flag.status",
      "short" : "Alltid 'active' – inget statusfält i TKBn; returnerade poster är per definition aktiva",
      "mustSupport" : true
    },
    {
      "id" : "Flag.category",
      "path" : "Flag.category",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Flag.category:alertType",
      "path" : "Flag.category",
      "sliceName" : "alertType",
      "short" : "Uppmärksamhetstyp (alertInformationBody.typeOfAlertInformation)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Flag.category:hypersensitivityType",
      "path" : "Flag.category",
      "sliceName" : "hypersensitivityType",
      "short" : "Precisering av överkänslighetstyp (alertInformationBody.hypersensitivity.typeOfHypersensitivity)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Flag.code",
      "path" : "Flag.code",
      "short" : "Klinisk kod per body-typ (XOR):\nhypersensitivity: atcSubstance (code.coding) eller hypersensitivityAgentCode (code.coding);\n  fritext i code.text (nonATCSubstance / hypersensitivityAgent)\nseriousDisease: seriousDisease.disease (ICD10/SNOMED)\ntreatment: treatment.treatmentCode (KVÅ); tomt CodeableConcept om enbart treatmentDescription\ncommunicableDisease: communicableDiseaseCode (ICD10)\nunstructuredAlertInformation: unstructuredAlertInformationHeading som code.text\nrestrictionOfCare: ingen strukturerad kod; tomt CodeableConcept",
      "mustSupport" : true
    },
    {
      "id" : "Flag.subject",
      "path" : "Flag.subject",
      "short" : "Patient (alertInformationHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Flag.period",
      "path" : "Flag.period",
      "mustSupport" : true
    },
    {
      "id" : "Flag.period.start",
      "path" : "Flag.period.start",
      "short" : "Giltighet från (alertInformationBody.validityTimePeriod.start)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Flag.period.end",
      "path" : "Flag.period.end",
      "short" : "Giltighet till: validityTimePeriod.end (planerat slut) eller obsoleteTime (faktisk inaktivering) – det minsta av dessa",
      "mustSupport" : true
    },
    {
      "id" : "Flag.encounter",
      "path" : "Flag.encounter",
      "short" : "Kopplad vårdkontakt (alertInformationHeader.careContactId)",
      "mustSupport" : true
    },
    {
      "id" : "Flag.author",
      "path" : "Flag.author",
      "short" : "Ansvarig hälso- och sjukvårdspersonal (alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    }]
  }
}

```
