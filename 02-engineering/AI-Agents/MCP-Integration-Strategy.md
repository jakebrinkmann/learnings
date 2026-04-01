---
tags:
  - engineering
  - ai-agents
  - architecture
  - mcp
  - security
---

# Model Context Protocol (MCP) Integration Strategy

*Established: 4/1/2026*

> **MANDATE:** MCP is the universal bridge for tool and data access. Never give an LLM direct API keys. Route all access through MCP servers for least privilege. See [[AI-Architecture-Principles#The Limbs (Connectivity)]].

## The Problem: Ad-Hoc Connectivity
Historically, our AI agents have relied on ad-hoc, manual connectivity. We've used CLI piping (`llm`, `curl`, `jq`), manual slash commands, and context-stuffing via `repomix` to feed data into the LLM. 
This approach does not scale and violates the principle of **Deterministic Limbs**—custom integrations are brittle, and directly giving LLMs API keys is a massive security risk.

## The Solution: MCP (Model Context Protocol)
MCP unifies how the "Probabilistic Core" (the LLM) interacts with the "Deterministic Limbs" (our systems, databases, and APIs).

### Engineering Mandates for MCP

1. **Standardized Connectivity over Custom Integrations**
   * All future agent architectures must use standardized MCP servers to connect to local files, databases, or external APIs seamlessly. 
   * Do not write custom Python/Bash wrappers for API calls if an MCP server exists.

2. **Swarm Security & Least Privilege**
   * **Never give the LLM direct API keys.** 
   * Credentials must be stored strictly within the MCP server.
   * The orchestrator must strictly filter which tools/MCP endpoints are exposed to the LLM based on its current role in the Swarm (Supervisor vs. Worker). E.g., the `drift-auditor` should only have read access to the Enterprise Architecture Repository (EAR) via MCP, while the `autonomous-developer` might have write access to specific branches.

3. **Bridging the State Gap**
   * Use MCP servers to interface with our Externalized Memory systems. 
   * Instead of stuffing context, the agent should query the **GraphRAG** database (for relational mapping of Bounded Contexts) or the **Vector RAG** database (for factual lookups) dynamically via MCP tools.

## Implementation Plan
- [ ] Stand up an MCP server for our Enterprise Architecture Repository (EAR).
- [ ] Migrate the `/historian` and `/gap-analysis` commands (from [[Principal-Architect-Agent-Prompt]]) to use MCP for querying the `domain.fs` and Gherkin specs instead of relying on `repomix` context stuffing.
- [ ] Audit all existing LLM scripts (e.g., those in [[llm-hackathon]]) to remove hardcoded API/data access and replace them with MCP client calls.