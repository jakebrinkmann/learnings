# Code Property Graphs (CPG) & Graph Analysis

Graph-based analysis to continuously audit codebases against architectural models (preventing "architectural drift") and finding vulnerabilities.

## Code Property Graph (CPG)
A unified multigraph data structure that merges classic program representations:
1. **Abstract Syntax Tree (AST):** Syntactic structure/containment.
2. **Control Flow Graph (CFG):** Execution paths and statement flows.
3. **Data Flow Graph (DFG):** Data movement and variable propagation.
4. **Overlays:** High-level semantic links mapping code to architectural concepts (e.g., Bounded Contexts).

## Joern
* **Purpose:** Open-source tool for CPG analysis.
* **Mechanism:** Uses a Scala-based DSL to query the CPG.
* **Use Case:** Executing queries like "Does any component in the 'Payment' context access the 'Inventory' DB directly instead of using gRPC?"

## Vulnerability-Focused Slice Construction
* **Concept:** Optimizing AI/LLM security audits.
* **Mechanism:** Use CPG traversal to identify code segments interacting with vulnerable execution paths.
* **Result:** Reduces the code payload sent to LLMs by up to 90%, improving audit accuracy and reducing token costs.
