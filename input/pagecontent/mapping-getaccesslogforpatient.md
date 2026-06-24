# GetAccessLogForPatient – Åtkomstloggar

**Tjänstekontrakt:** `informationsecurity:auditing:log` GetAccessLogForPatient v1.1, 2.0  
**FHIR-profil:** [IneraEHDSAuditEvent](StructureDefinition-inera-ehds-audit-event.html)  
**Logisk modell:** [IneraEHDSLMAccessLog](StructureDefinition-inera-ehds-lm-access-log.html)  
**Krävs för NPÖ:** Nej (Ej listad) | **Krävs för 1177 Journal:** Ja (v1.1, 2.0)  
**EHDS-koppling:** EHDS-relevant rättighets- och transparensförmåga, ej klinisk prioriterad datakategori

> **OBS:** Denna tjänst är en loggtjänst (inte klinisk data) och saknar därför
> `approvedForPatient`-fält och `accountableHealthcareProfessional`-header.
> Ingen Provenance-resurs krävs i normalfallet – AuditEvent är självt en revisionsspårning.

---

## Mappningstabell – loggposts-fält

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `accessLogId` | 1..1 | `AuditEvent.entity[loggpost].what.identifier.value` | Loggpostens unika identifierare |
| `patientId` | 1..1 | `AuditEvent.patient` | Reference(IneraEHDSPatient); patienten vars data åtkoms |
| `accessTime` | 1..1 | `AuditEvent.recorded` | Åtkomsttidpunkt; UTC ISO 8601 |
| `accessType` | 1..1 | `AuditEvent.type` | Åtkomsttyp (Läsning/Sökning); kodad med DICOM `DCM#110110` el. liknande |
| `accessSubType` | 0..1 | `AuditEvent.subtype` | Åtkomstundertyp; mer specifik klassificering av händelsen |
| `accessOutcome` | 1..1 | `AuditEvent.outcome` | Utfall: `0` = beviljad, `4` = nekad (AuditEventOutcome) |
| `accessPurpose` | 0..1 | `AuditEvent.purposeOfEvent` | Åtkomstsyfte (Vård/Administration); kodad med `v3-ActReason` |
| `userId` | 1..1 | `AuditEvent.agent[accessor].who.identifier.value` | Användarens HSA-id; system: `urn:oid:1.2.752.129.2.1.4.1` |
| `userRole` | 0..1 | `AuditEvent.agent[accessor].role` | Användarroll vid åtkomsttillfället |
| `userOrganization` | 0..1 | `AuditEvent.agent[accessor].who` | Reference(SEBaseOrganization) med identifier.value = organisations HSA-id |
| `sourceSystemHSAId` | 1..1 | `AuditEvent.source.observer.identifier.value` | Källsystem (loggkälla); HSA-id för det system som registrerade händelsen |
| `accessedResource` | 0..1 | `AuditEvent.entity[resurs].description` | Resurs eller tjänst som åtkoms; fritext eller URI |

---

## Mappningstabell – tekniska responsfält (result.*)

Dessa fält är en del av RIVTA-transportlagrets standardsvar och bär ingen klinisk information. De hanteras av infrastrukturlagret och mappas inte till FHIR-resurser.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod (OK/ERROR) – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.logId` | 0..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## AuditEvent.agent-struktur

AuditEvent kan ha flera agenter. Följande agentroller används:

| Agent-index | Roll (`agent.type`) | Populeras från |
|---|---|---|
| `agent[accessor]` | Åtkomsttagaren (personen/systemet som läste journalen) | `userId`, `userRole`, `userOrganization` |
| `agent[source]` | Källsystem som utförde åtkomsten | `sourceSystemHSAId` (om ej enbart i `source.observer`) |

`AuditEvent.agent[accessor].requestor = true` signalerar att detta är den initierade
aktören.

---

## AuditEvent.entity-struktur

| Entity-index | `entity.type` | Innehåll |
|---|---|---|
| `entity[loggpost]` | `2` (System Object) | Loggpostens eget id (`accessLogId`) |
| `entity[resurs]` | `2` (System Object) | Den åtkomna resursen (`accessedResource`) |

`patientId` mappas till `AuditEvent.patient` (FHIR R4-tillägg, tillagd i R4B men
stöds via extension i R4; alternativt `AuditEvent.entity[patient]` med `entity.role = 1`).

---

## Notering om NPÖ

GetAccessLogForPatient är **inte** ett krav för NPÖ (versionen är "Ej listad").
Profilen är primärt avsedd för **1177 Journal** (v1.1, 2.0) och möjliggör
insyn för patienten i vem som har läst deras journal.

---

## Notering om Provenance

Åtkomstloggposter kräver i normalfallet inte en separat Provenance-resurs eftersom
AuditEvent självt är en loggpost. Om Provenance ändå behövs för att markera källsystem
tillämpas standardmönstret med `sourceSystemHSAId` i `Provenance.agent[custodian]`.

---

## Föreslagna nya issues

| Id | Fråga | Prioritet |
|---|---|---|
| LOG-001 | `AuditEvent.patient` är en R4B-utökning som inte finns i basen av FHIR R4. Behöver utredas om en lokal extension eller `entity[patient]`-mönstret (med `entity.role = 1`) ska användas i IneraEHDSAuditEvent-profilen för R4-kompatibilitet. | Hög |
| LOG-002 | `accessType`-kodvärden behöver formellt kodverk (Läsning/Sökning). Utred om DICOM AuditEventID-koder eller ett lokalt Inera-kodverk ska användas för `AuditEvent.type` respektive `AuditEvent.subtype`. | Medium |
