---
tags:
  - architecture
  - tooling
  - structurizr
  - ear
  - ai-agents
  - workflows
---
# EAR Framework: Shorthand Guide

**Goal:** Architecture as compiled, testable code. No drift. No Big Bang rewrites.

## 1. The 3-File Core (Per Domain)
*Procedural configs (YAML) banned. Math > Docs.*

| File | Role | Purpose & Contents |
|------|------|--------------------|
| **`domain.fs`** | **The Truth** | F# Discriminated Unions (Events, Workflows). `State + Command = [Events] + New State`. |
| **`context.dsl`** | **The Structure** | Pure Structurizr fragment. NO `workspace {}` wrappers. |
| **`README.md`** | **The Business** | Actor catalog, invariants, Use Cases -> Commands, AC traceability (Business projection). |

*Rule:* Must have linked Gherkin `.feature` in `/specs` with Arch IDs (e.g., `@BC-PAYMENT-001`).

### Terminology: What is a DU (Discriminated Union)?
In F#, a **Discriminated Union (DU)** is a data structure used to model mutually exclusive states, events, or commands. It is the secret weapon for Domain-Driven Design (DDD) because it enforces *mathematical completeness*.

Instead of using easily misspelled strings (`"Pending"`) or ambiguous integers (`1`), a DU strictly defines the *only* possible states:
```fsharp
type SubmissionStatus = 
    | Pending 
    | Approved 
    | Rejected
```
**Why it matters (Exhaustive Pattern Matching):**
When writing logic to handle a state like `SubmissionStatus`, the F# compiler forces the developer (or AI agent) to handle *every single state*. If a new state is added to the DU later (e.g., `| NeedsReview`), the compiler will instantly break and flag every place in the codebase that forgot to handle it. This prevents "ghost states," makes illegal states unrepresentable, and ensures your domain model is a strict, mathematical state machine.

### Code Templates (The MERA Pattern)
This is the standard shorthand structure that AI agents should use to generate the 3-File Core.

**`domain.fs`**
```fsharp
// ABOUTME: Behavioral state machine for [Context Name]
type Command = 
    | Submit of Payload
    | Cancel of Reason

type Event = 
    | Submitted of Payload
    | Cancelled of Reason

type State = 
    | Initial
    | Processing of Payload
    | Completed
```

**`context.dsl`**
```dsl
// ABOUTME: Structural topology mapping to MERA pattern
// MERA = Manager, Engine, Resource, Accessor
container "Manager" { 
    description "Orchestrates workflows and handles external triggers"
    technology "C# / .NET API"
}
container "Engine" { 
    description "Pure domain logic and state machine (domain.fs)"
    technology "F#"
}
container "Resource" {
    description "State persistence"
    technology "SQL Database"
}
container "Accessor" {
    description "Integration with external systems"
    technology "Anti-Corruption Layer"
}
```

**`specs/[context].feature`**
```gherkin
# ABOUTME: Executable specifications for validation
Feature: [Context Name] State Machine

  Scenario: [Successful Outcome]
    Given [Initial State]
    When [Command]
    Then [Events Raised]
    And [New State Reached]
```

### System Assembly & Validation
*(How the domain core wires into the global topology)*

| File / Command | Purpose |
|----------------|---------|
| **`dotnet fsi --exec domain.fs`** | Lightweight Step 1: Validate F# syntax and type-check domain logic without needing a `.fsproj`. |
| **`enterprise-landscape.dsl`** | Wired landscape (systems & people). Pure fragment. |
| **`workspace.dsl`** | Container view & master aggregator (The ONLY workspace). |
| **`structurizr validate`** | Final gate check to validate the compiled architecture. |

## 2. Topology (Master Aggregator)
* **`workspace.dsl`** -> **The ONLY workspace.** Owns `workspace`, `model`, `views` blocks.
* **`enterprise-landscape.dsl`** -> Pure fragment. `person` & `softwareSystem` only.
* **Include Flow:** 
  1. `workspace.dsl` -> `!include enterprise-landscape.dsl`
  2. Inside landscape systems -> `!include domains/.../context.dsl`
  3. Cross-context links (e.g., `api -> db`) defined in `workspace.dsl` model block.
* **The Gate:** ALWAYS run `structurizr validate -workspace workspace.dsl` after changes.

## 3. Agent Workflows (Prompts)

### 🧪 Mode 1: TDD Gap Analysis
> "Compare `[Domain]` config vs Gherkin `/specs`. Find missing states/paths. Write *failing* Gherkin scenarios for undocumented states."

### 🏗️ Mode 2: Structural Refactor
> "Refactor `[Domain]` to 3-File Core: 1) YAML -> F# `domain.fs` 2) Strip wrappers from `context.dsl` (pure fragment) 3) Gen `README.md` mapping F# to Gherkin 4) Delete legacy config."

### 🕵️‍♂️ Mode 3: Historian Mode (Reality vs Blueprint)
> "Historian Mode for `[Domain]`: Compare `domain.fs` & specs vs actual `/src` code. Flag drift (bypassed aggregates, sync cross-context calls, dead tables). Gen strict Markdown report + required ADRs/commits."

## 4. ADR Rigor
* **Format:** Context -> Y-Statement -> Decision -> Consequences -> Enforcement.
* **Y-Statement Syntax:** *"In context of [A], facing [B], decided for [C], neglected [D], to achieve [E], accepting [F]."*

## 5. Detailed Deep-Dives
For the specific compiler quirks and agent prompts required to execute this framework, see:
* [[Structurizr-Multi-File-Patterns]] - How to solve namespace collisions, linear parser issues, and scope locks.
* [[Principal-Architect-Agent-Prompt]] - The exact prompt workflows (Historian, DevOps, Handoff) for AI agents.
## 6. Managing Time (The Strangler Pattern)
We do not use "future-state" architecture branches. The `main` branch holds both the map of the swamp and the blueprint for the paved road.

* **`domain.fs`** = The Vision (Mathematically perfect Target State).
* **`context.dsl`** = The Reality (Legacy + ACLs + Target).

**Mandatory Structurizr Tags:**
* `Sunset`: Legacy components marked for death (e.g., God Table).
* `Target`: New, pristine DDD components.
* `Strangler`: Anti-Corruption Layers (ACLs) and sync agents that keep the Target and Sunset components synchronized during the transition phase.

Views are generated dynamically by filtering these tags. If you are coding an ACL, tag it `Strangler`.