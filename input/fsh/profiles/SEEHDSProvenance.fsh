Profile: SEEHDSProvenance
Parent: Provenance
Id: se-ehds-provenance
Title: "SE EHDS Provenance"
Description: "Provenance-profil för EHDS-TK. Varje klinisk resurs åtföljs av en Provenance med tre agenter: custodian (vårdgivare), author (vårdenhet) och assembler (EHDS-bryggan)."

* target 1..* MS
* target ^short = "Referens till resursen som Provenance gäller"

* recorded 1..1 MS
* recorded ^short = "Tidpunkt för dokumentation (documentTime från RIVTA, UTC ISO 8601)"

* agent 3..* MS
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type.coding.code"
* agent ^slicing.rules = #open

* agent contains
    custodian 1..1 MS and
    author 1..1 MS and
    assembler 1..1 MS

* agent[custodian].type 1..1 MS
* agent[custodian].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian
* agent[custodian].who 1..1 MS
* agent[custodian].who only Reference($SEBaseOrganization)
* agent[custodian].who ^short = "Vårdgivare (careProviderHSAId från RIVTA) – yttre Sparr"

* agent[author].type 1..1 MS
* agent[author].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
* agent[author].who 1..1 MS
* agent[author].who only Reference($SEBaseOrganization)
* agent[author].who ^short = "Vårdenhet (careUnitHSAId från RIVTA) – inre Sparr"

* agent[assembler].type 1..1 MS
* agent[assembler].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
* agent[assembler].who 1..1 MS
* agent[assembler].who ^short = "EHDS-bryggan (EHDS_BRIDGE_HSA_ID)"
