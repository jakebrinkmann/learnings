---
tags:
  - architecture
  - ddd
  - tooling
  - architecture-as-code
  - living-documentation
  - c4-model
  - governance
---
# Architecture as Code (Modeling as Code)

To achieve a workflow where architectural artifacts are not thrown away, can be "red-lined" (version-controlled and diffed in Git/PRs), and allow for automated impact analysis, engineering teams must shift from **Diagram-as-Code** to **Model-as-Code**.

* **Diagram-as-Code (e.g., raw PlantUML, Mermaid, D2):** Just draws pictures. Results in loose files that require procedural brute force to maintain. No programmatic impact analysis is possible.
* **Model-as-Code (e.g., Structurizr, Archi):** Separates the underlying graph database model from the views. You define components once, and multiple diagrams/views are generated from that single source of truth.

---

## 🏗️ Repository Organization & Git Best Practices

When storing models in Git, strict organizational guardrails are required to prevent the repository from becoming a tangled mess.

* **Standardized Directory Structure:** Split the repository logically. For example:
  * `/models` (Foundational definitions of systems, containers, and actors)
  * `/views` (View-specific logic referencing the models)
  * `/styles` (Shared themes, colors, and visual branding)
  * `/adrs` (Architecture Decision Records)
* **Do Not Commit Binaries:** Only version control the source code (e.g., DSL or `.puml` files). Use CI/CD pipelines to generate PNG/SVG diagrams upon merging rather than committing heavy binary images directly to the repository.
* **Use Semantic Versioning:** Architecture releases should be tagged with semantic versions (e.g., `v1.2.0`) to provide traceability of how the system evolves over time.

---

## 🧠 Modeling Best Practices (The "Soft" Skills)

Transitioning to Model-as-Code requires a shift in mindset. Avoid these common pitfalls:

* **Don't Model Everything:** It is tempting to try and capture every microservice, class, or database table. This leads to cluttered, unreadable diagrams and massive maintenance overhead. Focus only on the parts of the system that affect communication, design decisions, or onboarding. Code-level diagrams should be avoided unless absolutely necessary (IDEs can auto-generate them).
* **Keep Views Focused:** Just because you have a centralized model doesn't mean every element belongs in every diagram. Good architecture views should be heavily filtered for their specific audience.
* **Use Meaningful Identifiers:** Establish naming conventions centrally. Avoid cryptic aliases (e.g., using `userService` instead of `us`) to ensure the DSL remains readable to reviewers.

---

## 🛠️ The "Stitched Together" Tool Stack

Here is a breakdown of the best tools to stitch the entire Domain-Driven Design (DDD) lifecycle together, along with specific operational advice for scaling them:

### 1. Strategic DDD: Context Mapper
* **How it works:** You write your Ubiquitous Language, Bounded Contexts, and Context Maps in a text-based DSL.
* **No Throwaway Artifacts:** Generates PlantUML diagrams, C4 models, and Microservice code skeletons.
* **Impact Analysis:** Because it is a text file, you can "red-line" changes to boundaries (e.g., "Customer/Supplier" to "Shared Kernel") in a standard Pull Request.

### 2. System Architecture: Structurizr (C4 Model)
* **Model vs. View:** Define the architecture in the DSL. If you rename a service, *every single diagram* updates automatically.
* **Reusable Layouts & Local Validation:** Extract shared layout instructions into dedicated template files and `!include` them in every view so you don't have to manually arrange boxes. Encourage contributors to run **Structurizr Lite** locally to catch layout issues before submitting a PR.
* **ADRs and NFRs:** Link Architecture Decision Records directly to the elements they affect via properties and tags.
* **Practical Implementation:** See the [[Structurizr-CLI-Kata]] for a step-by-step guide on setting up this exact repository structure, writing the DSL, and running the CI/CD validations.

### 3. Business Goals to Tech Mapping: Archi (ArchiMate)
* **Motivation & Strategy Layers:** Map specific Business Goals down to the Application Components that satisfy them. Archi uses **Derived Relationships** to automatically calculate indirect impacts (e.g., tracing a server failure up to a disrupted business process).
* **Understanding the Scope:** See [[Enterprise-Architecture-Layers]] for a breakdown of why ArchiMate is used for full-stack traceability (from corporate initiatives down to physical servers), whereas C4/Structurizr is preferred for day-to-day DDD software design.
* **Red-Lining via coArchi:** The **coArchi plugin** stores the ArchiMate model in Git as granular XML files.
* **Preventing Merge Conflicts:** Concurrent edits to the same diagram in coArchi can cause severe XML merge conflicts. Assign clear ownership over specific elements and diagrams to prevent simultaneous modifications.

### 4. Visual Model-as-Code Alternatives
* **Ilograph:** Uses a YAML-based Resource Tree. Its superpower is **Contexts**—viewing the exact same resources through different organizational lenses (e.g., viewing a Lambda function in an "AWS Services" context vs. an "AWS Regions" context).
* **IcePanel:** Built around the C4 model, allowing interactive zooming and overlaying "Flows" over static models.
* **Keadex Mina:** An offline IDE for coding C4 diagrams using PlantUML syntax. Keeps diagrams as code (`.puml`) but stores positional metadata in separate `.json` files.

### 5. Architectural Fitness Functions: ArchUnit
* **How it works:** Write unit tests for your architecture (e.g., `classes().that().resideInAPackage("..domain..").should().onlyDependOnClassesThat().resideInAnyPackage("..domain..")`).
* **The Value:** If a developer accidentally makes the Core Domain depend on the Database layer, the build breaks, keeping architecture and code perfectly synchronized.

### 6. Behavioral Testing: Cucumber (Gherkin)
* **Stitching to Architecture via Metadata Tags:** Tag your architecture components in Structurizr/Archi with a unique ID (e.g., `Component: Payment-Gateway`). In your code repository, tag your Gherkin `.feature` files with the exact same ID (`@Architecture-Payment-Gateway`). A CI script can then cross-reference the two, ensuring every core component has passing acceptance criteria.

---

## 🌟 The Enterprise Architecture Repository (EAR) Workflow

A true Enterprise Architecture Repository (EAR) is not just a single tool; it requires **both halves of the equation** to function effectively at scale:

### Half 1: The Modeling Engine (The Work Space)
*(Tools: Structurizr / Archi / Context Mapper)*
This is where your architects do the actual work. You use these tools to model your DDD contexts, define non-functional requirements (NFRs), run your automated impact analysis, and write your architecture as code.
* **Define the Foundation:** Store your models in a centralized Git repository using the structured `/models`, `/views`, `/adrs` layout.
* **Architecture Review Board (ARB) via PRs:** Formalize the PR process. No one merges directly to `main`. PRs act as the formal ARB review, allowing reviewers to diff the text files and ensure models adhere to enterprise standards.
* **Automated Quality Gates:** In your CI/CD pipeline, run shell scripts that fail the build if conventions slip (e.g., failing the build if a `Critical` container lacks a linked NFR, or if a new component lacks an ADR).

### Half 2: The Catalog & Portal Layer (The Publishing Space)
*(Tools: Backstage / The 99x YAML Approach)*
Once the models are created and the diagrams are automatically generated by your CI/CD pipeline, they must be published into a developer portal where the rest of the organization can consume them.
* **The 99x YAML Approach:** Use `entities.yaml` and `org.yaml` files to assign strict team ownership to the components modeled in Half 1.
* **Living Documentation:** This layer serves the generated binary diagrams, TechDocs, and ADRs to the wider organization, ensuring that developers, product managers, and stakeholders are always looking at the single source of truth without needing to understand the underlying DSL.