# KV Anteckningstyp - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **KV Anteckningstyp**

## CodeSystem: KV Anteckningstyp 

| | |
| :--- | :--- |
| *Official URL*:urn:oid:1.2.752.129.2.2.2.11 | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:ClinicalDocumentNoteCodeCS |

 
Kodverk för typ av journalanteckning enligt KV Anteckningstyp. OID: 1.2.752.129.2.2.2.11. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ClinicalDocumentNoteCodeVS](ValueSet-clinicaldocumentnotecode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "clinicaldocumentnotecode-cs",
  "url" : "urn:oid:1.2.752.129.2.2.2.11",
  "version" : "0.1.0",
  "name" : "ClinicalDocumentNoteCodeCS",
  "title" : "KV Anteckningstyp",
  "status" : "active",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Kodverk för typ av journalanteckning enligt KV Anteckningstyp. OID: 1.2.752.129.2.2.2.11.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "content" : "complete",
  "count" : 9,
  "concept" : [{
    "code" : "utr",
    "display" : "utr",
    "definition" : "Utredning"
  },
  {
    "code" : "atb",
    "display" : "atb",
    "definition" : "Åtgärd/Behandling"
  },
  {
    "code" : "sam",
    "display" : "sam",
    "definition" : "Sammanfattning"
  },
  {
    "code" : "sao",
    "display" : "sao",
    "definition" : "Samordning"
  },
  {
    "code" : "ins",
    "display" : "ins",
    "definition" : "Inskrivning"
  },
  {
    "code" : "slu",
    "display" : "slu",
    "definition" : "Slutanteckning"
  },
  {
    "code" : "auf",
    "display" : "auf",
    "definition" : "Anteckning utan fysiskt möte"
  },
  {
    "code" : "sva",
    "display" : "sva",
    "definition" : "Slutenvårdsanteckning"
  },
  {
    "code" : "bes",
    "display" : "bes",
    "definition" : "Besöksanteckning"
  }]
}

```
