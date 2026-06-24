# GetCarePlans – Vårdplan

**Tjänstekontrakt:** `clinicalprocess:logistics:logistics` GetCarePlans v2.0  
**FHIR-profil:** [IneraEHDSCarePlan](StructureDefinition-inera-ehds-care-plan.html)  
**Logisk modell:** [IneraEHDSLMCarePlans](StructureDefinition-inera-ehds-lm-care-plans.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  

---

## Struktur

GetCarePlans returnerar en lista `carePlan` (0..*) med en flat struktur – alla fält finns direkt på `carePlan`, utan separata header/body-undernivåer i TKB.

---

## Mappningstabell

### Header – identitet och patient

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.documentId` | 1..1 | `CarePlan.identifier[0].value` | Källsystemets dokumentidentitet; unik inom källsystemet |
| `carePlan.sourceSystemHSAId` | 1..1 | `CarePlan.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `carePlan.patientId.extension` | 1..1 | `CarePlan.subject.identifier.value` | Personnummer eller samordningsnummer |
| `carePlan.patientId.root` | 1..1 | `CarePlan.subject.identifier.system` | OID→URI-konvertering (se OID-tabell nedan) |

### Header – dokumenttid

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.documentTitle` | 1..1 | `CarePlan.title` | Obligatorisk (1..1 i profilen) |
| `carePlan.documentTime` | 0..1 | `CarePlan.created` | YYYYMMDDHHMMSS → ISO 8601 |

### Header – ansvarig personal (accountableHealthcareProfessional)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.accountableHealthcareProfessional.authorTime` | 1..1 | `CarePlan.meta.lastUpdated` | Tidpunkt för registrering; YYYYMMDDHHMMSS → ISO 8601 |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `PractitionerRole.identifier.value` | Via `CarePlan.author`-referens |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Valfritt komplement till HSA-id |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Befattningskod (KV Befattning OID 1.2.752.129.2.2.1.4) |

### Header – ansvarig personal – organisationsenhet

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier` | HSA-id för organisationsenhet |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Namn på organisationsenhet |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefonnummer till org.enhet – ingår ej i PractitionerRole.organization; kan lagras i Organization.telecom om Organization-resurs skapas |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post till org.enhet – se `orgUnitTelecom` ovan |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Postadress till org.enhet – ingår ej i PractitionerRole; kan lagras i Organization.address om Organization-resurs skapas |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Fritextplats för org.enhet – ingen standardiserad FHIR-plats i CarePlan/PractitionerRole |

### Header – PDL/Sparr

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – vårdenhet (Regel 1) |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – vårdgivare (Regel 1) |
| `carePlan.approvedForPatient` | 1..1 | `CarePlan.meta.security` | PDL-kontroll (Regel 3) – se PDL-001 i mapping-issues |

### Header – signerare (legalAuthenticator)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.legalAuthenticator.signatureTime` | 1..1 (om legalAuthenticator anges) | `CarePlan.extension[assertedDate]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `carePlan.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `CarePlan.asserter.identifier` | Via asserter-referens |
| `carePlan.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |

### Header – relaterad vårdkontakt

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.careContactId` | 0..1 | `CarePlan.encounter.identifier` | Logisk referens till Encounter |

### Body – plantyp och deltagare

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.typeOfCarePlan` | 0..1 | `CarePlan.category` | Bunden till TypeOfCarePlanVS (required) |
| `carePlan.participatingCareUnitHSAId` | 0..* | `CarePlan.contributor` | Deltagande vårdenheters HSA-id (IIType); en referens per enhet |

### Body – innehåll (MultimediaType)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlan.content` | 0..* | Extension (MultimediaType) | FHIR R4 CarePlan har inget inbyggt multimedia-fält; kräver extension vid implementering |
| `carePlan.content.mediaType` | 1..1 | Extension.mediaType | MIME-typ: text/plain, text/html, image/jpeg, image/png, image/tiff, application/pdf |
| `carePlan.content.id` | 0..0 | N/A | Ej tillämpligt för detta TK per TKB (markerat 0..0 i logisk modell) |
| `carePlan.content.value` | 0..1 | Extension.value (base64Binary) | Binärdata (base64) – XOR med reference; max 100 KB per post |
| `carePlan.content.reference` | 0..1 | Extension.reference (url) | Referens till extern fil (URL) – XOR med value |

> **OBS – Innehåll:** Text-innehåll (`text/plain`, `text/html`) kan även lagras i `CarePlan.note.text` som alternativ till extension, men förlorar då MIME-typinformation. Binärt innehåll kräver separat extension.

> **Invariant:** `carePlan.content` – antingen `value` eller `reference` måste anges, ej båda (`getcareplans-content-xor` i logisk modell).

### Tekniska responsfält (result)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.logId` | 1..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.subCode` | 0..1 | Ej mappad | Teknisk subkod – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## PDL och Sparr

PDL-fälten `healthcareProfessionalCareUnitHSAId` och `healthcareProfessionalCareGiverHSAId` är **inte** toppnivå-header-fält utan finns under `carePlan.accountableHealthcareProfessional`. De är valfria i kontraktet men krävs av Regel 1 för korrekt Sparr-hantering.

| RIVTA PDL-element | FHIR-destination | Sparr-nivå |
|---|---|---|
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `carePlan.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` | Inre Sparr |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `healthcareProfessionalCareUnitHSAId` |

---

## TypeOfCarePlan – kodverk

| Kod | Display | Beskrivning |
|---|---|---|
| `SIP` | SIP | Samordnad individuell plan |
| `SPLPTLRV` | SPLPTLRV | Samordnad plan enligt LPT och LRV |
| `SPU` | SPU | Samordnad plan vid utskrivning |
| `VP` | VP | Vårdplan |
| `HP` | HP | Habiliteringsplan |
| `RP` | RP | Rehabiliteringsplan |
| `GP` | GP | Genomförandeplan |
| `SVP` | SVP | Standardiserad vårdplan |

---

## OID-till-URI-tabell

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Föreslagna nya issues

| Id | Fråga | Status |
|---|---|---|
| CP-001 | `carePlan.content` (MultimediaType) saknar standardiserat FHIR R4-uttryck i CarePlan. Bör en lokal extension definieras i profilen med fälten `mediaType`, `value` (base64Binary) och `reference` (url), eller ska `DocumentReference` användas som alternativ resurs? | Föreslagen |
| CP-002 | `carePlan.participatingCareUnitHSAId` mappas till `CarePlan.contributor` (Reference(CareTeam\|Organization\|Patient\|Practitioner\|RelatedPerson)). Organization är lämpligast för enhetsnivå. Bör logisk referens via identifier tillåtas utan att Organization-resurs skapas? | Föreslagen |
| CP-003 | OrgUnit-kontaktdetaljer (`orgUnitTelecom`, `orgUnitEmail`, `orgUnitAddress`, `orgUnitLocation`) under `accountableHealthcareProfessional.healthcareProfessionalOrgUnit` är ej mappade i FHIR CarePlan/PractitionerRole. Ska dessa fält ignoreras eller kräver de skapande av en fullständig Organization-resurs? | Föreslagen |
