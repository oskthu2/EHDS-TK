# GetCarePlans - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetCarePlans**

## Logical Model: GetCarePlans 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-care-plans | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMCarePlans |

 
Logisk modell för tjänstekontraktet GetCarePlans (RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCarePlans:2). Representerar responsens informationsstruktur (GetCarePlansResponseType). En lista med CarePlanType returneras, var och en med header- och body-element. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-care-plans)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-care-plans.csv), [Excel](StructureDefinition-inera-ehds-lm-care-plans.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-care-plans",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-care-plans",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMCarePlans",
  "title" : "GetCarePlans",
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
  "description" : "Logisk modell för tjänstekontraktet GetCarePlans\n(RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCarePlans:2).\nRepresenterar responsens informationsstruktur (GetCarePlansResponseType).\nEn lista med CarePlanType returneras, var och en med header- och body-element.",
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
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-care-plans",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-care-plans",
      "path" : "inera-ehds-lm-care-plans",
      "short" : "GetCarePlans",
      "definition" : "Logisk modell för tjänstekontraktet GetCarePlans\n(RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCarePlans:2).\nRepresenterar responsens informationsstruktur (GetCarePlansResponseType).\nEn lista med CarePlanType returneras, var och en med header- och body-element."
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan",
      "path" : "inera-ehds-lm-care-plans.carePlan",
      "short" : "Vård- och omsorgsplaner som matchar begäran",
      "definition" : "Lista med vård- och omsorgsplaner för patienten. Varje post innehåller\nheader (basinformation) och body (planspecifik information).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.documentId",
      "path" : "inera-ehds-lm-care-plans.carePlan.documentId",
      "short" : "Planens identitet, unik inom källsystemet",
      "definition" : "Planens identitet, unik inom källsystemet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.sourceSystemHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.sourceSystemHSAId",
      "short" : "HSA-id för källsystemet",
      "definition" : "HSA-id för källsystemet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.documentTitle",
      "path" : "inera-ehds-lm-care-plans.carePlan.documentTitle",
      "short" : "Rubrik för vård- och omsorgsplanen",
      "definition" : "Rubrik för vård- och omsorgsplanen",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.documentTime",
      "path" : "inera-ehds-lm-care-plans.carePlan.documentTime",
      "short" : "Tidpunkt då planen upprättades (YYYYMMDDhhmmss)",
      "definition" : "Tidpunkt då planen upprättades (YYYYMMDDhhmmss)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.patientId",
      "path" : "inera-ehds-lm-care-plans.carePlan.patientId",
      "short" : "Patientens identifierare (personnummer/samordningsnummer)",
      "definition" : "Patientens identifierare (personnummer/samordningsnummer)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional",
      "short" : "Ansvarig hälso- och sjukvårdspersonal",
      "definition" : "Ansvarig hälso- och sjukvårdspersonal",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.authorTime",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.authorTime",
      "short" : "Tidpunkt då informationen registrerades (YYYYMMDDhhmmss)",
      "definition" : "Tidpunkt då informationen registrerades (YYYYMMDDhhmmss)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "short" : "HSA-id för ansvarig personal",
      "definition" : "HSA-id för ansvarig personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalName",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalName",
      "short" : "Namn på ansvarig personal",
      "definition" : "Namn på ansvarig personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "short" : "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)",
      "definition" : "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "short" : "Organisationsenhet för ansvarig personal",
      "definition" : "Organisationsenhet för ansvarig personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "HSA-id för org.enhet",
      "definition" : "HSA-id för org.enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "Namn på org.enhet",
      "definition" : "Namn på org.enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "short" : "Telefon till org.enhet",
      "definition" : "Telefon till org.enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "short" : "E-post till org.enhet",
      "definition" : "E-post till org.enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "short" : "Postadress för org.enhet",
      "definition" : "Postadress för org.enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "short" : "Plats för org.enhet",
      "definition" : "Plats för org.enhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId",
      "short" : "HSA-id för vårdenhet (Regel 1: PDL/Sparr)",
      "definition" : "HSA-id för vårdenhet (Regel 1: PDL/Sparr)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId",
      "short" : "HSA-id för vårdgivare (Regel 1: PDL/Sparr)",
      "definition" : "HSA-id för vårdgivare (Regel 1: PDL/Sparr)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator",
      "path" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator",
      "short" : "Signeringsinformation",
      "definition" : "Signeringsinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator.signatureTime",
      "path" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator.signatureTime",
      "short" : "Tidpunkt för signering (YYYYMMDDhhmmss)",
      "definition" : "Tidpunkt för signering (YYYYMMDDhhmmss)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator.legalAuthenticatorHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator.legalAuthenticatorHSAId",
      "short" : "HSA-id för signerare",
      "definition" : "HSA-id för signerare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator.legalAuthenticatorName",
      "path" : "inera-ehds-lm-care-plans.carePlan.legalAuthenticator.legalAuthenticatorName",
      "short" : "Namn på signerare",
      "definition" : "Namn på signerare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.approvedForPatient",
      "path" : "inera-ehds-lm-care-plans.carePlan.approvedForPatient",
      "short" : "Informationen godkänd för patient (Regel 3)",
      "definition" : "Informationen godkänd för patient (Regel 3)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.careContactId",
      "path" : "inera-ehds-lm-care-plans.carePlan.careContactId",
      "short" : "Refererad vårdkontakt-id",
      "definition" : "Refererad vårdkontakt-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.content",
      "path" : "inera-ehds-lm-care-plans.carePlan.content",
      "short" : "Innehåll i vård- och omsorgsplanen (MultimediaType)",
      "definition" : "MultimediaType-element med planens innehåll. Binärdata max 100 KB per TKB.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "constraint" : [{
        "key" : "getcareplans-content-xor",
        "severity" : "error",
        "human" : "Antingen value eller reference ska anges i content, inte båda",
        "expression" : "(value.exists() or reference.exists()) and (value.exists().not() or reference.exists().not())",
        "source" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-care-plans"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.content.mediaType",
      "path" : "inera-ehds-lm-care-plans.carePlan.content.mediaType",
      "short" : "Mediatyp (MIME-typ): text/plain, text/html, image/jpeg, image/png, image/tiff, application/pdf",
      "definition" : "Mediatyp (MIME-typ): text/plain, text/html, image/jpeg, image/png, image/tiff, application/pdf",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.content.value",
      "path" : "inera-ehds-lm-care-plans.carePlan.content.value",
      "short" : "Binärdata (base64) – XOR med reference",
      "definition" : "Binärdata (base64) – XOR med reference",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "base64Binary"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.content.reference",
      "path" : "inera-ehds-lm-care-plans.carePlan.content.reference",
      "short" : "Referens till extern fil (URL) – XOR med value",
      "definition" : "Referens till extern fil (URL) – XOR med value",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "url"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.content.id",
      "path" : "inera-ehds-lm-care-plans.carePlan.content.id",
      "short" : "id (ej tillämpligt)",
      "definition" : "N/A — content.id är 0..0 per TKB för GetCarePlans.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.participatingCareUnitHSAId",
      "path" : "inera-ehds-lm-care-plans.carePlan.participatingCareUnitHSAId",
      "short" : "Deltagande vårdenheters HSA-id (IIType)",
      "definition" : "Deltagande vårdenheters HSA-id (IIType)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.carePlan.typeOfCarePlan",
      "path" : "inera-ehds-lm-care-plans.carePlan.typeOfCarePlan",
      "short" : "Typ av vård- och omsorgsplan",
      "definition" : "Typ av vård- och omsorgsplan",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/typeofcareplan-vs"
      }
    },
    {
      "id" : "inera-ehds-lm-care-plans.result",
      "path" : "inera-ehds-lm-care-plans.result",
      "short" : "Resultatkod för anropet",
      "definition" : "Resultatkod för anropet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.result.resultCode",
      "path" : "inera-ehds-lm-care-plans.result.resultCode",
      "short" : "Resultatkod: OK, INFO eller ERROR",
      "definition" : "Resultatkod: OK, INFO eller ERROR",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.result.errorCode",
      "path" : "inera-ehds-lm-care-plans.result.errorCode",
      "short" : "Felkod vid ERROR (INVALID_REQUEST)",
      "definition" : "Felkod vid ERROR (INVALID_REQUEST)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.result.logId",
      "path" : "inera-ehds-lm-care-plans.result.logId",
      "short" : "UUID för felsökning",
      "definition" : "UUID för felsökning",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.result.subCode",
      "path" : "inera-ehds-lm-care-plans.result.subCode",
      "short" : "Subkod",
      "definition" : "Subkod",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-care-plans.result.message",
      "path" : "inera-ehds-lm-care-plans.result.message",
      "short" : "Beskrivande meddelande (svenska)",
      "definition" : "Beskrivande meddelande (svenska)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
