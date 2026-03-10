---
tags: [architecture, ddd, strategic-design]
---
# Subdomain Distillation

Separate **Problem Space** (What we are solving) from **Solution Space** (How we solve it with software).

### The 3 Types of Subdomains

A key mental model for distillation is separating what is **Essential** (required to run the business) from what is **Differentiating** (what gives you a competitive advantage).

#### 1. Core Domain
- **Classification**: **Essential** AND **Differentiating**
- **Value**: Competitive Advantage / USP
- **Complexity**: High
- **Strategy**: **BUILD** in-house
- **Resourcing**: Best engineers, strict DDD (Aggregates, Hexagonal Architecture)
- *Example*: Risk algorithm, matching engine, proprietary pricing
- *Note*: In complex ecosystems, you may also identify a [[Shared-Core-Subdomain]] that anchors semantics for multiple distinct Core domains.

#### 2. Supporting Subdomain
- **Classification**: **Essential** but **NOT Differentiating**
- **Value**: Necessary for business, but no competitive edge
- **Complexity**: Low/Medium (Mostly CRUD)
- **Strategy**: **BUILD or BUY** (cheaply)
- **Resourcing**: Junior/Mid-level, simple Active Record / Transaction Script
- *Example*: Product catalog, internal HR reporting

#### 3. Generic Subdomain
- **Classification**: **Essential** but **NOT Differentiating** (Industry standard)
- **Value**: Solved problem, industry standard
- **Complexity**: High
- **Strategy**: **BUY or OUTSOURCE** (SaaS)
- **Resourcing**: Integration only
- *Example*: Auth (Cognito/Auth0), Payments (Stripe), Invoicing (QuickBooks)

### 🧩 The Hybrid Supporting Domain Pattern
Sometimes, a domain appears to be standard or Supporting (e.g., a standard HR management system or a basic logistics tracker), but it harbors a highly complex, custom-built Core algorithm inside it. 
- **Example**: A standard recruiting CRM (Supporting) that contains a proprietary, highly-guarded AI candidate-matching algorithm (Core).
- **Strategy**: Do not treat the entire system as Core. Isolate the Core algorithm into its own Bounded Context or module, and treat the surrounding CRUD wrappers as a Supporting subdomain.

### Distillation Process
1. **Map** the domain (via Event Storming).
2. **Identify** the Core (What must we build to survive? Where is the money made?).
3. **Categorize** the remainder (Supporting vs Generic).
4. **Align** Bounded Contexts (Ideally 1 Context : 1 Subdomain, but often 1:N in legacy).
   - *Warning*: Do not confuse physical overlap with conceptual overlap. See [[Physical-vs-Conceptual-Boundaries]].
