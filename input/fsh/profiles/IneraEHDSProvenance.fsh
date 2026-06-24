Profile: IneraEHDSProvenance
Parent: Provenance
Id: inera-ehds-provenance
Title: "SE EHDS Provenance"
Description: """
  Provenance-profil för EHDS-TK. Varje klinisk resurs åtföljs av en Provenance
  med två agenter som speglar spärr-hierarkin enligt PDL:
  - custodian (yttre Sparr) — den juridiskt ansvariga vårdgivaren
  - author (inre Sparr) — den informationsägande vårdenheten

  OBS: Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering
  baserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver
  Provenance-agenterna för spärr och `meta.security` för `approvedForPatient` inte
  inkluderas i svaret — filtreringen sker då redan på servernivå.
"""

* target 1..* MS
* target ^short = "Referens till resursen som Provenance gäller"

* recorded 1..1 MS
* recorded ^short = "Tidpunkt för dokumentation (documentTime från RIVTA, UTC ISO 8601)"

* agent 2..* MS
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type.coding.code"
* agent ^slicing.rules = #open

* agent contains
    custodian 1..1 MS and
    author 1..1 MS

* agent[custodian].type 1..1 MS
* agent[custodian].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian
* agent[custodian].who 1..1 MS
* agent[custodian].who only Reference(Organization)
* agent[custodian].who ^short = "Vårdgivare (careProviderHSAId / accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId) – yttre Sparr"

* agent[author].type 1..1 MS
* agent[author].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
* agent[author].who 1..1 MS
* agent[author].who only Reference(Organization)
* agent[author].who ^short = "Vårdenhet (careUnitHSAId / accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId) – inre Sparr"
