# Architecture Advice Process (AAP)

*Reference: "Facilitating Software Architecture" by Andrew Harmel-Law (Chapters 4, 5, and 6)*

## Overview
The Architecture Advice Process (AAP) is a decentralized decision-making framework designed to shift software architecture away from an "Ivory Tower" centralized model. It empowers development teams to own architectural decisions while maintaining alignment and conceptual integrity. In this model, the architect's role evolves from a sole decision-maker into a *process facilitator*.

## The 3-Phase Decision-Making Process

### 1. Option Making (Chapter 4)
Any developer or team member can initiate an architecturally significant decision. In this phase, the initiator pulls together candidate solutions and evaluates trade-offs. The core rule of the AAP is that before taking a decision, the initiator **must** seek advice from two key groups:
- **Experts:** Individuals with deep technical or domain expertise relevant to the problem.
- **Affected Parties:** Anyone who will be meaningfully impacted by the outcome of the decision.

*Note: The goal is to seek **advice**, not to achieve consensus or approval. This avoids drawn-out bottlenecks.*

### 2. Decision Taking (Chapter 5)
Once advice is gathered, the individual or team makes the final call. This phase heavily focuses on the socio-technical aspects of rolling out decentralized decision-making:
- **Avoid "Big Bang" rollouts:** Start by applying the AAP to low-risk projects or single teams.
- **Overcome psychological barriers:** Foster psychological safety so teams feel confident taking ownership, and help traditional architects manage the fear of losing control.
- **Fast Flow:** By eliminating the need for committee consensus, teams maintain rapid development cycles and collective ownership.

### 3. Communicating the Decision (Chapter 6)
Once a decision is taken, it must be documented and shared transparently. This enforces accountability and acts as a natural check against reckless choices.
- **[[Architecture Decision Records]] (ADRs):** The primary tool for communicating decisions. These are lightweight, standardized text files kept alongside the code that capture the context, the decision made, and the consequences/trade-offs.
- **Architectural Advice Forums:** Collaborative spaces (rather than rigid review boards) where teams can present their options, manage strong opinions, and receive constructive feedback.

## Summary of Benefits
By shifting from a culture of "seeking approval" to "seeking advice," the AAP eliminates traditional architectural bottlenecks, mitigates cognitive biases (by forcing cross-functional perspective), and builds trust across engineering teams.