# GetCareContacts – Vårdkontakter

**Tjänstekontrakt:** `clinicalprocess:logistics:logistics` GetCareContacts v2.0, 3.0  
**FHIR-profil:** [SEEHDSEncounter](StructureDefinition-se-ehds-encounter.html)  
**Logisk modell:** [SEEHDSLMCareContacts](StructureDefinition-se-ehds-lm-care-contacts.html)  
**Krävs för NPÖ:** Ja (v2.0, 3.0) | **Krävs för 1177 Journal:** Ja (v2.0, 3.0)  
**EHDS-koppling:** Stödjande kontext (ej separat EHDS-huvudkategori)

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContactHeader.patientId` | 1..1 | `Encounter.subject.identifier` | OID→URI |
| `careContactHeader.sourceSystemHSAId` | 1..1 | `Encounter.meta.source` | |
| `careContactHeader.documentTime` | 1..1 | `Encounter.meta.lastUpdated` | Registreringstidpunkt |
| `careContactHeader.accountableHealthcareProfessional` | 1..1 | `Encounter.participant.individual` | Reference(SEBasePractitionerRole) |
| `careContactHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `careContactHeader.careUnitHSAId` | 1..1 | `Encounter.serviceProvider` + `Provenance.agent[author]` | Inre Sparr |
| `careContactStatus` | 1..1 | `Encounter.status` | Registrerad→planned, Utförd→finished, Avbokad→cancelled |
| `careContactType` | 1..1 | `Encounter.class` | kv_kontakttyp → v3-ActCode |
| `careContactRegistrationTime` | 1..1 | `Encounter.period.start` | |
| `careContactEndTime` | 0..1 | `Encounter.period.end` | |
| `careContactReason` | 0..1 | `Encounter.reasonCode` | |
| `careContactSpecialty` | 0..1 | `Encounter.serviceType` | |
| `careContactId` | 0..1 | `Encounter.identifier` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
