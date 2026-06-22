Profile: SEEHDSDevice
Parent: Device
Id: se-ehds-device
Title: "SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord)"
Description: """
  Profil för det källsystem som registrerat en vaccination i GetVaccinationHistory v2.0.

  Representerar vaccinationMedicalRecordBody.registrationRecord.sourceSystem*
  och sourceSystemContact. Refereras från SEEHDSImmunization via
  extension[registrationDevice].

  deviceName[systemName]  = sourceSystemName     (1..1, obligatorisk)
  deviceName[productName] = sourceSystemProductName (0..1)
  version                 = sourceSystemProductVersion (0..1)
  extension[sourceSystemContact] = sourceSystemContact.actorId/actorName (0..1)
"""

// ─── Källsystemskontakt ───────────────────────────────────────────────────────
* extension contains DeviceSourceSystemContact named sourceSystemContact 0..1 MS
* extension[sourceSystemContact] ^short = "Kontaktperson för källsystemet (registrationRecord.sourceSystemContact)"

// ─── Enhetsnamn – systemName (obligatorisk) och productName (valfri) ─────────
* deviceName MS
* deviceName ^slicing.discriminator.type = #value
* deviceName ^slicing.discriminator.path = "type"
* deviceName ^slicing.rules = #open
* deviceName contains
    systemName 1..1 MS and
    productName 0..1 MS

* deviceName[systemName].name 1..1 MS
* deviceName[systemName].name ^short = "Källsystemets namn (registrationRecord.sourceSystemName)"
* deviceName[systemName].type = #user-friendly-name

* deviceName[productName].name 1..1 MS
* deviceName[productName].name ^short = "Källsystemets produktnamn (registrationRecord.sourceSystemProductName)"
* deviceName[productName].type = #model-name

// ─── Produktversion ──────────────────────────────────────────────────────────
* version 0..1 MS
* version.value 1..1 MS
* version.value ^short = "Källsystemets produktversion (registrationRecord.sourceSystemProductVersion)"

// ─── Extension-definition ────────────────────────────────────────────────────

Extension: DeviceSourceSystemContact
Id: device-source-system-contact
Title: "Källsystemskontakt"
Description: "Ansvarig kontaktperson för källsystemet (registrationRecord.sourceSystemContact.actorId/actorName)."
* extension contains
    actorId 0..1 and
    actorName 0..1
* extension[actorId].value[x] only string
* extension[actorId] ^short = "Kontaktpersonens identifierare (sourceSystemContact.actorId)"
* extension[actorName].value[x] only string
* extension[actorName] ^short = "Kontaktpersonens namn (sourceSystemContact.actorName)"
