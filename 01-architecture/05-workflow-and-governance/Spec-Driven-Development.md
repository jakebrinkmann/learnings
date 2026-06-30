# Spec-Driven Development and EARS Reference

## 1. EARS Reference Handbook (State of the Art)

The **Easy Approach to Requirements Syntax (EARS)** is a methodology designed to gently constrain natural language when writing system or software requirements. Developed in 2009 by Alistair Mavin and his team at Rolls-Royce, EARS reduces ambiguity, wordiness, omission, and duplication in requirements by applying a lightweight, standardized ruleset to sentence structures.

### The 5 Core EARS Patterns

By forcing authors to use specific templates, EARS ensures that the trigger, the state, the system, and the system's response are always explicitly clear.

1. **Ubiquitous (Always Occurring)**
   Used for fundamental requirements that are always active with no specific triggers or preconditions.
   * **Syntax:** `The <system> shall <system response>`
   * **Example:** *The system shall encrypt all data at rest.*

2. **Event-Driven**
   Used when a requirement is triggered by a specific event or action.
   * **Syntax:** `When <trigger>, the <system> shall <system response>`
   * **Example:** *When the disconnect button is pressed, the software shall break the network connection.*

3. **State-Driven**
   Used when a requirement is only active while the system is in a specific operating state.
   * **Syntax:** `While <state>, the <system> shall <system response>`
   * **Example:** *While in Do Not Disturb mode, the software shall silence incoming calls.*

4. **Unwanted Behaviors**
   Used to define how the system should handle errors, faults, failures, or unexpected inputs.
   * **Syntax:** `If <trigger/condition>, then the <system> shall <system response>`
   * **Example:** *If the password is entered incorrectly, then the app shall display an error message.*

5. **Optional Features**
   Used for requirements that only apply if a specific feature or hardware is present.
   * **Syntax:** `Where <feature is enabled/present>, the <system> shall <system response>`
   * **Example:** *Where dark mode is enabled, the system shall use the dark color scheme.*

**Complex Combinations:**
You can combine these keywords logically, usually building from the broadest condition to the specific trigger: `While <state>, When <trigger>, the <system> shall <system response>`.

---

## 2. Proposed Updates to "Living Specifications" Using EARS

Currently, the vault defines "Living Specifications" as Gherkin (`.feature`) files in the `/specs/` directory that test F# workflows (as noted in `Gemini-Copilot Conversation.md`). 

To elevate these specifications and make them more robust upstream—before they even become Gherkin code—we can integrate EARS into our Living Specifications workflow:

* **EARS as the Pre-Gherkin Source of Truth:** Before writing Gherkin Given/When/Then scenarios, Product and Architecture teams should define Acceptance Criteria using EARS. This bridges the gap between raw business requirements and executable Gherkin tests.
* **Update to `README.md` Acceptance Criteria:** The Acceptance Criteria documented in the Domain `README.md` files (which map to Architecture IDs like `@BC-ATF-001`) should strictly follow EARS syntax. 
* **Direct Mapping to Property-Based Testing:** Because EARS defines universal rules (e.g., *While in state X, the system shall Y*), these statements map perfectly to Property-Based Testing (PBT) in F#, validating entire input spaces rather than just single Gherkin examples.
* **Automated Linting:** Integrate requirements management tools or custom scripts into the CI/CD pipeline to parse the `README.md` and validate that all Acceptance Criteria conform to EARS syntax before the Living Specifications are considered "ready for development."

---

## 3. Catalog of Spec-Driven Development Approaches (e.g., Kiro)

**Spec-Driven Development (SDD)** is an emerging software engineering methodology—heavily championed by AWS and modern AI tooling—where structured natural language specifications become the single source of truth for both human developers and AI coding agents. 

Rather than "vibe coding" (rapidly prompting AI to generate code without an architectural plan), SDD forces you to iterate on the *specification*, letting the AI accelerate the implementation.

### Kiro: The AI-Powered IDE for SDD
**Kiro** is an advanced AI IDE and CLI tool built specifically for Spec-Driven Development. Key features include:

* **Spec Mode:** A dedicated interface for drafting, refining, and managing living specifications.
* **Automated Requirements Gathering:** Kiro takes basic product briefs and expands them into formal user stories and EARS-based Acceptance Criteria.
* **Steering Documents:** Developers provide high-level guidelines (tech stack, architectural principles, coding standards) that constrain the AI.
* **Agentic Code Generation:** Specialized agents (frontend, backend, infrastructure) generate code strictly guided by the current spec and steering docs.
* **Model Context Protocol (MCP) Integration:** Kiro uses MCP servers to give its agents lean, targeted context tailored to the current epic, avoiding token bloat and AI hallucinations.
* **Property-Based Testing (PBT):** Instead of standard unit tests, Kiro translates natural language specs into executable properties to validate universal rules.

### OpenSpec (Fission-AI)
[OpenSpec](https://github.com/Fission-AI/OpenSpec) is a framework that enforces a structural separation between the current system state and active architectural proposals. It is highly effective for managing complex state changes and feature additions (e.g., adding two-factor authentication to an existing Express.js application).

* **Directory Separation:** Utilizes an `openspec/` directory that cleanly separates `specs/` (the current state and source of truth) from `changes/` (active proposals). The `changes/` directory typically contains `proposal.md`, `tasks.md`, and delta specs.
* **Explicit Delta Articulation:** During the proposal phase, OpenSpec forces developers and architects to clearly articulate exactly which existing flows will be **MODIFIED** and which new flows will be **ADDED**.
* **Strict Validation:** Features robust validation via the `openspec validate --strict` command. This performs static analysis on the proposal against the current specifications to identify gaps, such as catching missing `GIVEN/WHEN/THEN` scenarios that would otherwise lead to gaps in acceptance test coverage.

### Other SDD Approaches and Tools
1. **Behavior-Driven Development (BDD) with Gherkin/Cucumber:** The traditional approach to SDD. Business rules are written in `Given/When/Then` format and bound to executable test code. (Our current `/specs/*.feature` approach).
2. **Design-by-Contract (DbC):** Defining formal, verifiable preconditions, postconditions, and invariants for software components.
3. **Model-Based Systems Engineering (MBSE):** Using formalized modeling languages (like SysML) to specify system requirements, design, analysis, and verification.
4. **Requirements Management Tools with EARS Integration:** Tools like **Jama Connect**, **QVscribe**, and **SES Engineering Studio** have built-in EARS templates that auto-evaluate requirement syntax as you type, ensuring specs are machine-readable before development begins.

## 4. The SDD Kick-off Workflow: From Intent to Wireframe

A common anti-pattern in modern development and AI-assisted engineering is **starting a project with a UI wireframe**. Doing so shifts the source of truth to visual designs rather than business logic, risking a slide into "vibe coding" and a loss of translation between stakeholder needs and architectural implementation. 

In true Spec-Driven Development (and traditional BDD), behavioral scenarios must be phrased declaratively in business language, with **no reference to the UI elements** through which the interactions take place. 

To bridge the gap between rigorous specification and the need for early business buy-in, the kick-off workflow should treat wireframes merely as a *visual projection* of the spec, not the spec itself.

### The 4-Step Kick-off Plan

1. **Step 1: Define "Jobs to be Done" & Core Intent**
   Before sketching any UI, define the target audience, the core problems the system solves, system constraints, and explicit non-goals. This establishes the foundation (e.g., the OpenSpec proposal).
2. **Step 2: Draft EARS Acceptance Criteria**
   Translate the business intent into the Easy Approach to Requirements Syntax (EARS). By defining the triggers, states, and system responses independent of the UI (e.g., *"When the user submits a registration, the system shall..."*), you establish a machine-readable, UI-agnostic truth.
3. **Step 3: Wireframe as a Constraint Map**
   Generate the UI wireframe by mapping it strictly to the spec. Every button, form, and view must trace directly back to an EARS statement from Step 2. If a wireframe element does not have a corresponding behavioral spec, it is removed.
4. **Step 4: Business Review & Alignment**
   Present the wireframes to stakeholders *alongside* the SDD document. This secures buy-in on the behavior and the visuals simultaneously, ensuring that human developers and AI agents have a fully structured, validated spec to execute against during implementation.