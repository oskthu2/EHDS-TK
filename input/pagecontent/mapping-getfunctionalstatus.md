# GetFunctionalStatus – Funktionstillstånd och ADL

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetFunctionalStatus v2.0  
**FHIR-profil:** [IneraEHDSConditionFunctional](StructureDefinition-inera-ehds-condition-functional.html)  
**Logisk modell:** [IneraEHDSLMFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Funktionstillstånd (ICF-baserad)

---

## Härledda fält / Designbeslut

### En Condition per functionalStatusAssessment

Varje `functionalStatusAssessment`-post mappas till en `Condition`-resurs med profilen `IneraEHDSConditionFunctional`. Roten för ett svar är `functionalStatusAssessment 0..*`.

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

### PADL-poster (FUNC-001 – Beslutat)

`padl`-blockets `typeOfAssessment` och `assessment` mappas till `Condition.note` med formatet
`[typeOfAssessment]: assessment` per post. `functionalStatusAssessmentBody.comment` mappas separat till
`Condition.note[0]` (helbedömningskommentar); därefter en post per `padl`-element.

Alternativet med separata `Observation`-resurser per PADL-post ger bättre strukturerbarhet
men ökar resurskomplexiteten avsevärt. Det kan omprövas om strukturerad sökning på
PADL-typ krävs.

---

## Mappningstabell – functionalStatusAssessmentHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentHeader.documentId` | 1..1 | `Condition.identifier[0].value` | Källsystemets dokumentidentifierare |
| `functionalStatusAssessmentHeader.sourceSystemHSAId` | 1..1 | `Condition.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `functionalStatusAssessmentHeader.documentTime` | 1..1 | `Condition.extension[assertedDate]` | Bedömningstidpunkt/händelsetidpunkt; YYYYMMDDHHMMSS → ISO 8601, se [GENERAL-001](#öppna-frågor) |
| `functionalStatusAssessmentHeader.patientId.extension` | 1..1 | `Condition.subject.identifier.value` | Personnummer eller samordningsnummer |
| `functionalStatusAssessmentHeader.patientId.root` | 1..1 | `Condition.subject.identifier.system` | OID→URI, se tabell nedan |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Condition.recordedDate` | Registreringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `Condition.recorder` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – vårdenhet |
| `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – vårdgivare |
| `functionalStatusAssessmentHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `Condition.extension[assertedDate]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 (om legalAuthenticator finns, prioriteras framför documentTime) |
| `functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `Condition.asserter` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |
| `functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorRoleCode` | 0..1 | Ej mappad | Signerande persons befattning – ingen direkt FHIR-mappning utanför PractitionerRole; Condition.asserter är en Reference utan rollkod |
| `functionalStatusAssessmentHeader.approvedForPatient` | 1..1 | `Condition.meta.security` | `false` → kod `NOPATIENT` från `http://terminology.hl7.org/CodeSystem/v3-ActCode`; se PDL-001 |
| `functionalStatusAssessmentHeader.careContactId` | 0..1 | `Condition.encounter.identifier.value` | Logisk referens till vårdkontakt |
| `functionalStatusAssessmentHeader.documentTitle` | 0..0 | N/A | Ej tillämpligt för detta TK (markerat 0..0 i logisk modell) |
| `functionalStatusAssessmentHeader.nullified` | 0..0 | N/A | Ej tillämpligt för detta TK |
| `functionalStatusAssessmentHeader.nullifiedReason` | 0..0 | N/A | Ej tillämpligt för detta TK |

---

## Mappningstabell – functionalStatusAssessmentBody

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentBody.assessmentCategory` | 1..1 | `Condition.category` | Kodverk `AssessmentCategoryCS`; `pad-pad` eller `fun-fun` |
| `functionalStatusAssessmentBody.comment` | 0..1 | `Condition.note[0].text` | Fritext-kommentar för hela bedömningen. Villkor: Gäller enbart vid assessmentCategory = 'pad-pad'. |

### Underelement – padl (vid assessmentCategory = pad-pad)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentBody.padl` | 0..* | `Condition.note[n]` | Varje PADL-post enkodas som en note; se [FUNC-001](#öppna-frågor) |
| `functionalStatusAssessmentBody.padl.typeOfAssessment` | 1..1 | `Condition.note[n].text` (prefix) | Typ av PADL-bedömning; läggs som prefix i note-texten, t.ex. `[typeOfAssessment]: assessment`. Tillåtna värden (Regel 2): 'personlig hygien', 'på/avklädning', 'förflyttning', 'toalettbesök', 'födointag' |
| `functionalStatusAssessmentBody.padl.assessment` | 1..1 | `Condition.note[n].text` (suffix) | Textuell PADL-bedömning |

### Underelement – disability (vid assessmentCategory = fun-fun)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusAssessmentBody.disability.disabilityAssessment` | 1..1 | `Condition.code` | ICF-kod för funktionsnedsättning; se underelement nedan |
| `functionalStatusAssessmentBody.disability.disabilityAssessment.code` | — | `Condition.code.coding.code` | ICF-kod, t.ex. `b310` |
| `functionalStatusAssessmentBody.disability.disabilityAssessment.codeSystem` | — | `Condition.code.coding.system` | OID `1.2.752.116.1.1.3` → `urn:oid:1.2.752.116.1.1.3` (ICF, se tabell nedan) |
| `functionalStatusAssessmentBody.disability.disabilityAssessment.displayName` | 0..1 | `Condition.code.coding.display` | Kodverkets officiella benämning |
| `functionalStatusAssessmentBody.disability.comment` | 0..1 | `Condition.note[n].text` | Kommentar specifik för funktionsnedsättningsbedömningen |

> **CVType-restriktion för `disabilityAssessment`:** `codeSystemName` och `codeSystemVersion` är förbjudna (0..0) i detta fält per TKB. Använd enbart `code`, `codeSystem`, `displayName` och `originalText`.

---

## Mappningstabell – result

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.logId` | 1..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## PDL och Sparr

PDL-styrning i GetFunctionalStatus utgår från `accountableHealthcareProfessional`-blockets HSA-id:n i headern (samma mönster som övriga PatientSummaryHeader-kontrakt):

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `functionalStatusAssessmentHeader.approvedForPatient` (boolean) | `Condition.meta.security`; `false` → `NOPATIENT` (v3-ActCode) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `functionalStatusAssessmentHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar Condition via `urn:uuid:{Condition.id}`.  
`Provenance.recorded` = `functionalStatusAssessmentHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |
| `1.2.752.116.1.1.3` | `urn:oid:1.2.752.116.1.1.3` |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| FUNC-001 | **Beslutat:** PADL-poster kodas som `Condition.note` med format `[typeOfAssessment]: assessment`. Se avsnitt ovan. |
| PDL-001 | **Beslutat:** `approvedForPatient = false` → `meta.security` kod `NOPATIENT` (v3-ActCode). Se README avsnitt 9. |
| GENERAL-001 | **Öppen:** Tidsstämpelformat. RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |

---

## Föreslagna nya issues

| ID | Fält | Beskrivning |
|---|---|---|
| FUNC-002 | `functionalStatusAssessmentHeader.legalAuthenticator.legalAuthenticatorRoleCode` | Signerande persons befattning (CodeableConcept). Det finns inget standardelement i Condition för detta. `Condition.asserter` är en enkel Reference utan plats för rollkod. Alternativ: (a) enkoda i den refererade PractitionerRole-resursen om en sådan skapas, eller (b) ignorera då det är samma person som legalAuthenticatorHSAId och rollkoden hämtas via HSA-katalogen. Kräver designbeslut. |
