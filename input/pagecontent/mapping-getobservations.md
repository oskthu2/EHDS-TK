# GetObservations – Kliniska observationer och mätvärden

**Tjänstekontrakt:** `clinicalprocess:healthcond:basic` GetObservations v2.0  
**FHIR-profil:** [SEEHDSObservationGrowth](StructureDefinition-se-ehds-observation-growth.html) (parent: IPS Observation-results)  
**Logisk modell:** [SEEHDSLMObservations](StructureDefinition-se-ehds-lm-observations.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Kliniska mätresultat och tillväxtdata

> **OBS – Avvikande headerstruktur:** GetObservations använder en specifik headertyp som
> **inte** är `PatientSummaryHeader`. Det finns inget `careProviderHSAId`/`careUnitHSAId`
> på toppnivå i headern. PDL- och Sparr-fält hanteras separat – se avsnitt
> [PDL och Sparr](#pdl-och-sparr) nedan.

---

## Datamodell – översikt

Tjänstekontraktet returnerar en lista med `observations 0..*`. Varje observation
består av ett `header`-element och ett `observationBody`-element:

```
observations [0..*]
  header [1..1]
  observationBody [1..1]
    observationId          [1..1]  Identifier
    registrationTime       [1..1]  instant
    observationType        [0..1]  CodeableConcept
    observationValue       [1..1]  (XOR-union, se nedan)
      cv                   [0..1]  CodeableConcept
      pq                   [0..1]  Quantity
      ivlpq                [0..1]  Range
      ts                   [0..1]  string  (variabelprecisions-tidsstämpel)
      ivlts                [0..1]  Period
      st                   [0..1]  string
      intValue             [0..1]  integer
    scale                  [0..1]  CodeableConcept
    observationStatus      [1..1]  CodeableConcept  (SNOMED CT urvals-id 56431000052106)
    targetSite             [0..*]  CodeableConcept
    description            [0..1]  string
    time                   [0..1]  (TimeType: ts 0..1 string | ivlts 0..1 Period)
    valueNegation          [1..1]  boolean
    patient                [1..1]  PatientInformationType
      patientId            [0..1]  Identifier
      person               [1..1]  (personId, givenName, middleSurname, surname,
                                    givenNameMarker, gender, dateOfBirth,
                                    confidentialityIndicator, maritalStatus,
                                    address[0..*], electronicAddress[0..*])
      address              [0..*]  AddressType
      electronicAddress    [0..*]  TelType
    participation          [0..*]  BackboneElement
      participantType      [1..1]  CodeableConcept
      time                 [0..1]  TimeType
      healthcareProfessional [0..1]
        performerId        [0..1]  Identifier
        person             [1..1]  PersonType
        jobCode            [0..1]  CodeableConcept
        license            [0..*]  CodeableConcept
        specialistQualification [0..*] CodeableConcept
        organisation       [1..1]  BackboneElement
        address            [0..*]  BackboneElement
        electronicAddress  [0..*]  BackboneElement
      patient              [0..1]  PatientInformationType
      otherPerson          [0..1]  BackboneElement
      locationRole         [0..1]  BackboneElement
      resource             [0..1]  BackboneElement
      organisation         [0..1]  BackboneElement
    relation               [0..*]  BackboneElement
      relationType         [1..1]  CodeableConcept
      referredInformation  [1..1]  BackboneElement
        referenceId        [1..1]  Identifier
        time               [1..1]  string
        categorization     [1..1]  string
        informationOwner   [1..1]  BackboneElement
          careGiverId      [1..1]  Identifier
```

---

## Mappningstabell

### Header

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `header` (headertyp specifik för GetObservations) | 1..1 | — | Ej standard `PatientSummaryHeader`; se avsnitt PDL och Sparr |

### observationBody – identitet och tidpunkt

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationId.extension` | 1..1 | `Observation.identifier.value` | Unikt id satt av källsystemet |
| `observationBody.observationId.root` | 1..1 | `Observation.identifier.system` | OID för vårdgivarens HSA-id; format `urn:oid:{root}` |
| `observationBody.registrationTime` | 1..1 | `Observation.issued` | Dokumentationstidpunkt; YYYYMMDDHHMMSS → ISO 8601 (se GENERAL-001) |

### observationType – klassificering och kod

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationType` | 0..1 | `Observation.code` | Typ av observation; om saknas används platshållarkod – se avsnitt Observation.code nedan |

> **OBS:** Alla Observation-resurser från GetObservations tilldelas statisk `Observation.category = exam` (se avsnitt Observation.category nedan). `observationType` styr `Observation.code`, inte `category`.

### observationValue – XOR-union av värdetyper

Exakt ett av nedanstående fält används per observation (XOR). FHIR-elementet väljs
baserat på vilken gren som är populerad i källdata.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationValue.cv` | 0..1 | `Observation.valueCodeableConcept` | Kodad observation |
| `observationBody.observationValue.pq` | 0..1 | `Observation.valueQuantity` | Numeriskt värde med enhet (UCUM) |
| `observationBody.observationValue.ivlpq` | 0..1 | `Observation.valueRange` | Intervall av Quantity-värden |
| `observationBody.observationValue.ts` | 0..1 | `Observation.valueString` | Variabelprecisions-tidsstämpel som sträng – **kan ej alltid mappas till dateTime** (se OBS-001) |
| `observationBody.observationValue.ivlts` | 0..1 | `Observation.valuePeriod` | Tidsintervall |
| `observationBody.observationValue.st` | 0..1 | `Observation.valueString` | Fritextsvar |
| `observationBody.observationValue.intValue` | 0..1 | `Observation.valueInteger` | Heltalsvärde |

### Negation och frånvaro av värde

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.valueNegation` | 1..1 | `Observation.dataAbsentReason` | Om `true` utelämnas `value[x]` och `dataAbsentReason` sätts; se OBS-002 |

### Status och skala

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.observationStatus` | 1..1 | `Observation.status` | SNOMED CT (urvals-id 56431000052106) → FHIR ObservationStatus; kräver ConceptMap, se OBS-003 |
| `observationBody.scale` | 0..1 | `Observation.method` | Mätskala eller mätmetod (t.ex. AUDIT-skalan, AB0-systemet) |

### Anatomisk lokalisation

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.targetSite[0]` | 0..1 | `Observation.bodySite` | Första elementet mappas till bodySite; FHIR är 0..1, se OBS-004 |
| `observationBody.targetSite[1..*]` | 0..* | `Observation.note.text` (tillägg) | Överskjutande lokaliseringar noteras med prefix `"Ytterligare lokal: "` |

### Beskrivning och kommentar

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.description` | 0..1 | `Observation.note.text` | Klinisk fritextbeskrivning som komplement till value |

### Effektiv tid

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.time` | 0..1 | — | XOR: antingen `ts` eller `ivlts` populeras |
| `observationBody.time.ts` | 0..1 | `Observation.effectiveDateTime` | Variabelprecisions-sträng; konverteras om precision ≥ dag (se OBS-001 och GENERAL-001) |
| `observationBody.time.ivlts` | 0..1 | `Observation.effectivePeriod` | Tidsintervall för observationen; XOR med `time.ts` |

### Patient (observationBody.patient)

`observationBody.patient` innehåller den patient som observationen avser. Denna information
används primärt för att sätta `Observation.subject` och för skyddsbedömning.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.patient.person.personId.extension` | 0..1 | `Observation.subject.identifier.value` | Personnummer eller samordningsnummer (föredragen källa) |
| `observationBody.patient.person.personId.root` | 0..1 | `Observation.subject.identifier.system` | OID→URI-konvertering, se OID-tabell nedan |
| `observationBody.patient.patientId.extension` | 0..1 | `Observation.subject.identifier.value` | Alternativ om `person.personId` saknas (nationell reservidentitet, OID 1.2.752.74.9.1) |
| `observationBody.patient.patientId.root` | 0..1 | `Observation.subject.identifier.system` | OID→URI |
| `observationBody.patient.person.givenName` | 0..* | Ej mappad i Observation | Förnamn – lagras ej i Observation; kan bifogas i Patient-resurs om en skapas |
| `observationBody.patient.person.middleSurname` | 0..1 | Ej mappad i Observation | Mellannamn – se givenName ovan |
| `observationBody.patient.person.surname` | 0..1 | Ej mappad i Observation | Efternamn – se givenName ovan |
| `observationBody.patient.person.givenNameMarker` | 0..1 | Ej mappad | Tilltalsnamnsmarkering (10–99) – inget standardiserat FHIR-fält i Observation eller Patient |
| `observationBody.patient.person.gender` | 0..1 | Ej mappad i Observation | Kön – lagras i Patient.gender om Patient-resurs skapas; KV kön OID 1.2.752.129.2.2.1.1 |
| `observationBody.patient.person.dateOfBirth` | 0..1 | Ej mappad i Observation | Födelsedatum – lagras i Patient.birthDate om Patient-resurs skapas |
| `observationBody.patient.person.confidentialityIndicator` | 1..1 | `Observation.meta.security` | Skyddade uppgifter – `http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R` om `true` |
| `observationBody.patient.person.maritalStatus` | 0..1 | Ej mappad | Civilstånd – inget motsvararande fält i Observation; lagras i Patient.maritalStatus om Patient-resurs skapas |
| `observationBody.patient.person.address` | 0..* | Ej mappad | Personens adress – lagras i Patient.address om Patient-resurs skapas; ej relevant för Observation |
| `observationBody.patient.person.electronicAddress` | 0..* | Ej mappad | Elektronisk adress (t.ex. telefon) – lagras i Patient.telecom om Patient-resurs skapas |
| `observationBody.patient.address` | 0..* | Ej mappad | Särskild kallelseadress för patienten – lagras i Patient.address om Patient-resurs skapas |
| `observationBody.patient.electronicAddress` | 0..* | Ej mappad | Elektronisk adress för patienten (t.ex. telemedicinutrustning) – lagras i Patient.telecom om Patient-resurs skapas |

### Utförare (participation)

`observationBody.participation` är en polymorf lista med XOR-union av deltagartyper:
`healthcareProfessional`, `patient`, `otherPerson`, `locationRole`, `resource`, `organisation`.
Mappningen nedan täcker alla grenar.

#### participation – gemensamma fält

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].participantType` | 1..1 | `Observation.performer.extension[participationType]` | Deltagarroll (utförare, vittne, ansvarig etc.); SNOMED CT urvals-id 53351000052100 |
| `observationBody.participation[*].time` | 0..1 | Ej mappad | Tidpunkt för deltagandet – FHIR Observation har inget per-performer-tidsfält; kan noteras i extension om nödvändigt (se OBS-006) |

#### participation – hälso- och sjukvårdspersonal (healthcareProfessional)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].healthcareProfessional.performerId` | 0..1 | `Observation.performer` (Reference(PractitionerRole)) | Logisk referens via HSA-id (OID 1.2.752.129.2.1.4.1) |
| `observationBody.participation[*].healthcareProfessional.person` | 1..1 | `PractitionerRole.practitioner` (via referens) | PersonType – namn och id mappas till Practitioner-resurs om en skapas |
| `observationBody.participation[*].healthcareProfessional.jobCode` | 0..1 | `PractitionerRole.code` | Befattningskod (NI 2017 Hälso- och sjukvårdspersonal.befattning) |
| `observationBody.participation[*].healthcareProfessional.license` | 0..* | `PractitionerRole.practitioner` → `Practitioner.qualification` | Legitimation – lagras i Practitioner om resurs skapas |
| `observationBody.participation[*].healthcareProfessional.specialistQualification` | 0..* | `PractitionerRole.practitioner` → `Practitioner.qualification` | Specialistkompetens – lagras i Practitioner om resurs skapas |
| `observationBody.participation[*].healthcareProfessional.organisation` | 1..1 | `PractitionerRole.organization` | Organisation för uppdraget; HSA-id och namn via logisk referens |
| `observationBody.participation[*].healthcareProfessional.address` | 0..* | Ej mappad | Hälso- och sjukvårdspersonals adress – ingen plats i PractitionerRole; lagras i Practitioner.address om resurs skapas |
| `observationBody.participation[*].healthcareProfessional.electronicAddress` | 0..* | Ej mappad | Hälso- och sjukvårdspersonals elektroniska adress – lagras i Practitioner.telecom om resurs skapas |

#### participation – patient som deltagare

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].patient` | 0..1 | Ej mappad | Patienten som aktiv deltagare (ej som subjekt) – ingen standardmappning i FHIR Observation.performer för PatientInformationType; se OBS-006 |

#### participation – övrig person (otherPerson)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].otherPerson` | 0..1 | `Observation.performer` (Reference(RelatedPerson)) | Övrig person (t.ex. anhörig, tolk); type → RelatedPerson.relationship; person → RelatedPerson |

#### participation – plats/platsroll (locationRole)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].locationRole` | 0..1 | Ej mappad | Platsroll (t.ex. patientens hem, arbetsplats) – FHIR Observation har inget performer-fält för Location; kan mappas till `Observation.extension[locationRole]` om extension definieras (se OBS-006) |

#### participation – resurs (resource)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].resource` | 0..1 | `Observation.device` | Medicinteknisk utrustning; id → Device.identifier; type → Device.type; övriga fält (groupId, amount, resourceProperty) är ej mappade (se OBS-006) |

#### participation – organisation

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.participation[*].organisation` | 0..1 | `Observation.performer` (Reference(Organization)) | Organisation som deltar; HSA-id via logisk referens |

### Relationer (relation)

`observationBody.relation` innehåller typade samband till andra informationsmängder.
Val av FHIR-element beror på `relationType`-koden – se OBS-005.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationBody.relation[*]` | 0..* | `Observation.derivedFrom` eller `Observation.hasMember` | Val beror på `relationType`; se OBS-005 och avsnitt nedan |
| `observationBody.relation[*].relationType` | 1..1 | *(styr val av FHIR-element)* | SNOMED CT-kod (urvals-id 53371000052106) som avgör om det är derivedFrom, hasMember eller extension |
| `observationBody.relation[*].referredInformation.referenceId.extension` | 1..1 | `Observation.derivedFrom.identifier.value` / `Observation.hasMember.identifier.value` | Id på den refererade informationen |
| `observationBody.relation[*].referredInformation.referenceId.root` | 1..1 | `Observation.derivedFrom.identifier.system` / `Observation.hasMember.identifier.system` | OID→URI-konvertering |
| `observationBody.relation[*].referredInformation.time` | 1..1 | Ej mappad | Starttid för refererad information – FHIR-referenser har inget tidsfält; information förloras om ej hanteras i extension (se OBS-005) |
| `observationBody.relation[*].referredInformation.categorization` | 1..1 | Ej mappad | Typ av information från engagemangsindexet – ingen standardmotpart i FHIR Observation.derivedFrom; kan lagras i extension (se OBS-005) |
| `observationBody.relation[*].referredInformation.informationOwner.careGiverId` | 1..1 | Ej mappad | Informationsägande vårdgivare – ingen per-referens ägarinformation i FHIR; kan lagras i Provenance om nödvändigt (se OBS-005) |

### Tekniska responsfält (result)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.logId` | 1..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.subCode` | 0..1 | Ej mappad | Teknisk subkod – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## Härledda fält och designbeslut

### Observation.status (OBS-003)

`observationBody.observationStatus` använder SNOMED CT-koder ur urvalsuppsättningen
med id `56431000052106`. En ConceptMap krävs för att översätta dessa till FHIR
`ObservationStatus`-värden:

| SNOMED CT-kod | SNOMED CT-display | FHIR ObservationStatus |
|---|---|---|
| `385676005` | Under utförande | `preliminary` |
| `385651009` | Slutlig | `final` |
| `272393004` | Korrigerad | `amended` |
| `59776000` | Avbeställd/annullerad | `cancelled` |
| `444301002` | Avböjd av patient | `cancelled` |

Saknad mappning: status sätts till `unknown` och en `OperationOutcome`-varning genereras.

### Observation.category – statisk kod

Alla Observation-resurser producerade från GetObservations tilldelas
`Observation.category` med kod `exam` från
`http://terminology.hl7.org/CodeSystem/observation-category` för att markera att
de härrör från kliniska undersökningar/mätningar.

### Observation.code – fallback

Om `observationBody.observationType` saknas och ingen annan kod kan härledas sätts
`Observation.code` till en lokal platshållarkod
`https://fhir.inera.se/ig/ehds-tk/CodeSystem/observation-placeholder#unspecified`
med display *"Okänd observationstyp"* för att uppfylla FHIR-profilens krav på minst
en kod.

### valueNegation (OBS-002)

När `observationBody.valueNegation = true` innebär det att observationens värde
explicit förnekats eller är frånvarande av klinisk orsak. Mappning:

| `valueNegation` | FHIR-handling |
|---|---|
| `false` (normalfall) | `value[x]` populeras som normalt; `dataAbsentReason` utelämnas |
| `true` | `value[x]` utelämnas; `Observation.dataAbsentReason.coding.code = "not-applicable"` |

Koden `not-applicable` hämtas från
`http://terminology.hl7.org/CodeSystem/data-absent-reason`.

### ts-fältet (OBS-001) – variabelprecisions-tidsstämpel

`observationBody.observationValue.ts` och `observationBody.time.ts` är RIVTA
`TimeType/ts`-strängar med variabel precision, t.ex. `202306`, `20230601`,
`20230601120000`. Dessa kan **inte** alltid konverteras till FHIR `dateTime` utan
att förlora precisionssemantik. Hantering:

| Precision i ts-strängen | FHIR-typ | Konvertering |
|---|---|---|
| `YYYY` (år) | `Observation.valueString` | Behålls som sträng |
| `YYYYMM` (år+månad) | `Observation.valueString` | Behålls som sträng |
| `YYYYMMDD` (datum) | `Observation.valueDateTime` | Konverteras till `YYYY-MM-DD` |
| `YYYYMMDDHHMMSS` (full) | `Observation.valueDateTime` | Konverteras till ISO 8601 med zon Europe/Stockholm |

För `time.ts`: om precision ≥ dag mappas till `Observation.effectiveDateTime`,
annars till `Observation.effectiveDateTime` med en implementationsspecifik
utfyllnadsstrategi (t.ex. start av period, se GENERAL-001).

### targetSite – kardinalitetskollision (OBS-004)

`observationBody.targetSite` är definierad som `0..*` i TKB men
`Observation.bodySite` är `0..1` i FHIR R4. Implementationsstrategi:

1. Det **första** elementet i `targetSite`-listan mappas till `Observation.bodySite`.
2. Eventuella ytterligare element (index ≥ 1) läggs till som fritextnotis i
   `Observation.note.text`, med prefix `"Ytterligare lokal: "` och kodens
   `displayName`.
3. Öppen fråga om tilläggsextension – se OBS-004.

### relation – relationstyper (OBS-005)

`observationBody.relation` innehåller referenser till andra observationer med en
`relationType`-kod. Mapping:

| `relationType` (RIVTA) | FHIR-element | Motivering |
|---|---|---|
| Härledd från / deriverad | `Observation.derivedFrom` | Källobservation för beräknad observation |
| Ingår i grupp / komponent | `Observation.hasMember` | Deltagande observation i panel |
| Övriga typer | `Observation.extension[observationRelation]` | Lokal extension – se OBS-005 |

Notera att `referredInformation.time`, `referredInformation.categorization` och
`referredInformation.informationOwner.careGiverId` saknar standardmotpart i FHIR-referensen
och kräver extension eller Provenance-resurs om de ska bevaras.

---

## PDL och Sparr

> GetObservations v2.0 har en **avvikande headerstruktur** jämfört med
> `PatientSummaryHeader`. Det finns inga dedikerade fält `careProviderHSAId` och
> `careUnitHSAId` på standardplats i headern.

PDL- och Sparr-information hämtas istället ur följande källor när de är
tillgängliga:

| PDL/Sparr-begrepp | Alternativ källa i GetObservations | FHIR-destination |
|---|---|---|
| Vårdgivare (yttre Sparr) | `observationBody.participation[*]` där `participantType` avser ansvarig vårdgivare | `Provenance.agent[custodian].who.identifier` |
| Vårdenhet (inre Sparr) | `observationBody.participation[*]` där `participantType` avser vårdenhet | `Provenance.agent[author].who.identifier` |
| Skyddad identitet | `observationBody.patient.person.confidentialityIndicator` | `Observation.meta.security` |

Implementationer **måste** hantera avsaknaden av standard-Sparr-fält och antingen
vägra returnera posten utan tydlig Sparr-attributering, eller flagga posten med
`meta.security` och dokumentera beslutet i implementationsguiden.

---

## Provenance

En `Provenance`-resurs skapas per `Observation`-resurs.

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `observationBody.participation` (se PDL-avsnitt) |
| `agent[author]` | Informationsägande vårdenhet | `observationBody.participation` (se PDL-avsnitt) |

`Provenance.target` refererar `Observation` via `urn:uuid:{Observation.id}`.  
`Provenance.recorded` = `observationBody.registrationTime` (konverterat till ISO 8601).

---

## OID-till-URI-tabell

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.74.9.1` | `urn:oid:1.2.752.74.9.1` | Nationell reservidentitet |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |
| `2.16.840.1.113883.6.96` | `http://snomed.info/sct` | SNOMED CT |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| Id | Fråga | Status |
|---|---|---|
| OBS-001 | Hur hanteras `ts`-strängar med lägre precision än datum (år, år+månad) i `Observation.effectiveDateTime`? Bör en extension `_effectiveDateTime` med `valueString` användas? | Öppen |
| OBS-002 | Vilken `dataAbsentReason`-kod bäst representerar `valueNegation=true`? `not-applicable` eller `not-performed`? | Öppen |
| OBS-003 | ConceptMap för SNOMED CT-urval `56431000052106` → FHIR ObservationStatus är ej komplett. Saknade koder behöver inventeras mot TKB. | Öppen |
| OBS-004 | `targetSite` är `0..*` i TKB men `Observation.bodySite` är `0..1` i FHIR R4. Bör en extension `bodySite` med `0..*` läggas till profilen, eller accepteras informationsförlust med notering? | Öppen |
| OBS-005 | `relation` med `relationType` har inget standardiserat FHIR-uttryck för alla relationstyper. Behöver lokal extension definieras i profilen? `referredInformation.time`, `categorization` och `informationOwner` saknar också standardmotpart i FHIR-referensen. | Öppen |
| GENERAL-001 | Gemensam hantering av RIVTA variabelprecisions-tidsstämplar (YYYYMMDDHHMMSS, YYYYMMDD, YYYYMM, YYYY) vid konvertering till ISO 8601 och tidszon Europe/Stockholm behöver dokumenteras i gemensam konverteringsspecifikation. | Öppen |

---

## Föreslagna nya issues

| Id | Fråga | Status |
|---|---|---|
| OBS-006 | `participation[*].time` (tidpunkt för deltagande), `participation[*].patient` (patient som deltagare), `participation[*].locationRole` (platsroll), samt detaljfälten i `participation[*].resource` (groupId, amount, resourceProperty) saknar standardmotpart i FHIR Observation. Bör dessa täckas av en gemensam `participation`-extension i profilen, eller ska dessa fält markeras som ej mappade med informationsförlust? | Föreslagen |
| OBS-007 | `observationBody.patient.person.givenNameMarker` (tilltalsnamnsmarkering, giltiga värden 10–99) har inget standardiserat FHIR-fält i Patient-resursen. Bör en extension definieras för denna uppgift, eller ska den ignoreras? | Föreslagen |
| OBS-008 | `observationBody.patient.person.maritalStatus` (civilstånd) och `observationBody.patient.person.address`/`electronicAddress` (samt `patient.address`/`electronicAddress`) är ej relevanta för Observation-resursen. Ska de lagras i en sammanhörande Patient-resurs om en skapas, och i så fall vilket profileringskrav gäller för Patient-resursen i detta sammanhang? | Föreslagen |
