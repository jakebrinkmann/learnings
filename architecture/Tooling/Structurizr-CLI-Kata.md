---
tags:
  - architecture
  - tooling
  - structurizr
  - c4-model
  - architecture-as-code
  - kata
  - fsharp
---
# Structurizr CLI Kata: Order-Taking System

This guide provides a practical, step-by-step tutorial for implementing an **Enterprise Architecture Repository (EAR)** using the local Structurizr CLI. It maps the theoretical principles of [[Architecture-as-Code]] (separating models from views, integrating ADRs, and using Git for "red-lining") into a concrete practice using an Order-Taking domain built in F#.

## Step 1: Initialize the EAR Directory Structure
To avoid "loose files" and procedural brute force, organize the repository structurally so the model and views are completely separated.
```bash
mkdir -p order-taking-kata/{models/domains/order-taking,views/layouts,styles,adrs,docs,scripts}
cd order-taking-kata
```

## Step 2: Create the Semantic Core (The Models)
In Model-as-Code, you define your elements centrally so they can be reused across multiple perspectives.

### 1. Shared Actors
Create a file at `models/actors.dsl` for cross-domain personas:
```dsl
// File: models/actors.dsl
customer = person "Customer" "A user who places and tracks orders."
```

### 2. The Bounded Context
Create `models/domains/order-taking/context.dsl` to define the System, Containers, and their structural boundaries:
```dsl
// File: models/domains/order-taking/context.dsl
orderSystem = softwareSystem "Order-Taking System" "Processes, validates, and manages orders." {
    
    orderApi = container "Order API" "Handles incoming commands." "F# / Giraffe" {
        tags "Microservice" "Core Domain"
    }
    
    orderDb = container "Order Database" "Stores aggregate state and events." "PostgreSQL" {
        tags "Database"
    }

    // Container Relationships
    orderApi -> orderDb "Reads from and writes to" "SQL/TCP"
}

// Context Relationships
customer -> orderSystem "Submits orders to"
customer -> orderApi "Makes API calls to" "JSON/HTTPS"
```

## Step 3: Define the Visual Projections (The Views)
Views define how the model is projected for specific audiences. Create `views/context-views.dsl`:
```dsl
// File: views/context-views.dsl
views {
    systemContext orderSystem "OrderSystemContext" {
        description "The high-level system context for the Order-Taking capability."
        include *
        autoLayout lr
    }

    container orderSystem "OrderSystemContainers" {
        description "The containers within the Order-Taking System."
        include *
        autoLayout tb
    }

    theme default
}
```

## Step 4: Stitch It Together in the Master Workspace
The master file acts as an aggregator, keeping the top-level file clean and navigable using the `!include` macro.
Create `workspace.dsl` in the root of your repository:
```dsl
// File: workspace.dsl
workspace "Enterprise Architecture" "Order-Taking Kata Workspace" {
    
    // Link Architecture Decision Records (ADRs)
    !adrs adrs

    model {
        !include models/actors.dsl
        !include models/domains/order-taking/context.dsl
    }

    !include views/context-views.dsl
}
```

## Step 5: Add an Architecture Decision Record (ADR)
Structurizr natively integrates ADRs to document the "why" behind your technical decisions.
Create a file at `adrs/0001-use-fsharp-for-core.md`:
```markdown
# 1. Use F# for the Order API Core Domain

Date: 2026-03-10
Status: Accepted

## Context
We need a way to strictly enforce tactical DDD (Value Objects, Aggregates). 

## Decision
We will build the `orderApi` container using F# to leverage algebraic data types.
```

## Step 6: Use the CLI for Validation and Export
With the workspace built, use the `structurizr` CLI (installed via Homebrew or Docker) to execute your architecture.

1. **Validate the Model (CI/CD Quality Gate):**
   ```bash
   structurizr validate -w workspace.dsl
   ```
   This ensures syntax is correct and relationships are sound before merging.

2. **Export the Projections:**
   ```bash
   structurizr export -w workspace.dsl -f plantuml -o views/
   ```
   *Note:* Because you separated the model from the views, Structurizr implies higher-level relationships automatically (e.g., because `customer -> orderApi`, it knows `customer -> orderSystem`).

3. **Launch the Local Workspace:**
   ```bash
   structurizr local -w workspace.dsl
   # or for a blank notepad
   structurizr playground
   ```
   This spins up the interactive UI directly on your machine. [http://localhost:8080/workspace/1](http://localhost:8080/workspace/1) If you use the Lite version locally, changes to your text files will automatically refresh in the browser.

## The "Red-Lining" Workflow in Action
To execute the EAR Workflow:
1. Create a new branch: `git checkout -b feature/add-payment-gateway`
2. Add the Payment Gateway to `context.dsl` and link it to the `orderApi`.
3. Add an ADR to `/adrs`.
4. Open a Pull Request. Reviewers will only look at the **text diffs** in `context.dsl` to see exactly how the boundaries are changing (the "red-line"), rather than trying to decipher a messy image file.