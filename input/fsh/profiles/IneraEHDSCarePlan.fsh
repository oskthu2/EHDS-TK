Profile: IneraEHDSCarePlan
Parent: CarePlan
Id: inera-ehds-care-plan
Title: "SE EHDS CarePlan – Vårdplan (GetCarePlans)"
Description: "Profil för vård- och omsorgsplaner mappat från RIVTA-tjänstekontraktet GetCarePlans (clinicalprocess:logistics:logistics v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0."

* identifier MS
* identifier ^short = "Planens identitet inom källsystemet (documentId)"

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* author only Reference(PractitionerRole or Organization)
* author MS
* author ^short = "Ansvarig personal (accountableHealthcareProfessional)"

* created MS
* created ^short = "Tidpunkt då planen upprättades (documentTime)"

* status 1..1 MS

* intent 1..1 MS

* category MS
* category from TypeOfCarePlanVS (required)
* category ^short = "Typ av vård- och omsorgsplan (typeOfCarePlan)"

* title 1..1 MS
* title ^short = "Rubrik för planen (documentTitle) – obligatorisk"

* note MS
* note ^short = "Innehåll i planen (content – text/plain, text/html). Stödda MIME-typer: text/plain, text/html, image/jpeg, image/png, image/tiff, application/pdf. Binärt innehåll (base64/URL) kräver extension. content.id är 0..0 (N/A) per TKB. Binärdata max 100 KB per post."

* extension contains
    ApprovedForPatient named approvedForPatient 0..1 MS

Extension: ApprovedForPatient
Id: approved-for-patient
Title: "Godkänd för patient"
Description: "Anger om information är godkänd för delning med patient (approvedForPatient, Regel 3)."
* value[x] only boolean
