---
tags: [architecture, design]
---
[How I design software. | by Hussein Nasser ](https://medium.com/@hnasr/how-i-design-software-6a08f10d5c99)

# Designing and Architecting Software

**1. Preparation & Deep Work**
- Block 2-3 hours of uninterrupted time.
- Architecture is sociotechnical. Make thinking mutually visible using collaborative canvases (Miro/FigJam) or a structured markdown vault.

**2. Discovery (The "Why" & "Who")**
- **[[Impact Mapping]]:** Map business goals explicitly: `Impact (KPIs) ← Actors ← Ways to help ← Tasks`.
- **[[Subdomain Distillation]]:** Identify the "min-ship" (MVP). Separate **Core** (build) from **Supporting/Generic** (buy/outsource).
- **[[Three Amigos]]:** Define acceptance criteria (Gherkin) before assuming requirements.

**3. Workflow Modeling**
- **[[Event Storming]]:** Map the system chronologically, not with paragraphs.
  - 🟧 **Domain Events:** Past-tense facts (`OrderPlaced`).
  - 🟦 **Commands:** Actions triggering events.
  - 🟨 **Actors:** Users executing commands.
  - 🟪 **Policies:** Automated reactive rules.
  - 🟩 **Read Models:** Views required to make decisions.

**4. Component Identification & Decomposition**
- **[[Volatility-Based Decomposition]]:** Group components by what changes together, not by technical layers.
- **[[Bounded Contexts]]:** Group related behaviors with strict API/Event contracts.
- **[[Managers, Engines, Resource Access]]:** Separate orchestration (Managers), pure business rules (Engines), and I/O (Resource Access).

**5. Detailed Diagramming**
- **[[C4 Model]]:** Structure levels: System Context → Containers → Components → Code. No ad-hoc blocks and squares.
- **[[Architecture-as-Code]]:** Define components in a Single Source of Truth (e.g., Structurizr DSL). Auto-generate diagrams to prevent drift.

**6. Review & Governance**
- **[[Architecture Decision Records]] (ADRs):** Document *why* decisions were made, linked to the component.
- **[[Continuous Architecture Governance]]:** Submit architectural changes via PRs for semantic review.
- **[[Fitness Functions]]:** Use tools like ArchUnit to enforce boundaries in CI/CD automatically.