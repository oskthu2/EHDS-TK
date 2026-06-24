# Tillväxtkurva – observationstyper (IoÖ Tillväxtkurva v3) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Tillväxtkurva – observationstyper (IoÖ Tillväxtkurva v3)**

## ValueSet: Tillväxtkurva – observationstyper (IoÖ Tillväxtkurva v3) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/ValueSet/growth-observation-type-vs | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:GrowthObservationTypeVS |

 
SNOMED CT-koder för tillväxtmätningar enligt Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15). 
Alla koder från kodsystemet SNOMED CT SE (OID 1.2.752.116.2.1.1). 
Koder: 
*  

| | | |
| :--- | :--- | :--- |
| 1153637007 | Kroppslängd | (primärkod för längd) |

 
*  

| | | |
| :--- | :--- | :--- |
| 50373000 | Mått på kroppslängd | (alternativkod för längd) |

 
*  

| | | |
| :--- | :--- | :--- |
| 248334005 | Längd i liggande | (bakåtkompatibel – ej för nyanslutning) |

 
*  

| | |
| :--- | :--- |
| 27113001 | Kroppsvikt |

 
*  

| | |
| :--- | :--- |
| 363812007 | Huvudomfång |

 
*  

| | |
| :--- | :--- |
| 412726003 | Graviditetslängd vid födelse |

 
 

 **References** 

* [SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)](StructureDefinition-inera-ehds-observation-growth.md)

### Logisk definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "growth-observation-type-vs",
  "url" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/growth-observation-type-vs",
  "version" : "0.1.0",
  "name" : "GrowthObservationTypeVS",
  "title" : "Tillväxtkurva – observationstyper (IoÖ Tillväxtkurva v3)",
  "status" : "draft",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "SNOMED CT-koder för tillväxtmätningar enligt Interaktionsöverenskommelse\nTillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15).\n\nAlla koder från kodsystemet SNOMED CT SE (OID 1.2.752.116.2.1.1).\n\nKoder:\n- 1153637007 | Kroppslängd | (primärkod för längd)\n- 50373000   | Mått på kroppslängd | (alternativkod för längd)\n- 248334005  | Längd i liggande | (bakåtkompatibel – ej för nyanslutning)\n- 27113001   | Kroppsvikt |\n- 363812007  | Huvudomfång |\n- 412726003  | Graviditetslängd vid födelse |",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "1153637007",
        "display" : "Kroppslängd"
      },
      {
        "code" : "50373000",
        "display" : "Mått på kroppslängd"
      },
      {
        "code" : "248334005",
        "display" : "Längd i liggande (bakåtkompatibel – ej för nyanslutning)"
      },
      {
        "code" : "27113001",
        "display" : "Kroppsvikt"
      },
      {
        "code" : "363812007",
        "display" : "Huvudomfång"
      },
      {
        "code" : "412726003",
        "display" : "Graviditetslängd vid födelse"
      }]
    }]
  }
}

```
