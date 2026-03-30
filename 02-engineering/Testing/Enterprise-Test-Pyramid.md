---
tags: [qa, testing, architecture, sdlc, cheatsheet]
---
# Cheat Sheet: Enterprise Test Pyramid & Quality Framework

**Core Principle:** Testing is continuous. Fast feedback at every level. Strict traceability from requirement to deployed code.

## 1. The 9-Layer Pyramid

*Bottom = Fastest/Isolated ➔ Top = Slowest/Integrated*

| Lvl   | Type             | Scope                   | Trigger         | Ecosystems           |
| :---- | :--------------- | :---------------------- | :-------------- | :------------------- |
| **9** | **Security**     | Static/Dynamic Analysis | Commit + PI     | Snyk, OWASP ZAP      |
| **8** | **Performance**  | NFR Verification        | Pre-release     | k6, JMeter           |
| **7** | **Regression**   | Full System Suite       | Pre-release     | Playwright, Cypress  |
| **6** | **Smoke**        | Post-deploy Health      | Per Environment | k6, APM              |
| **5** | **End-to-End**   | Main Success Scenario   | Staging         | Playwright, Cypress  |
| **4** | **Contract**     | API Boundary (CDC)      | PR              | Pact                 |
| **3** | **Verification** | Integration/Component   | PR              | Testcontainers, Jest |
| **2** | **Validation**   | Gherkin / User Story    | Per Story       | Cucumber, Playwright |
| **1** | **Unit**         | Isolated Function (TDD) | Local / PR      | Jest, JUnit          |

## 2. Traceability Mapping

Every test maps to a specific planning artifact. No orphaned tests.

* **Validation (Type 2)** ➔ **User Story:** 1 Gherkin `Scenario` = 1 Test. *(Gate: All scenarios pass to close story)*
* **Verification (Type 3)** ➔ **Tech Design:** Verifies architecture/functions. *(Gate: PR merge)*
* **End-to-End (Type 5)** ➔ **Use Case:** Maps to Main Success Scenario steps. *(Gate: Feature completion)*
* **Smoke (Type 6)** ➔ **Deployment:** Critical path probes. *(Gate: <60s execution for Canary promotion)*
* **Regression (Type 7)** ➔ **Release:** Pre-prod full suite. *(Gate: 100% pass rate to release)*

## 3. Quality Metrics (Hard Targets)

* **Unit Coverage:** `≥ 80%` *(Blocks PR)*
* **Gherkin Automation:** `100%` *(Blocks Story Closure)*
* **PR Feedback Loop:** `< 10m` *(Unit + Integration + Contract)*
* **Regressions:** `0` *(Blocks Release)*
* **Smoke Execution:** `< 60s` *(Blocks Canary)*
* **Canary Error Rate:** `< 0.1%` *(Blocks Canary)*
* **NFR Verification:** `p95` target met

## 4. The 4-Tier Gate Enforcement

* **T1: Process (Auto)** ➔ Issue tracker hard-blocks (e.g., cannot start Story without Gherkin AC).
* **T2: Visibility (Auto)** ➔ Dashboards track violations (e.g., missing AC, orphaned tasks). *Target: 0 daily.*
* **T3: Pipeline (Auto)** ➔ CI/CD hard-blocks (e.g., coverage drop, contract fail, critical CVE).
* **T4: Human (Manual)** ➔ Strategic sign-offs (e.g., PR Approval, Architecture Review, Release Sign-off).

---
**See Also:** [[Testing]] | [[TestDouble]] | [[Requirements Engineering]]