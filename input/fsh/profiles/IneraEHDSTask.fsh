Profile: IneraEHDSTask
Parent: Task
Id: inera-ehds-task
Title: "SE EHDS Task – Remisstatus (GetRequestActivities)"
Description: "Profil för remisstatus och processaktiviteter mappat från RIVTA-tjänstekontraktet GetRequestActivities (crm:requeststatus v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0."

* for only Reference(IneraEHDSPatient)
* for MS
* for ^short = "Patient (requestHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (requestHeader.sourceSystemHSAId)"

* owner only Reference(PractitionerRole or Organization)
* owner MS
* owner ^short = "Mottagande enhet (requestReceiver)"

* authoredOn MS
* authoredOn ^short = "Registreringsdatum (requestHeader.documentTime)"

* lastModified MS
* lastModified ^short = "Senaste statusändring (activityTime)"

* status 1..1 MS
* status ^short = "Aktivitetsstatus (requestStatus – kv_requestStatus)"

* intent 1..1 MS

* focus MS
* focus only Reference(IneraEHDSServiceRequestReferral)
* focus ^short = "Koppling till remiss (requestId)"

* code MS
* code ^short = "Aktivitetstyp (activityType)"

* description MS
* description ^short = "Aktivitetsbeskrivning (activityComment)"
