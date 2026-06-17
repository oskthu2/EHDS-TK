Profile: SEEHDSCarePlan
Parent: CarePlan
Id: se-ehds-care-plan
Title: "SE EHDS CarePlan – Vårdplan (GetCarePlans)"
Description: "Profil för vårdplaner och vård- och omsorgsplaner mappat från RIVTA-tjänstekontraktet GetCarePlans (clinicalprocess:logistics:logistics v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från carePlanHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* author only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* author MS
* author ^short = "Ansvarig upprättare (accountableHealthcareProfessional)"

* created MS
* created ^short = "Skapad (documentTime från carePlanHeader)"

* status 1..1 MS
* status ^short = "Planstatus (carePlanStatus)"

* intent 1..1 MS

* category MS
* category ^short = "Plantyp (carePlanType)"

* title MS
* title ^short = "Plantitel (carePlanTitle)"

* description MS
* description ^short = "Planbeskrivning (carePlanDescription)"

* period MS
* period ^short = "Planperiod (carePlanTimePeriod)"
* period.start MS
* period.start ^short = "Startdatum"
* period.end MS
* period.end ^short = "Slutdatum"

* activity MS
* activity.detail MS
* activity.detail.description MS
* activity.detail.description ^short = "Planerad åtgärd (plannedActivity)"

* note MS
* note ^short = "Kommentar (carePlanComment)"
