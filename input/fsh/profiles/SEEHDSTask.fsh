Profile: SEEHDSTask
Parent: Task
Id: se-ehds-task
Title: "SE EHDS Task – Remisstatus (GetRequestActivities)"
Description: "Profil för remisstatus och processaktiviteter mappat från RIVTA-tjänstekontraktet GetRequestActivities (crm:requeststatus v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0."

* for only Reference(SEEHDSPatient)
* for MS
* for ^short = "Patient (patientId från requestHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* owner only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* owner MS
* owner ^short = "Ansvarig enhet (requestReceiver)"

* authoredOn MS
* authoredOn ^short = "Registreringsdatum (documentTime från requestHeader)"

* lastModified MS
* lastModified ^short = "Senaste statusändring (activityTime)"

* status 1..1 MS
* status ^short = "Aktivitetsstatus (requestStatus – kv_requestStatus)"

* intent 1..1 MS

* focus MS
* focus only Reference(SEEHDSServiceRequestReferral)
* focus ^short = "Koppling till remiss (requestId)"

* code MS
* code ^short = "Aktivitetstyp (activityType)"

* description MS
* description ^short = "Aktivitetsbeskrivning (activityComment)"

* input MS
* input ^short = "Indata (requestInput)"

* output MS
* output ^short = "Utdata/resultat (requestOutput)"
