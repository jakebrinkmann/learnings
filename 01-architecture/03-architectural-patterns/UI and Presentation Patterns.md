---
tags: [architecture, frontend, patterns, ui]
---
# UI and Presentation Patterns

### ELM Architecture
Simple, deterministic state management.
- **Model**: The state of your application.
- **Update**: A way to update your state (messages/actions).
- **View**: A way to view your state as HTML.

### MVC (Model-View-Controller)
Classic separation of concerns.
- **Model**: Data and business logic.
- **View**: UI presentation.
- **Controller**: Handles input, updates Model, updates View.

### ADDS (Action Delegate Delegatee viewState)
- **Action**: The triggering event.
- **Delegate**: The handler/coordinator.
- **Delegatee**: The worker performing the task.
- **viewState**: The resulting state bound to the UI.