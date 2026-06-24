# GetLaboratoryOrderOutcome - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetLaboratoryOrderOutcome**

## Logical Model: GetLaboratoryOrderOutcome 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-laboratory-order-outcome | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMLaboratoryOrderOutcome |

 
Logisk modell för tjänstekontraktet GetLaboratoryOrderOutcome (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetLaboratoryOrderOutcome:4). Representerar responsens informationsstruktur — multidisciplinära laboratoriesvar för en patient. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-laboratory-order-outcome)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.csv), [Excel](StructureDefinition-inera-ehds-lm-laboratory-order-outcome.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-laboratory-order-outcome",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-laboratory-order-outcome",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMLaboratoryOrderOutcome",
  "title" : "GetLaboratoryOrderOutcome",
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
  "description" : "Logisk modell för tjänstekontraktet GetLaboratoryOrderOutcome\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetLaboratoryOrderOutcome:4).\nRepresenterar responsens informationsstruktur — multidisciplinära laboratoriesvar\nför en patient.",
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
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-laboratory-order-outcome",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-laboratory-order-outcome",
      "path" : "inera-ehds-lm-laboratory-order-outcome",
      "short" : "GetLaboratoryOrderOutcome",
      "definition" : "Logisk modell för tjänstekontraktet GetLaboratoryOrderOutcome\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetLaboratoryOrderOutcome:4).\nRepresenterar responsens informationsstruktur — multidisciplinära laboratoriesvar\nför en patient."
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome",
      "short" : "Laboratoriesvar (ett per beställning)",
      "definition" : "En labbeställning med tillhörande svar. Kardinalitet: Valfri, lista.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header",
      "short" : "Header med åtkomstkontroll och metadata",
      "definition" : "Header med åtkomstkontroll och metadata",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader",
      "short" : "Åtkomstkontrollhuvud (PDL)",
      "definition" : "Åtkomstkontrollhuvud (PDL)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.accountableCareGiver",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.accountableCareGiver",
      "short" : "Ansvarig vårdgivare (HSA-id)",
      "definition" : "HSA-id för den vårdgivare som är ansvarig för posten. Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.accountableCareUnit",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.accountableCareUnit",
      "short" : "Ansvarig vårdenhet (HSA-id)",
      "definition" : "HSA-id för den vårdenhet som är ansvarig för posten. Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.patientId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.patientId",
      "short" : "Patientens id i svaret",
      "definition" : "Patientens id i svaret",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.originalPatientId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.originalPatientId",
      "short" : "Ursprungligt patient-id",
      "definition" : "Ursprungligt patient-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.careProcessId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.careProcessId",
      "short" : "Vårdprocessid (UUID)",
      "definition" : "Vårdprocessid (UUID)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.blockComparisonTime",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.blockComparisonTime",
      "short" : "Tidpunkt för spärrkontroll",
      "definition" : "Tidpunkt för spärrkontroll",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.approvedForPatient",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.accessControlHeader.approvedForPatient",
      "short" : "Godkänd för patientvisning",
      "definition" : "Anger om informationsägaren godkänt att patienten kan ta del av informationen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.sourceSystemId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.sourceSystemId",
      "short" : "Källsystemets HSA-id",
      "definition" : "Källsystemets HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.record",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.record",
      "short" : "Poststatus och tidpunkt",
      "definition" : "Poststatus och tidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.record.recordId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.record.recordId",
      "short" : "Postens unika id",
      "definition" : "Postens unika id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.record.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.record.timestamp",
      "short" : "Tidpunkt för posten",
      "definition" : "Tidpunkt för posten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author",
      "short" : "Dokumentationsansvarig",
      "definition" : "Dokumentationsansvarig",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.authorId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.authorId",
      "short" : "Författarens HSA-id",
      "definition" : "Författarens HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.name",
      "short" : "Författarens namn",
      "definition" : "Författarens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.timestamp",
      "short" : "Tidpunkt för dokumentation",
      "definition" : "Tidpunkt för dokumentation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.byRole",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.byRole",
      "short" : "Yrkesroll vid dokumentation",
      "definition" : "Yrkesroll vid dokumentation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.orgUnit",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.orgUnit",
      "short" : "Organisationsenhet",
      "definition" : "Organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.orgUnit.orgUnitId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.orgUnit.orgUnitId",
      "short" : "OrgUnit HSA-id",
      "definition" : "OrgUnit HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.orgUnit.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.author.orgUnit.name",
      "short" : "OrgUnit namn",
      "definition" : "OrgUnit namn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature",
      "short" : "Signatär",
      "definition" : "Signatär",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.signatureId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.signatureId",
      "short" : "Signatärens HSA-id",
      "definition" : "Signatärens HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.name",
      "short" : "Signatärens namn",
      "definition" : "Signatärens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.timestamp",
      "short" : "Signeringstidpunkt",
      "definition" : "Signeringstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.byRole",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.header.signature.byRole",
      "short" : "Yrkesroll vid signering",
      "definition" : "Yrkesroll vid signering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body",
      "short" : "Beställnings- och svarsinformation",
      "definition" : "Beställnings- och svarsinformation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.identifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.identifier",
      "short" : "Beställningens unika id",
      "definition" : "Beställningens unika id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.laboratoryIdentifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.laboratoryIdentifier",
      "short" : "Laboratoriets beställningsnummer",
      "definition" : "Laboratoriets beställningsnummer",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.type",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.type",
      "short" : "Typ av laboratoriebeställning",
      "definition" : "Typ av laboratoriebeställning",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.text",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.text",
      "short" : "Fritext om beställningen",
      "definition" : "Fritext om beställningen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral",
      "short" : "Kopplad remiss",
      "definition" : "Kopplad remiss",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.identifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.identifier",
      "short" : "Remissens id",
      "definition" : "Remissens id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.timestamp",
      "short" : "Remissens tidpunkt",
      "definition" : "Remissens tidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.version",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.version",
      "short" : "Remissversion",
      "definition" : "Remissversion",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.question",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.question",
      "short" : "Frågeställning i remissen",
      "definition" : "Frågeställning i remissen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requestedCareService",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requestedCareService",
      "short" : "Begärd vårdtjänst",
      "definition" : "Begärd vårdtjänst",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester",
      "short" : "Remittent",
      "definition" : "Remittent",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.requesterId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.requesterId",
      "short" : "Remittentens HSA-id",
      "definition" : "Remittentens HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.name",
      "short" : "Remittentens namn",
      "definition" : "Remittentens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.byRole",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.byRole",
      "short" : "Remittentens yrkesroll",
      "definition" : "Remittentens yrkesroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.orgUnit",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.orgUnit",
      "short" : "Remittentens org-enhet",
      "definition" : "Remittentens org-enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.orgUnit.orgUnitId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.orgUnit.orgUnitId",
      "short" : "OrgUnit HSA-id",
      "definition" : "OrgUnit HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.orgUnit.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.requester.orgUnit.name",
      "short" : "OrgUnit namn",
      "definition" : "OrgUnit namn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.referralInformation",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.referralInformation",
      "short" : "Remissinformation",
      "definition" : "Remissinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.referralInformation.referralComment",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.referralInformation.referralComment",
      "short" : "Remisskommentar",
      "definition" : "Remisskommentar",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.referralInformation.referralMedicalInformation",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.referral.referralInformation.referralMedicalInformation",
      "short" : "Medicinsk remissinformation",
      "definition" : "Medicinsk remissinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses",
      "short" : "Analysgrupp (panel)",
      "definition" : "En grupp av relaterade analyser (t.ex. ett analyspaket). Kardinalitet: Valfri, lista.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.name",
      "short" : "Gruppens namn",
      "definition" : "Gruppens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.comment",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.comment",
      "short" : "Kommentar till gruppen",
      "definition" : "Kommentar till gruppen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.code",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.code",
      "short" : "Gruppens kod",
      "definition" : "Gruppens kod",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis",
      "short" : "Enskild analys",
      "definition" : "Enskild analys",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.identifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.identifier",
      "short" : "Analysens id",
      "definition" : "Analysens id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.timestamp",
      "short" : "Tidpunkt för analysen",
      "definition" : "Tidpunkt för analysen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.code",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.code",
      "short" : "Analysens kod (t.ex. NPU)",
      "definition" : "Analysens kod (t.ex. NPU)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.method",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.method",
      "short" : "Analysmetod",
      "definition" : "Analysmetod",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.status",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.status",
      "short" : "Analysstatus",
      "definition" : "Analysstatus",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.comment",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.comment",
      "short" : "Kommentar till analysen",
      "definition" : "Kommentar till analysen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.accredited",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.accredited",
      "short" : "Ackrediterad analys",
      "definition" : "Ackrediterad analys",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen",
      "short" : "Prov",
      "definition" : "Prov",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.identifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.identifier",
      "short" : "Provnummer",
      "definition" : "Provnummer",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.material",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.material",
      "short" : "Provmaterial",
      "definition" : "Provmaterial",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.timestamp",
      "short" : "Provtagningstidpunkt",
      "definition" : "Provtagningstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.anatomicalLocation",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.anatomicalLocation",
      "short" : "Anatomisk plats",
      "definition" : "Anatomisk plats",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.comment",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.comment",
      "short" : "Kommentar om provet",
      "definition" : "Kommentar om provet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity",
      "short" : "Provrelaterad aktivitet",
      "definition" : "Provrelaterad aktivitet",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.code",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.code",
      "short" : "Aktivitetskod",
      "definition" : "Aktivitetskod",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.time",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.time",
      "short" : "Aktivitetens tidsperiod",
      "definition" : "Aktivitetens tidsperiod",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.method",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.method",
      "short" : "Aktivitetsmetod",
      "definition" : "Aktivitetsmetod",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container",
      "short" : "Provbehållare",
      "definition" : "Provbehållare",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container.identifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container.identifier",
      "short" : "Behållarens id",
      "definition" : "Behållarens id",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container.type",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container.type",
      "short" : "Behållartyp",
      "definition" : "Behållartyp",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.device",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.device",
      "short" : "Mätinstrument",
      "definition" : "Mätinstrument",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.device.identifier",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.device.identifier",
      "short" : "Instrumentets id",
      "definition" : "Instrumentets id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result",
      "short" : "Analysresultat",
      "definition" : "Analysresultat",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.type",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.type",
      "short" : "Resultattyp",
      "definition" : "Resultattyp",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.value",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.value",
      "short" : "Resultatvärde (AnyValueType — se anmärkning)",
      "definition" : "ASSUME-001: AnyValueType kan innehålla PQ, string, boolean eller kodad typ.\nModellerad som string i avvaktan på mappningsverifiering. Se QUESTIONS.md.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.comment",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.comment",
      "short" : "Kommentar till resultatet",
      "definition" : "Kommentar till resultatet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.interpretation",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.interpretation",
      "short" : "Tolkning av resultatet",
      "definition" : "Tolkning av resultatet",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference",
      "short" : "Referensintervall",
      "definition" : "Referensintervall",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.interval",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.interval",
      "short" : "Referensintervall (PQIntervalType)",
      "definition" : "Referensintervall (PQIntervalType)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.description",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.description",
      "short" : "Beskrivning av referensintervall",
      "definition" : "Beskrivning av referensintervall",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.population",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.population",
      "short" : "Population för referensintervall",
      "definition" : "Population för referensintervall",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.comment",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.comment",
      "short" : "Kommentar till referensintervall",
      "definition" : "Kommentar till referensintervall",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature",
      "short" : "Mottagarsignatur",
      "definition" : "Mottagarsignatur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.signatoryId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.signatoryId",
      "short" : "Signatärens id",
      "definition" : "Signatärens id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.name",
      "short" : "Signatärens namn",
      "definition" : "Signatärens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.timestamp",
      "short" : "Signeringstidpunkt",
      "definition" : "Signeringstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.byRole",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.byRole",
      "short" : "Yrkesroll",
      "definition" : "Yrkesroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature",
      "short" : "Utförarsignatur",
      "definition" : "Utförarsignatur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.signatoryId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.signatoryId",
      "short" : "Signatärens id",
      "definition" : "Signatärens id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.name",
      "short" : "Signatärens namn",
      "definition" : "Signatärens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.timestamp",
      "short" : "Signeringstidpunkt",
      "definition" : "Signeringstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.byRole",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.byRole",
      "short" : "Yrkesroll",
      "definition" : "Yrkesroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.related",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.related",
      "short" : "Relaterade analyser",
      "definition" : "Relaterade analyser",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientUnit",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientUnit",
      "short" : "Mottagande enhet",
      "definition" : "Mottagande enhet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientUnit.unitId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientUnit.unitId",
      "short" : "Enhetens HSA-id",
      "definition" : "Enhetens HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientUnit.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientUnit.name",
      "short" : "Enhetens namn",
      "definition" : "Enhetens namn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature",
      "short" : "Beställarens signatur",
      "definition" : "Beställarens signatur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.signatoryId",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.signatoryId",
      "short" : "Signatärens id",
      "definition" : "Signatärens id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.name",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.name",
      "short" : "Signatärens namn",
      "definition" : "Signatärens namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.timestamp",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.timestamp",
      "short" : "Signeringstidpunkt",
      "definition" : "Signeringstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.byRole",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.recipientSignature.byRole",
      "short" : "Yrkesroll",
      "definition" : "Yrkesroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.contactInformation",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.contactInformation",
      "short" : "Kontaktinformation",
      "definition" : "Kontaktinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.contactInformation.text",
      "path" : "inera-ehds-lm-laboratory-order-outcome.laboratoryOrderOutcome.body.contactInformation.text",
      "short" : "Kontaktinformationstext",
      "definition" : "Kontaktinformationstext",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
