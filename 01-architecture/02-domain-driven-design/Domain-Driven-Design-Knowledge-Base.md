---
tags: "[architecture, ddd]"
---
# Domain Driven Design Knowledge Base

A collection of notes and resources on Domain-Driven Design (DDD).

## Core Concepts
- [[Strategic-Design|Strategic Design]]: Core concepts like Shared Models, Deliberate Discovery, and Replacement vs Reuse.
- [[Modeling-and-Workflows|Domain Modeling & Workflows]]: How to approach modeling, including scenarios, processes, and a detailed Order-Taking example.

## Discovery Tools
- [[Discovery-Tools|Discovery Tools]]: Techniques for exploring the domain, including Event Storming, Impact Mapping, and Business Model Canvas.

## Implementation Levels
Based on the "DDD Reboot" concept:
1. **Code Level**: [[Value-Objects|Value Objects & Code Smells]] - Building the domain with strong types.
2. **Application Level**: [[Hexagonal Architecture|Hexagonal Architecture]] - Isolating the domain from infrastructure.
3. **Enterprise Level**: [[Context-Maps|Context Maps & Bounded Contexts]] - Managing boundaries between systems.
4. **Architecture-as-Code (AaC)**: [[Architecture-As-Code-Transitions|AaC Transitions & Strangler Fig]] - Managing legacy migrations and temporal architecture safely.

## References
- [Domain Modeling Made Functional](https://github.com/swlaschin/DomainModelingMadeFunctional)
- [As Time Goes By… (a Bi-temporal Event Sourcing story) - Thomas Pierrain](https://www.youtube.com/watch?v=xzekp1RuZbM)
