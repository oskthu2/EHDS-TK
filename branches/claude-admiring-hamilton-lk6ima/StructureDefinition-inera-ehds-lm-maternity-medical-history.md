# GetMaternityMedicalHistory - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetMaternityMedicalHistory**

## Logical Model: GetMaternityMedicalHistory 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-maternity-medical-history | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMMaternityMedicalHistory |

 
Logisk modell för tjänstekontraktet GetMaternityMedicalHistory (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetMaternityMedicalHistory:2). Representerar responsens informationsstruktur — mödravårdsjournal för en patient. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-maternity-medical-history)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-maternity-medical-history.csv), [Excel](StructureDefinition-inera-ehds-lm-maternity-medical-history.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-maternity-medical-history",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-maternity-medical-history",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMMaternityMedicalHistory",
  "title" : "GetMaternityMedicalHistory",
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
  "description" : "Logisk modell för tjänstekontraktet GetMaternityMedicalHistory\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetMaternityMedicalHistory:2).\nRepresenterar responsens informationsstruktur — mödravårdsjournal för en patient.",
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
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-maternity-medical-history",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-maternity-medical-history",
      "path" : "inera-ehds-lm-maternity-medical-history",
      "short" : "GetMaternityMedicalHistory",
      "definition" : "Logisk modell för tjänstekontraktet GetMaternityMedicalHistory\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetMaternityMedicalHistory:2).\nRepresenterar responsens informationsstruktur — mödravårdsjournal för en patient."
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord",
      "short" : "Mödravårdsjournalpost",
      "definition" : "Mödravårdsjournalpost",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader",
      "short" : "PatientSummaryHeader",
      "definition" : "PatientSummaryHeader",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.documentId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.documentId",
      "short" : "Dokumentets unika id",
      "definition" : "Dokumentets unika id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.sourceSystemHSAId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.sourceSystemHSAId",
      "short" : "Källsystemets HSA-id",
      "definition" : "Källsystemets HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.documentTitle",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.documentTitle",
      "short" : "Dokumentets titel",
      "definition" : "Dokumentets titel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.documentTime",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.documentTime",
      "short" : "Dokumentets tidpunkt",
      "definition" : "Dokumentets tidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.patientId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.patientId",
      "short" : "Patientens id",
      "definition" : "Patientens id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.patientId.value",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.patientId.value",
      "short" : "Patientens personnummer/samordningsnummer",
      "definition" : "Patientens personnummer/samordningsnummer",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.patientId.system",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.patientId.system",
      "short" : "OID för identifierartyp (t.ex. urn:oid:1.2.752.129.2.1.3.1)",
      "definition" : "OID för identifierartyp (t.ex. urn:oid:1.2.752.129.2.1.3.1)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional",
      "short" : "Ansvarig hälso- och sjukvårdspersonal",
      "definition" : "Ansvarig hälso- och sjukvårdspersonal",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime",
      "short" : "Tidpunkt",
      "definition" : "Tidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "short" : "HSA-id (obligatorisk i mödrahälsovård)",
      "definition" : "HSA-id (obligatorisk i mödrahälsovård)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "short" : "Yrkesroll",
      "definition" : "Yrkesroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "short" : "Organisationsenhet",
      "definition" : "Organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "OrgUnit HSA-id",
      "definition" : "OrgUnit HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "OrgUnit namn",
      "definition" : "OrgUnit namn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "short" : "Telefon",
      "definition" : "Telefon",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "short" : "E-post",
      "definition" : "E-post",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "short" : "Adress",
      "definition" : "Adress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "short" : "Plats",
      "definition" : "Plats",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId",
      "short" : "Vårdenhetens HSA-id",
      "definition" : "Regel 1: Obligatorisk i GetMaternityMedicalHistory.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId",
      "short" : "Vårdgivarens HSA-id",
      "definition" : "Regel 1: Obligatorisk i GetMaternityMedicalHistory.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator",
      "short" : "Juridiskt ansvarig",
      "definition" : "Juridiskt ansvarig",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.signatureTime",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.signatureTime",
      "short" : "Signeringstidpunkt",
      "definition" : "Signeringstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "short" : "HSA-id",
      "definition" : "HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.approvedForPatient",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.approvedForPatient",
      "short" : "Godkänd för patientvisning",
      "definition" : "Godkänd för patientvisning",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.careContactId",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordHeader.careContactId",
      "short" : "Vårdkontaktid",
      "definition" : "Vårdkontaktid",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody",
      "short" : "Mödravårdsjournaldata",
      "definition" : "Mödravårdsjournaldata",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord",
      "short" : "Inskrivningsuppgifter",
      "definition" : "Inskrivningsuppgifter",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.lastMenstrualPeriod",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.lastMenstrualPeriod",
      "short" : "Sista menstruationsdag",
      "definition" : "Sista menstruationsdag",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.indicationPregnancy",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.indicationPregnancy",
      "short" : "Graviditetsindikation datum",
      "definition" : "Graviditetsindikation datum",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.contraceptiveDiscontinued",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.contraceptiveDiscontinued",
      "short" : "Datum p-medel avslutades",
      "definition" : "Datum p-medel avslutades",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromLastMenstrualPeriod",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromLastMenstrualPeriod",
      "short" : "Beräknat förlossningsdatum (LMP)",
      "definition" : "Beräknat förlossningsdatum (LMP)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromUltrasoundScan",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromUltrasoundScan",
      "short" : "Beräknat förlossningsdatum (UL)",
      "definition" : "Beräknat förlossningsdatum (UL)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromEmbryonicTransfer",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.expectedDayOfDeliveryFromEmbryonicTransfer",
      "short" : "Beräknat förlossningsdatum (embryoöverföring)",
      "definition" : "Beräknat förlossningsdatum (embryoöverföring)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.length",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.length",
      "short" : "Kroppslängd (cm)",
      "definition" : "Kroppslängd (cm)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.weight",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.weight",
      "short" : "Kroppsvikt (kg)",
      "definition" : "Kroppsvikt (kg)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.bodyMassIndex",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.bodyMassIndex",
      "short" : "BMI",
      "definition" : "BMI",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.infertility",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.infertility",
      "short" : "Infertilitet (år)",
      "definition" : "Infertilitet (år)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity",
      "short" : "Tidigare graviditeter",
      "definition" : "Tidigare graviditeter",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.year",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.year",
      "short" : "År",
      "definition" : "År",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.month",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.month",
      "short" : "Månad",
      "definition" : "Månad",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.delivery",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.delivery",
      "short" : "Förlossningssätt",
      "definition" : "Förlossningssätt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.healthcareFacility",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.healthcareFacility",
      "short" : "Vårdinrättning",
      "definition" : "Vårdinrättning",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.progress",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.progress",
      "short" : "Förlopp",
      "definition" : "Förlopp",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.sex",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.sex",
      "short" : "Barnets kön",
      "definition" : "Barnets kön",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.weightOfChild",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.weightOfChild",
      "short" : "Barnets vikt",
      "definition" : "Barnets vikt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.gestation",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.previousGravidityAndParity.gestation",
      "short" : "Gestationsålder (veckor)",
      "definition" : "Gestationsålder (veckor)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesThrombosis",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesThrombosis",
      "short" : "Trombos",
      "definition" : "Trombos",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesEndocineDiseases",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesEndocineDiseases",
      "short" : "Endokrina sjukdomar",
      "definition" : "Endokrina sjukdomar",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesRecurrentUrinaryTractInfections",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesRecurrentUrinaryTractInfections",
      "short" : "Recidiverande urinvägsinfektioner",
      "definition" : "Recidiverande urinvägsinfektioner",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesDiabetesMellitus",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.diseasesDiabetesMellitus",
      "short" : "Diabetes mellitus",
      "definition" : "Diabetes mellitus",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy",
      "short" : "Läkemedel under graviditet",
      "definition" : "Läkemedel under graviditet",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy.medicament",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy.medicament",
      "short" : "Läkemedel",
      "definition" : "Läkemedel",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy.dosage",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.medicationDuringPregnacy.dosage",
      "short" : "Dosering",
      "definition" : "Dosering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.assessmentAtFirstContactStandardCare",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.registrationRecord.assessmentAtFirstContactStandardCare",
      "short" : "Bedömning vid inskrivning standardvård",
      "definition" : "Bedömning vid inskrivning standardvård",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord",
      "short" : "Graviditetskontroll",
      "definition" : "Graviditetskontroll",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.completeWeeksOfGestation",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.completeWeeksOfGestation",
      "short" : "Kompletta graviditetsveckor",
      "definition" : "Kompletta graviditetsveckor",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.weight",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.weight",
      "short" : "Vikt",
      "definition" : "Vikt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.symphysisFundalHeight",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.symphysisFundalHeight",
      "short" : "Symfondusmått (cm)",
      "definition" : "Symfondusmått (cm)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.haemoglobin",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.haemoglobin",
      "short" : "Hemoglobin",
      "definition" : "Hemoglobin",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.bloodPressureSystolic",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.bloodPressureSystolic",
      "short" : "Systoliskt blodtryck",
      "definition" : "Systoliskt blodtryck",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.bloodPressureDiastolic",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.bloodPressureDiastolic",
      "short" : "Diastoliskt blodtryck",
      "definition" : "Diastoliskt blodtryck",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.proteinuria",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.proteinuria",
      "short" : "Proteinuri",
      "definition" : "Proteinuri",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.glycosuria",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.glycosuria",
      "short" : "Glykosuri",
      "definition" : "Glykosuri",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalPosition",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalPosition",
      "short" : "Fosterläge",
      "definition" : "Fosterläge",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalPresentation",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalPresentation",
      "short" : "Fosterpresentation",
      "definition" : "Fosterpresentation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalHeartRate",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.fetalHeartRate",
      "short" : "Fosterhjärtfrekvens",
      "definition" : "Fosterhjärtfrekvens",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.typeOfLeave",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.typeOfLeave",
      "short" : "Typ av ledighet",
      "definition" : "Typ av ledighet",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration",
      "short" : "Läkemedel sedan inskrivning",
      "definition" : "Läkemedel sedan inskrivning",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration.medicament",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration.medicament",
      "short" : "Läkemedel",
      "definition" : "Läkemedel",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration.dosage",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.pregnancyCheckupRecord.medicationSinceRegistration.dosage",
      "short" : "Dosering",
      "definition" : "Dosering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord",
      "short" : "Eftervård",
      "definition" : "Eftervård",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord",
      "short" : "Moderns eftervård",
      "definition" : "Moderns eftervård",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.breastfeeding",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.breastfeeding",
      "short" : "Amning",
      "definition" : "Amning",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bloodPressureSystolic",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bloodPressureSystolic",
      "short" : "Systoliskt blodtryck",
      "definition" : "Systoliskt blodtryck",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bloodPressureDiastolic",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bloodPressureDiastolic",
      "short" : "Diastoliskt blodtryck",
      "definition" : "Diastoliskt blodtryck",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.haemoglobin",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.haemoglobin",
      "short" : "Hemoglobin",
      "definition" : "Hemoglobin",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bodyTemperature",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.bodyTemperature",
      "short" : "Kroppstemperatur",
      "definition" : "Kroppstemperatur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.scarsOK",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.scarsOK",
      "short" : "Ärr OK",
      "definition" : "Ärr OK",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.sutureRemoved",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.sutureRemoved",
      "short" : "Suturer borttagna",
      "definition" : "Suturer borttagna",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.perineumComfortable",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.perineumComfortable",
      "short" : "Perineum OK",
      "definition" : "Perineum OK",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.vulvaVaginaPortioOK",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.vulvaVaginaPortioOK",
      "short" : "Vulva/vagina/portio OK",
      "definition" : "Vulva/vagina/portio OK",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.uterusContracted",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.uterusContracted",
      "short" : "Uterus kontraherad",
      "definition" : "Uterus kontraherad",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.uterusNote",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.motherPostDeliveryRecord.uterusNote",
      "short" : "Uterusnotering",
      "definition" : "Uterusnotering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord",
      "short" : "Barnets eftervård",
      "definition" : "Barnets eftervård",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.ordinalNumber",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.ordinalNumber",
      "short" : "Löpnummer för barn (vid flerbörd)",
      "definition" : "Löpnummer för barn (vid flerbörd)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.weight",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.weight",
      "short" : "Barnets vikt",
      "definition" : "Barnets vikt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore1",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore1",
      "short" : "Apgar-poäng 1 min",
      "definition" : "Apgar-poäng 1 min",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore5",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore5",
      "short" : "Apgar-poäng 5 min",
      "definition" : "Apgar-poäng 5 min",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore10",
      "path" : "inera-ehds-lm-maternity-medical-history.maternityMedicalRecord.maternityMedicalRecordBody.postDeliveryRecord.childPostDeliveryRecord.apgarScore10",
      "short" : "Apgar-poäng 10 min",
      "definition" : "Apgar-poäng 10 min",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    }]
  }
}

```
