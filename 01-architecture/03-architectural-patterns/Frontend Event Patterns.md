---
tags: [architecture, events, frontend]
---
# Frontend Event Patterns

### DOM: Event Bubbling
When an event triggered by a child element travels *up* through the DOM hierarchy.

### Component Lifecycle (e.g., React)
- **State vs Props**: State is private/controlled by the component. Props are passed down from parent.
- **Data Flow**: "Top-down" or "unidirectional".
- **Mental Model**: Component tree is a waterfall of props; local state is an additional water source joining at an arbitrary point.
- **Cleanup**: Crucial to free up resources when components are destroyed or unmounted.