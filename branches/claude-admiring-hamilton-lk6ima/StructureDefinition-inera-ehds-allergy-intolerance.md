# SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation)**

## Resource Profile: SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-allergy-intolerance | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSAllergyIntolerance |

 
Sekundär profil för allergier och överkänslighet från GetAlertInformation. 
Skapas ENBART när alertInformationBody = hypersensitivity. Den tillhörande IneraEHDSFlag-resursen är alltid primär och pekar på denna resurs via Flag.extension[flag-detail] (standard R4-extension; R5: supportingInfo). 
Populeras med klinisk information från hypersensitivity-blocket: 
* atcSubstance/hypersensitivityAgentCode → AllergyIntolerance.code
* degreeOfSeverity → AllergyIntolerance.reaction.severity
* degreeOfCertainty → AllergyIntolerance.verificationStatus (se ALERT-004)
* ascertainedDate → AllergyIntolerance.onsetDateTime
* alertInformationComment → AllergyIntolerance.note
* pharmaceuticalProductId → AllergyIntolerance.reaction.substance.coding (NPL-id)
 
Täcker NPÖ 2.0 och 1177 Journal 2.0. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-allergy-intolerance)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-allergy-intolerance.csv), [Excel](StructureDefinition-inera-ehds-allergy-intolerance.xlsx), [Schematron](StructureDefinition-inera-ehds-allergy-intolerance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-allergy-intolerance",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-allergy-intolerance",
  "version" : "0.1.0",
  "name" : "IneraEHDSAllergyIntolerance",
  "title" : "SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation)",
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
  "description" : "Sekundär profil för allergier och överkänslighet från GetAlertInformation.\n\nSkapas ENBART när alertInformationBody = hypersensitivity.\nDen tillhörande IneraEHDSFlag-resursen är alltid primär och pekar på denna\nresurs via Flag.extension[flag-detail] (standard R4-extension; R5: supportingInfo).\n\nPopuleras med klinisk information från hypersensitivity-blocket:\n- atcSubstance/hypersensitivityAgentCode → AllergyIntolerance.code\n- degreeOfSeverity → AllergyIntolerance.reaction.severity\n- degreeOfCertainty → AllergyIntolerance.verificationStatus (se ALERT-004)\n- ascertainedDate → AllergyIntolerance.onsetDateTime\n- alertInformationComment → AllergyIntolerance.note\n- pharmaceuticalProductId → AllergyIntolerance.reaction.substance.coding (NPL-id)\n\nTäcker NPÖ 2.0 och 1177 Journal 2.0.",
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
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AllergyIntolerance",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "AllergyIntolerance",
      "path" : "AllergyIntolerance"
    },
    {
      "id" : "AllergyIntolerance.meta.source",
      "path" : "AllergyIntolerance.meta.source",
      "short" : "Källsystem HSA-id (alertInformationHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.clinicalStatus",
      "path" : "AllergyIntolerance.clinicalStatus",
      "short" : "Alltid 'active' – härledd; inget statusfält i TKBn",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.verificationStatus",
      "path" : "AllergyIntolerance.verificationStatus",
      "short" : "Visshet (alertInformationBody.hypersensitivity.degreeOfCertainty → ConceptMap till verificationStatus); se ALERT-004",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.type",
      "path" : "AllergyIntolerance.type",
      "short" : "Alltid 'allergy' – härledd av att body = hypersensitivity"
    },
    {
      "id" : "AllergyIntolerance.code",
      "path" : "AllergyIntolerance.code",
      "short" : "Agens/substans:\n- pharmaceuticalHypersensitivity.atcSubstance → code.coding (ATC, primär)\n- pharmaceuticalHypersensitivity.nonATCSubstance → code.text\n- otherHypersensitivity.hypersensitivityAgentCode → code.coding\n- otherHypersensitivity.hypersensitivityAgent → code.text",
      "min" : 1
    },
    {
      "id" : "AllergyIntolerance.patient",
      "path" : "AllergyIntolerance.patient",
      "short" : "Patient (alertInformationHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "AllergyIntolerance.onset[x]",
      "path" : "AllergyIntolerance.onset[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "AllergyIntolerance.onset[x]:onsetDateTime",
      "path" : "AllergyIntolerance.onset[x]",
      "sliceName" : "onsetDateTime",
      "short" : "Datum för konstaterande (alertInformationBody.ascertainedDate)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support",
          "valueBoolean" : true
        }],
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.recordedDate",
      "path" : "AllergyIntolerance.recordedDate",
      "short" : "Registreringstidpunkt (alertInformationHeader.accountableHealthcareProfessional.authorTime)",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.recorder",
      "path" : "AllergyIntolerance.recorder",
      "short" : "Dokumentationsansvarig (alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.asserter",
      "path" : "AllergyIntolerance.asserter",
      "short" : "Juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.note",
      "path" : "AllergyIntolerance.note",
      "short" : "Kommentar (alertInformationBody.alertInformationComment)",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction",
      "path" : "AllergyIntolerance.reaction",
      "short" : "Reaktionsinformation (delar av hypersensitivity)"
    },
    {
      "id" : "AllergyIntolerance.reaction.substance",
      "path" : "AllergyIntolerance.reaction.substance",
      "short" : "Läkemedelsprodukt (pharmaceuticalHypersensitivity.pharmaceuticalProductId → reaction.substance.coding med NPL-id)",
      "mustSupport" : true
    },
    {
      "id" : "AllergyIntolerance.reaction.severity",
      "path" : "AllergyIntolerance.reaction.severity",
      "short" : "Allvarlighetsgrad (hypersensitivity.degreeOfSeverity → ConceptMap till reaction.severity)"
    }]
  }
}

```
