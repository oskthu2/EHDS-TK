Profile: SEEHDSObservationGrowth
Parent: $Observation-results-uv-ips
Id: se-ehds-observation-growth
Title: "SE EHDS Observation – Tillväxtkurva (GetObservations)"
Description: "Profil för tillväxtobservationer för barn och ungdom mappat från RIVTA-tjänstekontraktet GetObservations (clinicalprocess:healthcond:basic v1.2). Täcker NPÖ 1.2 och 1177 Journal 1.2."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från observationHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* performer only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer MS
* performer ^short = "Ansvarig personal (accountableHealthcareProfessional)"

* issued MS
* issued ^short = "Registreringsdatum (documentTime)"

* status 1..1 MS
* status ^short = "Observationsstatus"

* category 1..* MS
* category ^short = "Observationskategori (vital-signs)"

* code 1..1 MS
* code ^short = "Observationstyp (observationCode – LOINC)"
* code.coding MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains loinc 0..1 MS
* code.coding[loinc].system = $LOINC
* code.coding[loinc] ^short = "LOINC-kod för tillväxtparameter (vikt, längd, huvudomfång)"

* effective[x] 1..1 MS
* effective[x] ^short = "Mättidpunkt (observationTime)"

* value[x] 1..1 MS
* value[x] ^short = "Mätvärde med enhet (observationValue)"

* interpretation MS
* interpretation ^short = "Bedömning (observationInterpretation)"

* note MS
* note ^short = "Kommentar (observationComment)"
