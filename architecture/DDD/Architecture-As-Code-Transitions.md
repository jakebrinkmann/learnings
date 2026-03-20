---
tags: [architecture, ddd, aac, strangler-fig, enterprise]
---
# Architecture-as-Code (AaC) Transitions

To survive enterprise modernization, your Enterprise Architecture Repository (EAR) must explicitly model **Time** and **Transition**. To maintain day-to-day delivery, your team must look at the EAR and instantly know:

1. **What is legacy** (Sunset)
2. **What is the bridge** (Strangler)
3. **What is the future** (Target)

### 1. Split the "Truth" by File Type
*   **`domain.fs` (The Vision)**: Defines the **Target State**. Pure business logic and mathematical intent. Immune to current database realities.
*   **`context.dsl` (The Fact)**: Defines **Current Reality + Strangler Facade**. Maps physical execution, legacy systems, clean systems, and Anti-Corruption Layers (ACLs).

### 2. Temporal Tagging (The Visual Strangler)
Never use a single system landscape diagram. Use Structurizr tags to separate temporal states:
*   `tags "As-Is" "Sunset"` (The Legacy)
*   `tags "Strangler" "ACL"` (The Bridge)
*   `tags "To-Be" "Target"` (The Future)

**Implementation:** Create dual views in `workspace.dsl`:
*   `Landscape-Current`: Exclude `Target` tags (for debugging engineers).
*   `Landscape-Target`: Exclude `Sunset` tags (for PMs/planning).

### 3. Explicitly Model the "Strangler Facade"
The Strangler Fig is physical infrastructure, not just a concept.
*   Document sync agents, event subscribers, and ACLs in the **`ResourceAccess`** layer.
*   Explicitly show developers how to bridge old and new systems.

### 4. Tiered Fitness Functions
Do not apply strict CI/CD architectural rules globally—it will freeze feature development.
*   **Legacy Domains**: "Pass with Warnings".
*   **Target Domains**: Strict enforcement (opt-in only after a domain gets a pure `Engine` container).

### 5. NEVER Branch the Architecture
*   **No `future-state` branches**: Vision and Fact must live side-by-side in `main`.
*   **Why**: Hiding the vision in a branch guarantees engineers will keep building on the legacy swamp.
*   **How**: Force visibility in `main` using tags. Manage changes via PRs and semantic versioning.