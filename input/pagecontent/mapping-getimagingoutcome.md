# GetImagingOutcome – Bilddiagnostik

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetImagingOutcome v1.0  
**FHIR-profiler:** [IneraEHDSDiagnosticReportImaging](StructureDefinition-inera-ehds-diagnostic-report-imaging.html) (primär) | [ImagingStudy](http://hl7.org/fhir/R4/imagingstudy.html) (sekundär, per imageRecording)  
**Logisk modell:** [IneraEHDSLMImagingOutcome](StructureDefinition-inera-ehds-lm-imaging-outcome.html)  
**Krävs för NPÖ:** Ja (v1.0) | **Krävs för 1177 Journal:** Ja (v1.0)  
**EHDS-koppling:** Medical imaging studies – bilddiagnostiska utlåtanden

---

## Resurshierarki

```
imagingOutcome 0..*
│
IneraEHDSDiagnosticReportImaging  (1 per imagingOutcome – utlåtandet)
  └── ImagingStudy               (0..* per imageRecording – undersökning/DICOM-data)
```

En `imagingOutcome` representerar ett bilddiagnostiskt utlåtande (t.ex. ett röntgensvar) och mappas till en `IneraEHDSDiagnosticReportImaging`. Varje `imageRecording` inom svaret (enskilda undersökningar med modalitetsdata) mappas till en separat `ImagingStudy`-instans. Referensen `DiagnosticReport.imagingStudy` binder ihop utlåtandet med undersökningarna. Se [IMG-002](#öppna-frågor) för DICOM-designfrågor.

---

## Mappningstabell – IneraEHDSDiagnosticReportImaging

Rotelementet `imagingOutcomeHeader` och `imagingOutcomeBody` mappas gemensamt till DiagnosticReport.

### imagingOutcomeHeader (PatientSummaryHeader)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imagingOutcomeHeader.documentId` | 1..1 | `DiagnosticReport.identifier[0].value` | Källsystemets dokumentidentifierare |
| `imagingOutcomeHeader.sourceSystemHSAId` | 1..1 | `DiagnosticReport.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `imagingOutcomeHeader.documentTitle` | 0..1 | `DiagnosticReport.extension[title]` | Dokumenttitel; kräver lokal extension då DiagnosticReport saknar title-fält i R4 |
| `imagingOutcomeHeader.documentTime` | 0..1 | `DiagnosticReport.issued` | Tidpunkt för dokumentet; YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `imagingOutcomeHeader.patientId.value` | 1..1 | `DiagnosticReport.subject.identifier.value` | Personnummer eller samordningsnummer |
| `imagingOutcomeHeader.patientId.system` | 1..1 | `DiagnosticReport.subject.identifier.system` | OID→URI, se tabell nedan |
| `imagingOutcomeHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Provenance.recorded` | Ansvarig persons åtgärdstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `PractitionerRole.identifier.value` | Tolkande radiolog / ansvarig läkares HSA-id |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Utförande enhets HSA-id |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Utförande enhets namn |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefonnummer till org-enhet; ingen standardiserad plats på PractitionerRole/Organization i DiagnosticReport-kontexten |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post till org-enhet; ingen standardiserad plats; kan läggas på Organization.telecom om Organization-instans skapas |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Adress till org-enhet; kan läggas på Organization.address om Organization-instans skapas |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Plats/lokation för org-enhet; kan läggas på Organization.address.city om Organization-instans skapas |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – informationsägande vårdenhet |
| `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – juridiskt ansvarig vårdgivare |
| `imagingOutcomeHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `DiagnosticReport.extension[signatureTime]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `imagingOutcomeHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `DiagnosticReport.resultsInterpreter.identifier` | Medicinskt ansvarig för utlåtandet |
| `imagingOutcomeHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |
| `imagingOutcomeHeader.approvedForPatient` | 1..1 | `DiagnosticReport.meta.security` | PDL-kontroll – se [PDL-001](#öppna-frågor) |
| `imagingOutcomeHeader.careContactId` | 0..1 | `DiagnosticReport.encounter.identifier` | Logisk referens till Encounter/vårdkontakt |
| `imagingOutcomeHeader.nullified` | 0..1 | (härledd till `DiagnosticReport.status`) | `true` → `status = entered-in-error`; se [IMG-001](#öppna-frågor) |
| `imagingOutcomeHeader.nullifiedReason` | 0..1 | `DiagnosticReport.extension[nullifiedReason]` | Orsak till makulering; fritext |

### imagingOutcomeBody

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imagingOutcomeBody.examinationSpeciality` | 0..1 | `DiagnosticReport.code` | Undersökningsspecialitet; om saknad sätts en fast LOINC-kod för bilddiagnostik (se [DiagnosticReport.code – fallback](#diagnosticreportcode--fallback-om-examinationspeciality-saknas)) |
| `imagingOutcomeBody.typeOfResult` | 1..1 | `DiagnosticReport.status` | Se statusmappning i [Härledda fält](#diagnosticreportstatus-härledd-från-typeofresult-och-nullified); se även [IMG-001](#öppna-frågor) |
| `imagingOutcomeBody.resultTime` | 1..1 | `DiagnosticReport.effectiveDateTime` | Tidpunkt för resultatet; YYYYMMDDHHMMSS → ISO 8601 |
| `imagingOutcomeBody.resultReport` | 1..1 | `DiagnosticReport.conclusion` | Fritext-utlåtande; kombineras med `resultComment` om båda finns |
| `imagingOutcomeBody.resultComment` | 0..1 | `DiagnosticReport.conclusion` | Läggs till efter `resultReport` separerat med radbrytning |
| `imagingOutcomeBody.radiationDose` | 0..* | `DiagnosticReport.extension[radiationDose]` | Stråldos per undersökning; Quantity med enhet (mSv/mGy) |
| `imagingOutcomeBody.patientData.patientWeight` | 0..1 | `DiagnosticReport.extension[patientWeight]` | Patientvikt vid undersökningstillfället |
| `imagingOutcomeBody.patientData.patientLength` | 0..1 | `DiagnosticReport.extension[patientLength]` | Patientlängd vid undersökningstillfället |

#### imagingOutcomeBody.referral (kopplad remiss)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imagingOutcomeBody.referral.referralId` | 1..1 | `DiagnosticReport.basedOn.identifier` | Remiss-id → logisk referens till ServiceRequest |
| `imagingOutcomeBody.referral.referralReason` | 0..1 | Ej mappad till DiagnosticReport | Remissorsak tillhör ursprungsremissen (ServiceRequest.note) |
| `imagingOutcomeBody.referral.anamnesis` | 0..1 | Ej mappad till DiagnosticReport | Anamnes tillhör ursprungsremissen (ServiceRequest.note) |
| `imagingOutcomeBody.referral.careContactId` | 0..1 | `DiagnosticReport.encounter.identifier` | Alternativ källa för vårdkontaktsreferens om header.careContactId saknas |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.authorTime` | 1..1 | Ej mappad till DiagnosticReport | Remittentens tidpunkt tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalHSAid` | 0..1 | Ej mappad till DiagnosticReport | Remittentens HSA-id tillhör ursprungsremissen (ServiceRequest.requester) |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | Ej mappad till DiagnosticReport | Remittentens namn tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | Ej mappad till DiagnosticReport | Remittentens yrkesroll tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 1..1 | Ej mappad till DiagnosticReport | Remittentens org-enhets HSA-id tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 1..1 | Ej mappad till DiagnosticReport | Remittentens org-enhets namn tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefon; tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post; tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Adress; tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Plats; tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.attested.signatureTime` | 1..1 (om attested) | Ej mappad till DiagnosticReport | Attesttidpunkt för remissen tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.attested.legalAuthenticatorHSAId` | 0..1 | Ej mappad till DiagnosticReport | Attesterarens HSA-id tillhör ursprungsremissen |
| `imagingOutcomeBody.referral.attested.legalAuthenticatorName` | 0..1 | Ej mappad | Attesterarens namn i klartext; tillhör ursprungsremissen |

> Alla `imagingOutcomeBody.referral.*`-fält är attribut till ursprungsremissen. En logisk referens via `DiagnosticReport.basedOn` → `ServiceRequest.identifier` är tillräcklig. Se [Referral → ServiceRequest](#referral--servicerequest).

#### Härledda fält – DiagnosticReport

| Källa | FHIR-element | Kommentar |
|---|---|---|
| (per imageRecording) | `DiagnosticReport.imagingStudy` | Reference(ImagingStudy) per imageRecording; se IMG-002 |

---

## Mappningstabell – ImagingStudy (per imageRecording)

Varje `imageRecording`-element mappas till en separat `ImagingStudy`-instans som länkas via `DiagnosticReport.imagingStudy`.

### Grunddata och undersökning

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imageRecording.recordingId` | 0..1 | `ImagingStudy.identifier` | Inspelningens/undersökningens id |
| `imageRecording.examinationActivity` | 1..1 | `ImagingStudy.procedureCode` | Undersökningsaktivitet (radiologisk procedur) |
| `imageRecording.examinationTimePeriod.start` | 1..1 | `ImagingStudy.started` | Starttid för undersökningen; YYYYMMDDHHMMSS → ISO 8601 |
| `imageRecording.examinationTimePeriod.end` | 1..1 | `ImagingStudy.extension[examinationEndTime]` | Sluttid; ingen direkt motpart i ImagingStudy R4; kräver lokal extension |
| `imageRecording.examinationStatus` | 0..1 | `ImagingStudy.status` | Status för undersökningen; se statusmappning nedan |
| `imageRecording.examinationUnit` | 0..1 | `ImagingStudy.location.display` | Undersökningsenhet som fritextsträng; Reference(Location) med logisk referens om HSA-id kan utvinnas |
| `imageRecording.numberOfImages` | 0..1 | `ImagingStudy.numberOfInstances` | Totalt antal bilder i undersökningen |

### Ansvarig personal (imageRecording.accountableHealthcareProfessional)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imageRecording.accountableHealthcareProfessional.authorTime` | 1..1 | Ej mappad | Tidpunkt i bildtagningens kontext; ingen dedikerad plats på ImagingStudy |
| `imageRecording.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `ImagingStudy.interpreter.identifier` | Tolkande läkarens HSA-id på undersökningsnivå |
| `imageRecording.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `ImagingStudy.interpreter.display` | Tolkande läkarens namn |
| `imageRecording.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | Ej mappad | Yrkesroll; ingen standardiserad plats på ImagingStudy; kan läggas i PractitionerRole om referensen expanderas |
| `imageRecording.accountableHealthcareProfessional.healthcareProfessionalOrgUnit` | 0..1 | Ej mappad | Org-enhet för bildtagningspersonal; ingen direkt plats på ImagingStudy; se [IMG-003](#öppna-frågor) |

### Modalitetsdata (imageRecording.modalityData)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imageRecording.modalityData.typeOfModality` | 0..1 | `ImagingStudy.modality` | DICOM-modalitetskod (CT, MR, PT, DX etc.) |
| `imageRecording.modalityData.manufacturer` | 0..1 | `ImagingStudy.extension[deviceManufacturer]` | Utrustningens tillverkare; kräver lokal extension |
| `imageRecording.modalityData.modelName` | 0..1 | `ImagingStudy.extension[deviceModel]` | Utrustningens modell; kräver lokal extension |
| `imageRecording.modalityData.equipmentId` | 0..1 | `ImagingStudy.extension[equipmentId]` | Utrustningens id (serienummer, HSA-id eller lokalt id); kräver lokal extension |
| `imageRecording.modalityData.softwareVersion` | 0..1 | `ImagingStudy.extension[softwareVersion]` | Programversion i utrustningen; kräver lokal extension |

### DICOM-bilddata (imageRecording.imageDicomData)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imageRecording.imageDicomData[i].dicomSOP` | 1..1 | `ImagingStudy.series[i].instance[i].sopClass` | DICOM SOP Class UID; se [IMG-002](#öppna-frågor) |
| `imageRecording.imageDicomData[i].dicomValue` | 0..1 | Ej mappad direkt | Base64-kodad DICOM-data; ingår ej i FHIR-resursen; se [IMG-002](#öppna-frågor) |
| `imageRecording.imageDicomData[i].dicomReference` | 0..1 | `ImagingStudy.series[i].instance[i].url` | URL till DICOM-bild i WADO-RS eller DICOMweb; se [IMG-002](#öppna-frågor) |

### Strukturerad bilddata (imageRecording.imageStructuredData)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `imageRecording.imageStructuredData[i].aperture` | 0..1 | `ImagingStudy.series[i].instance[i].extension[aperture]` | Bländarvärde; kräver lokal extension |
| `imageRecording.imageStructuredData[i].exposureTime` | 0..1 | `ImagingStudy.series[i].instance[i].extension[exposureTime]` | Exponeringstid; kräver lokal extension |
| `imageRecording.imageStructuredData[i].imageCreationTime` | 0..1 | `ImagingStudy.series[i].started` | Tidpunkt för serieinspelning |
| `imageRecording.imageStructuredData[i].bodyPartExamined` | 0..1 | `ImagingStudy.series[i].bodySite` | Undersökt kroppsdel (SNOMED CT / DICOM-kod) |
| `imageRecording.imageStructuredData[i].contrastAgentUsed` | 0..1 | `ImagingStudy.series[i].extension[contrastAgent]` | Kontrastmedel använt; kräver lokal extension; ingen standard ImagingStudy.series-plats i R4 |
| `imageRecording.imageStructuredData[i].magneticFieldStrength` | 0..1 | `ImagingStudy.extension[magneticFieldStrength]` | Magnetfältstyrka (gäller MR); Quantity med enhet Tesla; kräver lokal extension |
| `imageRecording.imageStructuredData[i].copyright` | 0..1 | Ej mappad | Upphovsrätt för bilddata; ingen standardiserad plats i ImagingStudy; kan lagras i `ImagingStudy.note` som fritext |
| `imageRecording.imageStructuredData[i].imageData.mediaType` | 1..1 | Ej mappad | MIME-typ för bildinnehåll; ImagingStudy hanterar inte inbäddad bilddata – hanteras via Binary-resurs eller extern lagring; se [IMG-002](#öppna-frågor) |
| `imageRecording.imageStructuredData[i].imageData.value` | 0..1 | Ej mappad | Binär bild (base64); ingår ej direkt i FHIR-resursen; se [IMG-002](#öppna-frågor) |
| `imageRecording.imageStructuredData[i].imageData.reference` | 0..1 | `ImagingStudy.series[i].instance[i].url` | Referens-URL till extern bild; kombineras med dicomReference vid mappning |
| `imageRecording.imageStructuredData[i].imageData.burnedInAnnotations` | 0..1 | Ej mappad | Indikerar inbrända annotationer i bild; ingen standardiserad plats i ImagingStudy R4; kan lagras i extension |

### Härledda fält – ImagingStudy

| Källa | FHIR-element | Kommentar |
|---|---|---|
| (härledd) | `ImagingStudy.subject` | Samma patient som DiagnosticReport.subject |
| (härledd) | `ImagingStudy.series[*].uid` | Genereras av bryggan om dicomSOP saknar serie-UID |

### Statusmappning – imageRecording.examinationStatus → ImagingStudy.status

| RIVTA examinationStatus | FHIR ImagingStudy.status |
|---|---|
| Planerad / beställd | `registered` |
| Pågår | `available` |
| Slutförd | `available` |
| Avbokad / makulerad | `cancelled` |
| Okänd | `unknown` |

---

## Härledda fält / Designbeslut

### DiagnosticReport.status (härledd från typeOfResult och nullified)

`DiagnosticReport.status` härleds från två fält i kombination:

| Villkor | `DiagnosticReport.status` |
|---|---|
| `imagingOutcomeHeader.nullified = true` | `entered-in-error` (prioriteras alltid; se [IMG-001](#öppna-frågor)) |
| `imagingOutcomeBody.typeOfResult = PREL` | `preliminary` |
| `imagingOutcomeBody.typeOfResult = DEF` | `final` |
| `imagingOutcomeBody.typeOfResult = TILL` | `amended` |
| `typeOfResult` saknar känd kod | `unknown` |

`nullified` kontrolleras **alltid** först. Om `nullified = true` sätts status till `entered-in-error` oavsett `typeOfResult`.

### DiagnosticReport.code – fallback om examinationSpeciality saknas

Om `imagingOutcomeBody.examinationSpeciality` saknas sätts `DiagnosticReport.code` till en fast LOINC-kod för bilddiagnostik:

```
code.coding.system  = "http://loinc.org"
code.coding.code    = "18748-4"
code.coding.display = "Diagnostic imaging study"
```

### DiagnosticReport.conclusion – sammanslagning

`resultReport` och `resultComment` kombineras till `DiagnosticReport.conclusion`:

```
{resultReport}
\n
{resultComment}   ← läggs till med inledande radbrytning om fältet finns
```

### documentTitle → extension

`imagingOutcomeHeader.documentTitle` saknar direkt motpart i DiagnosticReport R4. Mappas till en lokal extension `https://fhir.inera.se/ig/ehds-tk/StructureDefinition/ext-document-title` på DiagnosticReport-nivå.

### ImagingStudy.series-konstruktion från imageDicomData

`imageDicomData` är ett platt fält per `imageRecording`. ImagingStudy i FHIR kräver en serie-hierarki. Bryggan konstruerar serien enligt:

- En `ImagingStudy.series` skapas per distinkt `dicomSOP`-klass (eller en aggregerad serie om alla instanser delar SOP-klass).
- `series.uid` genereras som UUID om inget DICOM-serie-UID finns i TKB:n.
- `series.instance[*].sopClass` = `dicomSOP` (som Coding med system `urn:ietf:rfc:3986`).
- `series.instance[*].url` = `dicomReference` (om URL finns, annars utelämnas).
- `dicomValue` (base64-binär) ingår **inte** i FHIR-resursen; se [IMG-002](#öppna-frågor).

### imageRecording.examinationUnit – string vs. Reference

`imageRecording.examinationUnit` är modellerad som en fritextsträng i den logiska modellen (inte ett strukturerat objekt med HSA-id/namn). Om HSA-id kan identifieras i strängen skapas en logisk Reference(Location); annars används `ImagingStudy.location.display` direkt.

### Referral → ServiceRequest

Om `imagingOutcomeBody.referral.referralId` finns skapas en logisk referens till en `ServiceRequest` via `DiagnosticReport.basedOn`. Bryggan matchar mot befintliga ServiceRequest-instanser (från GetReferralOutcome) eller skapar en minimal stub med enbart identifier satt. Remissens övriga fält tillhör ServiceRequest och repeteras inte i DiagnosticReport.

---

## PDL och Sparr

GetImagingOutcome v1.0 använder standardmönstret **PatientSummaryHeader** via `accountableHealthcareProfessional`-blocket:

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `imagingOutcomeHeader.approvedForPatient` (boolean) | `DiagnosticReport.meta.security`; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar `DiagnosticReport` (och transitivt `ImagingStudy`-instanserna) via `urn:uuid:{DiagnosticReport.id}`.  
`Provenance.recorded` = `imagingOutcomeHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).  
`Provenance.agent[author].onBehalfOf` = `imagingOutcomeHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId`.

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
| IMG-001 | **`typeOfResult` (PREL/DEF/TILL) → `DiagnosticReport.status` – verifiera korrekthet.** Mappningen PREL→`preliminary`, DEF→`final`, TILL→`amended` är rimlig men kodvärdenas exakta semantik i kv_typeOfResult behöver verifieras mot TKB-förvaltningens dokumentation. Det är oklart om `TILL` avser ett tilläggsutlåtande (amended) eller ett kompletterande svar (appended). Dessutom: om `nullified=true` sätts `entered-in-error` oavsett `typeOfResult` – konfirmera denna prioritering med TKB-förvaltningen. |
| IMG-002 | **DICOM-bilddata (`imageDicomData.dicomSOP` + `dicomValue`/`dicomReference`) – ImagingStudy-design.** `dicomValue` är base64-binär DICOM-data som inte kan inkluderas i en FHIR-resurs utan via en `Binary`-resurs eller extern lagring. `dicomReference` är en URL (t.ex. WADO-RS) som fungerar direkt som `ImagingStudy.series.instance.url`. Behöver beslut om: (1) om Binary-resurser ska skapas för `dicomValue`; (2) hur DICOM-serie-UID konstrueras när det saknas i TKB:n; (3) om `imageDicomData` ska mappas till en serie per SOP-klass eller en instans per element. Detsamma gäller `imageStructuredData.imageData.value` och `imageData.mediaType`. |
| PDL-001 | **`approvedForPatient` (boolean) saknar standardiserad FHIR-motsvarighet.** Fältet finns i PatientSummaryHeader-mönstret men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |

## Föreslagna nya issues

| ID | Fråga |
|---|---|
| IMG-003 | **`imageRecording.accountableHealthcareProfessional.healthcareProfessionalOrgUnit` saknar mappning.** Org-enheten för bildtagningspersonal på undersökningsnivå har ingen standardiserad plats i ImagingStudy R4. Alternativ: (1) skapa en PractitionerRole-resurs länkad via `ImagingStudy.interpreter`; (2) lokal extension på ImagingStudy. Behöver designbeslut. |
| IMG-004 | **`imageStructuredData.imageData.burnedInAnnotations` saknar FHIR-motpart.** Boolean-flagga som indikerar inbrända annotationer i bilddata. Ingen standardiserad plats i ImagingStudy R4. Förslag: lokal extension på `ImagingStudy.series.instance`. |
| IMG-005 | **`imageStructuredData.copyright` – hantering av upphovsrätt.** Ingen standardiserad plats för upphovsrättsinformation i ImagingStudy. Kan lagras som `ImagingStudy.note` men semantiken går förlorad. Behöver beslut om lokal extension. |
