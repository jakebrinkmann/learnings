# Formal Methods & Mathematical Verification

Formal methods provide rigorous mathematical proofs to guarantee systems satisfy specified designs and invariants. Moving from "testing" to "proving."

## TLA+ (Temporal Logic of Actions) & PlusCal
* **Foundation:** Set theory and temporal logic.
* **Purpose:** Models concurrent and distributed systems as state machines.
* **Mechanism:** Describes all possible legal execution traces. Exhaustively explores state space using the **TLC** model checker.
* **Use Case:** Preventing race conditions, deadlocks, and distributed consensus bugs (e.g., AWS S3/DynamoDB).
* **PlusCal:** Algorithm-oriented pseudocode syntax that transpiles directly into TLA+.

## Alloy
* **Foundation:** Relational algebra.
* **Purpose:** Validates structural requirements and data relationships.
* **Mechanism:** Uses a SAT-based solver for constraint satisfaction.
* **Use Case:** Validating ontologies, RBAC/access control policies, and billing structures.

## APALACHE
* **Foundation:** Symbolic logic.
* **Purpose:** Symbolic model checking for TLA+.
* **Mechanism:** Handles large state-space exploration where TLC (explicit state checking) would hit memory/time limits.

## Logic-Driven Development (Semi-Formal)
* **Concept:** Embedding mathematical logic directly into the codebase using strong type systems.
* **Mechanism:** 
  * Define system entities and document assumptions.
  * Use the compiler (e.g., Rust) to enforce invariants via wrapper types (e.g., `UserID` vs `SessionID`).
  * "Proving" code obligations via manual review tags or automated type checks.
