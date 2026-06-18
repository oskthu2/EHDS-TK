Instance: ObservationStatusMap
InstanceOf: ConceptMap
Id: observation-status-map
Title: "GetObservations – observationStatus (SNOMED CT) → FHIR ObservationStatus"
Description: """
  Mappning från RIVTA GetObservations observationStatus-koder (SNOMED CT,
  urvals-id 56431000052106) till FHIR R4 ObservationStatus (OBS-003).

  Kodsystem: SNOMED CT SE, OID 1.2.752.116.2.1.1 → URI http://snomed.info/sct.
  Om en okänd kod tas emot sätts status till 'unknown' och en OperationOutcome-varning
  genereras av bryggan.
"""
Usage: #definition

* url = "https://fhir.inera.se/ConceptMap/observation-status-map"
* name = "ObservationStatusMap"
* title = "GetObservations observationStatus → FHIR ObservationStatus"
* status = #active
* experimental = false
* date = "2025-01-01"
* sourceUri = "http://snomed.info/sct"
* targetUri = "http://hl7.org/fhir/observation-status"
* description = "Mappar SNOMED CT-koder från urvals-id 56431000052106 till FHIR ObservationStatus."

* group[0].source = "http://snomed.info/sct"
* group[0].target = "http://hl7.org/fhir/observation-status"

* group[0].element[0].code = #385676005
* group[0].element[0].display = "Under utförande"
* group[0].element[0].target[0].code = #preliminary
* group[0].element[0].target[0].display = "Preliminary"
* group[0].element[0].target[0].equivalence = #equivalent

* group[0].element[1].code = #385651009
* group[0].element[1].display = "Slutlig"
* group[0].element[1].target[0].code = #final
* group[0].element[1].target[0].display = "Final"
* group[0].element[1].target[0].equivalence = #equivalent

* group[0].element[2].code = #272393004
* group[0].element[2].display = "Korrigerad"
* group[0].element[2].target[0].code = #amended
* group[0].element[2].target[0].display = "Amended"
* group[0].element[2].target[0].equivalence = #equivalent

* group[0].element[3].code = #59776000
* group[0].element[3].display = "Avbeställd/annullerad"
* group[0].element[3].target[0].code = #cancelled
* group[0].element[3].target[0].display = "Cancelled"
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[3].target[0].comment = "Avbeställd/annullerad – observationen utfördes aldrig"

* group[0].element[4].code = #444301002
* group[0].element[4].display = "Avböjd av patient"
* group[0].element[4].target[0].code = #cancelled
* group[0].element[4].target[0].display = "Cancelled"
* group[0].element[4].target[0].equivalence = #narrower
* group[0].element[4].target[0].comment = "Avböjd av patient – semantiken specificeras med dataAbsentReason om värderelevant"

* group[0].unmapped.mode = #fixed
* group[0].unmapped.code = #unknown
* group[0].unmapped.display = "Unknown"
