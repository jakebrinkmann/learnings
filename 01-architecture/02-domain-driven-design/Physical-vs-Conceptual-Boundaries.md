---
tags: [architecture, ddd, bounded-contexts, anti-pattern, strategic-design]
---
# Physical vs. Conceptual Boundaries

A common Domain-Driven Design anti-pattern is assuming that **physical workflow overlap implies conceptual domain overlap**. 

Just because physical items flow through the same building or touch the same operational chokepoints, it does *not* mean:
- The software domain is the same.
- The business language ([[Ubiquitous-Language]]) is the same.
- The teams should share a data model or process flow.

### The "Project Intersection" Anti-Pattern
When architects attempt to draw one giant "universal process map" for all inventory flows (e.g., unifying manufacturing, 3PL partner fulfillment, and warehouse distribution), it creates the illusion of a single domain. 

This illusion leads to a **distributed monolith** where:
- Every upstream flow (e.g., manufacturing) feeds into a single downstream execution engine.
- Events in one area trigger unrelated logic in another (e.g., fulfillment events triggering fee logic, triggering compliance changes).
- Changes in one area break unrelated areas, blocking independent team velocity and scalability.

### The DDD Solution
Separate the domains based on **semantics and business capabilities**, not physical location. 
- Keep execution engines (like warehouse distribution and serialization) as purely operational [[Subdomain-Distillation#2. Supporting Subdomain|Supporting Subdomains]] that execute neutrally.
- Keep distinct business lines (like White-Label manufacturing vs. 3PL fulfillment) as separate Core Domains, even if they physically cross paths in the warehouse.
