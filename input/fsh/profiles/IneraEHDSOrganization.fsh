Profile: IneraEHDSOrganization
Parent: Organization
Id: inera-ehds-organization
Title: "SE EHDS Organization – Organisationsenhet"
Description: """
  Profil för organisationsenheter i EHDS-TK-mappningar (vårdenheter, juridiska vårdgivare m.fl.).

  Identifier-slicen ger stöd för HSA-id och SMI-id (Folkhälsomyndighetens
  id för vaccinationsenheter i det nationella vaccinationsregistret).
  Namn, kontaktuppgifter och adress mappar fält som annars inte har plats
  i resurserna de refereras ifrån.
"""

// ─── Identifierare ───────────────────────────────────────────────────────────
* identifier MS
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    hsaId 0..1 MS and
    smiId 0..1 MS

* identifier[hsaId].system = $hsaid-ntjp
* identifier[hsaId].value 1..1 MS
* identifier[hsaId] ^short = "HSA-id för organisationsenhet (orgUnitHSAId)"

* identifier[smiId].system = "urn:oid:1.2.752.194.10.1.1"
* identifier[smiId].value 1..1 MS
* identifier[smiId] ^short = "SMI-id / Verksamhetsid från Folkhälsomyndighetens vaccinationsregister (careUnitSmiId). OID behöver verifieras – se VAC-006."

// ─── Grundinformation ────────────────────────────────────────────────────────
* name MS
* name ^short = "Organisationsenhetens namn (orgUnitName)"

* telecom MS
* telecom ^short = "Telefon/e-post för organisationsenhet (orgUnitTelecom / orgUnitEmail)"

* address MS
* address.line MS
* address.line ^short = "Gatuadress (orgUnitAddress)"
* address.city MS
* address.city ^short = "Ort/plats (orgUnitLocation)"
