# Introduktion

### Domän

Denna Implementation Guide (IG) beskriver den FHIR-funktionalitet som krävs för att informationsförsörja **NPÖ** (Nationell patientöversikt) och **1177 Journal** via Ineras RIVTA-tjänstekontrakt. IG:t definierar FHIR-profiler, logiska modeller och mappningar för 16 tjänstekontrakt fördelade på 6 FHIR-grupper.

---

### Omfång

IG:t täcker följande FHIR-grupper och tjänstekontrakt:

| FHIR-grupp | Informationsmängd | Tjänstekontrakt | NPÖ | 1177 Journal |
|---|---|---|---|---|
| Patientöversikt | Diagnos | GetDiagnosis | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Uppmärksamhetsinformation | GetAlertInformation | Ja (2.0, 3.0) | Ja (2.0, 3.0) |
| Patientöversikt | Läkemedel | GetMedicationHistory | Ja (2.2) | Ja (2.2) |
| Patientöversikt | Vaccinationer | GetVaccinationHistory | Ja (2.0) | Ja (1.0, 2.0) |
| Patientöversikt | Funktionstillstånd och ADL | GetFunctionalStatus | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Mödravård | GetMaternityMedicalHistory | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Vårdplan | GetCarePlans | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Vårdkontakter | GetCareContacts | Ja (2.0, 3.0) | Ja (2.0, 3.0) |
| Patientöversikt | Anteckningar | GetCareDocumentation | Ja (2.1, 3.0) | Ja (2.1, 3.0) |
| Laboratorie och diagnostik | Provsvar | GetLaboratoryOrderOutcome | Ja (3.1, 4.1) | Ja (3.1, 4.2) |
| Bilddiagnostik | Bilddiagnostik | GetImagingOutcome | Ja (1.0) | Ja (1.0) |
| Remiss och process | Konsultationsremiss | GetReferralOutcome | Ja (3.1) | Ja (3.1) |
| Remiss och process | Remisstatus | GetRequestActivities | Ja (2.0) | Ja (1.0, 2.0) |
| Tillväxtkurva barn | Tillväxtkurva | GetObservations | Ja (1.2) | Ja (1.2) |
| Logg | Åtkomstloggar | GetAccessLogForPatient | Nej | Ja (1.1, 2.0) |

IG:t täcker **inte** tjänstekontrakt utanför ovanstående tabell, och avser inte att ersätta källsystemen eller specificera gränssnittet mot NPÖ/1177 Journal på transaktionsnivå.

---

### Syfte

Syftet med IG:t är att:

1. Definiera FHIR-profiler (R4) som möjliggör EHDS-kompatibel representation av data från Ineras RIVTA-tjänstekontrakt
2. Dokumentera mappningen från RIVTA-element till FHIR-element, inklusive OID→URI-översättning, Provenance-mönster och Sparr-hantering
3. Stödja implementörer som transformerar RIVTA-svar till FHIR-resurser för NPÖ och 1177 Journal

IG:t riktar sig till systemleverantörer, arkitekter och integrationsspecialister inom svensk e-hälsa.

---

### Arkitektur och EHDS-relation

Profilerna bygger på:
- **IPS (International Patient Summary)** – profiler ärvs där de finns
- **EU EPS (European Patient Summary)** – obligations-profilen sätts i `meta.profile` vid runtime
- **HL7 Sweden basprofiler** – SEBasePractitionerRole och SEBaseOrganization används för personreferenser

Varje producerad FHIR-resurs bär **två profiler** i `meta.profile`:
1. Aktuell EHDS-TK-profil (t.ex. `IneraEHDSConditionDiagnosis`)
2. Relevant EU EPS obligations-profil

---

### Terminologi

Alla kodverk och värdemängder som Inera förvaltar finns på [Inera Terminologitjänst](https://www.inera.se/tjanster/alla-tjanster-a-o/terminologitjanst-for-nationell-e-halsa/).

---

### Beroenden

Denna IG har beroenden till:
- **HL7 IPS:** `hl7.fhir.uv.ips`
- **EU EPS:** `hl7.fhir.eu.eps`
- **SE-core (HL7 Sweden):** `hl7se.fhir.base`

---

### Dokumentation

Mer information om Inera Core och RIVTA finns på [Inera Core](https://www.inera.se/tjanster/alla-tjanster-a-o/inera-core/).

---

### Förvaltning och vägledning

FHIR-profilerna förvaltas av Inera: [Källkod](https://github.com/oskthu2/ehds-tk).

Beskrivning av krav på konformans och vägledning för Ineras FHIR-IGs finns på [Inera FHIR-landningssida](https://www.inera.se/fhir).
