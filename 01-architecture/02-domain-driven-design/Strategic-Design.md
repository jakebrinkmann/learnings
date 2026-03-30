---
tags:
  - architecture
  - ddd
---
# Strategic Design

## Core Concepts

### Create a Shared Model
To effectively model a domain, we must:
- Find *Business Events* and *Workflows*
- Partition problem domain into smaller sub-domains (well-bounded contexts!)
- Create a model of each sub-domain in the solution (Design for Autonomy!)
- Develop a common language shared between everyone involved in the project (Avoid [[The-Translation-Trap]])

### Deliberate Discovery
- Learn about the problem domain
- Domain Knowledge → Modeling Efforts
- Investigation & Clarification of "Gray Areas"
- __Understand the WHY behind the WHAT__
- Domain vision statement

### Replacement, not Reuse
- Build isolated subdomain models for replacement, not reuse
- Don't rush to put concrete boundaries in (avoid precision in early iterations)
- Strive for CLEAN BOUNDARIES, not perfect models
- "business capability ownership boundaries"
