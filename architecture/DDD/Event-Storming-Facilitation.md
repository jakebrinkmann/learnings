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

### Sticky Note Legend
- 🟧 **Orange**: `Domain Event` (Past tense: `OrderPlaced`)
- 🟦 **Blue**: `Command` (Action: `PlaceOrder`)
- 🟨 **Yellow**: `Aggregate` (State boundary: `Order`)
- 🟪 **Purple**: `Policy` (Reactive rule: "When X, do Y")
- 🟩 **Green**: `Read Model` (Data for UI/decisions)
- 👤 **Cyan**: `Actor` (User role)
- 🩷 **Pink**: `External System` (Stripe, Salesforce)
- 🟥 **Red**: `Hotspot` (Conflict, risk, unknown, disagreement)

### The 5 Phases

1. **Chaotic Exploration**
   - Brain dump 🟧 Events. 
   - No strict order. Everyone writes simultaneously.

2. **Enforce Timeline**
   - Sort 🟧 Events left-to-right (chronological). 
   - Eliminate duplicates. Find missing steps.

3. **Reverse Narrative**
   - Walk right-to-left to validate logic ("For `OrderShipped` to happen, what must happen first?").

4. **Add Triggers**
   - Attach 🟦 Commands, 👤 Actors, 🩷 Systems, and 🟪 Policies to the Events.

5. **Extract Boundaries**
   - Group related concepts into 🟨 Aggregates. 
   - Draw Bounded Context lines around linguistic shifts (e.g., where a "User" becomes a "Customer").
