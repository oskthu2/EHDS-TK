# GetRequestActivities – Remisstatus

**Tjänstekontrakt:** `crm:requeststatus` GetRequestActivities v2.0  
**FHIR-profil:** [SEEHDSTask](StructureDefinition-se-ehds-task.html)  
**Logisk modell:** [SEEHDSLMRequestActivities](StructureDefinition-se-ehds-lm-request-activities.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v1.0, 2.0)  
**EHDS-koppling:** Stödjande processinformation (ej separat EHDS-huvudkategori)

---

## Mappningstabell – requestHeader (metadata)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `requestHeader.patientId.extension` | 1..1 | `Task.for.identifier.value` | Personnummer eller samordningsnummer |
| `requestHeader.patientId.root` | 1..1 | `Task.for.identifier.system` | OID→URI-konvertering; se OID-tabell nedan |
| `requestHeader.sourceSystemHSAId` | 1..1 | `Task.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `requestHeader.documentTime` | 1..1 | `Task.authoredOn` | YYYYMMDDHHMMSS → ISO 8601 |
| `requestHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – vårdgivare |
| `requestHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – vårdenhet |

---

## Mappningstabell – remissaktivitetsfält

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `requestId` | 1..1 | `Task.identifier[0].value` | Remissidentifierare; källsystemets id för denna remiss­aktivitet |
| `requestStatus` | 1..1 | `Task.status` | kv_requestStatus → FHIR Task.status; se statusmappning nedan |
| `requestReceiver` | 0..1 | `Task.owner` | Reference(SEBaseOrganization) med `identifier.value` = mottagarens HSA-id |
| `activityType` | 0..1 | `Task.code` | Aktivitetstyp; kodverk kv_activityType → `Task.code` |
| `activityTime` | 0..1 | `Task.lastModified` | Senaste aktivitetstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `activityComment` | 0..1 | `Task.description` | Aktivitetsbeskrivning i fritext |

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

En `Provenance`-resurs skapas per Task och bär PDL/Sparr-information från requestHeader.

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare (Yttre Sparr) | `requestHeader.careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet (Inre Sparr) | `requestHeader.careUnitHSAId` |

`Provenance.target` refererar Task-resursen.  
`Provenance.recorded` = `requestHeader.documentTime` (konverterat till ISO 8601).

---

## OID-till-URI-tabell

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Designbeslut

### requestId → Task.identifier vs Task.focus

`requestId` i LM är remissaktivitetens egen identifierare (ej remissen i sig). Den
mappas därför till `Task.identifier[0].value` för att representera källsystemets id
för detta aktivitetsobjekt. En referens till den underliggande remissen (om tillgänglig)
kan läggas i `Task.focus` som `Reference(SEEHDSServiceRequestReferral)`, men det
kräver att remiss-id är separat tillgängligt vilket ej framgår av LM-strukturen.

### Task.requester

LM saknar ett explicit fält för den som skapat/initierat remissen. `Task.requester`
lämnas utan mappning tills RIVTA-kontraktet klargör om avsändarinformation finns i
requestHeader eller requestId-strukturen.

---

## Föreslagna nya issues

| Id | Fråga | Prioritet |
|---|---|---|
| REQ-001 | `requestId` i LM kan avse antingen aktivitetens eget id eller referens till remissen. Behöver klargöras: ska `Task.identifier` och `Task.focus` båda populeras? Kräver analys av TKB. | Medium |
| REQ-002 | `Task.requester` saknar källfält i LM. Behöver utredas om avsändaren finns i requestHeader (t.ex. via ett `senderHSAId`-fält i fullständigt RIVTA-schema). | Låg |
