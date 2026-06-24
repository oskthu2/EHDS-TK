Invariant: encounter-period-min-one
Description: "careContactTimePeriod: minst ett av start och end måste anges"
Expression: "period.exists() implies (period.start.exists() or period.end.exists())"
Severity: #error

Profile: IneraEHDSEncounter
Parent: Encounter
Id: inera-ehds-encounter
Title: "SE EHDS Encounter – Vårdkontakter (GetCareContacts)"
Description: "Profil för vårdkontakter mappat från RIVTA-tjänstekontraktet GetCareContacts (clinicalprocess:logistics:logistics v3.0). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0."

* obeys encounter-period-min-one

* identifier MS
* identifier ^short = "Vårdkontaktens identitet (documentId)"

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* status 1..1 MS
* status ^short = "Kontaktstatus (careContactStatus – SNOMED CT SE, SCTID 53761000052103)"

* class 1..1 MS
* class ^short = "Typ av vårdkontakt (careContactCode – KV Vårdkontakttyp OID 1.2.752.129.2.2.2.x)"

* period 0..1 MS
* period ^short = "Tidsintervall för vårdkontakten (careContactTimePeriod)"
* period.start 0..1 MS
* period.start ^short = "Starttidpunkt (careContactTimePeriod.start)"
* period.end 0..1 MS
* period.end ^short = "Sluttidpunkt (careContactTimePeriod.end)"

* participant MS
* participant.individual only Reference(PractitionerRole)
* participant.individual MS
* participant.individual ^short = "Ansvarig personal (accountableHealthcareProfessional)"

* serviceProvider only Reference(Organization)
* serviceProvider MS
* serviceProvider ^short = "Enhet för vårdkontakten (careContactOrgUnit – Regel 5: krävs för NPÖ)"
* serviceProvider.identifier 1..1 MS
* serviceProvider.identifier ^short = "HSA-id för kontaktenhet (careContactOrgUnit.orgUnitHSAId) – obligatorisk per Regel 4"
* serviceProvider.display 1..1 MS
* serviceProvider.display ^short = "Namn på kontaktenhet (careContactOrgUnit.orgUnitName) – obligatorisk per Regel 4"

* reasonCode MS
* reasonCode ^short = "Orsak till vårdkontakt (careContactReason)"
