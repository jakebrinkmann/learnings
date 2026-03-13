---
tags:
  - architecture
  - structurizr
  - dsl
  - c4-model
  - troubleshooting
---
# Structurizr Multi-File Patterns & Quirks

When building an Enterprise Architecture Repository (EAR) using Structurizr DSL, splitting a massive monolith into a multi-file workspace introduces several compiler quirks. Here are the required patterns to solve them.

## 1. The "Reopening Identifiers" Restriction
**The Problem:** You cannot declare a `softwareSystem` in one file (e.g., `enterprise-landscape.dsl`), and then "reopen" that identifier with a block `{}` in `workspace.dsl` to add containers to it. The Structurizr compiler will throw an `Unexpected tokens` error.
**The Fix:** You must use an **Inline Include** at the exact moment of declaration.
```dsl
// In enterprise-landscape.dsl
atfCompliance = softwareSystem "ATF Compliance" {
    !include domains/atf-compliance/context.dsl
}
```

## 2. Forward References & Cross-Context Relationships
**The Problem:** The Structurizr parser evaluates files linearly. If `domainA/context.dsl` contains a relationship like `apiA -> systemB`, but `systemB` is declared *after* `systemA` in the landscape file, the compiler will throw an `Identifier not found` error.
**The Fix:** NEVER define cross-context relationships inside a bounded context's local `context.dsl` fragment. 
1. `context.dsl` should strictly contain local containers and intra-domain relationships.
2. Lift all cross-context relationships (e.g., `eformsApi -> boundBook`) into the master `workspace.dsl` model block, which is evaluated *after* all landscape and context files are fully loaded into global scope.

## 3. Global Namespace Collisions
**The Problem:** Structurizr identifiers are globally scoped. If your landscape defines `azureKeyVault = softwareSystem "Azure Key Vault"`, and a specific domain tries to define a container identifier as `azureKeyVault = container "Key Vault"`, the compiler will crash with an identifier collision.
**The Fix:** Enforce a strict **Prefixing Rule** for local containers. Prefix container identifiers with a short abbreviation of their bounded context.
* *Landscape:* `azureKeyVault`
* *Local Container:* `eformsKvDelegates` or `atfKeyVault`

## 4. The "Landscape Scope" Lock
**The Problem:** You try to add a container to a software system, but the compiler throws: `Workspace is landscape scoped, but the software system named [System] has containers.`
**The Fix:** Structurizr automatically infers workspace scope based on the views present. If a workspace only contains `systemLandscape` or `systemContext` views, it locks the scope to `landscape` (rejecting all containers). To unlock the scope, you must define at least one `container` view in your `views {}` block.

## 5. Pure Fragments vs. Workspaces
**The Problem:** Using `workspace { model {} views {} }` inside a file you intend to `!include` will break the master workspace topology.
**The Fix:** Only `workspace.dsl` is allowed to use those wrapper blocks. Every other `.dsl` file (like `context.dsl` or `enterprise-landscape.dsl`) must be a **Pure Fragment** containing only raw definitions (e.g., `container`, `person`, `->`).
