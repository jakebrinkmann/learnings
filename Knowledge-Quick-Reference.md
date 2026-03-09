---
tags: "[reference, knowledge-base]"
---
# 🧠 Knowledge Quick Reference

This is a consolidated cheat sheet of the core principles, frameworks, and methodologies collected across the vault. Use this as a high-level refresher or a map to dive deeper into specific domains.

---

## 🏗️ Engineering Architecture & Design
*The blueprint for autonomous, high-velocity software delivery.*

- **Dual-Track Agile & DDD**: Validate concepts via spikes/PoCs *before* delivery. Structure epics strictly as Domain-Driven "Bounded Contexts" to align business requirements with software architecture. ([[architecture_engineering-blueprint]], [[domain-driven-design_DomainDrivenDesign]])
- **Volatility-Based Decomposition**: Design around what is likely to change. Hide volatile components (3rd-party integrations, rules) behind strict interfaces to contain the blast radius. ([[Patterns]], [[Tradeoffs]])
- **Executable Specifications (BDD)**: Eradicate ambiguity using "Living Documentation". Formulate Acceptance Criteria using Gherkin (`Given/When/Then`) and physically bind them to automated test code.
- **Clean / Hexagonal Architecture**: Ensure the inner core (Use Cases/Business Logic) knows nothing about the outside world (SQL, APIs, UI). Enforce architectural fitness functions via CI/CD. ([[architectures_Hexagonal]])

---

## 🌐 Backend & API Systems
*Designing robust, secure, and event-driven services.*

- **API-Events Hybrid**: Link RESTful paths (OpenAPI) and event subjects (CloudEvents) in YAML. Map CloudEvent subjects directly to REST paths for cohesive documentation. ([[API-Events-hybrid]])
- **Security & Scopes**: Manage authentication and authorization strictly using [[OAUTH]] and defined [[PermissionScopes]].
- **Observability**: Maintain traceability across microservices using [[TraceIds]].

---

## 🔄 SDLC & Code Quality
*Standards for shipping reliable code.*

- **Technical Review Priorities**: 
  1. Small code contributions (vital)
  2. Merged quickly
  3. JIRA card attached
  4. Automated tests & style checks
  5. Single Project Maintainer sign-off ([[tech-review-priorities]])
- **Code Review Checklist**: Verify style, logic, error handling, modularity, test coverage, security, and documentation. Refuse incomplete code (`TODO`/`FIXME`). ([[code-review-checklist]])
- **Collaboration**: Utilize [[PairProgramming]] and standard [[pull-request-template]]s to maintain quality and knowledge sharing.

---

## 🏃‍♂️ Agile & Team Process
*Workflows for high-performing, asynchronous teams.*

- **Async-First Work**:
  - Start with clarity and default to action.
  - Value results over responsiveness.
  - Provide "if-then" responses to unblock peers.
  - Give quick end-of-day updates (done, next, blockers). ([[AsyncWork]])
- **Leverage vs. Overhead**: 
  - Focus on high-leverage tasks (~10x impact).
  - A calendar speaks more truth than a to-do list. Limit meetings to create long scheduled work blocks.
  - As a senior, your greatest leverage is your *insight*. Minimize opportunity cost. ([[LeverageNeutralOverhead]])
- **Project Grooming**: Standardize user stories, acceptance criteria, and the definition of done before sprinting. ([[sdlc_project-grooming_Acceptance Criteria]])

---

## ⏱️ Productivity & Note-Taking
*Personal effectiveness and time management.*

- **Eat That Frog**: 
  - Expected Value = `Resources Required × ROI × Probability of Success`.
  - Apply the 80/20 rule: focus on the 20% of tasks that yield 80% of results.
  - Use the **ABCDE Method** to ruthlessly prioritize daily tasks.
  - "Salami Slice" large tasks to get started immediately. ([[EatThatFrog]], [[ABCDE-Method]])
- **Focus & Deep Work**: 
  - Technology is a terrible master but a wonderful servant. Create "zones of silence".
  - Single-handle every task: launch immediately and persevere until 100% complete.

---

*For navigation to all domain folders, see the [[Home]] note.*