# SE EHDS Observation Base – GetObservations - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Observation Base – GetObservations**

## Resource Profile: SE EHDS Observation Base – GetObservations 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-base | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSObservationBase |

 
Basprofil för alla observationer från GetObservations (clinicalprocess:healthcond:basic v2.0). 
Profilen fångar den generella TK-mappningen och används som förälder av domänspecifika profiler (t.ex. IneraEHDSObservationGrowth för tillväxtkurva). 
Nyckeldesignbeslut: 
* observationBody.observationValue är XOR-union av sju värdetyper (cv/pq/ivlpq/ts/ivlts/st/int). Varje gren mappas till respektive FHIR value[x]-variant.
* Om valueNegation=true utelämnas value[x] och dataAbsentReason sätts.
* observationBody.time (ts/ivlts) → effective[x]; registrationTime → issued.
* participation är polymorf (healthcareProfessional/patient/otherPerson/locationRole/resource/organisation). Välj FHIR-element per deltagartyp (se mappningssida).
* PDL-fält (Sparr) hanteras via Provenance och meta.security (se mappningssida).
 
Täcker NPÖ 1.2 och 1177 Journal 1.2. 

**Användningar:**

* Härledd från denna Profil: [SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)](StructureDefinition-inera-ehds-observation-growth.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-observation-base)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-observation-base.csv), [Excel](StructureDefinition-inera-ehds-observation-base.xlsx), [Schematron](StructureDefinition-inera-ehds-observation-base.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-observation-base",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-base",
  "version" : "0.1.0",
  "name" : "IneraEHDSObservationBase",
  "title" : "SE EHDS Observation Base – GetObservations",
  "status" : "draft",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Basprofil för alla observationer från GetObservations\n(clinicalprocess:healthcond:basic v2.0).\n\nProfilen fångar den generella TK-mappningen och används som förälder av\ndomänspecifika profiler (t.ex. IneraEHDSObservationGrowth för tillväxtkurva).\n\nNyckeldesignbeslut:\n- observationBody.observationValue är XOR-union av sju värdetyper (cv/pq/ivlpq/ts/ivlts/st/int).\n  Varje gren mappas till respektive FHIR value[x]-variant.\n- Om valueNegation=true utelämnas value[x] och dataAbsentReason sätts.\n- observationBody.time (ts/ivlts) → effective[x]; registrationTime → issued.\n- participation är polymorf (healthcareProfessional/patient/otherPerson/locationRole/resource/organisation).\n  Välj FHIR-element per deltagartyp (se mappningssida).\n- PDL-fält (Sparr) hanteras via Provenance och meta.security (se mappningssida).\n\nTäcker NPÖ 1.2 och 1177 Journal 1.2.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.meta.source",
      "path" : "Observation.meta.source",
      "short" : "Källsystem (header) – HSA-id för det system som tillgängliggör informationen",
      "mustSupport" : true
    },
    {
      "id" : "Observation.meta.security",
      "path" : "Observation.meta.security",
      "short" : "Säkerhetsmärkning:\nconfidentialityIndicator=true → v3-Confidentiality#R (skyddad identitet)\napprovedForPatient=false      → ActCode#NOPATIENT (ej visas för patient, se PDL-001)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.identifier",
      "path" : "Observation.identifier",
      "short" : "Observations-id (observationBody.observationId)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.identifier.system",
      "path" : "Observation.identifier.system",
      "short" : "OID för informationsägande vårdgivare (observationId.root) – format urn:oid:{root}",
      "mustSupport" : true
    },
    {
      "id" : "Observation.identifier.value",
      "path" : "Observation.identifier.value",
      "short" : "Unikt id inom vårdgivaren (observationId.extension)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Observationsstatus (observationBody.observationStatus – SNOMED CT urvals-id 56431000052106 → FHIR ObservationStatus via ConceptMap, se OBS-003)",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/se-observation-status-vs"
      }
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "short" : "Observationskategori – kategori 'exam' sätts alltid; domänprofiler lägger till fler (t.ex. vital-signs)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Observationstyp (observationBody.observationType.type.code) – SNOMED CT SE OID 1.2.752.116.2.1.1; om saknas används platshållarkod"
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "short" : "Kodat observationstyps-värde; SNOMED CT SE-koder (http://snomed.info/sct)"
    },
    {
      "id" : "Observation.code.text",
      "path" : "Observation.code.text",
      "short" : "observationBody.observationType.type.displayName"
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patient (observationBody.patient.person.personId om tillgängligt; annars observationBody.patient.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "Observationstid (observationBody.time.ts → effectiveDateTime; observationBody.time.ivlts → effectivePeriod); se GENERAL-001 och OBS-001"
    },
    {
      "id" : "Observation.issued",
      "path" : "Observation.issued",
      "short" : "Dokumentationstidpunkt (observationBody.registrationTime) – när uppgiften registrerades i journalen",
      "mustSupport" : true
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "short" : "Deltagare (observationBody.participation[*]):\nhealthcareProfessional.performerId → Reference(PractitionerRole)\notherPerson → Reference(RelatedPerson)\norganisation → Reference(Organization)\nresource → Observation.device (se nedan)\npatient/locationRole → se OBS-006",
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Observationsvärde (observationBody.observationValue – XOR-union):\ncv       → valueCodeableConcept\npq       → valueQuantity\nivlpq    → valueRange\nts       → valueDateTime (precision ≥ dag) eller valueString (precision < dag, se OBS-001)\nivlts    → valuePeriod\nst       → valueString\nintValue → valueInteger\nOm valueNegation=true utelämnas value[x] och dataAbsentReason sätts (se OBS-002)."
    },
    {
      "id" : "Observation.dataAbsentReason",
      "path" : "Observation.dataAbsentReason",
      "short" : "Negation (observationBody.valueNegation=true → dataAbsentReason.code='not-detected'); se OBS-002",
      "mustSupport" : true
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Textuell beskrivning (observationBody.description); även overflow-lokal från targetSite[1..*] läggs här",
      "mustSupport" : true
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "short" : "Anatomisk lokalisation (observationBody.targetSite[0]).\nFörsta målplatsen mappas till bodySite; TK är 0..* men FHIR R4 är 0..1.\nYtterligare platser (index ≥ 1) mappas till extension[additionalBodySite] (se OBS-004).\nOBS: extension utgår i FHIR R5 där bodySite är 0..* – använd standard bodySite vid R5-migration.",
      "mustSupport" : true
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "short" : "Mätskala (observationBody.scale) – nominalskala/ordinalskala (t.ex. AUDIT, AB0-systemet)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.device",
      "path" : "Observation.device",
      "short" : "Medicinteknisk utrustning (observationBody.participation[*].resource.id → Device.identifier)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.hasMember",
      "path" : "Observation.hasMember",
      "short" : "Samband – panelmedlem (observationBody.relation[*] med relationstyp 'ingår i grupp'); se OBS-005",
      "mustSupport" : true
    },
    {
      "id" : "Observation.derivedFrom",
      "path" : "Observation.derivedFrom",
      "short" : "Samband – härledd observation (observationBody.relation[*] med relationstyp 'härledd från'); se OBS-005",
      "mustSupport" : true
    }]
  }
}

```
