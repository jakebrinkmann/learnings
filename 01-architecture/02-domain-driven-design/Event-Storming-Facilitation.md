---
tags: [architecture, ddd, discovery, agile]
---
# Event Storming Facilitation

**Goal:** Map Domain Events over time to build a shared understanding between Business and Engineering.

### Setup Checklist
- [ ] Domain Experts (Business) + Tech Experts (Eng)
- [ ] Massive wall paper or digital canvas (Miro/FigJam)
- [ ] Sticky notes & markers
- [ ] **NO** laptops/phones. Everyone stands.

### Sticky Note Legend (Merged Standard)
*We use a hybrid approach combining the `wwerner` cheatsheet with traditional Brandolini Event Storming (retaining Purple for Policies).*

- 🟧 **Orange**: `Domain Event` (Past tense: `OrderPlaced`)
- 🟦 **Light Blue**: `Command` (Action: `PlaceOrder`)
- 🟨 **Yellow**: `Aggregate` (State boundary: `Order`)
- 🟥 **Red**: `Issue / Hotspot` (Conflict, risk, unknown, disagreement)
- 🟪 **Purple**: `Policy` (Business rule, automated process, or listener that reacts to an Event and triggers a Command)
- 🟨👤 **Yellow with Stick Figure**: `User Role / Persona` (Actor triggering the command)
- 🟩 **Green**: `View / Read Model` (Data required for UI/decisions)
- 🩷 **Pink**: `Bounded Context Name` (Used as labels for context boundaries)
- ➖ **Solid Line**: `Bounded Context Boundary`
- 〰️ **Dashed Line**: `Subdomain Boundary`
- ➡️ **Arrows**: `Event Flow`

*(Note: If you need to map External Systems, traditional Brandolini uses Pink for that as well. You may need to use a distinct shade of Pink or another color if both are heavily used).*

### The 5 Phases

1. **Chaotic Exploration**
   - Brain dump 🟧 Events. 
   - No strict order. Everyone writes simultaneously.

2. **Enforce Timeline**
   - Sort 🟧 Events left-to-right (chronological) using ➡️ **Arrows** for Event Flow. 
   - Eliminate duplicates. Find missing steps.

3. **Reverse Narrative**
   - Walk right-to-left to validate logic ("For `OrderShipped` to happen, what must happen first?").

4. **Add Triggers, Views & Policies**
   - Attach 🟦 Commands, 🟨👤 User Roles, and 🟩 Views to the Events.
   - Identify 🟪 Policies (automated rules/processes) that bridge Events to new Commands.
   - Mark any friction points or questions with 🟥 Issues.

5. **Extract Boundaries**
   - Group related concepts into 🟨 Aggregates. 
   - Draw ➖ **Solid Lines** around Bounded Contexts and label them with 🩷 **Pink** notes.
   - Draw 〰️ **Dashed Lines** to represent broader Subdomains.