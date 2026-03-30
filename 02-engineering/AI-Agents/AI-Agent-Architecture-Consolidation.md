---
tags: [engineering, ai-agents, ai-tooling, architecture, consolidation]
---
# AI Agent Architecture Consolidation

*Recorded on 3/17/2026*

**Problem:**
*   **Bloat:** 18 overlapping agents; over-engineered maintenance nightmare.
*   **Duplication:** Multiple agents doing the same jobs (e.g., `beastmode`/`builder`, `archivist`/`nexus-archivist`).
*   **Bad Naming:** Edgy/legacy names (`godmode`, `beastmode`, `nexus-`) instead of functional names.
*   **Conflicts:** Context collisions from multiple agents fighting over system design.

**Proposed Consolidation (Functional Groups):**

1.  **Product & Backlog**
    *   `product-owner`: PRD drafting (Keep)
    *   `backlog-manager`: ADO tickets (was `nexus-backlog`)
2.  **Architecture & Design (EAR)**
    *   `blueprint-architect`: High-level architecture (Merge: `architect`, `godmode`)
    *   `enterprise-architect`: DDD pipeline (Merge: `nexus-architect`, `scout`, `legacy-scout`)
    *   `drift-auditor`: EAR vs. Actuals (Merge: `archivist`, `nexus-archivist`)
3.  **Implementation & Execution**
    *   `pair-programmer`: Cautious TDD partner (was `feedback`)
    *   `autonomous-developer`: Full TDD loop (Merge: `beastmode`, `builder`)
    *   `debugger`: Root-cause analysis (was `problem-solver`)
4.  **Verification**
    *   `pr-reviewer`: Security/linting gate (Keep)
    *   `spec-auditor`: Code vs. Specs (Merge: `audit`, `spec-reviewer`)
5.  **Technical Writing**
    *   `docs-publisher`: MkDocs pipeline (was `docs-as-code-specialist`)
    *   `workflow-generator`: Extract patterns (Keep)

**Execution Plan:**
- [ ] Confirm groupings.
- [ ] Delete duplicates.
- [ ] Rename survivors (functional only).
- [ ] Standardize frontmatter.