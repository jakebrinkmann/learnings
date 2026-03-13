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