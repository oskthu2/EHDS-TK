# GetCareContacts – Vårdkontakter

**Tjänstekontrakt:** `clinicalprocess:logistics:logistics` GetCareContacts v3.0  
**FHIR-profil:** [SEEHDSEncounter](StructureDefinition-se-ehds-encounter.html)  
**Logisk modell:** [SEEHDSLMCareContacts](StructureDefinition-se-ehds-lm-care-contacts.html)  
**Krävs för NPÖ:** Ja (v2.0, 3.0) | **Krävs för 1177 Journal:** Ja (v2.0, 3.0)  

---

## Struktur

GetCareContacts returnerar en lista `careContact` (0..*). Varje post innehåller header-fält (documentId, sourceSystemHSAId, patientId, accountableHealthcareProfessional, approvedForPatient) och body-fält (careContactCode, careContactReason, careContactOrgUnit, careContactTimePeriod, careContactStatus, additionalPatientInformation).

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careContact.documentId` | 1..1 | `Encounter.identifier.value` | Unik identitet inom källsystemet |
| `careContact.patientId` | 1..1 | `Encounter.subject.identifier` | OID→URI-konvertering |
| `careContact.sourceSystemHSAId` | 1..1 | `Encounter.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `careContact.accountableHealthcareProfessional.authorTime` | 1..1 | `Encounter.meta.lastUpdated` | Registreringstidpunkt |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `Encounter.participant.individual` (identifier) | Logisk referens |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr (Regel 1) |
| `careContact.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr (Regel 1) |
| `careContact.approvedForPatient` | 1..1 | `Encounter.meta.security` (SUBSETTED) | Regel 3 |
| `careContact.careContactCode` | 0..1 | `Encounter.class` | KV Vårdkontakttyp (OID 1.2.752.129.2.2.2.x) |
| `careContact.careContactReason` | 0..1 | `Encounter.reasonCode.text` | Fri text från patient/företrädare |
| `careContact.careContactOrgUnit.orgUnitHSAId` | 0..1 | `Encounter.serviceProvider.identifier` | Logisk referens till enhet |
| `careContact.careContactOrgUnit.orgUnitName` | 0..1 | `Encounter.serviceProvider.display` | |
| `careContact.careContactTimePeriod.start` | 0..1 | `Encounter.period.start` | Minst ett av start/end krävs om period anges |
| `careContact.careContactTimePeriod.end` | 0..1 | `Encounter.period.end` | |
| `careContact.careContactStatus` | 0..1 | `Encounter.status` | SNOMED CT SE OID 1.2.752.116.2.1.1 |
| `careContact.additionalPatientInformation.dateOfBirth` | 0..1 | `Encounter.subject` (Patient.birthDate) | Om inte hämtas via PU |
| `careContact.additionalPatientInformation.gender` | 0..1 | `Encounter.subject` (Patient.gender) | KV Kön OID 1.2.752.129.2.2.1.1 |

> **Invariant:** `Encounter.period` – om `careContactTimePeriod` anges måste minst ett av `start` och `end` vara satt (`encounter-period-min-one`).

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

Status för vårdkontakt mappas från SNOMED CT SE (OID 1.2.752.116.2.1.1, SCTID 53761000052103) till `Encounter.status`. Mappning av specifika SNOMED-koder till FHIR-statusvärden görs via ConceptMap (ej inkluderad i denna version av IG).
