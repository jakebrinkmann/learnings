---
tags: [ai-agents, architecture, principles]
---
# AI Architecture Principles

*Established: 4/1/2026*

This document outlines the core principles for building Agentic Systems, based on the Macro-Map of Agentic Systems research.

## 1. The Engine (Stateless Core)
LLMs are stochastic text predictors with no true logic.
* **Structured Outputs:** Always enforce JSON Schema constraints at the API level. Do not rely on prompt engineering for syntax.
* **Temperature:** Set to 0.0 when routing or calling tools.
* **Deterministic Limbs:** Offload all deterministic tasks (math, sorting, logic checks) to code (e.g., Python, F#).

## 2. The Loop (Orchestration)
The LLM does not know it is looping. Agency is an illusion built via programmatic `while` loops (ReAct).
* **Weaponize Errors:** Wrap tools in try/except blocks. Inject raw errors back into context so the LLM can self-correct.
* **Circuit Breakers:** Hard-code maximum iteration limits (e.g., 5 loops) to prevent runaways.

## 3. Memory & Context (RAG vs GraphRAG)
More context dilutes attention ("Lost in the Middle"). Avoid context stuffing (e.g., dumping whole repositories via `repomix`).
* **Factual Lookups:** Use Vector RAG with strict semantic chunking and top 3-5 results.
* **Complex Relationships:** Use **GraphRAG** (Nodes/Edges) to deterministically map Bounded Contexts and Aggregate Roots.
* **Massive Synthesis:** Use Map-Reduce (parallel LLM calls to summarize chunks, then summarize the summaries).

## 4. The Limbs (Connectivity)
Custom integrations don't scale.
* Use the [[MCP-Integration-Strategy|Model Context Protocol (MCP)]] as the universal bridge for tool and data access.

## 5. The Swarm (Multi-Agent Routing)
Swarms prevent single-agent context degradation but multiply hallucination risks.
* **Supervisor/Manager Pattern:** Use lightweight models to route tasks to specialized worker models.
* **Context Isolation:** Never pass the entire conversation history during a handoff. Summarize the exact state/variables needed.