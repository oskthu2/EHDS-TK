# GetFunctionalStatus – Funktionstillstånd och ADL

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetFunctionalStatus v2.0  
**FHIR-profil:** [SEEHDSConditionFunctional](StructureDefinition-se-ehds-condition-functional.html)  
**Logisk modell:** [SEEHDSLMFunctionalStatus](StructureDefinition-se-ehds-lm-functional-status.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Funktionstillstånd (ICF-baserad)

---

## Härledda fält / Designbeslut

### En Condition per functionalStatusAssessment

Varje `functionalStatusAssessment`-post mappas till en `Condition`-resurs med profilen `SEEHDSConditionFunctional`. Roten för ett svar är `functionalStatusAssessment 0..*`.

### assessmentCategory styr körningens innehåll

`functionalStatusAssessmentBody.assessmentCategory` avgör vilka underelement som är relevanta:

| `assessmentCategory` | Underelement | FHIR-mappning |
|---|---|---|
| `pad-pad` (PADL) | `padl 0..*` | `Condition.note` (se [FUNC-001](#öppna-frågor)) |
| `fun-fun` (Funktionsnedsättning) | `disability 0..1` | `Condition.code` (ICF-kod) |

Kategorin i sig mappas alltid till `Condition.category` från kodverket `AssessmentCategoryCS`.

### clinicalStatus och verificationStatus

Inget explicit statusfält finns i TKB:n. Fälten härleds:

| Fält | Värde | Motivering |
|---|---|---|
| `Condition.clinicalStatus` | `active` | Posterna är aktiva bedömningar vid svarstillfället |
| `Condition.verificationStatus` | `confirmed` | RIVTA-svar representerar bekräftade journaluppgifter |

### PADL-poster utan dedikerat FHIR-element

`padl`-blockets `typeOfAssessment` och `assessment` har inget naturligt hem i Condition-resursen. Dessa enkodas som `Condition.note`-poster i ordning. Se [FUNC-001](#öppna-frågor).

---

## Mappningstabell – functionalStatusAssessmentHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentHeader.documentId` | 1..1 | `Condition.identifier.value` | Källsystemets dokumentidentifierare |
| `functionalStatusAssessmentHeader.sourceSystemHSAId` | 1..1 | `Condition.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `functionalStatusAssessmentHeader.patientId.extension` | 1..1 | `Condition.subject.identifier.value` | Personnummer eller samordningsnummer |
| `functionalStatusAssessmentHeader.patientId.root` | 1..1 | `Condition.subject.identifier.system` | OID→URI, se tabell nedan |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Condition.recordedDate` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `Condition.recorder` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr |
| `functionalStatusAssessmentHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `Condition.extension[assertedDate]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `Condition.asserter` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `functionalStatusAssessmentHeader.approvedForPatient` | 1..1 | (ej mappad) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |
| `functionalStatusAssessmentHeader.careContactId` | 0..1 | `Condition.encounter.identifier.value` | Logisk referens till vårdkontakt |

---

## Mappningstabell – functionalStatusAssessmentBody

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentBody.assessmentCategory` | 1..1 | `Condition.category` | Kodverk `AssessmentCategoryCS`; pad-pad eller fun-fun |
| `functionalStatusAssessmentBody.comment` | 0..1 | `Condition.note[0].text` | Fritext-kommentar för hela bedömningen |

### Underelement – padl (vid assessmentCategory = pad-pad)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentBody.padl` | 0..* | `Condition.note[n]` | Varje PADL-post enkodas som en note; se [FUNC-001](#öppna-frågor) |
| `functionalStatusAssessmentBody.padl.typeOfAssessment` | 1..1 | `Condition.note[n].text` (prefix) | Typ av PADL-bedömning; läggs som prefix i note-texten, t.ex. `[typeOfAssessment]: assessment` |
| `functionalStatusAssessmentBody.padl.assessment` | 1..1 | `Condition.note[n].text` (suffix) | Textuell PADL-bedömning |

### Underelement – disability (vid assessmentCategory = fun-fun)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentBody.disability.disabilityAssessment.code` | 1..1 | `Condition.code.coding.code` | ICF-kod |
| `functionalStatusAssessmentBody.disability.disabilityAssessment.codeSystem` | 1..1 | `Condition.code.coding.system` | OID `1.2.752.116.1.1.3` → `urn:oid:1.2.752.116.1.1.3` (ICF, se tabell nedan) |
| `functionalStatusAssessmentBody.disability.disabilityAssessment.displayName` | 0..1 | `Condition.code.coding.display` | Kodverkets officiella benämning |
| `functionalStatusAssessmentBody.disability.comment` | 0..1 | `Condition.note[n].text` | Kommentar specifik för funktionsnedsättningsbedömningen |

---

## PDL och Sparr

PDL-styrning i GetFunctionalStatus utgår från `accountableHealthcareProfessional`-blockets HSA-id:n i headern (samma mönster som övriga PatientSummaryHeader-kontrakt):

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `functionalStatusAssessmentHeader.approvedForPatient` (boolean) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` (env-variabel) |

`Provenance.target` refererar Condition via `urn:uuid:{Condition.id}`.  
`Provenance.recorded` = `functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).

---

## Öppna frågor

| ID | Fråga |
|---|---|
| FUNC-001 | **PADL-poster saknar dedikerat FHIR Condition-element.** `padl.typeOfAssessment` och `padl.assessment` har ingen naturlig placering i Condition. Nuvarande workaround är att enkoda varje PADL-post som en `Condition.note` med prefixat format `[typeOfAssessment]: assessment`. Alternativ: använda en separat Observation-resurs per PADL-post. Kräver designbeslut. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** Fältet finns i alla PatientSummaryHeader-kontrakt men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |
| `1.2.752.116.1.1.3` | `urn:oid:1.2.752.116.1.1.3` |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.
