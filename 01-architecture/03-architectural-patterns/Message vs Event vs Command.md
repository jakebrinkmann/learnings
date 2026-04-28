---
tags: [architecture, events, patterns]
---
# Message vs Event vs Command

Theoretical hierarchy:
`Message` -> `Event` | `Request` -> `Query` | `Command`

### Message
Generic domain packet of info (fact or request).
- Differentiates how communication is handled without dictating intent.

### Event
Something that *happened* (past tense).
- **Immutable**: Cannot be rejected (but can be ignored).
- **Stateless Notification**: "Something changed." (Consumers must query the source for latest state).
- **Event Carried State Transfer**: "Here is the new state." (Fat payload; consumer doesn't need to query).
- **Directedness**: Observable, not directed. Producer is the source of truth.

### Command
Intent to perform an action (near future).
- **Directedness**: Typically 1:1 (Producer -> Consumer).
- **Mutable**: Can be rejected or fail.
- **Naming**: Imperative Verb (e.g., `CreateOrder`).

### Audit / Query
Publish an object's state for eventual consistency in consumer caches. Fetching state without modifying it.