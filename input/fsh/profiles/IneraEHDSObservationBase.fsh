Profile: IneraEHDSObservationBase
Parent: $Observation-results-uv-ips
Id: inera-ehds-observation-base
Title: "SE EHDS Observation Base – GetObservations"
Description: """
  Basprofil för alla observationer från GetObservations
  (clinicalprocess:healthcond:basic v2.0).

  Profilen fångar den generella TK-mappningen och används som förälder av
  domänspecifika profiler (t.ex. IneraEHDSObservationGrowth för tillväxtkurva).

  Nyckeldesignbeslut:
  - observationBody.observationValue är XOR-union av sju värdetyper (cv/pq/ivlpq/ts/ivlts/st/int).
    Varje gren mappas till respektive FHIR value[x]-variant.
  - Om valueNegation=true utelämnas value[x] och dataAbsentReason sätts.
  - observationBody.time (ts/ivlts) → effective[x]; registrationTime → issued.
  - participation är polymorf (healthcareProfessional/patient/otherPerson/locationRole/resource/organisation).
    Välj FHIR-element per deltagartyp (se mappningssida).
  - PDL-fält (Sparr) hanteras via Provenance och meta.security (se mappningssida).

  Täcker NPÖ 1.2 och 1177 Journal 1.2.
"""

// ─── Identitet och proveniensmetadata ──────────────────────────────────────

* identifier MS
* identifier ^short = "Observations-id (observationBody.observationId)"
* identifier.value MS
* identifier.value ^short = "Unikt id inom vårdgivaren (observationId.extension)"
* identifier.system MS
* identifier.system ^short = "OID för informationsägande vårdgivare (observationId.root) – format urn:oid:{root}"

* meta.source MS
* meta.source ^short = "Källsystem (header) – HSA-id för det system som tillgängliggör informationen"

* meta.security MS
* meta.security ^short = """
    Säkerhetsmärkning:
    confidentialityIndicator=true → v3-Confidentiality#R (skyddad identitet)
    approvedForPatient=false      → ActCode#NOPATIENT (ej visas för patient, se PDL-001)
  """

// ─── Status ────────────────────────────────────────────────────────────────

* status 1..1 MS
* status from SEObservationStatusVS (required)
* status ^short = "Observationsstatus (observationBody.observationStatus – SNOMED CT urvals-id 56431000052106 → FHIR ObservationStatus via ConceptMap, se OBS-003)"

// ─── Klassificering ────────────────────────────────────────────────────────

* category 1..* MS
* category ^short = "Observationskategori – kategori 'exam' sätts alltid; domänprofiler lägger till fler (t.ex. vital-signs)"

* code 1..1 MS
* code ^short = "Observationstyp (observationBody.observationType.type.code) – SNOMED CT SE OID 1.2.752.116.2.1.1; om saknas används platshållarkod"
* code.coding MS
* code.coding ^short = "Kodat observationstyps-värde; SNOMED CT SE-koder (http://snomed.info/sct)"
* code.text MS
* code.text ^short = "observationBody.observationType.type.displayName"

// ─── Subjekt ──────────────────────────────────────────────────────────────

* subject only Reference(IneraEHDSPatient)
* subject 1..1 MS
* subject ^short = "Patient (observationBody.patient.person.personId om tillgängligt; annars observationBody.patient.patientId)"

// ─── Tid ──────────────────────────────────────────────────────────────────

* effective[x] MS
* effective[x] ^short = "Observationstid (observationBody.time.ts → effectiveDateTime; observationBody.time.ivlts → effectivePeriod); se GENERAL-001 och OBS-001"

* issued MS
* issued ^short = "Dokumentationstidpunkt (observationBody.registrationTime) – när uppgiften registrerades i journalen"

// ─── Utförare ─────────────────────────────────────────────────────────────

* performer MS
* performer ^short = """
    Deltagare (observationBody.participation[*]):
    healthcareProfessional.performerId → Reference(PractitionerRole)
    otherPerson → Reference(RelatedPerson)
    organisation → Reference(Organization)
    resource → Observation.device (se nedan)
    patient/locationRole → se OBS-006
  """

// ─── Värde ────────────────────────────────────────────────────────────────

* value[x] MS
* value[x] ^short = """
    Observationsvärde (observationBody.observationValue – XOR-union):
    cv       → valueCodeableConcept
    pq       → valueQuantity
    ivlpq    → valueRange
    ts       → valueDateTime (precision ≥ dag) eller valueString (precision < dag, se OBS-001)
    ivlts    → valuePeriod
    st       → valueString
    intValue → valueInteger
    Om valueNegation=true utelämnas value[x] och dataAbsentReason sätts (se OBS-002).
  """

// OBS-001: ts-värden med variabelprecision (YYYYMM, YYYY) representeras som valueString.
// ts med precision ≥ dag (YYYYMMDD eller YYYYMMDDHHMMSS) konverteras till valueDateTime.
// För valueDateTime vid lägre precision än sekund: använd FHIR _valueDateTime-elementet med
// extension http://hl7.org/fhir/StructureDefinition/originalText för att bevara källsträngen.

// ─── Frånvaroreason ───────────────────────────────────────────────────────

* dataAbsentReason MS
* dataAbsentReason ^short = "Negation (observationBody.valueNegation=true → dataAbsentReason.code='not-detected'); se OBS-002"

// OBS-002: Koden 'not-detected' från http://terminology.hl7.org/CodeSystem/data-absent-reason
// används när valueNegation=true – det kliniska värdet är explicit frånvarande/negativt.

// ─── Anatomisk lokalisation ───────────────────────────────────────────────

* bodySite MS
* bodySite ^short = """
    Anatomisk lokalisation (observationBody.targetSite[0]).
    Första målplatsen mappas till bodySite; TK är 0..* men FHIR R4 är 0..1.
    Ytterligare platser (index ≥ 1) mappas till extension[additionalBodySite] (se OBS-004).
    OBS: extension utgår i FHIR R5 där bodySite är 0..* – använd standard bodySite vid R5-migration.
  """

// OBS-004: extension[additionalBodySite] är en R4-övergångslösning för targetSite[1..*].
// I FHIR R5 är Observation.bodySite 0..* och denna extension behövs ej längre.

// ─── Metod/skala ──────────────────────────────────────────────────────────

* method MS
* method ^short = "Mätskala (observationBody.scale) – nominalskala/ordinalskala (t.ex. AUDIT, AB0-systemet)"

// ─── Utrustning ───────────────────────────────────────────────────────────

* device MS
* device ^short = "Medicinteknisk utrustning (observationBody.participation[*].resource.id → Device.identifier)"

// ─── Relationer ───────────────────────────────────────────────────────────

* derivedFrom MS
* derivedFrom ^short = "Samband – härledd observation (observationBody.relation[*] med relationstyp 'härledd från'); se OBS-005"

* hasMember MS
* hasMember ^short = "Samband – panelmedlem (observationBody.relation[*] med relationstyp 'ingår i grupp'); se OBS-005"

// ─── Anteckning ───────────────────────────────────────────────────────────

* note MS
* note ^short = "Textuell beskrivning (observationBody.description); även overflow-lokal från targetSite[1..*] läggs här"
