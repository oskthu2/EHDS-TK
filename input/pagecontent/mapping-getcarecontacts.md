# GetCareContacts – Vårdkontakter

**Tjänstekontrakt:** `clinicalprocess:logistics:logistics` GetCareContacts v3.0  
**FHIR-profil:** [IneraEHDSEncounter](StructureDefinition-inera-ehds-encounter.html)  
**Logisk modell:** [IneraEHDSLMCareContacts](StructureDefinition-inera-ehds-lm-care-contacts.html)  
**Krävs för NPÖ:** Ja (v2.0, 3.0) | **Krävs för 1177 Journal:** Ja (v2.0, 3.0)  

---

## Struktur

GetCareContacts returnerar en lista `careContact` (0..*). Varje post innehåller header-fält (documentId, sourceSystemHSAId, patientId, accountableHealthcareProfessional, approvedForPatient) och body-fält (careContactCode, careContactReason, careContactOrgUnit, careContactTimePeriod, careContactStatus, additionalPatientInformation).

---

## Mappningstabell

### Header – identitet och patient

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.documentId` | 1..1 | `Encounter.identifier[0].value` | Källsystemets dokumentidentitet; unik inom källsystemet |
| `careContact.sourceSystemHSAId` | 1..1 | `Encounter.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `careContact.patientId.extension` | 1..1 | `Encounter.subject.identifier.value` | Personnummer eller samordningsnummer |
| `careContact.patientId.root` | 1..1 | `Encounter.subject.identifier.system` | OID→URI-konvertering (se OID-tabell nedan) |

### Header – ansvarig personal (accountableHealthcareProfessional)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.accountableHealthcareProfessional.authorTime` | 1..1 | `Encounter.meta.lastUpdated` | Registreringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `PractitionerRole.identifier.value` | Via `Encounter.participant.individual`-referens |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Valfritt komplement till HSA-id |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Befattningskod (KV Befattning OID 1.2.752.129.2.2.1.4) |

### Header – ansvarig personal – organisationsenhet

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier` | HSA-id för organisationsenhet |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Namn på organisationsenhet |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefonnummer till org.enhet – ingår ej i PractitionerRole.organization; kan lagras i Organization.telecom om Organization-resurs skapas |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post till org.enhet – se `orgUnitTelecom` ovan |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Postadress till org.enhet – ingår ej i PractitionerRole; kan lagras i Organization.address om Organization-resurs skapas |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Fritextplats för org.enhet – ingen standardiserad FHIR-plats i Encounter/PractitionerRole |

### Header – PDL/Sparr

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – vårdenhet (Regel 1) |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – vårdgivare (Regel 1) |
| `careContact.approvedForPatient` | 1..1 | `Encounter.meta.security` | PDL-kontroll (Regel 3) – se PDL-001 i mapping-issues |
| `careContact.documentTitle` | 0..0 | N/A | Ej tillämpligt för detta TK |
| `careContact.documentTime` | 0..0 | N/A | Ej tillämpligt för detta TK |
| `careContact.legalAuthenticator` | 0..0 | N/A | Ej tillämpligt för detta TK |
| `careContact.nullified` | 0..0 | N/A | Ej tillämpligt för detta TK |
| `careContact.nullifiedReason` | 0..0 | N/A | Ej tillämpligt för detta TK |
| `careContact.careContactId` | 0..0 | N/A | Ej tillämpligt för detta TK (careContactId är en korsreferens som inte gäller för kontakter i sin egen lista) |

### Body – kontakttyp, orsak och status

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.careContactCode` | 0..1 | `Encounter.class` | KV Vårdkontakttyp (OID 1.2.752.129.2.2.2.x) |
| `careContact.careContactReason` | 0..1 | `Encounter.reasonCode.text` | Fri text från patient eller företrädare |
| `careContact.careContactStatus` | 0..1 | `Encounter.status` | SNOMED CT SE (OID 1.2.752.116.2.1.1, SCTID 53761000052103); kräver ConceptMap – se CC-001 |

### Body – tid

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.careContactTimePeriod` | 0..1 | `Encounter.period` | Om angiven måste minst ett av start/end vara satt |
| `careContact.careContactTimePeriod.start` | 0..1 | `Encounter.period.start` | YYYYMMDDHHMMSS → ISO 8601 |
| `careContact.careContactTimePeriod.end` | 0..1 | `Encounter.period.end` | YYYYMMDDHHMMSS → ISO 8601 |

> **Invariant:** Om `careContactTimePeriod` anges måste minst ett av `start` och `end` vara satt (`encounter-period-min-one`).

### Body – kontaktenhet (careContactOrgUnit)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.careContactOrgUnit` | 0..1 | — | Enhet för kontakten (Regel 5) |
| `careContact.careContactOrgUnit.orgUnitHSAId` | 1..1 | `Encounter.serviceProvider.identifier` | Logisk referens till Organization via HSA-id – obligatorisk per Regel 4 |
| `careContact.careContactOrgUnit.orgUnitName` | 1..1 | `Encounter.serviceProvider.display` | Visningsnamn för kontaktenhet – obligatorisk per Regel 4 |
| `careContact.careContactOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefon till kontaktenhet – ingår ej i Encounter.serviceProvider; kan lagras i Organization.telecom om Organization-resurs skapas |
| `careContact.careContactOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post till kontaktenhet – se `orgUnitTelecom` ovan |
| `careContact.careContactOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Adress till kontaktenhet – ingår ej i Encounter; kan lagras i Organization.address om Organization-resurs skapas |
| `careContact.careContactOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Fritextplats för kontaktenhet – ingen standardiserad FHIR-plats i Encounter |

### Body – ytterligare patientinformation (additionalPatientInformation)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.additionalPatientInformation` | 0..1 | — | Ytterligare patientuppgifter – komplement när PU-tjänsten ej används |
| `careContact.additionalPatientInformation.dateOfBirth` | 0..1 | `Patient.birthDate` (via `Encounter.subject`) | Lagras på Patient-resursen om en skapas; YYYY / YYYYMM / YYYYMMDD → ISO 8601-datum |
| `careContact.additionalPatientInformation.gender` | 0..1 | `Patient.gender` (via `Encounter.subject`) | KV Kön (OID 1.2.752.129.2.2.1.1) → FHIR AdministrativeGender; kräver ConceptMap |

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

PDL-fälten finns under `careContact.accountableHealthcareProfessional` (inte på toppnivå).

| RIVTA PDL-element | FHIR-destination | Sparr-nivå |
|---|---|---|
| `careContact.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` | Inre Sparr |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `healthcareProfessionalCareUnitHSAId` |

---

## careContactCode – KV Vårdkontakttyp

Kodverket KV Vårdkontakttyp (OID 1.2.752.129.2.2.2.x) innehåller koder som anger kontaktform. Vanliga värden inkluderar öppenvård, slutenvård och hemsjukvård. Exakt version specificeras av producenten.

---

## careContactStatus – SNOMED CT SE

Status för vårdkontakt mappas från SNOMED CT SE (OID 1.2.752.116.2.1.1, SCTID 53761000052103) till `Encounter.status`. Mappning av specifika SNOMED-koder till FHIR-statusvärden görs via ConceptMap (ej inkluderad i denna version av IG) – se CC-001.

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
| CC-001 | ConceptMap för SNOMED CT SE (OID 1.2.752.116.2.1.1, SCTID 53761000052103) → FHIR `Encounter.status` saknas. Vilka SNOMED-koder ingår i urvalet, och hur mappas de till FHIR-värdemängden (planned, arrived, triaged, in-progress, onleave, finished, cancelled)? | Föreslagen |
| CC-002 | OrgUnit-kontaktdetaljer (`orgUnitTelecom`, `orgUnitEmail`, `orgUnitAddress`, `orgUnitLocation`) förekommer på två ställen: under `accountableHealthcareProfessional.healthcareProfessionalOrgUnit` och under `careContactOrgUnit`. Inget av dessa fält mappas i FHIR Encounter. Ska de ignoreras, eller kräver de att en fullständig Organization-resurs skapas med `Organization.telecom` och `Organization.address`? | Föreslagen |
| CC-003 | `careContact.additionalPatientInformation.gender` (KV Kön OID 1.2.752.129.2.2.1.1, koder 0/1/2/9) behöver ConceptMap till FHIR AdministrativeGender (male/female/other/unknown). Bör denna ConceptMap delas med andra TK som använder samma kodverk? | Föreslagen |
