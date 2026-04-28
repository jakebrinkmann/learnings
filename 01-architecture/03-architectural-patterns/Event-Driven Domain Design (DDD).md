---
tags: [architecture, events, ddd]
---
# Event-Driven Domain Design (DDD)

> "Modeling events forces you to think about system behavior, not just structure." - Greg Young

### Core Concepts
- **Bounded Contexts**: Microservices boundaries. Choreographed process flows.
- **Event Storming**: Context -> Operation -> Context -> Operation.
- **Domain Event**: Simple object representing an interesting domain occurrence.
- **Operation**: Relates to a domain concept but isn't a natural part of an Entity/Value object.

### Data Structures
- **Aggregate**: Group acting as a unit for data changes ("Root" member).
- **Entity**: Has unique identifier. State can change.
- **Value Object**: Just a value, no identity.