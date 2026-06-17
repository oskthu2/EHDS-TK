# GetAccessLogForPatient – Åtkomstloggar

**Tjänstekontrakt:** `informationsecurity:auditing:log` GetAccessLogForPatient v1.1, 2.0  
**FHIR-profil:** [SEEHDSAuditEvent](StructureDefinition-se-ehds-audit-event.html)  
**Logisk modell:** [SEEHDSLMAccessLog](StructureDefinition-se-ehds-lm-access-log.html)  
**Krävs för NPÖ:** Nej (Ej listad) | **Krävs för 1177 Journal:** Ja (v1.1, 2.0)  
**EHDS-koppling:** EHDS-relevant rättighets- och transparensförmåga, ej klinisk prioriterad datakategori

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `accessLogId` | 1..1 | `AuditEvent.entity.what.identifier` | Loggpostens id |
| `patientId` | 1..1 | `AuditEvent.entity.what` | Reference(SEEHDSPatient) |
| `accessTime` | 1..1 | `AuditEvent.recorded` | UTC ISO 8601 |
| `accessType` | 1..1 | `AuditEvent.type` | Åtkomsttyp |
| `accessSubType` | 0..1 | `AuditEvent.subtype` | |
| `accessOutcome` | 1..1 | `AuditEvent.outcome` | 0=beviljad, 4=nekad |
| `accessPurpose` | 0..1 | `AuditEvent.purposeOfEvent` | |
| `userId` | 1..1 | `AuditEvent.agent.who.identifier` | Användarens HSA-id (system: urn:oid:1.2.752.29.4.19) |
| `userRole` | 0..1 | `AuditEvent.agent.role` | |
| `userOrganization` | 0..1 | `AuditEvent.agent.who` | Reference(SEBaseOrganization) |
| `sourceSystemHSAId` | 1..1 | `AuditEvent.source.observer.identifier` | Loggkälla |
| `accessedResource` | 0..1 | `AuditEvent.entity.description` | |

---

## Notering om NPÖ

GetAccessLogForPatient är **inte** ett krav för NPÖ (versionen är "Ej listad"). Profilen är primärt avsedd för **1177 Journal** (v1.1, 2.0) och möjliggör insyn för patienten i vem som har läst deras journal.

---

## Provenance

Åtkomstloggposter kräver i normalfallet inte en separat Provenance-resurs eftersom AuditEvent självt är en loggpost. Om Provenance ändå behövs för att markera källsystem tillämpas standardmönstret.
