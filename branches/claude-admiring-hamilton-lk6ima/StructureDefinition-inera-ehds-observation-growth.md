# SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)**

## Resource Profile: SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-growth | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSObservationGrowth |

 
Profil för tillväxtobservationer (längd, vikt, huvudomfång, beräknad graviditetslängd) för barn och ungdom, baserad på: 
* GetObservations (clinicalprocess:healthcond:basic v2.0)
* Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15)
 
Ärver IneraEHDSObservationBase och lägger till: 
* code bunden till GrowthObservationTypeVS (IoÖ-specificerade SNOMED CT-koder)
* value[x] begränsad till Quantity (pq-grenen; IoÖ anger alltid PQ-värden)
* Enhet (UCUM) per mättyp: cm (längd/hC), kg (vikt), d (gestationslängd)
* LOINC-kod-slice på code.coding för EHDS/EPS-interoperabilitet
* category = vital-signs
 
Kodsystem för observationType.type: SNOMED CT SE, OID 1.2.752.116.2.1.1. 
Täcker NPÖ 1.2 och 1177 Journal 1.2. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-observation-growth)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-observation-growth.csv), [Excel](StructureDefinition-inera-ehds-observation-growth.xlsx), [Schematron](StructureDefinition-inera-ehds-observation-growth.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-observation-growth",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-growth",
  "version" : "0.1.0",
  "name" : "IneraEHDSObservationGrowth",
  "title" : "SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)",
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
  "description" : "Profil för tillväxtobservationer (längd, vikt, huvudomfång, beräknad\ngraviditetslängd) för barn och ungdom, baserad på:\n- GetObservations (clinicalprocess:healthcond:basic v2.0)\n- Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15)\n\nÄrver IneraEHDSObservationBase och lägger till:\n- code bunden till GrowthObservationTypeVS (IoÖ-specificerade SNOMED CT-koder)\n- value[x] begränsad till Quantity (pq-grenen; IoÖ anger alltid PQ-värden)\n- Enhet (UCUM) per mättyp: cm (längd/hC), kg (vikt), d (gestationslängd)\n- LOINC-kod-slice på code.coding för EHDS/EPS-interoperabilitet\n- category = vital-signs\n\nKodsystem för observationType.type: SNOMED CT SE, OID 1.2.752.116.2.1.1.\n\nTäcker NPÖ 1.2 och 1177 Journal 1.2.",
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
  "baseDefinition" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-base",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "short" : "Alltid vital-signs för tillväxtmätningar (observationBody.observationType mappar till vital-signs)"
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "IoÖ-kod (observationBody.observationType.type):\nSNOMED CT SE OID 1.2.752.116.2.1.1, kräver en av:\n1153637007 (kroppslängd), 50373000 (mått på kroppslängd),\n248334005 (längd i liggande – ej för nyanslutning),\n27113001 (kroppsvikt), 363812007 (huvudomfång),\n412726003 (graviditetslängd vid födelse).",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/growth-observation-type-vs"
      }
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "description" : "SNOMED CT-kod (obligatorisk per IoÖ) + valfri LOINC-kod för EHDS-interoperabilitet",
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Observation.code.coding:snomedSE",
      "path" : "Observation.code.coding",
      "sliceName" : "snomedSE",
      "short" : "SNOMED CT SE-kod (IoÖ-obligatorisk):\n1153637007 | kroppslängd |\n50373000   | mått på kroppslängd |\n248334005  | längd i liggande (bakåtkompatibel) |\n27113001   | kroppsvikt |\n363812007  | huvudomfång |\n412726003  | graviditetslängd vid födelse |",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding:snomedSE.system",
      "path" : "Observation.code.coding.system",
      "min" : 1,
      "patternUri" : "http://snomed.info/sct"
    },
    {
      "id" : "Observation.code.coding:loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "loinc",
      "short" : "Valfri LOINC-kod för EHDS/EPS-interoperabilitet:\n8302-2 (Body height)                  ↔ 1153637007 / 50373000 / 248334005\n29463-7 (Body weight)                 ↔ 27113001\n9843-4 (Head occipital-frontal circ.) ↔ 363812007\n11885-1 (Gestational age Estimated)   ↔ 412726003",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding:loinc.system",
      "path" : "Observation.code.coding.system",
      "min" : 1,
      "patternUri" : "http://loinc.org"
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Mätvärde (observationBody.observationValue.pq); IoÖ anger alltid pq-grenen för tillväxtmätningar",
      "min" : 1,
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Observation.value[x].value",
      "path" : "Observation.value[x].value",
      "short" : "Mätetalet (observationBody.observationValue.pq.value):\nLängd: decimal cm, 0-1 decimal (t.ex. 49.5)\nVikt:  decimal kg, 0-3 decimaler (t.ex. 5.830)\nHuvud: decimal cm, 1 decimal (t.ex. 38.5)\nGest:  heltal dagar (t.ex. 280)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x].unit",
      "path" : "Observation.value[x].unit",
      "short" : "Enhet: 'cm' (längd/hC), 'kg' (vikt), 'd' (gestationslängd)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x].system",
      "path" : "Observation.value[x].system",
      "short" : "Alltid UCUM (http://unitsofmeasure.org)",
      "min" : 1,
      "patternUri" : "http://unitsofmeasure.org",
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x].code",
      "path" : "Observation.value[x].code",
      "short" : "UCUM-kod: cm | kg | d",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
