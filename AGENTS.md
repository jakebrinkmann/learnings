# AGENTS.md

This file provides context about this Obsidian vault for AI agents.

## Vault Overview

This vault serves as a comprehensive personal knowledge base and professional reference for software engineering, system architecture, and technical team management. It covers the full Software Development Life Cycle (SDLC), ranging from high-level Domain-Driven Design (DDD) and architectural patterns down to specific backend technologies, DevOps, agile team processes, and emerging AI/LLM tooling.

The content reflects a senior engineering perspective, focusing on enterprise software development, robust system design, and pragmatic team leadership.

## Organization

The vault uses a **Hybrid Structure** designed to be both "File System Apparent" (navigable in VS Code, GitHub, or Finder) and "Obsidian Native" (fluidly connected via tags and links). 

Instead of a massive, flat `Notes/` directory or a hyper-nested hierarchy, notes are organized into broad, shallow, high-level "Area" folders that immediately communicate the vault's domains to an outside observer:
- `architecture/` (System design, EAR, Structurizr, DDD)
- `engineering/` (Backend, APIs, DevOps, AI tooling)
- `management/` (1-on-1s, Agile processes, Interviews)
- `skeletons/` (Templates for standardized note creation)
- `journal/` (Daily logs, time management)

The `Home.md` note at the root serves as a central starting point and tag index, bridging the folder structure with Obsidian's native discovery features.

## Key Topics

- **Software Architecture & Design:** Domain-Driven Design (Strategic Design, Context Maps, Value Objects), Architecture-as-Code, and Structurizr tooling.
- **Backend Development:** API design, event-driven hybrid systems, and API documentation.
- **Agile & Team Processes:** 1-on-1s, asynchronous work, and interview frameworks.
- **Productivity & Note-Taking:** Time management frameworks (ABCDE Method), daily journaling, and accountability tracking.
- **AI & Emerging Tech:** LLM hackathons and Jupyter workstation setups for local AI workflows.
- **DevOps, QA, & SDLC:** Testing strategies, release tagging, code reviews, and Git workflows.

## User Preferences

The organizational structure leans toward a professional, pragmatic, and engineering-focused style. Responses should be concise, technically accurate, and structured with clear headings or bullet points. Avoid unnecessary fluff and focus on actionable engineering, architectural, and management principles.

The user strongly prefers consistency, standardization, and templated note creation, as evidenced by the `skeletons/` folder. The user wants a system that makes sense natively in Obsidian but is immediately apparent to external viewers browsing the raw file system.

## Custom Instructions

- **Hybrid Placement:** When creating new notes, place them in the appropriate broad "Area" folder (e.g., `architecture/`, `engineering/`) rather than a generic `Notes/` folder so the repository makes sense to external viewers.
- **Use Tags for Discovery:** Rely on YAML frontmatter tags (e.g., `#architecture`, `#backend`, `#sdlc`, `#agile`) to group related concepts across folders.
- **Fluid Contextual Linking:** Notes should be interconnected using inline tags and `[[WikiLinks]]` based on their conceptual relationships regardless of their physical folder location. When discussing SDLC or team processes, proactively suggest or create links to relevant architectural, backend, or testing standards.
- **Leverage Templates:** When asked to create a new note (such as an interview guide, daily journal, or task paper), utilize the templates found in the `skeletons/` folder to maintain structural consistency.
- **Maintain Technical Depth:** Assume a senior engineering or architectural context. Responses related to system design, APIs, or DDD should align with enterprise software development best practices.
- **Deprecating MOCs:** Do not prioritize updating `README` files as MOCs. Ensure new notes have robust tags in their frontmatter and rely on the `Home.md` file as a tag index or entry point for search.