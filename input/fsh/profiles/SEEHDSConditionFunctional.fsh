Profile: SEEHDSConditionFunctional
Parent: $Condition-uv-ips
Id: se-ehds-condition-functional
Title: "SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)"
Description: "Profil för funktionstillstånd och ADL-bedömningar mappat från RIVTA-tjänstekontraktet GetFunctionalStatus (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från functionalStatusHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* recorder only Reference($SEBasePractitionerRole)
* recorder MS
* recorder ^short = "Ansvarig hälso- och sjukvårdspersonal (accountableHealthcareProfessional)"

* asserter only Reference($SEBasePractitionerRole)
* asserter MS
* asserter ^short = "Rättslig äkthetsintygsgivare (legalAuthenticator)"

* recordedDate MS
* recordedDate ^short = "Registreringsdatum (documentTime)"

* code 1..1 MS
* code ^short = "Funktionstillståndstyp (functionalStatusTypeCode – ICF)"

* category MS
* category ^short = "Funktionstillståndskategori (functionalStatusType)"

* clinicalStatus MS
* clinicalStatus ^short = "Status (functionalStatusStatus)"

* severity MS
* severity ^short = "Svårighetsgrad (functionalStatusSeverity)"

* onsetDateTime MS
* onsetDateTime ^short = "Startdatum (functionalStatusTimePeriod.start)"

* abatementDateTime MS
* abatementDateTime ^short = "Slutdatum (functionalStatusTimePeriod.end)"

* note MS
* note ^short = "Bedömning i fritext (functionalStatusComment)"
