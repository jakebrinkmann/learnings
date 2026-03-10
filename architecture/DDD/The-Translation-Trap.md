---
tags: [architecture, ddd, ubiquitous-language, anti-pattern]
---
# The Translation Trap

The **Translation Trap** occurs when a system violates the first rule of Domain-Driven Design: **Never mix languages that represent different business mental models.**

### Mixing Semantic Universes
When distinct domains are forced into a single conceptual space, their vocabularies collide. For example, mixing:
- **Manufacturing semantics:** *Work Orders, Laser Operations, Form 2*
- **3PL Logistics semantics:** *Partner Orders, Drop-Ship Fees, All-in SKUs*
- **Distribution semantics:** *Item Fulfillment, Bulk Shipment*

### The Consequences
Because the boundaries are merged, concepts leak and mutate:
- Manufacturing starts using logistics vocabulary.
- Partner fee logic leaks into basic distribution operations.
- Compliance/Bound Book logic mutates depending on "who the partner is".

This forces teams to constantly translate meaning across domains, leading to:
- Misunderstanding of requirements.
- Conflicting process flows.
- Redundant, "spaghetti" logic (e.g., complex if/else trees for different partner types).
- Elevated risk of compliance errors.

### The DDD Solution
Enforce strict [[Context-Maps|Bounded Contexts]] with their own independent Ubiquitous Language. Each context must use its own vocabulary. If data must pass between them, use an Anti-Corruption Layer (ACL) or published contracts (e.g., a Partner Program context publishes fee rules, which Manufacturing and 3PL consume, while Distribution executes neutrally without knowing about fees).
