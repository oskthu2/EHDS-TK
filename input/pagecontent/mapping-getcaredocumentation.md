# GetCareDocumentation – Journalanteckningar

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetCareDocumentation v3.0  
**FHIR-profil:** [SEEHDSDocumentReference](StructureDefinition-se-ehds-document-reference.html)  
**Logisk modell:** [SEEHDSLMCareDocumentation](StructureDefinition-se-ehds-lm-care-documentation.html)  
**Krävs för NPÖ:** Ja (v3.0) | **Krävs för 1177 Journal:** Ja (v3.0)  
**EHDS-koppling:** Journalanteckningar – kan bidra till discharge report eller dokumentationsunderlag; bredare än EHDS discharge reports

---

> **VIKTIGT – JoL-header v2.2 (inte PatientSummaryHeader)**
>
> GetCareDocumentation v3.0 använder **JoL-header v2.2**, inte det vanliga
> `PatientSummaryHeader`-mönstret. PDL-fälten för Sparr kommer **direkt från
> `accessControlHeader`**, inte från ett nästlat `accountableHealthcareProfessional`-block.
> Se DES-005 i [mapping-issues](mapping-issues.html).
>
> - Yttre Sparr: `careDocumentation.header.accessControlHeader.accountableHealthcareProvider`
> - Inre Sparr: `careDocumentation.header.accessControlHeader.accountableCareUnit`

---

## Resurshierarki

```
SEEHDSDocumentReference (1 per careDocumentation)
  └── author → PractitionerRole (header.author)
  └── authenticator → PractitionerRole (header.signature)
  └── content[0].attachment (XOR: clinicalDocumentNoteText eller multimediaEntry)
```

Varje `careDocumentation`-post ger upphov till en `DocumentReference`. Kroppen är ett
XOR-fält: antingen `clinicalDocumentNoteText` (fritext) eller `multimediaEntry` (binärdata
eller URL) – se Härledda fält nedan.

---

## Mappningstabell – careDocumentation.header (JoL-header v2.2)

### accessControlHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.header.accessControlHeader.patientId.extension` | 1..1 | `DocumentReference.subject.identifier.value` | Personnummer eller samordningsnummer |
| `careDocumentation.header.accessControlHeader.patientId.root` | 1..1 | `DocumentReference.subject.identifier.system` | OID→URI, se tabell nedan |
| `careDocumentation.header.accessControlHeader.accountableHealthcareProvider` | 0..1 | `Provenance.agent[custodian].who.identifier` | **Yttre Sparr** – vårdgivarens HSA-id (direkt i accessControlHeader, inte under accountableHealthcareProfessional) |
| `careDocumentation.header.accessControlHeader.accountableCareUnit` | 0..1 | `Provenance.agent[author].who.identifier` | **Inre Sparr** – vårdenhetens HSA-id (direkt i accessControlHeader) |
| `careDocumentation.header.accessControlHeader.careProcessId` | 0..1 | `DocumentReference.context.related.identifier` | Referens till vårdprocess |
| `careDocumentation.header.accessControlHeader.blockComparisonTime` | 1..1 | `DocumentReference.extension[blockComparisonTime]` | Tidpunkt för Sparr-jämförelse; YYYYMMDDHHMMSS → ISO 8601 |
| `careDocumentation.header.accessControlHeader.approvedForPatient` | 1..1 | (ej mappad) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

### record och sourceSystemId

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.header.record.recordId` | 1..1 | `DocumentReference.masterIdentifier` | Källsystemets dokumentidentifierare (primär nyckel) |
| `careDocumentation.header.record.timestamp` | 1..1 | `DocumentReference.date` | Tidpunkt då journalposten skapades; YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `careDocumentation.header.sourceSystemId` | 1..1 | `DocumentReference.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |

### author

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.header.author.authorId` | 0..1 | `DocumentReference.author` (Reference(PractitionerRole)) | Författarens HSA-id; logisk referens |
| `careDocumentation.header.author.name` | 0..1 | `PractitionerRole.practitioner.display` | Författarens visningsnamn |
| `careDocumentation.header.author.timestamp` | 1..1 | `Provenance.recorded` | Tidpunkt för skapande av anteckning |
| `careDocumentation.header.author.byRole` | 0..1 | `PractitionerRole.code` | Yrkesroll för författaren |
| `careDocumentation.header.author.orgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `careDocumentation.header.author.orgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |

### signature (legalAuthenticator)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.header.signature.signatureId` | 0..1 | `DocumentReference.authenticator` (Reference(PractitionerRole)) | Signerarens HSA-id; logisk referens |
| `careDocumentation.header.signature.name` | 0..1 | `PractitionerRole.practitioner.display` | Signerarens visningsnamn |
| `careDocumentation.header.signature.timestamp` | 1..1 | `DocumentReference.extension[signatureTime]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `careDocumentation.header.signature.byRole` | 0..1 | `PractitionerRole.code` | Yrkesroll för signeraren |

---

## Mappningstabell – careDocumentation.body

### Klassificering och titel

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.body.clinicalDocumentNoteCode` | 1..1 | `DocumentReference.type` | Anteckningstyp; kodsystem ClinicalDocumentNoteCodeCS – se värdegrupptabell nedan |
| `careDocumentation.body.clinicalDocumentNoteTitle` | 0..1 | `DocumentReference.description` | Anteckningens titel (fritext) |

#### Värdegrupptabell – clinicalDocumentNoteCode

| Kod | Beskrivning | Anteckningstyp |
|---|---|---|
| `utr` | Utredning/planering | Planeringsanteckning |
| `atb` | Åtgärdsbeskrivning | Åtgärdsanteckning |
| `sam` | Sammanfattning | Sammanfattande anteckning |
| `sao` | Samordnad bedömning | Samordningsanteckning |
| `ins` | Inskrivning | Inskrivningsanteckning |
| `slu` | Slutanteckning | Utskrivningsanteckning |
| `auf` | Akutanteckning/frisk | Akutanteckning |
| `sva` | Specialistvårdsanteckning | Specialistanteckning |
| `bes` | Besöksanteckning | Besöksanteckning |

### Innehåll – XOR: clinicalDocumentNoteText eller multimediaEntry

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.body.clinicalDocumentNoteText` | 0..1 | `DocumentReference.content[0].attachment.data` | Fritext journalanteckning; kodas som base64 med `contentType: text/plain; charset=utf-8` |
| `careDocumentation.body.multimediaEntry.mediaType` | 1..1 (om multimedia) | `DocumentReference.content[0].attachment.contentType` | MIME-typ (t.ex. `application/pdf`, `image/jpeg`) |
| `careDocumentation.body.multimediaEntry.value` | 0..1 (XOR) | `DocumentReference.content[0].attachment.data` | Binärdata (redan base64-kodat); XOR med reference |
| `careDocumentation.body.multimediaEntry.reference` | 0..1 (XOR) | `DocumentReference.content[0].attachment.url` | URL till externt dokument; XOR med value |

### dissentingOpinion (avvikande mening)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.body.dissentingOpinion[i].opinionId` | 0..1 | `DocumentReference.extension[dissentingOpinion][i].opinionId` | Avvikande meningens identifierare |
| `careDocumentation.body.dissentingOpinion[i].authorTime` | 1..1 | `DocumentReference.extension[dissentingOpinion][i].authorTime` | Tidpunkt för avvikande mening; YYYYMMDDHHMMSS → ISO 8601 |
| `careDocumentation.body.dissentingOpinion[i].opinion` | 1..1 | `DocumentReference.extension[dissentingOpinion][i].opinion` | Text för avvikande mening |
| `careDocumentation.body.dissentingOpinion[i].personId` | 1..1 | `DocumentReference.extension[dissentingOpinion][i].personId` | Identifierare för personen med avvikande mening |
| `careDocumentation.body.dissentingOpinion[i].personName` | 1..1 | `DocumentReference.extension[dissentingOpinion][i].personName` | Namn på personen med avvikande mening |

> **Obs:** `dissentingOpinion` saknar standard FHIR R4-element i DocumentReference.
> Custom extension krävs. Se Härledda fält nedan.

### hasMore (paginering)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `careDocumentation.body.hasMore[i].logicalAddress` | 1..1 | (ej mappad) | Logisk adress för ytterligare data; se [DOC-001](#öppna-frågor) |
| `careDocumentation.body.hasMore[i].reference` | 1..1 | (ej mappad) | URL för hämtning av resterande sidor; se [DOC-001](#öppna-frågor) |

---

## Härledda fält / Designbeslut

### DocumentReference.status

`careDocumentation.body` innehåller inget statusfält. `DocumentReference.status` sätts alltid
till `current` – antagandet är att tjänsten returnerar aktiva, giltiga journalanteckningar.
Makulerade anteckningar förväntas inte returneras av källsystemet.

### XOR-villkor för body-innehåll

Exakt ett av `clinicalDocumentNoteText` och `multimediaEntry` ska förekomma per post.
En FSH Invariant implementeras:

```
invariant: swe-doc-body-xor
description: "Exakt ett av clinicalDocumentNoteText och multimediaEntry måste anges"
expression: "content.attachment.data.exists() xor content.attachment.url.exists()"
```

### dissentingOpinion

Det finns inget standardiserat FHIR R4-element för avvikande meningar i `DocumentReference`.
Custom extension `https://fhir.inera.se/StructureDefinition/dissenting-opinion` definieras
med delfälten `opinionId`, `authorTime`, `opinion`, `personId`, `personName`.

### hasMore (paginering)

`hasMore 0..*` indikerar att svaret är paginerat och att ytterligare data kan hämtas.
Det finns inget FHIR-ekvivalent för detta pagineringsmönster. Dokumenteras i IG: konsumenten
måste anropa tjänsten upprepade gånger (med `hasMore[i].logicalAddress` och `reference`)
tills alla sidor är hämtade. Se [DOC-001](#öppna-frågor).

---

## PDL och Sparr

GetCareDocumentation använder JoL-header v2.2. PDL-fälten för Sparr hämtas **direkt från
`accessControlHeader`** – inte från ett `accountableHealthcareProfessional`-block som i
PatientSummaryHeader-baserade TK:er (DES-005):

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `careDocumentation.header.accessControlHeader.accountableHealthcareProvider` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `careDocumentation.header.accessControlHeader.accountableCareUnit` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `careDocumentation.header.accessControlHeader.approvedForPatient` (boolean) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careDocumentation.header.accessControlHeader.accountableHealthcareProvider` |
| `agent[author]` | Informationsägande vårdenhet | `careDocumentation.header.accessControlHeader.accountableCareUnit` |

`Provenance.target` refererar `DocumentReference` via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `careDocumentation.header.author.timestamp` (ISO 8601).

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| DOC-001 | **`hasMore 0..*` saknar FHIR-ekvivalent.** Pagineringsmönstret i GetCareDocumentation har ingen direkt representation i FHIR DocumentReference. Konsumentlösningar måste hantera paginering på RIVTA-nivå innan FHIR-transformation. Dokumenteras i IG. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** Fältet finns i `accessControlHeader` men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut; se central issue i [mapping-issues](mapping-issues.html). |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält. |
