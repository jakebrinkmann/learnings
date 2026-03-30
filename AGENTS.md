# AGENTS.md

This file provides context about this Obsidian vault for AI agents.

## Vault Overview

This vault serves as a comprehensive personal knowledge base, professional reference, and **published GitBook** for software engineering, system architecture, and technical team management. It captures the philosophy of building software solutions "holistically and sanely."

The content reflects a senior engineering perspective, focusing on enterprise software development, robust system design, pragmatic team leadership, and effective communication.

## Organization (The GitBook Structure)

The vault is strictly organized into six numbered pillars to act as a cohesive, GitBook-style online reference. All new notes must be placed into the appropriate subdirectories within these pillars:

1. **`01-architecture/` (The "Why" & "Where")**: Systems Thinking, Domain-Driven Design (DDD), Architectural Patterns, Architecture-as-Code, and Workflow/Governance.
2. **`02-engineering/` (The "What")**: Technical implementation notes, AI/Agents, API design, Backend, Cloud, Frontend, Observability, Security, Testing, and Tools.
3. **`03-management/` (The "Who" & "When")**: Agile & Scrum, Project Lifecycle (NFRs, SDLC), and Team & Leadership (1-on-1s, interviews, async work).
4. **`04-productivity-and-mindset/` (The "How I Work")**: Mental models, time & task management, daily routines, and AI conversation logs.
5. **`05-communication/` (The "How We Connect")**: Wordsmithing, documentation frameworks (Diátaxis, Write The Docs), team communication, and publications.
6. **`06-appendices/`**: Reusable assets, templates, and checklists for Agile/PM, Engineering/SDLC, and Personal/Interviews (formerly `skeletons/`).

At the root level, **`SUMMARY.md`** serves as the master GitBook Table of Contents, and **`README.md`** is the landing page.

## Key Topics

- **Software Architecture & Design:** Domain-Driven Design, Architecture-as-Code, Structurizr.
- **Backend Development:** API design, event-driven hybrid systems.
- **Agile & Team Processes:** 1-on-1s, asynchronous work, interview frameworks.
- **Productivity & Note-Taking:** Time management frameworks, daily journaling.
- **AI & Emerging Tech:** LLM hackathons, local AI workflows.
- **DevOps, QA, & SDLC:** Testing strategies, code reviews, Git workflows.

## User Preferences

The organizational structure leans toward a professional, pragmatic, and engineering-focused style. Responses should be concise, technically accurate, and structured with clear headings or bullet points. Avoid unnecessary fluff and focus on actionable engineering, architectural, and management principles.

The user strongly prefers consistency, standardization, and templated note creation.

## Custom Instructions

- **Strict Placement:** When creating new notes, place them in the appropriate numbered "Pillar" folder and its relevant subfolder (e.g., `01-architecture/02-domain-driven-design/`, `02-engineering/Backend/`). DO NOT create loose notes in the root or generic folders.
- **Update the SUMMARY:** If you create a new note, ensure it is logically linked or conceptually fits into the existing `SUMMARY.md` structure. If instructed to create major new sections, update `SUMMARY.md` to reflect the new GitBook navigation.
- **Use Tags for Discovery:** Rely on YAML frontmatter tags (e.g., `#architecture`, `#backend`, `#sdlc`, `#agile`) to group related concepts.
- **Leverage Templates:** When asked to create a new note (such as an interview guide, daily journal, or task paper), utilize the templates found in the `06-appendices/` folder to maintain structural consistency. Duplicate and fill them out.
- **Maintain Technical Depth:** Assume a senior engineering or architectural context.
- **No Floating MOCs:** Do not create separate Map of Content (MOC) files. The root `SUMMARY.md` file acts as the single source of truth for navigation.