---
tags:
  - architecture
  - ddd
  - tooling
  - architecture-as-code
  - living-documentation
  - c4-model
---
# Architecture as Code (Modeling as Code)

To achieve a workflow where architectural artifacts are not thrown away, can be "red-lined" (version-controlled and diffed in Git/PRs), and allow for automated impact analysis, engineering teams must shift from **Diagram-as-Code** to **Model-as-Code**.

* **Diagram-as-Code (e.g., raw PlantUML, Mermaid, D2):** Just draws pictures. Results in loose files that require procedural brute force to maintain. No programmatic impact analysis is possible.
* **Model-as-Code (e.g., Structurizr, Archi):** Separates the underlying graph database model from the views. You define components once, and multiple diagrams/views are generated from that single source of truth.

## 🛠️ The Ideal "Stitched Together" Stack

Here is a breakdown of the best tools to stitch the entire Domain-Driven Design (DDD) lifecycle together, categorized by their role in the SDLC:

### 1. Strategic DDD: Context Mapper
If you want a tool built *specifically* for DDD, **Context Mapper** is the gold standard.
* **How it works:** You write your Ubiquitous Language, Bounded Contexts, and Context Maps in a text-based DSL (Domain-Specific Language).
* **No Throwaway Artifacts:** The DSL generates your PlantUML diagrams, C4 models, and even Microservice code skeletons (via JHipster or Spring Boot generators).
* **Impact Analysis:** Because it is a text file, you can "red-line" it in a Pull Request. If a team proposes changing a relationship from "Customer/Supplier" to "Shared Kernel," it is a visible code diff.

### 2. System Architecture & Impact Analysis: Structurizr (C4 Model)
**Structurizr** (which implements the C4 model) is the gold standard for defining a single source of truth for your systems.
* **Model vs. View:** You define the architecture in the Structurizr DSL (e.g., `softwareSystem "Logistics" { uses "Manufacturing" }`). If you rename a service or change a dependency, *every single diagram* that features that component updates automatically. 
* **ADRs and NFRs:** Structurizr supports linking Architecture Decision Records (ADRs) directly to the elements they affect. You can assign properties and tags to components to define NFRs (e.g., throughput targets, compliance scopes).
* **Fitness Functions in CI/CD:** You can write scripts that parse the Structurizr DSL and query your live service registry (AWS/K8s) to validate that the documented architecture matches the running code.

### 3. Business Goals to Tech Mapping: Archi (ArchiMate)
If your primary goal is end-to-end traceability from high-level business drivers to technical implementation, **Archi** (using the ArchiMate language) is uniquely equipped for this.
* **Motivation & Strategy Layers:** Unlike C4 or UML, ArchiMate has built-in elements for modeling "Motivation" (Goals, Drivers, Requirements) and "Strategy". You can map a specific Business Goal down to the Application Component that satisfies it.
* **Impact Analysis:** Archi uses **Derived Relationships** to automatically calculate indirect relationships across layers. Its Visualiser allows you to click any element and instantly see all upstream and downstream impacts.
* **Red-Lining via coArchi:** By using the **coArchi plugin**, you can store the entire ArchiMate model in a Git repository broken down into granular XML files, allowing your team to use standard Pull Request workflows to review architectural changes.

### 4. Visual Model-as-Code Alternatives (IcePanel, Ilograph, Keadex)
If DSLs are too restrictive for your team, hybrid tools bridge the gap between structured modeling and visual UI:
* **IcePanel:** Built strictly around the C4 model, allowing interactive zooming and overlaying "Flows" (dynamic interaction sequences) over static models.
* **Ilograph:** Uses a YAML-based Resource Tree, allowing you to view the exact same resources through different "Perspectives" (Deployment vs. Security).
* **Keadex Mina:** A serverless, offline IDE specifically for coding C4 diagrams using PlantUML syntax. It keeps your diagrams as code (`.puml`) but stores the positional metadata in separate `.json` files, ensuring your project structure remains PR-friendly.

### 5. Architectural Fitness Functions: ArchUnit / NetArchTest
To prevent the "throwaway artifact" problem, you must enforce the architecture in your CI/CD pipeline.
* **How it works:** You write unit tests for your architecture (e.g., `classes().that().resideInAPackage("..domain..").should().onlyDependOnClassesThat().resideInAnyPackage("..domain..")`).
* **The Value:** If a developer accidentally makes the Core Domain depend on the Database layer, the build breaks. The architecture and code stay perfectly synchronized.

### 6. Behavioral Testing & Acceptance Criteria: Cucumber / SpecFlow (Gherkin)
To stitch business requirements to code, Gherkin (`Given / When / Then`) should be treated as **Living Documentation**.
* **How it works:** Store the `.feature` files directly in the Git repository alongside the Bounded Context they describe.
* **Stitching to Architecture via Metadata Tags:** To link Gherkin tests directly to your architecture model, tag your architecture components in Structurizr/Archi with a unique ID (e.g., `Component: Payment-Gateway`). In your code repository, tag your Gherkin feature files with the same ID (`@Architecture-Payment-Gateway`). You can then run a CI script that cross-references the architecture model against your test suite, ensuring every core component has passing acceptance criteria.

---

## 🌟 The Enterprise Architecture Repository (EAR) Workflow

If you build an Enterprise Architecture Repository mapped to your Git workflows today, it looks like this:

1. **Define the Foundation:** Store your Structurizr `.dsl` or Archi model in a centralized Git repository. Define Business Goals and NFRs as top-level elements.
2. **Review via Pull Requests ("Red-Lining"):** When an architect/developer proposes a change, they branch the model and update the DSL. Reviewers can easily diff the text files to see exactly what relationships or components are being added.
3. **Automate Impact and Fitness:** In your CI/CD pipeline, run validations. Write a script that ensures every `Container` tagged as `Critical` has a linked NFR and an associated ADR.
4. **Link to Gherkin Tests:** Run cross-reference checks using metadata tags to ensure the behaviors defined in the code perfectly match the components defined in the architecture.