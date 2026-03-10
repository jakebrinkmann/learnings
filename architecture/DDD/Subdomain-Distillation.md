---
tags: [architecture, ddd, strategic-design]
---
# Subdomain Distillation

Separate **Problem Space** (What we are solving) from **Solution Space** (How we solve it with software).

### The 3 Types of Subdomains

#### 1. Core Domain
- **Value**: Competitive Advantage / USP
- **Complexity**: High
- **Strategy**: **BUILD** in-house
- **Resourcing**: Best engineers, strict DDD (Aggregates, Hexagonal Architecture)
- *Example*: Risk algorithm, matching engine, proprietary pricing
- *Note*: In complex ecosystems, you may also identify a [[Shared-Core-Subdomain]] that anchors semantics for multiple distinct Core domains.

#### 2. Supporting Subdomain
- **Value**: Necessary for business, but no competitive edge
- **Complexity**: Low/Medium (Mostly CRUD)
- **Strategy**: **BUILD or BUY** (cheaply)
- **Resourcing**: Junior/Mid-level, simple Active Record / Transaction Script
- *Example*: Product catalog, internal HR reporting

#### 3. Generic Subdomain
- **Value**: Solved problem, industry standard
- **Complexity**: High
- **Strategy**: **BUY or OUTSOURCE** (SaaS)
- **Resourcing**: Integration only
- *Example*: Auth (Cognito/Auth0), Payments (Stripe), Invoicing (QuickBooks)

### Distillation Process
1. **Map** the domain (via Event Storming).
2. **Identify** the Core (What must we build to survive? Where is the money made?).
3. **Categorize** the remainder (Supporting vs Generic).
4. **Align** Bounded Contexts (Ideally 1 Context : 1 Subdomain, but often 1:N in legacy).
   - *Warning*: Do not confuse physical overlap with conceptual overlap. See [[Physical-vs-Conceptual-Boundaries]].
