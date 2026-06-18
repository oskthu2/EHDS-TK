ValueSet: SEObservationStatusVS
Id: se-observation-status-vs
Title: "SE Observation Status (SNOMED CT urval 56431000052106)"
Description: """
  Tillåtna statusvärden för GetObservations observationStatus.
  Urvals-id 56431000052106, SNOMED CT SE (OID 1.2.752.116.2.1.1).
  Mappning till FHIR ObservationStatus via ConceptMap observation-status-map.
"""
* ^status = #active
* ^experimental = false
* http://snomed.info/sct#385676005 "Under utförande"
* http://snomed.info/sct#385651009 "Slutlig"
* http://snomed.info/sct#272393004 "Korrigerad"
* http://snomed.info/sct#59776000 "Avbeställd/annullerad"
* http://snomed.info/sct#444301002 "Avböjd av patient"
