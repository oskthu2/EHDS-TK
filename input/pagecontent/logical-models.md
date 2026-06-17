# Logical Models

This page describes the logical information models that underpin the profiles defined in this Implementation Guide. Logical models capture the information requirements of the domain independently of any technical representation.

---

### Purpose of logical models

*Explain why logical models are included in this IG. Example: "The logical models below represent the information requirements agreed with clinical and domain experts. They serve as the authoritative definition of what data must be exchanged and form the basis for the FHIR profiles defined in this IG."*

---

### Models

*List each logical model defined in this IG. For each model, provide a short description and link to the generated StructureDefinition page.*

| Logical model | Description |
|---------------|-------------|
| *[[ModelName]](StructureDefinition-[ModelName].html)* | *Describe what information this model captures and in which context it is used.* |

---

### Model descriptions

*For each logical model, describe its key elements, cardinalities, and any important constraints or business rules that are not self-evident from the element names.*

#### [Model name]

*Describe the model. List the most important elements and explain any design decisions, for example why certain elements are mandatory or why particular data types were chosen.*

---

> **Guidance for authors:** Define logical models as FHIR `StructureDefinition` resources with `kind = logical` in FSH. Place them in `input/fsh/logicalmodels/`. Logical models should reflect agreed clinical or domain requirements and be reviewed by subject matter experts before the corresponding FHIR profiles are created.
