# GetRequestActivities – Remisstatus

**Tjänstekontrakt:** `crm:requeststatus` GetRequestActivities v2.0  
**FHIR-profil:** [SEEHDSTask](StructureDefinition-se-ehds-task.html)  
**Logisk modell:** [SEEHDSLMRequestActivities](StructureDefinition-se-ehds-lm-request-activities.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v1.0, 2.0)  
**EHDS-koppling:** Stödjande processinformation (ej separat EHDS-huvudkategori)

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `requestHeader.patientId` | 1..1 | `Task.for.identifier` | OID→URI |
| `requestHeader.sourceSystemHSAId` | 1..1 | `Task.meta.source` | |
| `requestHeader.documentTime` | 1..1 | `Task.authoredOn` | |
| `requestHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `requestHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `requestId` | 1..1 | `Task.focus` | Reference(SEEHDSServiceRequestReferral) |
| `requestStatus` | 1..1 | `Task.status` | kv_requestStatus → FHIR Task.status |
| `requestReceiver` | 0..1 | `Task.owner` | Reference(SEBaseOrganization) |
| `activityType` | 0..1 | `Task.code` | |
| `activityTime` | 0..1 | `Task.lastModified` | |
| `activityComment` | 0..1 | `Task.description` | |

---

## Statusmappning (kv_requestStatus → Task.status)

| kv_requestStatus | Task.status |
|---|---|
| Mottagen | received |
| Under utredning | in-progress |
| Besvarad | completed |
| Avbruten | cancelled |
| Avvisad | rejected |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
