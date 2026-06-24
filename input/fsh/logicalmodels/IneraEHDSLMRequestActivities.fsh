Logical: IneraEHDSLMRequestActivities
Id: inera-ehds-lm-request-activities
Title: "GetRequestActivities"
Description: "Logisk modell för remisstatus och processaktiviteter hämtad via GetRequestActivities (crm:requeststatus v2.0)."

* requestHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* requestId 1..1 Identifier "Remissidentifierare (koppling till remiss)"
* requestStatus 1..1 CodeableConcept "Remisstatus (kv_requestStatus)"
* requestReceiver 0..1 Identifier "Mottagande enhets HSA-id"
* activityType 0..1 CodeableConcept "Aktivitetstyp"
* activityTime 0..1 dateTime "Aktivitetstidpunkt"
* activityComment 0..1 string "Aktivitetsbeskrivning/kommentar"
