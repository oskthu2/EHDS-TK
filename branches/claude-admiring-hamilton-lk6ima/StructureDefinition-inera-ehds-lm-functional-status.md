# GetFunctionalStatus - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetFunctionalStatus**

## Logical Model: GetFunctionalStatus 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-functional-status | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMFunctionalStatus |

 
Logisk modell för tjänstekontraktet GetFunctionalStatus (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2). Representerar responsens informationsstruktur: dokumenterade bedömningar av funktionsnedsättningar och/eller aktivitetsförmåga (PADL) för en patient. Bedömningskategori styrs av assessmentCategory: 'pad-pad' (PADL) eller 'fun-fun' (funktionsnedsättning). En tjänsteproducent måste använda samma värde för categorization i engagemangsindex som för assessmentCategory i svaret. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-functional-status)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-functional-status.csv), [Excel](StructureDefinition-inera-ehds-lm-functional-status.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-functional-status",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-functional-status",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMFunctionalStatus",
  "title" : "GetFunctionalStatus",
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
  "description" : "Logisk modell för tjänstekontraktet GetFunctionalStatus\n(RIV-TA urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2).\nRepresenterar responsens informationsstruktur: dokumenterade bedömningar av\nfunktionsnedsättningar och/eller aktivitetsförmåga (PADL) för en patient.\nBedömningskategori styrs av assessmentCategory: 'pad-pad' (PADL) eller 'fun-fun' (funktionsnedsättning).\nEn tjänsteproducent måste använda samma värde för categorization i engagemangsindex som\nför assessmentCategory i svaret.",
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
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-functional-status",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-functional-status",
      "path" : "inera-ehds-lm-functional-status",
      "short" : "GetFunctionalStatus",
      "definition" : "Logisk modell för tjänstekontraktet GetFunctionalStatus\n(RIV-TA urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2).\nRepresenterar responsens informationsstruktur: dokumenterade bedömningar av\nfunktionsnedsättningar och/eller aktivitetsförmåga (PADL) för en patient.\nBedömningskategori styrs av assessmentCategory: 'pad-pad' (PADL) eller 'fun-fun' (funktionsnedsättning).\nEn tjänsteproducent måste använda samma värde för categorization i engagemangsindex som\nför assessmentCategory i svaret."
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment",
      "short" : "Funktionsstatusbedömning",
      "definition" : "De funktionsstatusbedömningar som matchar begäran.\nKardinalitet: Valfri, lista.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader",
      "short" : "Dokumenthuvud (PatientSummaryHeader)",
      "definition" : "Innehåller basinformation om dokumentet (PatientSummaryHeaderType).\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.documentId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.documentId",
      "short" : "Dokumentets identitet",
      "definition" : "Funktionsbedömningens identitet som är unik inom källsystemet.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.sourceSystemHSAId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.sourceSystemHSAId",
      "short" : "HSA-id för källsystem",
      "definition" : "HSA-id för det system som tillgängliggör informationen.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.documentTitle",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.documentTitle",
      "short" : "Titel (ej tillämpligt)",
      "definition" : "N/A — GetFunctionalStatus skickar inte documentTitle. Elementet är 0..0 per TKB.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.documentTime",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.documentTime",
      "short" : "Bedömningstidpunkt",
      "definition" : "Bedömningstidpunkt/händelsetidpunkt. Format: YYYYMMDDhhmmss.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.patientId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.patientId",
      "short" : "Patientidentifierare",
      "definition" : "Identifierare för patient. id = patientens identifierare (12 tecken).\ntype = OID för typ av identifierare.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional",
      "short" : "Ansvarig hälso- och sjukvårdsperson",
      "definition" : "Information om den hälso- och sjukvårdsperson som är ansvarig för informationen.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime",
      "short" : "Tidpunkt för registrering",
      "definition" : "Tidpunkt då informationen registrerades. Format: YYYYMMDDhhmmss.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "short" : "Författarens HSA-id",
      "definition" : "Författarens HSA-id.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalName",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalName",
      "short" : "Namn",
      "definition" : "Namn på hälso- och sjukvårdspersonal.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "short" : "Befattning",
      "definition" : "Information om personens befattning.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "short" : "Organisationsenhet",
      "definition" : "Den organisation som hälso- och sjukvårdspersonalen är uppdragstagare i.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "HSA-id för organisationsenhet",
      "definition" : "HSA-id för organisationsenhet.\nKardinalitet: Obligatorisk (inom OrgUnitType).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "Namn på organisationsenhet",
      "definition" : "Namn på organisationsenhet.\nKardinalitet: Obligatorisk (inom OrgUnitType).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId",
      "short" : "HSA-id för vårdenhet",
      "definition" : "HSA-id för vårdenhet. Se regel 1 i TKB.\nKardinalitet: Valfri (villkorlig, se regel 1).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId",
      "short" : "HSA-id för vårdgivare",
      "definition" : "HSA-id för vårdgivaren.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator",
      "short" : "Signerande person",
      "definition" : "Information om vem som signerat informationen i dokumentet.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.signatureTime",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.signatureTime",
      "short" : "Tidpunkt för signering",
      "definition" : "Signaturtidpunkt. Format: YYYYMMDDhhmmss.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "short" : "HSA-id för signerande",
      "definition" : "HSA-id för person som signerat dokumentet.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorName",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorName",
      "short" : "Namn på signerande person",
      "definition" : "Namn i klartext för signerande person.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorRoleCode",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorRoleCode",
      "short" : "Signerande persons befattning",
      "definition" : "Signerande persons befattning. Om möjligt ska kodverk användas.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.approvedForPatient",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.approvedForPatient",
      "short" : "Godkänd för visning till patient",
      "definition" : "Anger om information får delas till patient.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.careContactId",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.careContactId",
      "short" : "Vårdkontakts-id",
      "definition" : "Id för den vårdkontakt vid vilken bedömningen genomfördes.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.nullified",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.nullified",
      "short" : "Makulerat (ej tillämpligt)",
      "definition" : "N/A — GetFunctionalStatus stödjer inte nullified. Elementet är 0..0 per TKB.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.nullifiedReason",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentHeader.nullifiedReason",
      "short" : "Makuleringsskäl (ej tillämpligt)",
      "definition" : "N/A — GetFunctionalStatus stödjer inte nullifiedReason. Elementet är 0..0 per TKB.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody",
      "short" : "Bedömningens innehåll",
      "definition" : "FunctionalStatusAssessmentBodyType — bedömningens informationsinnehåll.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.assessmentCategory",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.assessmentCategory",
      "short" : "Bedömningskategori",
      "definition" : "Bedömningskategori. 'pad-pad' = PADL-bedömning, 'fun-fun' = funktionsnedsättningsbedömning.\nOBS: tjänsteproducent måste använda samma värde som categorization i engagemangsindex.\nSe AssessmentCategoryCS/AssessmentCategoryVS.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/assessmentcategory-vs"
      }
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.comment",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.comment",
      "short" : "Kommentar",
      "definition" : "Kommentar till total bedömning.\nKardinalitet: Valfri.\nVillkor (Regel): Får ENDAST anges om assessmentCategory = 'pad-pad'.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.padl",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.padl",
      "short" : "PADL-bedömning",
      "definition" : "Beskriver gjorda PADL-bedömningar. Får enbart anges om assessmentCategory = 'pad-pad'.\nKardinalitet: Valfri, lista (villkorlig på assessmentCategory).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.padl.typeOfAssessment",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.padl.typeOfAssessment",
      "short" : "Typ av PADL-bedömning",
      "definition" : "Typ av PADL-bedömning. Kan anges med lämpligt kodsystem för PADL.\nKardinalitet: Obligatorisk.\nRegel 2 (TKB): Då attributet avser Personlig ADL ska ENBART ett av följande värden anges per post: 'personlig hygien', 'på/avklädning', 'förflyttning', 'toalettbesök', 'födointag'.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.padl.assessment",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.padl.assessment",
      "short" : "Textuell PADL-bedömning",
      "definition" : "Den textuella PADL-bedömning som gjorts i kategorin.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.disability",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.disability",
      "short" : "Funktionsnedsättningsbedömning",
      "definition" : "Beskriver gjord funktionsnedsättningsbedömning.\nFår enbart anges om assessmentCategory = 'fun-fun'.\nKardinalitet: Valfri (villkorlig på assessmentCategory).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.disability.disabilityAssessment",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.disability.disabilityAssessment",
      "short" : "ICF-kod för funktionsnedsättning",
      "definition" : "Angivelse av kod för den funktion som bedömts nedsatt.\nKodsystem: ICF, OID 1.2.752.116.1.1.3.\nExempelkod: b310 = röst- och talfunktioner.\nKardinalitet: Obligatorisk.\nCVType-begränsningar: codeSystemName och codeSystemVersion är 0..0 (får ej anges) per TKB. Om code anges ska codeSystem och displayName anges, ej originalText. Om originalText anges ska inga andra attribut anges.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.disability.comment",
      "path" : "inera-ehds-lm-functional-status.functionalStatusAssessment.functionalStatusAssessmentBody.disability.comment",
      "short" : "Kommentar till funktionsnedsättning",
      "definition" : "Kommentar med ytterligare information om funktionsnedsättningen.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.result",
      "path" : "inera-ehds-lm-functional-status.result",
      "short" : "Resultat",
      "definition" : "Innehåller information om begäran gick bra eller ej.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.result.resultCode",
      "path" : "inera-ehds-lm-functional-status.result.resultCode",
      "short" : "Resultatkod",
      "definition" : "Kan endast vara OK, INFO eller ERROR.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.result.errorCode",
      "path" : "inera-ehds-lm-functional-status.result.errorCode",
      "short" : "Felkod",
      "definition" : "Sätts endast om resultCode är ERROR. Tillåtna värden: INVALID_REQUEST.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.result.logId",
      "path" : "inera-ehds-lm-functional-status.result.logId",
      "short" : "Log-id",
      "definition" : "En UUID som kan användas vid felanmälan för att spåra felet.\nKardinalitet: Obligatorisk.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-functional-status.result.message",
      "path" : "inera-ehds-lm-functional-status.result.message",
      "short" : "Meddelande",
      "definition" : "En beskrivande text som kan visas för användaren.\nKardinalitet: Valfri.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
