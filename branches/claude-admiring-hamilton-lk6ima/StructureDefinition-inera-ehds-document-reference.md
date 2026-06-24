# SE EHDS DocumentReference – Anteckningar (GetCareDocumentation) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)**

## Resource Profile: SE EHDS DocumentReference – Anteckningar (GetCareDocumentation) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-document-reference | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSDocumentReference |

 
Profil för vårdanteckningar mappat från RIVTA-tjänstekontraktet GetCareDocumentation (clinicalprocess:healthcond:description v3.0). Täcker NPÖ 3.0 och 1177 Journal 3.0. 
Använder JoL-header v2.2 (ej PatientSummaryHeader): accessControlHeader för PDL, record för journaluppgift-metadata, author för dokumentationsansvarig, signature för signeringsinformation. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-document-reference)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-document-reference.csv), [Excel](StructureDefinition-inera-ehds-document-reference.xlsx), [Schematron](StructureDefinition-inera-ehds-document-reference.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-document-reference",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-document-reference",
  "version" : "0.1.0",
  "name" : "IneraEHDSDocumentReference",
  "title" : "SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)",
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
  "description" : "Profil för vårdanteckningar mappat från RIVTA-tjänstekontraktet GetCareDocumentation\n(clinicalprocess:healthcond:description v3.0). Täcker NPÖ 3.0 och 1177 Journal 3.0.\n\nAnvänder JoL-header v2.2 (ej PatientSummaryHeader): accessControlHeader för PDL,\nrecord för journaluppgift-metadata, author för dokumentationsansvarig,\nsignature för signeringsinformation.",
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
    "identity" : "fhircomposition",
    "uri" : "http://hl7.org/fhir/composition",
    "name" : "FHIR Composition"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
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
  },
  {
    "identity" : "xds",
    "uri" : "http://ihe.net/xds",
    "name" : "XDS metadata equivalent"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DocumentReference",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DocumentReference",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DocumentReference",
      "path" : "DocumentReference"
    },
    {
      "id" : "DocumentReference.meta.source",
      "path" : "DocumentReference.meta.source",
      "short" : "Källsystem HSA-id (careDocumentation.header.sourceSystemId)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.status",
      "path" : "DocumentReference.status",
      "short" : "Dokumentstatus – 'current' normalt; härledd",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.type",
      "path" : "DocumentReference.type",
      "short" : "Anteckningstyp (careDocumentation.body.clinicalDocumentNoteCode – KV Anteckningstyp)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.category",
      "path" : "DocumentReference.category",
      "short" : "Dokumentkategori",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.subject",
      "path" : "DocumentReference.subject",
      "short" : "Patient (careDocumentation.header.accessControlHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.date",
      "path" : "DocumentReference.date",
      "short" : "Journaluppgiftens skapandetidpunkt (careDocumentation.header.record.timestamp)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.author",
      "path" : "DocumentReference.author",
      "short" : "Dokumentationsansvarig (careDocumentation.header.author.authorId – JoL-header)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.authenticator",
      "path" : "DocumentReference.authenticator",
      "short" : "Signerande person (careDocumentation.header.signature.signatureId – JoL-header)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.content",
      "path" : "DocumentReference.content",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.content.attachment",
      "path" : "DocumentReference.content.attachment",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.content.attachment.contentType",
      "path" : "DocumentReference.content.attachment.contentType",
      "short" : "Mimetyp (careDocumentation.body.multimediaEntry.mediaType)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.content.attachment.data",
      "path" : "DocumentReference.content.attachment.data",
      "short" : "Anteckningstext/binärinnehåll (careDocumentation.body.clinicalDocumentNoteText / multimediaEntry.value)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.content.attachment.url",
      "path" : "DocumentReference.content.attachment.url",
      "short" : "Referens till extern fil (careDocumentation.body.multimediaEntry.reference)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.content.attachment.title",
      "path" : "DocumentReference.content.attachment.title",
      "short" : "Anteckningsrubrik (careDocumentation.body.clinicalDocumentNoteTitle)",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.context",
      "path" : "DocumentReference.context",
      "mustSupport" : true
    },
    {
      "id" : "DocumentReference.context.encounter",
      "path" : "DocumentReference.context.encounter",
      "short" : "Tillhörande vårdkontakt (careDocumentation.header.accessControlHeader – koppling via vårdkontakt-id)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-encounter"]
      }],
      "mustSupport" : true
    }]
  }
}

```
