Profile: IneraEHDSObservationGrowth
Parent: IneraEHDSObservationBase
Id: inera-ehds-observation-growth
Title: "SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)"
Description: """
  Profil för tillväxtobservationer (längd, vikt, huvudomfång, beräknad
  graviditetslängd) för barn och ungdom, baserad på:
  - GetObservations (clinicalprocess:healthcond:basic v2.0)
  - Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15)

  Ärver IneraEHDSObservationBase och lägger till:
  - code bunden till GrowthObservationTypeVS (IoÖ-specificerade SNOMED CT-koder)
  - value[x] begränsad till Quantity (pq-grenen; IoÖ anger alltid PQ-värden)
  - Enhet (UCUM) per mättyp: cm (längd/hC), kg (vikt), d (gestationslängd)
  - LOINC-kod-slice på code.coding för EHDS/EPS-interoperabilitet
  - category = vital-signs

  Kodsystem för observationType.type: SNOMED CT SE, OID 1.2.752.116.2.1.1.

  Täcker NPÖ 1.2 och 1177 Journal 1.2.
"""

// ─── Kategori = vital-signs ────────────────────────────────────────────────

* category 1..* MS
* category ^short = "Alltid vital-signs för tillväxtmätningar (observationBody.observationType mappar till vital-signs)"

// ─── Kod – bunden till IoÖ ValueSet + LOINC-slice ─────────────────────────

* code from GrowthObservationTypeVS (required)
* code MS
* code ^short = """
    IoÖ-kod (observationBody.observationType.type):
    SNOMED CT SE OID 1.2.752.116.2.1.1, kräver en av:
    1153637007 (kroppslängd), 50373000 (mått på kroppslängd),
    248334005 (längd i liggande – ej för nyanslutning),
    27113001 (kroppsvikt), 363812007 (huvudomfång),
    412726003 (graviditetslängd vid födelse).
  """

* code.coding MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "SNOMED CT-kod (obligatorisk per IoÖ) + valfri LOINC-kod för EHDS-interoperabilitet"

* code.coding contains
    snomedSE 1..1 MS and
    loinc 0..1 MS

* code.coding[snomedSE].system = "http://snomed.info/sct"
* code.coding[snomedSE] ^short = """
    SNOMED CT SE-kod (IoÖ-obligatorisk):
    1153637007 | kroppslängd |
    50373000   | mått på kroppslängd |
    248334005  | längd i liggande (bakåtkompatibel) |
    27113001   | kroppsvikt |
    363812007  | huvudomfång |
    412726003  | graviditetslängd vid födelse |
  """

* code.coding[loinc].system = $LOINC
* code.coding[loinc] ^short = """
    Valfri LOINC-kod för EHDS/EPS-interoperabilitet:
    8302-2 (Body height)                  ↔ 1153637007 / 50373000 / 248334005
    29463-7 (Body weight)                 ↔ 27113001
    9843-4 (Head occipital-frontal circ.) ↔ 363812007
    11885-1 (Gestational age Estimated)   ↔ 412726003
  """

// ─── Värde = alltid Quantity (PQ) ─────────────────────────────────────────

* value[x] 1..1 MS
* value[x] only Quantity
* value[x] ^short = "Mätvärde (observationBody.observationValue.pq); IoÖ anger alltid pq-grenen för tillväxtmätningar"

* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = """
    Mätetalet (observationBody.observationValue.pq.value):
    Längd: decimal cm, 0-1 decimal (t.ex. 49.5)
    Vikt:  decimal kg, 0-3 decimaler (t.ex. 5.830)
    Huvud: decimal cm, 1 decimal (t.ex. 38.5)
    Gest:  heltal dagar (t.ex. 280)
  """

* valueQuantity.unit 1..1 MS
* valueQuantity.unit ^short = "Enhet: 'cm' (längd/hC), 'kg' (vikt), 'd' (gestationslängd)"

* valueQuantity.system 1..1 MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.system ^short = "Alltid UCUM (http://unitsofmeasure.org)"

* valueQuantity.code 1..1 MS
* valueQuantity.code ^short = "UCUM-kod: cm | kg | d"
