# SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)**

## Resource Profile: SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-imaging-study | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSImagingStudy |

 
Profil för bilddiagnostiska undersökningar mappat från RIVTA-tjänstekontraktet GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0). Täcker NPÖ 1.0 och 1177 Journal 1.0. 

**Användningar:**

* Referera till denna Profil: [SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)](StructureDefinition-inera-ehds-diagnostic-report-imaging.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-imaging-study)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-imaging-study.csv), [Excel](StructureDefinition-inera-ehds-imaging-study.xlsx), [Schematron](StructureDefinition-inera-ehds-imaging-study.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-imaging-study",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-imaging-study",
  "version" : "0.1.0",
  "name" : "IneraEHDSImagingStudy",
  "title" : "SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)",
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
  "description" : "Profil för bilddiagnostiska undersökningar mappat från RIVTA-tjänstekontraktet GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0). Täcker NPÖ 1.0 och 1177 Journal 1.0.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "dicom",
    "uri" : "http://nema.org/dicom",
    "name" : "DICOM Tag Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ImagingStudy",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/ImagingStudy-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ImagingStudy",
      "path" : "ImagingStudy"
    },
    {
      "id" : "ImagingStudy.meta.source",
      "path" : "ImagingStudy.meta.source",
      "short" : "Källsystem HSA-id (imagingOutcomeHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "ImagingStudy.status",
      "path" : "ImagingStudy.status",
      "short" : "Undersökningsstatus – härledd (inget direkt statusfält i TKBn)",
      "mustSupport" : true
    },
    {
      "id" : "ImagingStudy.modality",
      "path" : "ImagingStudy.modality",
      "short" : "Modalitet (imagingOutcomeBody.imageRecording.modalityData.typeOfModality)",
      "mustSupport" : true
    },
    {
      "id" : "ImagingStudy.subject",
      "path" : "ImagingStudy.subject",
      "short" : "Patient (imagingOutcomeHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "ImagingStudy.started",
      "path" : "ImagingStudy.started",
      "short" : "Undersökningstidpunkt (imagingOutcomeBody.imageRecording.examinationTimePeriod.start)"
    },
    {
      "id" : "ImagingStudy.referrer",
      "path" : "ImagingStudy.referrer",
      "short" : "Remitterande läkare (imagingOutcomeBody.referral.accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ImagingStudy.interpreter",
      "path" : "ImagingStudy.interpreter",
      "short" : "Tolkande radiolog (imagingOutcomeHeader.accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ImagingStudy.series.uid",
      "path" : "ImagingStudy.series.uid",
      "short" : "DICOM Series Instance UID (härledd/genererad; dicomSOP är SOP Instance UID på instansnivå)"
    },
    {
      "id" : "ImagingStudy.series.modality",
      "path" : "ImagingStudy.series.modality",
      "short" : "Serieens modalitet (imagingOutcomeBody.imageRecording.modalityData.typeOfModality)"
    },
    {
      "id" : "ImagingStudy.series.instance.uid",
      "path" : "ImagingStudy.series.instance.uid",
      "short" : "Instans-UID (imagingOutcomeBody.imageRecording.imageDicomData.dicomSOP)"
    }]
  }
}

```
