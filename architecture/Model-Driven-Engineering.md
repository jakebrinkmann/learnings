# Model-Driven Engineering (MDE)

Treating models and their transformations as first-class citizens to achieve bidirectional traceability from natural language to runtime.

## Core Concepts
* **Model ($M$):** Abstraction of the system ($M \simeq S$).
* **Meta-model ($MM$):** Grammar/rules the model conforms to ($M \models MM$).
* **Transformation:** Automated mapping between models.

## MDE Toolchains (AMMA & ATL)
* **AMMA (ATLAS Model Management Architecture):** Platform for managing models.
* **ATL (ATLAS Transformation Language):** Used to map concepts between different notations.
* **Use Case:** Automatically generating formal specifications (e.g., TLA+) from semi-formal architectural models (e.g., SysML).

## Bidirectional Traceability (Requirements as Code)
* **Tools:** **StrictDoc**, **Doorstop**.
* **Mechanism:** Parse requirement templates inlined in source code, merging them with sidecar metadata.
* **Output:** Generates a Requirements Traceability Matrix (RTM) linking natural language requirements $\rightarrow$ code blocks $\rightarrow$ tests.
* **Context:** Mandatory in safety-critical domains (automotive, aerospace); scaling to enterprise software.
