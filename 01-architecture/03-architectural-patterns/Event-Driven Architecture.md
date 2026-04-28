---
tags: [architecture, events, moc]
---
# Event-Driven Architecture (MOC)

> "Why try to remember all systems to send info to? Throw an event out; any system who wants it can grab it."

**Core Philosophy**: Decoupling. Services are aware of the event router, not each other.
**Flow**: Emitters (detect) -> Channels/Routers (transmit) -> Consumers (react).
**Nature**: Push-based, on-demand.

## MOC
- [[Message vs Event vs Command]]: Primitives, definitions, and directedness.
- [[Event Design and Naming Conventions]]: Payloads, metadata, and standardization.
- [[Event Sourcing]]: Events as the single source of truth for application state.
- [[Event-Driven Domain Design (DDD)]]: Bounded contexts and event storming.
- [[Frontend Event Patterns]]: UI-specific paradigms (DOM, React).
- [[Event-Driven Implementation Examples]]: Code, payloads, and architectural tables.