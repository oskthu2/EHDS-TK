Profile: SEEHDSPatient
Parent: $Patient-uv-ips
Id: se-ehds-patient
Title: "SE EHDS Patient"
Description: "Patientprofil för EHDS-TK IG. Ärver från IPS Patient och lägger till svenska identifierarslicar."

* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Patientidentifierare (patientId från RIVTA)"

* identifier contains
    personnummer 0..1 MS and
    samordningsnummer 0..1 MS and
    nationelltReservnummer 0..1 MS

* identifier[personnummer].system 1..1 MS
* identifier[personnummer].system = $personnummer
* identifier[personnummer].value 1..1 MS
* identifier[personnummer] ^short = "Personnummer"

* identifier[samordningsnummer].system 1..1 MS
* identifier[samordningsnummer].system = $samordningsnummer
* identifier[samordningsnummer].value 1..1 MS
* identifier[samordningsnummer] ^short = "Samordningsnummer"

* identifier[nationelltReservnummer].system 1..1 MS
* identifier[nationelltReservnummer].system = $nationelltReservnummer
* identifier[nationelltReservnummer].value 1..1 MS
* identifier[nationelltReservnummer] ^short = "Nationellt reservnummer"

* name MS
* gender MS
* birthDate MS
