# AGENTS.md

This file provides context about this Obsidian vault for AI agents.

## Vault Overview

This vault serves as a comprehensive personal knowledge base and professional reference for software engineering, system architecture, and technical team management. It covers the full Software Development Life Cycle (SDLC), ranging from high-level Domain-Driven Design (DDD) and architectural patterns down to specific frontend/backend technologies, QA, DevOps, and agile team processes.

## Organization

The vault is organized strictly by technical discipline and workflow stages. Each major topic resides in its own dedicated folder (e.g., `architecture/`, `backend/`, `devops/`, `process/`), and almost every folder contains a `README` file, which likely serves as a Map of Content (MOC) or index for that specific domain.

Additionally, there is a `skeletons/` folder that houses templates (such as daily journals, interview structures, and GitHub READMEs) to standardize note creation. The presence of a `Home` note at the root suggests a central starting point linking out to the various domain-specific READMEs and sub-topics.

## Key Topics

- **Software Architecture & Design:** Domain-Driven Design (Strategic Design, Context Maps, Value Objects), Hexagonal Architecture, and engineering blueprints.
- **Agile & Team Processes:** Daily Scrum, asynchronous work, 1-on-1s, budget tracking, and interview frameworks.
- **Backend Development:** API design, event-driven hybrid systems, database schemas (DBSchemaSpy), and permission scopes.
- **DevOps & Infrastructure:** AWS (CLI, Cognito JWT, RDS PgDump), release tagging, and environment setups.
- **Software Development Life Cycle (SDLC):** Code review checklists, pair programming, Git workflows (Fugitive), and technical review priorities.
- **Quality Assurance:** Testing strategies, test doubles, API testing (Postman), and fuzzing.
- **Productivity & Note-Taking:** Time management frameworks (ABCDE Method, Eat That Frog), daily journaling, and accountability tracking.

## User Preferences

Based on the highly structured folder hierarchy and the use of `README` files as indices, the user prefers a highly organized, wiki-like approach to knowledge management. The presence of a `skeletons/` folder indicates a strong preference for consistency, standardization, and templated note creation.

The organizational structure leans toward a professional, pragmatic, and engineering-focused style. Responses should likely be concise, technically accurate, and structured with clear headings or bullet points. The agent should avoid unnecessary fluff and focus on actionable engineering, architectural, and management principles.

## Custom Instructions

- **Use READMEs as MOCs:** When exploring a topic, prioritize checking the `README` file in the relevant folder (e.g., `architecture/README`), as it likely contains the index or conceptual map for that domain.
- **Leverage Templates:** When asked to create a new note (such as an interview guide, daily journal, or task paper), utilize the templates found in the `skeletons/` folder to maintain structural consistency.
- **Maintain Technical Depth:** Assume a senior engineering or architectural context. Responses related to system design, APIs, or DDD should align with enterprise software development best practices.
- **Link Contextually:** When discussing SDLC or team processes, proactively suggest or create links to relevant architectural, backend, or testing standards found in the `qa/`, `sdlc/`, or `architecture/` folders.

## Tag-Based Organization (Replaces MOCs)

The user is transitioning away from rigid, folder-based "Map of Content" (MOC) notes (like `README` files) and prefers an Obsidian-style, tag-based approach. 

- **Use Tags for Discovery:** Instead of updating or linking to central `README` files, rely on YAML frontmatter tags (e.g., `#architecture`, `#backend`, `#sdlc`, `#agile`) to group related concepts.
- **Fluid Linking:** Notes should be interconnected using inline tags and `[[WikiLinks]]` based on their conceptual relationships rather than their physical folder location.
- **Deprecating MOCs:** Do not prioritize updating `README` files as MOCs. Instead, ensure new notes have robust tags in their frontmatter.
- **Home Note:** The `Home.md` file serves as a tag index or entry point for search, rather than a rigid directory tree.