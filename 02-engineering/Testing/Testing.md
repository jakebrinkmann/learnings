---
tags: [qa, testing, moc]
---
# Testing & Quality Assurance (QA)

Quality Assurance is not a phase at the end of the SDLC; it is a continuous practice integrated into every step of engineering. This section aggregates our approach to testing, test automation, and the quality frameworks that govern our deployment pipelines.

> **Core Principle:** Agile without proper test automation is dead.

## Enterprise Quality Framework

Our primary structural model for testing is the **9-Layer Test Pyramid**, which ensures fast feedback at every level and strict traceability from business requirements down to deployed code.

* **[[Enterprise-Test-Pyramid]]** - The comprehensive 9-layer framework, mapping test types (Unit, Integration, E2E, Smoke, Regression, Security, Performance) to Work Items and Pipeline Gates.

## Testing Practices & Methodologies

* **[[TestDouble]]** - Strategies for isolating tests (Mocks, Stubs, Spies, Fakes, Dummies).
* **[[Fuzzing]]** - Automated generation of invalid, unexpected, or random data as inputs to a computer program.
* **[[Test-Keywords]]** - Vocabulary and concepts related to test engineering.
* **[[Sub-Test-Execution]]** - Guidelines for executing specific sub-tests.
* **[[Test-Cases-Template]]** - Standardized templates for writing test cases.

## Key Concepts & Heuristics

* **Ownership:** Unit tests are owned by developers. Functional tests are co-owned with stakeholders (often using Gherkin/BDD). End-to-end and performance testing may involve specialized QA engineers.
* **Shift-Left Testing:** Test design happens concurrently with system design. 
  * Requirements $\rightarrow$ Analysis
  * Design $\rightarrow$ Checking
  * Implementation $\rightarrow$ Unit Testing
  * Integration $\rightarrow$ System Testing
  * Maintenance $\rightarrow$ Regression Testing
* **Estimations:** T-shirt sizing for stories *must* include dev and testing effort.
* **Parallel Independent Testing:** Leverage parallel pipelines and independent test environments to ensure speed without sacrificing coverage.

---
**Related Topics:**
* [[Requirements Engineering]] - How we capture the Gherkin Acceptance Criteria that drive our tests.
* [[SDLC-Model]] - How testing fits into the broader Software Development Lifecycle.
