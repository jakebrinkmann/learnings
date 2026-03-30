---
title: Enterprise SDLC EKG
tags: [ekg, architecture, strategy, ddd, agile, testing]
---
# Enterprise SDLC EKG (Enterprise Knowledge Graph)

The Enterprise Software Development Life Cycle (SDLC) Enterprise Knowledge Graph (EKG) is a conceptual model that shifts our view of software engineering from *linear, disconnected, siloed thinking* to *non-linear, interconnected, and systemic reasoning*.

It proves that a line of code is connected to a bounded context, which is connected to a user story, which is connected to a strategic portfolio epic. It makes the "Sociotechnical System" visible.

## The 6 Pillars of the EKG

The EKG is built on 6 core pillars that map the entire lifecycle of a software initiative from ideation to production operations.

### 1. SDLC Work Hierarchy (The "Why" and "What")
This pillar defines the strategic and tactical work items that drive value.
* **Portfolio Epic (Strategy/Initiative)**: High-level business strategy.
* **Epic**: A large body of work that can be broken down into specific features.
* **Feature**: A tangible piece of functionality.
* **Use Case**: The specific user interaction or system behavior.
* **User Story**: The tactical unit of delivery.
* **Task (Design/Dev)**: The granular execution steps.
* **Dependency (cross-team)**: Inter-team coordination requirements.
* **Architecture Decision Record (ADR)**: The governance of technical choices.
* **NFR Story**: Explicit tracking of Non-Functional Requirements.
* **Security Story**: Explicit tracking of security, compliance, and risk mitigation.
* **API Contract (OpenAPI/AsyncAPI)**: The agreed-upon interface design.
* **Test Charter (exploratory)**: The scope for exploratory testing sessions.

### 2. Testing & Evidence (The "Proof")
This pillar provides the traceability that our work meets the requirements.
* **Validation Test Suite**: Are we building the right thing? (Maps to User Stories)
* **Verification Test Suite**: Are we building it right? (Maps to Architecture/Design)
* **End-to-End Test Suite**: Does the system work as a whole? (Maps to Use Cases)
* **Azure Test Plan Test Case**: Specific, executable test scenarios.
* **Test Run**: The immutable evidence of execution.

### 3. Release Traceability (The "Delivery")
This pillar tracks how value actually reaches the user.
* **Release Package**: The bundle of artifacts intended for deployment.
* **Regression Suite**: The safety net ensuring existing value isn't broken.
* **Release Record (per environment)**: The audit trail of what went where, and when.
* **Smoke Test**: Post-deployment health verification.
* **Deployment**: The act of moving the release package into an environment.
* **Environment**: The target infrastructure (e.g., Staging, Production).

### 4. Code & Delivery Artifacts (The "How")
This pillar represents the tangible technical outputs.
* **Pull Request**: The peer-reviewed proposal for change.
* **Code Artifact (repo/file/module)**: The physical codebase.
* **Function / Service**: The runtime execution units.

### 5. DDD / Domain Model (The "Structure")
This pillar ensures the technical solution aligns with the business problem.
* **Subdomain (Core/Supporting/Generic)**: The business problem space.
* **Bounded Context**: The conceptual boundary of a model.
* **Context Relationship (ACL/OHS/etc.)**: How contexts interact.
* **Aggregate**: The transactional consistency boundary.
* **Domain Event**: Something that happened in the domain.
* **Command**: An intent to change the state of the system.
* **Team**: The sociotechnical unit owning the context.
* **LegacyMonolith**: The existing system we must integrate with or strangle.

### 6. Operations (The "Reality")
This pillar represents the system running in production.
* **Alert**: Automated notification of a system irregularity.
* **Incident**: A realized impact to the business or user that requires response.

## Implementing the EKG via Traceability

To realize this graph, every artifact (whether a Jira ticket, a markdown file, or a code repository) must maintain **traceability links** to its upstream and downstream neighbors. We enforce this through relational metadata (such as YAML frontmatter in our documentation templates).