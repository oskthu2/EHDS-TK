Profile: IneraPatient
Parent: Patient
Id: IneraPatient
Title: "Inera Patient"
Description: """
A template patient profile demonstrating Inera's FHIR profiling conventions.
Authors should replace this description with the clinical purpose and scope of the profile.
"""

* ^status = #draft
* ^version = "0.1.0"
* ^publisher = "Inera AB"
* ^contact.name = "Inera AB"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.inera.se"
* ^jurisdiction = urn:iso:std:iso:3166#SE "Sweden"

// Identifier slice: Swedish personal identity number (personnummer)
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Patient identifiers, including Swedish personnummer"

* identifier contains personnummer 0..1 MS
* identifier[personnummer].system 1..1
* identifier[personnummer].system = "http://electronichealth.se/identifier/personnummer"
* identifier[personnummer].value 1..1 MS
* identifier[personnummer].value ^short = "Swedish personal identity number (personnummer)"

// Name
* name MS
* name ^short = "Patient's name"
* name.family MS
* name.given MS

// Gender
* gender MS

// Birth date
* birthDate MS

// Address
* address MS
* address.postalCode MS
* address.city MS
* address.country MS
