# SE EHDS Condition – Diagnos (GetDiagnosis) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Condition – Diagnos (GetDiagnosis)**

## Resource Profile: SE EHDS Condition – Diagnos (GetDiagnosis) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-condition-diagnosis | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSConditionDiagnosis |

 
Profil för diagnos/problem mappat från RIVTA-tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-condition-diagnosis)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-condition-diagnosis.csv), [Excel](StructureDefinition-inera-ehds-condition-diagnosis.xlsx), [Schematron](StructureDefinition-inera-ehds-condition-diagnosis.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-condition-diagnosis",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-condition-diagnosis",
  "version" : "0.1.0",
  "name" : "IneraEHDSConditionDiagnosis",
  "title" : "SE EHDS Condition – Diagnos (GetDiagnosis)",
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
  "description" : "Profil för diagnos/problem mappat från RIVTA-tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0.",
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
      "short" : "Källsystem HSA-id (diagnosisHeader.sourceSystemHSAId) – urn:oid:1.2.752.129.2.1.4.1#{hsaId}",
      "mustSupport" : true
    },
    {
      "id" : "Condition.extension",
      "path" : "Condition.extension",
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
      "id" : "Condition.extension:assertedDate",
      "path" : "Condition.extension",
      "sliceName" : "assertedDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/condition-assertedDate"]
      }],
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
      "short" : "Alltid confirmed (RIVTA-svar representerar bekräftade journaluppgifter)",
      "mustSupport" : true
    },
    {
      "id" : "Condition.category",
      "path" : "Condition.category",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "coding.system"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Condition.category:diagnostyp",
      "path" : "Condition.category",
      "sliceName" : "diagnostyp",
      "short" : "Diagnostyp (diagnosisBody.typeOfDiagnosis) – HD (Huvuddiagnos) eller BY (Bidiagnos)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Condition.category:diagnostyp.coding",
      "path" : "Condition.category.coding",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Condition.category:diagnostyp.coding.system",
      "path" : "Condition.category.coding.system",
      "min" : 1,
      "patternUri" : "https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp"
    },
    {
      "id" : "Condition.category:diagnostyp.coding.code",
      "path" : "Condition.category.coding.code",
      "min" : 1
    },
    {
      "id" : "Condition.code",
      "path" : "Condition.code",
      "short" : "Diagnoskod (diagnosisBody.diagnosisCode)"
    },
    {
      "id" : "Condition.code.coding",
      "path" : "Condition.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Condition.code.coding:ICD10SE",
      "path" : "Condition.code.coding",
      "sliceName" : "ICD10SE",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:ICD10SE.system",
      "path" : "Condition.code.coding.system",
      "min" : 1,
      "patternUri" : "https://www.icd10.se/"
    },
    {
      "id" : "Condition.code.coding:ICD10SE.code",
      "path" : "Condition.code.coding.code",
      "short" : "ICD-10-SE kod (diagnosisBody.diagnosisCode.code)"
    },
    {
      "id" : "Condition.code.coding:ICD10SE.display",
      "path" : "Condition.code.coding.display",
      "short" : "Kodbenämning (diagnosisBody.diagnosisCode.displayName)"
    },
    {
      "id" : "Condition.code.text",
      "path" : "Condition.code.text",
      "short" : "Fritext (diagnosisBody.diagnosisCode.originalText) – fallback: displayName"
    },
    {
      "id" : "Condition.subject",
      "path" : "Condition.subject",
      "short" : "Patient (diagnosisHeader.patientId) – OID→URI för personnummer/samordningsnummer",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "Condition.onset[x]",
      "path" : "Condition.onset[x]",
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
      "id" : "Condition.onset[x]:onsetDateTime",
      "path" : "Condition.onset[x]",
      "sliceName" : "onsetDateTime",
      "short" : "Bedömningstidpunkt (diagnosisBody.diagnosisTime) – YYYYMMDDHHMMSS → ISO 8601",
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
      "id" : "Condition.recordedDate",
      "path" : "Condition.recordedDate",
      "short" : "Registreringstidpunkt (diagnosisHeader.accountableHealthcareProfessional.authorTime) – YYYYMMDDHHMMSS → ISO 8601",
      "mustSupport" : true
    },
    {
      "id" : "Condition.recorder",
      "path" : "Condition.recorder",
      "short" : "Ansvarig personal (diagnosisHeader.accountableHealthcareProfessional) – logisk referens via HSA-id",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.asserter",
      "path" : "Condition.asserter",
      "short" : "Rättslig äkthetsintygsgivare (diagnosisHeader.legalAuthenticator) – logisk referens via HSA-id",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    }]
  }
}

```
