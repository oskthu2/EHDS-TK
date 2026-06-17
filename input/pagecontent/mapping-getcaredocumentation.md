# GetCareDocumentation – Anteckningar

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetCareDocumentation v2.1, 3.0  
**FHIR-profil:** [SEEHDSDocumentReference](StructureDefinition-se-ehds-document-reference.html)  
**Logisk modell:** [SEEHDSLMCareDocumentation](StructureDefinition-se-ehds-lm-care-documentation.html)  
**Krävs för NPÖ:** Ja (v2.1, 3.0) | **Krävs för 1177 Journal:** Ja (v2.1, 3.0)  
**EHDS-koppling:** Kan bidra till discharge report eller dokumentationsunderlag; bredare än EHDS discharge reports

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentationHeader.patientId` | 1..1 | `DocumentReference.subject.identifier` | OID→URI |
| `careDocumentationHeader.sourceSystemHSAId` | 1..1 | `DocumentReference.meta.source` | |
| `careDocumentationHeader.documentTime` | 1..1 | `DocumentReference.date` | |
| `careDocumentationHeader.accountableHealthcareProfessional` | 1..1 | `DocumentReference.author` | Reference(SEBasePractitionerRole) |
| `careDocumentationHeader.legalAuthenticator` | 0..1 | `DocumentReference.authenticator` | Reference(SEBasePractitionerRole) |
| `careDocumentationHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `careDocumentationHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `careDocumentationType` | 1..1 | `DocumentReference.type` | kv_vårdanteckningstyp |
| `careDocumentationTitle` | 0..1 | `DocumentReference.content.attachment.title` | |
| `careDocumentationBody` | 1..1 | `DocumentReference.content.attachment.data` | Base64-kodat, contentType: text/plain eller text/html |
| `careDocumentationTimePeriod` | 0..1 | `DocumentReference.context.period` | |
| `careContactId` | 0..1 | `DocumentReference.context.encounter` | Reference(SEEHDSEncounter) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
