# Mappings

This page documents how elements in the logical models defined in this IG map to elements in the corresponding FHIR profiles.

---

### Purpose

*Explain the role of these mappings. Example: "The mappings below trace each element in the logical models to the FHIR profile element that carries that information. This makes it possible to verify coverage and to guide implementers who need to understand the relationship between clinical requirements and their technical representation."*

---

### Mapping tables

*Provide one mapping table per logical model. Each row should show a logical model element, its cardinality, and the corresponding FHIR profile path.*

#### [Logical model name] → [Profile name]

| Logical model element | Card. | FHIR profile element | Notes |
|-----------------------|-------|----------------------|-------|
| *[Element name]* | *1..1* | *[Profile.element](StructureDefinition-[Profile].html)* | *Any notes on the mapping, e.g. value set constraints or transformation rules.* |
| *[Element name]* | *0..\** | *[Profile.element](StructureDefinition-[Profile].html)* | |

---

### Unmapped elements

*If any logical model elements are not covered by a profile element, list them here and explain why (out of scope, deferred to a future version, covered by a separate profile, etc.).*

| Logical model element | Reason not mapped |
|-----------------------|-------------------|
| *[Element name]* | *Explanation.* |

---

> **Guidance for authors:** Keep mappings up to date as profiles evolve. Mappings can also be expressed formally using FHIR `StructureMap` resources if machine-processable transformation is needed. Place StructureMaps in `input/fsh/maps/`.
