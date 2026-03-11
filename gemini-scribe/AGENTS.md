# AGENTS.md

This file provides context about this Obsidian vault for AI agents.

## Vault Overview

This vault serves as a comprehensive personal knowledge base and professional reference for software engineering, system architecture, and technical team management. It covers the full Software Development Life Cycle (SDLC), ranging from high-level Domain-Driven Design (DDD) and architectural patterns down to specific backend technologies, DevOps, agile team processes, and emerging AI/LLM tooling.

The content reflects a senior engineering perspective, focusing on enterprise software development, robust system design, and pragmatic team leadership.

## Organization

The vault is currently transitioning from a strict folder-based hierarchy to a flatter, tag-based knowledge management system. The vast majority of concepts and references (over 120 files) now reside in a centralized `Notes/` directory, interconnected via tags and WikiLinks.

However, specific complex domains maintain a structured hierarchy, most notably the `architecture/` folder, which contains dedicated subfolders for `DDD/` and `Tooling/`. Additionally, a `skeletons/` folder houses templates (such as daily journals, interview structures, and GitHub READMEs) to standardize note creation.

The `Home` note at the root serves as a central starting point and tag index, linking out to various topics via YAML frontmatter tags rather than rigid directory trees.

## Key Topics

- **Software Architecture & Design:** Domain-Driven Design (Strategic Design, Context Maps, Value Objects), Architecture-as-Code, and Structurizr tooling.
- **Backend Development:** API design, event-driven hybrid systems, and API documentation.
- **Agile & Team Processes:** 1-on-1s, asynchronous work, and interview frameworks.
- **Productivity & Note-Taking:** Time management frameworks (ABCDE Method), daily journaling, and accountability tracking.
- **AI & Emerging Tech:** LLM hackathons and Jupyter workstation setups for local AI workflows.
- **DevOps, QA, & SDLC:** Testing strategies, release tagging, code reviews, and Git workflows.

## User Preferences

The organizational structure leans toward a professional, pragmatic, and engineering-focused style. Responses should be concise, technically accurate, and structured with clear headings or bullet points. Avoid unnecessary fluff and focus on actionable engineering, architectural, and management principles.

The user strongly prefers consistency, standardization, and templated note creation, as evidenced by the `skeletons/` folder. Furthermore, the user has explicitly shifted towards an Obsidian-style, tag-based approach for discovery rather than relying on strict folder-based Maps of Content (MOCs).

## Custom Instructions

- **Use Tags for Discovery:** Instead of updating or linking to central `README` files or MOCs, rely on YAML frontmatter tags (e.g., `#architecture`, `#backend`, `#sdlc`, `#agile`) to group related concepts.
- **Fluid Contextual Linking:** Notes should be interconnected using inline tags and `[[WikiLinks]]` based on their conceptual relationships rather than their physical folder location. When discussing SDLC or team processes, proactively suggest or create links to relevant architectural, backend, or testing standards.
- **Leverage Templates:** When asked to create a new note (such as an interview guide, daily journal, or task paper), utilize the templates found in the `skeletons/` folder to maintain structural consistency.
- **Maintain Technical Depth:** Assume a senior engineering or architectural context. Responses related to system design, APIs, or DDD should align with enterprise software development best practices.
- **Deprecating MOCs:** Do not prioritize updating `README` files as MOCs. Ensure new notes have robust tags in their frontmatter and rely on the `Home.md` file as a tag index or entry point for search.
