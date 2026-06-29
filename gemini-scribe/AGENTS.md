# AGENTS.md

This file provides context about this Obsidian vault for AI agents.

## Vault Overview

This vault serves as a comprehensive personal knowledge base and professional playbook for a senior software engineer, software architect, or engineering leader.

It bridges high-level system design with practical engineering, team management, and personal productivity, acting as a structured "second brain" for technical governance, software delivery, and professional growth. Recent additions indicate a strong focus on AI agent integration, architecture-as-code, and rigorous software development life cycle (SDLC) standardization.

## Organization

The vault is strictly organized using a top-level numbered folder hierarchy, dividing content into six primary domains: `01-architecture`, `02-engineering`, `03-management`, `04-productivity-and-mindset`, `05-communication`, and `06-appendices`.

Subfolders are systematically numbered (e.g., `01-philosophy`, `02-domain-driven-design`), ensuring a predictable, logical flow from abstract principles down to concrete practices. The `02-engineering` folder is further categorized by technical domain (e.g., AI-Agents, API, Cloud, Testing).

The vault makes extensive use of reusable assets, heavily centralized in the `06-appendices` folder, which contains standardized templates for the Software Development Life Cycle (SDLC), Agile processes, checklists, and personal logs. The presence of notes on Zettelkasten and Diataxis suggests a deliberate approach to cross-linking knowledge and structuring documentation based on clear user intent, keeping reference material and templates distinct from active working notes.

## Key Topics

- **Software Architecture & System Design**: Domain-Driven Design (DDD), C4 Model, Architecture-as-Code (Code Property Graphs, DB ERD), and Architectural Patterns (12-Factor App, Event Sourcing).
- **Engineering & Implementation**: API Design (FHIR, Events), Cloud Infrastructure (AWS CDK), Testing Strategies (Enterprise Test Pyramid, Fuzzing, Test Charters), and Backend/Frontend frameworks (SQLAlchemy, AlpineJS, Tailwind).
- **AI & Automation**: AI Agent Architecture, MCP Integration Strategy, Prompt Engineering (Principal Architect Agent), and LLM setups.
- **Technical Leadership & Management**: Agile/Scrum methodologies, Project Lifecycles (BCM, Data Flow Diagrams), 1-on-1s, Engineering Leveling, and Budget Tracking.
- **Documentation & Governance**: Architecture Decision Records (ADRs), Diataxis framework, Pull Request/Code Review Checklists, and Engineering Blueprints.
- **Productivity & Mental Models**: PARA method, Time Management (Eat That Frog, ABCDE), Critical Thinking, and TaskWarrior.

## User Preferences

Based on the highly structured, numbered folder hierarchy and the extensive collection of templates and checklists, the user heavily favors organization, standardization, and structured thinking. The agent should adopt a professional, highly organized, precise, and analytical communication style.

Responses should be detailed but systematically structured, utilizing bullet points, clear headings, and established frameworks. The user appreciates actionable insights, clear evaluation of tradeoffs (as evidenced by dedicated `Tradeoffs` and `CriticalThinking` notes), and conceptual integrity in technical designs.

When providing solutions, the agent should default to rigorous engineering practices, prioritizing testability, clear documentation, and architectural alignment over quick, unstructured fixes.

## Custom Instructions

- **Use Existing Templates**: When generating architecture proposals, bug reports, JIRA cards, or test runs, ALWAYS reference and utilize the user's existing templates located in `06-appendices` or `01-architecture/05-workflow-and-governance`.
- **Respect the Hierarchy**: Maintain the strict numbered naming conventions (e.g., `01-xxx`) when suggesting new files or folders to preserve the vault's sorting order.
- **Architectural Alignment**: Apply Domain-Driven Design (DDD) principles, Event-Driven patterns, and C4 modeling concepts when discussing, evaluating, or designing system architecture.
- **Documentation Standards**: Align documentation and writing suggestions with the Diataxis framework and Write-The-Docs principles, as indicated in the `05-communication` folder.
- **SDLC & Testing Rigor**: When discussing engineering implementations, incorporate appropriate testing strategies (Test Pyramid, Fuzzing) and reference standard SDLC artifacts (Data Dictionaries, Architecture Blueprints).
- **AI Agent Context**: When assisting with AI or LLM tasks, align with the user's established `AI-Architecture-Principles` and `MCP-Integration-Strategy` located in `02-engineering/AI-Agents`.
