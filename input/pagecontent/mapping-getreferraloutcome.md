# GetReferralOutcome – Remissvar / Konsultationssvar

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetReferralOutcome v3.2  
**FHIR-profil:** [IneraEHDSDiagnosticReportReferral](StructureDefinition-inera-ehds-diagnostic-report-referral.html)  
**Logisk modell:** [IneraEHDSLMReferralOutcome](StructureDefinition-inera-ehds-lm-referral-outcome.html)  
**Krävs för NPÖ:** Ja (v3.2) | **Krävs för 1177 Journal:** Ja (v3.2)  
**EHDS-koppling:** Remissvar – relaterar till vårdprocess och resultat (ej separat EHDS-huvudkategori)

---

## Resurshierarki

```
IneraEHDSDiagnosticReportReferral (1 per referralOutcome)
  └── basedOn → ServiceRequest (logisk referens via referral.referralId)
  └── performer → PractitionerRole (accountableHealthcareProfessional)
```

Varje `referralOutcome`-post i svaret ger upphov till en `DiagnosticReport`. Om `referralOutcomeBody.act`-poster finns med multimedia representeras dessa som `DiagnosticReport.presentedForm`-bilagor eller via extension – se [REF-001](#öppna-frågor).

---

## Mappningstabell – referralOutcomeHeader (PatientSummaryHeader)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcomeHeader.documentId` | 1..1 | `DiagnosticReport.identifier[0].value` | Källsystemets dokumentidentifierare |
| `referralOutcomeHeader.sourceSystemHSAId` | 1..1 | `DiagnosticReport.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `referralOutcomeHeader.documentTitle` | 0..1 | `DiagnosticReport.extension[title]` | Dokumenttitel; extension krävs då DiagnosticReport saknar title-fält i R4 |
| `referralOutcomeHeader.documentTime` | 1..1 | `DiagnosticReport.issued` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `referralOutcomeHeader.patientId.value` | 1..1 | `DiagnosticReport.subject.identifier.value` | Personnummer eller samordningsnummer |
| `referralOutcomeHeader.patientId.system` | 1..1 | `DiagnosticReport.subject.identifier.system` | OID→URI, se tabell nedan |
| `referralOutcomeHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Provenance.recorded` | Tidpunkt för ansvarig yrkesutövare; YYYYMMDDHHMMSS → ISO 8601 |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `PractitionerRole.identifier.value` | Logisk referens via HSA-id; DiagnosticReport.performer → Reference(PractitionerRole) |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn för ansvarig yrkesutövare |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefonnummer till org-enhet; ingen standardiserad plats på DiagnosticReport; kan läggas på Organization.telecom om Organization-instans skapas |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post till org-enhet; kan läggas på Organization.telecom om Organization-instans skapas |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Adress till org-enhet; kan läggas på Organization.address om Organization-instans skapas |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Plats/lokation för org-enhet; kan läggas på Organization.address.city om Organization-instans skapas |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – informationsägande vårdenhet |
| `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – juridiskt ansvarig vårdgivare |
| `referralOutcomeHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `DiagnosticReport.extension[attested].attestedTime` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `referralOutcomeHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `DiagnosticReport.extension[attested].attestorHSAId` | HSA-id för signerare |
| `referralOutcomeHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |
| `referralOutcomeHeader.approvedForPatient` | 1..1 | `DiagnosticReport.meta.security` | PDL-kontroll – se [PDL-001](#öppna-frågor) |
| `referralOutcomeHeader.careContactId` | 0..1 | `DiagnosticReport.encounter.identifier.value` | Logisk referens till vårdkontakt |

---

## Mappningstabell – referralOutcomeBody

### Svarstext och klassificering

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcomeBody.referralOutcomeTypeCode` | 1..1 | `DiagnosticReport.status` | SS=`final`, SR=`preliminary`; se [Härledda fält](#diagnosticreportstatus-från-referraloutcometypecode) |
| `referralOutcomeBody.referralOutcomeTitle` | 0..1 | `DiagnosticReport.extension[title]` | Titelprioritering: referralOutcomeTitle > documentTitle; se [Titel-prioritering](#titel-prioritering-diagnosticreportextensiontitle) |
| `referralOutcomeBody.referralOutcomeText` | 1..1 | `DiagnosticReport.conclusion` | Fritext remissvar/utlåtande |

### Klinisk information (clinicalInformation)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcomeBody.clinicalInformation[i].clinicalInformationCode` | 1..1 | `DiagnosticReport.conclusionCode[i]` | Klinisk informationskod (t.ex. diagnoskod) |
| `referralOutcomeBody.clinicalInformation[i].clinicalInformationText` | 1..1 | `DiagnosticReport.conclusion` (sammanslagen) | Fritextbeskrivning av klinisk information; konkateneras med referralOutcomeText; se [clinicalInformation-sammanslagning](#clinicalinformation-sammanslagning) |

### Åtgärder (act)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcomeBody.act[i].actId` | 0..1 | `DiagnosticReport.presentedForm[i].url` | Åtgärdsidentifierare; se [REF-001](#öppna-frågor) |
| `referralOutcomeBody.act[i].actCode` | 0..1 | `DiagnosticReport.extension[act][i].actCode` | Klinisk åtgärdskod (KVÅ eller lokalt kodsystem); kräver lokal extension |
| `referralOutcomeBody.act[i].actText` | 1..1 | `DiagnosticReport.presentedForm[i].title` | Fritextbeskrivning av åtgärd; se [REF-001](#öppna-frågor) |
| `referralOutcomeBody.act[i].actTime` | 0..1 | `DiagnosticReport.extension[act][i].actTime` | Tidpunkt för åtgärd; YYYYMMDDHHMMSS → ISO 8601; kräver lokal extension |
| `referralOutcomeBody.act[i].actResult[j].mediaType` | 1..1 | `DiagnosticReport.presentedForm[i].contentType` | MIME-typ för resultatet (t.ex. `application/pdf`, `image/jpeg`) |
| `referralOutcomeBody.act[i].actResult[j].value` | 0..1 | `DiagnosticReport.presentedForm[i].data` | Binärdata base64-kodat; XOR med reference |
| `referralOutcomeBody.act[i].actResult[j].reference` | 0..1 | `DiagnosticReport.presentedForm[i].url` | URL till externt dokument; XOR med value |

### Attestering (attested)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcomeBody.attested.attestedTime` | 1..1 (om attested) | `DiagnosticReport.extension[attested].attestedTime` | Tid för attestering; YYYYMMDDHHMMSS → ISO 8601 |
| `referralOutcomeBody.attested.attesterHSAId` | 0..1 | `DiagnosticReport.extension[attested].attestorHSAId` | Attesterarens HSA-id |
| `referralOutcomeBody.attested.attesterName` | 0..1 | Ej mappad | Attesterarens namn i klartext – HSA-id räcker för logisk referens |

### Kopplad remiss (referral)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcomeBody.referral.referralId` | 1..1 | `DiagnosticReport.basedOn.identifier` | Logisk referens till ursprungsremiss (ServiceRequest) via remissens id |
| `referralOutcomeBody.referral.referralReason` | 1..1 | Ej mappad till DiagnosticReport | Remissorsak tillhör ursprungsremissen (ServiceRequest.note); repeteras ej i svaret |
| `referralOutcomeBody.referral.referralTime` | 0..1 | Ej mappad till DiagnosticReport | Remisstid tillhör ursprungsremissen (ServiceRequest.authoredOn) |
| `referralOutcomeBody.referral.referralAuthor.authorTime` | 1..1 | Ej mappad till DiagnosticReport | Remittentens åtgärdstidpunkt tillhör ursprungsremissen |
| `referralOutcomeBody.referral.referralAuthor.healthcareProfessionalHSAId` | 0..1 | Ej mappad till DiagnosticReport | Remittentens HSA-id tillhör ursprungsremissen (ServiceRequest.requester) |
| `referralOutcomeBody.referral.referralAuthor.healthcareProfessionalName` | 0..1 | Ej mappad till DiagnosticReport | Remittentens namn tillhör ursprungsremissen |
| `referralOutcomeBody.referral.referralAuthor.healthcareProfessionalRoleCode` | 0..1 | Ej mappad till DiagnosticReport | Remittentens yrkesroll tillhör ursprungsremissen |
| `referralOutcomeBody.referral.referralAuthor.healthcareProfessionalOrgUnit` | 0..1 | Ej mappad till DiagnosticReport | Remittentens org-enhet tillhör ursprungsremissen; se [Referral → ServiceRequest](#referral--servicerequest) |
| `referralOutcomeBody.referral.careContactId` | 0..1 | `DiagnosticReport.encounter.identifier.value` | Alternativ källa för vårdkontaktsreferens om header.careContactId saknas |

> **Obs – DiagnosticReport.code:** Sätts alltid till LOINC `11488-4` ("Consult note") som fast kod för remissvar. Det finns inget valfritt kodningsfält i TKB för utlåtandetypen utöver `referralOutcomeTypeCode`.

> Alla `referralOutcomeBody.referral.*`-fält utom `referralId` och `careContactId` är attribut till ursprungsremissen. En logisk referens via `DiagnosticReport.basedOn` → `ServiceRequest.identifier` är tillräcklig. Bryggan skapar en minimal stub-ServiceRequest om ingen matchning finns.

---

## Härledda fält / Designbeslut

### DiagnosticReport.status (från referralOutcomeTypeCode)

| referralOutcomeTypeCode | Beskrivning | DiagnosticReport.status |
|---|---|---|
| `SS` | Specialistutlåtande/svar (slutgiltig bedömning) | `final` |
| `SR` | Specialistremissvar (preliminärt/delsvar) | `preliminary` |

### Titel-prioritering (DiagnosticReport.extension[title])

Titeln sätts enligt följande prioriteringsordning:

1. `referralOutcomeBody.referralOutcomeTitle` (om satt)
2. `referralOutcomeHeader.documentTitle` (om satt)
3. (inget värde) – extension sätts inte

### act-poster och multimedia (REF-001)

`referralOutcomeBody.act 0..*` representerar utförda åtgärder med eventuella bilagor. FHIR `DiagnosticReport` har inget dedikerat element för åtgärdslistor. Designbeslut:

- `act[i].actText` + multimedia (`actResult`) → `DiagnosticReport.presentedForm[i]`
- `act[i].actCode` + `act[i].actTime` → `DiagnosticReport.extension[act]` (kräver custom extension)
- `actResult.value` (base64Binary) → `presentedForm[i].data`
- `actResult.reference` (url) → `presentedForm[i].url`

Se [REF-001](#öppna-frågor) för öppen fråga.

### clinicalInformation-sammanslagning

`clinicalInformation 0..*` innehåller kliniska fynd/slutsatser med kod och fritext. Koden mappas till `DiagnosticReport.conclusionCode`; fritexterna konkateneras med `referralOutcomeText` i `DiagnosticReport.conclusion`:

```
{referralOutcomeText}
\n
[{clinicalInformationCode.display}]: {clinicalInformationText}   ← per clinicalInformation-post
```

### Referral → ServiceRequest

Om `referralOutcomeBody.referral.referralId` finns skapas en logisk referens till en `ServiceRequest` via `DiagnosticReport.basedOn`. Bryggan ansvarar för att matcha `referralId` mot befintliga ServiceRequest-instanser (från GetReferralOutcome eller GetRequestActivities) eller skapa en minimal stub-ServiceRequest med enbart identifier satt. Remissens övriga fält (`referralReason`, `referralTime`, `referralAuthor.*`) tillhör ServiceRequest och repeteras inte i DiagnosticReport.

---

## PDL och Sparr

PDL-styrning i GetReferralOutcome utgår från `accountableHealthcareProfessional`-blockets HSA-id:n i headern (standard PatientSummaryHeader-mönster):

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `referralOutcomeHeader.approvedForPatient` (boolean) | `DiagnosticReport.meta.security`; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar `DiagnosticReport` via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `referralOutcomeHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).  
`Provenance.agent[author].onBehalfOf` = `referralOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId`.

---

## OID-till-URI-tabell

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| REF-001 | **`act 0..*` saknar standard DiagnosticReport-element.** `referralOutcomeBody.act` innehåller kodad åtgärd (`actCode`), fritext (`actText`), tidpunkt (`actTime`) och eventuell multimedia (`actResult` med `mediaType`/`value`/`reference`). Nuvarande lösning: textinnehåll och bilagor → `presentedForm`, kodad åtgärd → custom extension. Alternativ: en `Procedure`-resurs per `act`-post länkad via `DiagnosticReport.result`. Kräver beslut. |
| PDL-001 | **`approvedForPatient` (boolean) saknar standardiserad FHIR-motsvarighet.** Fältet finns i headern men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut för alla TK:er; se central issue i [mapping-issues](mapping-issues.html). |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält. |

## Föreslagna nya issues

| ID | Fråga |
|---|---|
| REF-002 | **`referralOutcomeBody.attested.attesterName` vs. header-signatär.** Svaret har två potentiella signatärstrukturer: `referralOutcomeHeader.legalAuthenticator` och `referralOutcomeBody.attested`. Nuvarande beslut: båda mappas till samma `DiagnosticReport.extension[attested]`. Om de kan representera olika signatärer (t.ex. juridisk autentiserare vs. klinisk attestant) kan detta skapa konflikter. Behöver klargöras med TKB-förvaltningen om de är semantiskt ekvivalenta eller distinkta. |
| REF-003 | **`referralOutcomeBody.referral.referralAuthor.healthcareProfessionalOrgUnit` – detaljnivå saknas.** Den logiska modellen specificerar `healthcareProfessionalOrgUnit` som ett BackboneElement men specificerar inte sub-fält (orgUnitHSAId, orgUnitName etc.) på denna nivå i FSH-filen. Bryggan bör behandla det som en enkel logisk referens till ursprungsremissens ServiceRequest.requester-org. Verifiera med TKB-förvaltningen om sub-fält finns i faktisk XSD. |
| REF-004 | **`orgUnitTelecom`, `orgUnitEmail`, `orgUnitAddress`, `orgUnitLocation` – ej mappade i PatientSummaryHeader-blocket.** Kontaktuppgifter för org-enheten finns på flera ställen i modellen (header och referral.accountableHealthcareProfessional) men har ingen standardiserad plats i DiagnosticReport-kontexten utan att skapa separata Organization-instanser. Behöver beslut om dessa ska inkluderas alls i bryggan. |
