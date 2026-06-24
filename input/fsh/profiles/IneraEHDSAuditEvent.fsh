Profile: IneraEHDSAuditEvent
Parent: AuditEvent
Id: inera-ehds-audit-event
Title: "SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient)"
Description: "Profil för åtkomstloggar mappat från RIVTA-tjänstekontraktet GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Täcker 1177 Journal 1.1, 2.0. Krävs ej för NPÖ."

* agent 1..* MS
* agent ^short = "Aktörer i loggposten"
* agent.who MS
* agent.who ^short = "Användare/system (userId)"
* agent.who only Reference(PractitionerRole or Device)
* agent.requestor MS
* agent.requestor ^short = "Är aktören den som initierade händelsen"
* agent.purposeOfUse MS
* agent.purposeOfUse ^short = "Åtkomstsyfte (accessPurpose)"

* entity 1..* MS
* entity ^short = "Objekt/patient som åtkomsten gäller"
* entity.what MS
* entity.what only Reference(IneraEHDSPatient)
* entity.what ^short = "Patientidentifierare (patientId)"
* entity.role MS
* entity.role ^short = "Objektets roll i händelsen"

* recorded 1..1 MS
* recorded ^short = "Loggtidpunkt (accessTime)"

* type 1..1 MS
* type ^short = "Händelsetyp (accessType)"

* subtype MS
* subtype ^short = "Händelseundertyp (accessSubType)"

* action MS
* action ^short = "Åtgärd (R=Read)"

* outcome MS
* outcome ^short = "Utfall (accessOutcome)"

* source MS
* source.observer MS
* source.observer ^short = "Loggkälla/system (sourceSystemHSAId)"
