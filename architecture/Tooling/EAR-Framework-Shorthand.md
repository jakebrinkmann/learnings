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
* **`domain.fs`** -> **The Truth.** F# Discriminated Unions. `State + Command = [Events] + New State`.
* **`context.dsl`** -> **The Structure.** Pure Structurizr fragment. NO `workspace {}` wrappers.
* **`README.md`** -> **The Business.** Actor catalog, invariants, Use Cases -> Commands, AC traceability.
* *Rule:* Must have linked Gherkin `.feature` in `/specs` with Arch IDs (e.g., `@BC-PAYMENT-001`).

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