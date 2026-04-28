---
tags: [architecture, layers, history]
---
# Architectural Layers and Evolution

### Timeline
- **< 1995**: SOLID Monolith
- **1995 - 2010**: Horizontally Layered
- **2010+**: Decoupled / Independent

### Standard 5-Tier Layered Architecture
Separation of concerns from user to disk.
1. **User Interface / Presentation Layer**: Renders UI, handles user inputs.
2. **Application / Service / Functionality Layer**: Orchestrates domain objects, handles business use cases.
3. **Domain Model / Business Rules Layer**: Core enterprise logic, entities, and rules.
4. **Infrastructure / Integration Layer**: External APIs, message brokers, email services.
5. **Data Access / Persistence Layer**: Database interactions, ORMs, raw storage.