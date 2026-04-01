---
tags: [engineering, ai-agents, ai-tooling, architecture, consolidation, swarm-security, mcp]
---
# AI Agent Architecture Consolidation

*Recorded on 3/17/2026*

> [!info] 4/1/2026 Update
> This consolidation matches our Supervisor/Manager pattern, but requires strict Context Isolation during handoffs. See [[AI-Architecture-Principles#The Swarm (Multi-Agent Routing)]].

**Problem:**
*   **Bloat:** 18 overlapping agents; over-engineered maintenance nightmare.
*   **Duplication:** Multiple agents doing the same jobs (e.g., `beastmode`/`builder`, `archivist`/`nexus-archivist`).
*   **Bad Naming:** Edgy/legacy names (`godmode`, `beastmode`, `nexus-`) instead of functional names.
*   **Conflicts:** Context collisions from multiple agents fighting over system design.

**Proposed Consolidation (Functional Groups - Supervisor Pattern):**

1.  **Product & Backlog (Supervisor: Product Owner)**
    *   `product-owner`: PRD drafting (Keep)
    *   `backlog-manager`: ADO tickets (was `nexus-backlog`)
2.  **Architecture & Design (EAR) (Supervisor: Enterprise Architect)**
    *   `blueprint-architect`: High-level architecture (Merge: `architect`, `godmode`)
    *   `enterprise-architect`: DDD pipeline (Merge: `nexus-architect`, `scout`, `legacy-scout`)
    *   `drift-auditor`: EAR vs. Actuals (Merge: `archivist`, `nexus-archivist`)
3.  **Implementation & Execution (Supervisor: Autonomous Developer)**
    *   `pair-programmer`: Cautious TDD partner (was `feedback`)
    *   `autonomous-developer`: Full TDD loop (Merge: `beastmode`, `builder`)
    *   `debugger`: Root-cause analysis (was `problem-solver`)
4.  **Verification (Supervisor: PR Reviewer)**
    *   `pr-reviewer`: Security/linting gate (Keep)
    *   `spec-auditor`: Code vs. Specs (Merge: `audit`, `spec-reviewer`)
5.  **Technical Writing (Supervisor: Docs Publisher)**
    *   `docs-publisher`: MkDocs pipeline (was `docs-as-code-specialist`)
    *   `workflow-generator`: Extract patterns (Keep)

**Execution Plan:**
- [ ] Confirm groupings.
- [ ] Delete duplicates.
- [ ] Rename survivors (functional only).
- [ ] Standardize frontmatter.
- [ ] **[NEW]** Implement Context Isolation protocols for all cross-group handoffs.
- [ ] **[NEW]** Migrate all tool access to standardized Model Context Protocol (MCP) servers.