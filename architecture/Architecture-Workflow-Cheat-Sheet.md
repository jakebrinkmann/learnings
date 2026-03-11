---
tags:
  - architecture
  - ddd
  - tooling
  - architecture-as-code
  - living-documentation
  - cheat-sheet
  - socio-technical
---
# Principled Architecture Workflow: The Socio-Technical Model

This workflow defines our end-to-end architectural lifecycle. It is structured around the **Three Synthesis Lenses** (Domain, Volatility, Execution) to ensure our systems are structurally sound, organizationally aligned, and rigorously governed.

## Phase 1: Domain Synthesis (The "Why" & "Where")
*Focus: Business differentiation and organizational alignment.*

- **Distill the Subdomain** (See: [[Subdomain-Distillation]])
  - **Core**: Differentiating / **BUILD** in-house.
  - **Supporting**: Essential / **BUILD or BUY** (cheaply).
  - **Generic**: Standard / **BUY or OUTSOURCE** (SaaS).
- **Map the Motivation Layer** (See: [[Enterprise-Architecture-Layers]])
  - Use ArchiMate "Motivation" elements to answer *WHY* before building (Goals, Drivers, Requirements).
- **Align Organizational Topology (Conway's Law)**
  - **The Golden Rule:** Every subdomain maps to one or more Bounded Contexts. Every Bounded Context MUST map to its own autonomous repository (or strict module boundary) with runtime independence.
  - **Chain of Alignment:** Subdomains → Bounded Contexts → Team Boundaries → Deployment Units.

## Phase 2: Volatility Synthesis (The "What" & "How")
*Focus: Encapsulating change, defining boundaries, and establishing contracts.*

- **Event Storming & Ubiquitous Language** (See: [[Event-Storming-Facilitation]])
  - Conduct a collaborative "chaotic exploration" to build a shared mental model.
  - Map Actors, Commands, Events, and Role patterns early to surface hidden volatilities (e.g., vendor integrations, async flows).
- **Volatility-First Decomposition** (See: [[Modeling-and-Workflows]])
  - *Do not jump straight to C4.* Decompose based on what changes together.
  - Identify **Hot Spots** (volatilities) and separate stable business rules from unstable ones.
  - Categorize logic into explicit roles: **Manager** (workflow orchestration), **Engine** (pure business rules), and **Resource Access / RA** (I/O and integrations).
- **Enforce Bounded Context Contracts**
  - Architecture-as-code is insufficient without strict integration boundaries.
  - Define API-level contracts, Event schemas, SLA/SLO boundaries, and backward compatibility rules between contexts.

## Phase 3: Execution Synthesis (The "Build" & "Govern")
*Focus: Delivery, automated constraints, and continuous alignment.*

- **The "Three Amigos" Execution Gate**
  - A story *cannot* enter development until Business (BA), Engineering (Dev), and Quality (QA) agree on Gherkin-based acceptance criteria.
- **Model-Centric Design & Projections** (See: [[Architecture-as-Code]])
  - **Shift from Diagram to Model:** Use a Single Source of Truth (Structurizr DSL / Archi Model). Define components once; views are generated as "projections."
  - **C4 as a Projection:** Use C4 (System Context → Containers → Components → Code) to explain *what exists*, augmented by the volatility and role layers defined in Phase 2.
- **Architecture is a State Machine (EAR)**
  - Store architecture in a Git repository structure (`/adrs`, `/models`, `/views`, `/specs`).
  - **Red-Lining via PRs:** Propose architectural changes as semantic deltas. Reviewers see exact impact. (See: [[Structurizr-CLI-Kata]])
  - **Standardize ADRs:** Link Architecture Decision Records directly to components to capture the "Why" behind state transitions.
- **Automated Guardrails & Living Documentation**
  - **Fitness Functions:** Deploy tools like ArchUnit/NetArchTest in CI/CD to break the build if code violates the architectural model (e.g., bypassing boundaries).
  - **Living Documentation Portal:** Publish rendered diagrams, tech docs, and ADRs to a single pane of glass (e.g., Backstage) that stays synchronized with live code.
- **The Continuous Governance Loop**
  - Establish an Architectural Sync Cadence.
  - Formalize how dev teams submit PR proposals, track architecture debt, monitor compliance, and actively *retire* (not just add) cross-team dependencies.
