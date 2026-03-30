---
title: Requirements Engineering
tags: [requirements, systems-analysis, engineering, architecture, planning, nfr, dod, acceptance-criteria]
---

# Requirements Engineering

Requirements Engineering is the process of defining, documenting, and maintaining the requirements for a system or project. It ensures that the final product aligns with business goals, stakeholder needs, and technical constraints.

> "The devil is in the details."

---

## The Importance of Not Simply “Working”

The "ility" of engineering:
- **Quality**: "High value"; a high level of conformance and relatively low cost
- **Safety**: Avoiding dysfunctional or detrimental interactions
- **Usability/Operability**: Understanding human capability, needs, and limitations
- **Maintainability/Reliability**: Corrective (restore to fully functioning) / preventive (ensure doesn't break down)

Major issues in systems development often stem from poorly defined requirements, impacting:
1. Time-to-Market
2. Productivity
3. Software Quality and Reliability
4. Maintainability
5. Efficiency, Portability, Security, Usability

## Specification: Fixed vs. Variable Intent

- **Fixed Intent**: Well-known in advance (e.g., "Adventure ride holds 12 people"). Often modeled as constraints or non-functional requirements.
- **Variable Intent**: Refined over time (e.g., "Acceleration at load shall be no less than x Gs"). Modeled as functional requirements that iteratively evolve.

---

## Core Types of Requirements

### 1. Functional Requirements
- **Definition:** These describe the specific behaviors or functions of a system or product.
- **Purpose:** They specify what the system should do, outlining tasks, services, and interactions between users and the system. They represent the variable solution intent.
- **Examples:**
	- The system should allow users to log in using a username and password.
	- The system should be able to generate monthly financial reports.

### 2. Non-Functional Requirements (NFRs)
- **Definition:** These are attributes or qualities that the system must have, rather than specific behaviors or functions. Not "what the system does" but "how well it does it."
- **Purpose:** They define how the system should perform or behave under certain conditions. NFRs are persistent constraints on the design and development of the system, **not** standard backlog items.
- **Key Types of NFRs:**
	- **Performance:** How fast does the system return results?
	- **Scalability:** How much will this performance change with higher workloads?
	- **Availability:** Up and running time compared to downtime; Mean-Time-Between-Failure (MTBF).
	- **Security:** How well are the system and its data protected against attacks?
	- **Maintainability:** How much time does it take to fix an issue? Includes operability (making life easy for ops), simplicity (managing complexity), and evolvability (making change easy).
	- **Portability:** Which hardware, OS, and browsers does the software run on?
	- **Compatibility:** Does it conflict with other applications and processes?
	- **Reliability:** How often does the system experience critical failures?
	- **Localization:** Is the system compatible with local specifics?
	- **Usability:** How easy is it for the customer to use the system?

#### Specifying NFRs
- **Step 1:** Define NFR quality (name, scale, method of measure)
- **Step 2:** Quantify NFR values (current/baseline, target/success, constraint/unacceptable)

### 3. Business Requirements
- **Definition:** High-level goals or objectives that the organization seeks to achieve through the project.
- **Purpose:** These describe the overarching "why" of the project and align with the company’s strategic objectives.
- **Examples:** Increase customer satisfaction, improve order processing efficiency.

### 4. Stakeholder Requirements
- **Definition:** Needs and expectations of the stakeholders (users, customers, business owners).
- **Purpose:** Ensures that all stakeholders’ needs are addressed.
- **Examples:** End-users need customizable dashboards, managers need real-time metrics.

### 5. System Requirements
- **Definition:** Specifications that define the technical aspects of the system (hardware, software, network).
- **Purpose:** Defines how the solution should be built from a technical perspective.
- **Examples:** Must run on Windows Server 2019, integrate with existing CRM.

### 6. User Requirements
- **Definition:** Needs or expectations of end-users interacting directly with the system.
- **Purpose:** Focuses on UI/UX and usability considerations.
- **Examples:** Reset password via email verification, search order history.

### 7. Interface Requirements
- **Definition:** Defines how the system will interact with other systems.
- **Purpose:** Ensures seamless integration.
- **Examples:** Integrate with payment gateway API, exchange data via REST API.

### 8. Transition Requirements
- **Definition:** Describes how the system will transition from current to desired state.
- **Purpose:** Outlines changes, migration, or training needed.
- **Examples:** Data migration without loss, online user training modules.

### 9. Regulatory and Compliance Requirements
- **Definition:** Legal, regulatory, or compliance-related requirements.
- **Purpose:** Ensures the system meets legal/security standards.
- **Examples:** GDPR compliance, HIPAA compliance.

### 10. Data Requirements
- **Definition:** Specifies what data the system must store, manage, or process.
- **Purpose:** Ensures the system can handle necessary data.
- **Examples:** Secure storage of PII, 24-hour data backups.

---

## Agile Requirements & Validation

In Agile methodologies like [[FDD]] (Feature-Driven Development), requirements are decomposed to be actionable:
**Stakeholder Requirements -> Features -> Use Cases -> User Stories**

### Acceptance Criteria
**Acceptance Criteria** are used to determine whether the implementation is correct and delivers the business benefits.
- **Example:** "It’s done when the outgoing sound alert is played when a message is sent."
- **Example:** "It’s done when the incoming sound alert is played when a message is received."

### Definition of Done (DoD)
The **Definition of Done** encompasses all activities required to bring a feature to a shippable state. A common DoD checklist includes:
- Designed/Prototyped
- All Tests and Linting Rules Pass
- Coded and reviewed by another programmer
- Integrated and Verified in the staging environment
- End-user Documented and reviewed
