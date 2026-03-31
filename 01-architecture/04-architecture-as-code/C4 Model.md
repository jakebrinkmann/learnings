---
tags: [architecture, c4, diagrams, modeling]
---
# C4 Model

[The C4 model for visualising software architecture](https://c4model.com/)
[Cheat Sheets](http://www.codingthearchitecture.com/2017/04/27/visualising_and_documenting_software_architecture_cheat_sheets.html)
[arc42 Template](https://github.com/arc42/arc42-template)

## 1. The "Why" (Sociotechnical Context)
- **Maps of your code:** Google Maps for architecture. Zoom in/out based on audience.
- **Shared Understanding:** Bridges business, product, and engineering.
- **Diagramming vs. Modeling:** 
  - *Diagramming:* Static, rots quickly, forces explaining the gap between drawing and reality.
  - *Modeling:* Single source of truth. Changes propagate automatically (e.g., IcePanel). *Knowledge > Information.*

## 2. The 4 Levels (Quick Reference)

### Level 1: Context (Scope: In your company)
- **Focus:** The big picture. Scope and boundaries.
- **Elements:** People (actors), external software systems, the system itself (black box).
- **Audience:** Execs, Product, Tech. 
- **Integration:** Maps to `[[arc42]]` Section 3 (System Scope & Context).

### Level 2: Container (Scope: In a system)
- **Focus:** High-level tech choices, deployable/runnable units.
- **Elements:** Apps, APIs, micro-frontends, databases, external SaaS.
- **Heuristics:** 
  - *Deployability is the boundary:* If it runs/scales independently, it's a container.
  - *Databases are 1st-class containers:* They have runtime/scaling concerns.
  - *Map to teams:* Subdomains clarify ownership (Conway's Law / Team Topologies).
- **Audience:** Product, Tech.
- **Integration:** Maps to `[[arc42]]` Section 5 (Building Block View - Level 1).

### Level 3: Component (Scope: In a container)
- **Focus:** Internal building blocks and interactions.
- **Elements:** Controllers, services, repositories, adapters.
- **Heuristics:** Use selectively (complex business logic, critical services). Keep it conceptual.
- **Audience:** Tech (Architects & Devs).
- **Integration:** Maps to `[[arc42]]` Section 5 (Building Block View - Level 2).

### Level 4: Code (Scope: In a component)
- **Focus:** Implementation details (classes, functions).
- **Heuristics:** Rarely needed. Rots instantly. *Better approach:* Link directly to the source repo instead of drawing it.
- **Audience:** Devs.

## 3. Best Practices & Heuristics
- **Tailor to audience:** Execs don't need components; devs need more than context.
- **Annotate everything:** Every container needs *Technology* (e.g., Node.js, DynamoDB) and *Responsibility* (e.g., "Stores order details"). No bare boxes.
- **External systems matter:** Model SaaS (Stripe, Twilio) as containers—they affect resilience and team responsibilities.
- **Start Top-Down:** Context -> Container -> Component (only if needed).
- **Interactive > Static:** Walk through flows (user journeys) rather than just showing wiring.

## 4. C4 Diagram Review Checklist
- [ ] Diagram has a clear and descriptive name.
- [ ] Short description explains what the diagram represents and its purpose.
- [ ] All objects are named clearly (acronyms expanded/explained).
- [ ] Object responsibilities are self-explanatory or supported by displayed descriptions.
- [ ] Relationships (connections) are labeled to indicate intent or flow.
- [ ] Notation and symbols are explained via a legend.
- [ ] Shapes, line styles, borders, arrows, and colors are used consistently/meaningfully.
- [ ] Object sizes are proportional to their importance/hierarchy.
- [ ] Diagram shows the *right* level of detail for the intended audience.
- [ ] Intended audience can understand the diagram *without* additional explanation.