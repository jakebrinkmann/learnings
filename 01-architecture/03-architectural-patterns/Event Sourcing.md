---
tags: [architecture, events, event-sourcing]
---
# Event Sourcing

**Core Concept**: State is a derivative of events. 

- Every change is captured and stored as an immutable event.
- To get current state: Start with nothing (empty state) -> Apply every historical change event -> Result is current state.
- **Benefit**: You can simply take a copy of the application state, feed it a stream of events, and run with it. Rebuilding your entire database is just replaying the event log.