---
tags:
  - architecture
  - archimate
  - ddd
  - c4-model
  - enterprise-architecture
---
# Enterprise Architecture Layers

When mapping business goals to technical implementations, Enterprise Architecture frameworks (like ArchiMate) divide the enterprise into distinct, color-coded layers. This helps clarify *why* a system is being built, *how* it runs, and *where* specific design disciplines (like Domain-Driven Design) belong.

## The ArchiMate Stack (Top to Bottom)

### 🟪 The Motivation Layer (Purple)
Before defining bounded contexts or writing code, this layer answers the **Why**.
* **Business Goal:** A high-level corporate objective (e.g., "Increase fulfillment speed by 20%").
* **IT Goal:** The technical objective required to support the business (e.g., "Migrate legacy order system to a highly available cloud architecture").

### 🟨 The Business Layer (Yellow)
Defines the **Business Services** offered to customers or other departments, and the internal **Business Processes** executed to deliver them.

### 🟦 The Application Layer (Blue)
This is where software lives. It defines the **Application Services** (APIs or capabilities exposed) and the **Application Components** (deployable software).
* **Where DDD Fits:** Domain-Driven Design lives entirely in this layer. This is where your Bounded Contexts, Aggregates, and Domain Events are realized.

### 🟩 The Technology Layer (Green)
The physical or virtual infrastructure (servers, databases, Kubernetes clusters) that the Application Components are deployed on.

### 🟪 The Implementation & Migration Layer (Pink)
The actual funded projects or work packages (e.g., "Business Transformation Project", "IT Development Sprint") spun up to achieve the Motivation goals.

---

## ArchiMate vs. C4 Model (Structurizr)

Understanding these layers helps architects choose the right tool for the job:

* **ArchiMate (The Big Picture):** Uses ~60 different elements to trace an enterprise initiative all the way down to a physical server. It maps how a perfectly crafted DDD aggregate (Blue) runs on a specific server (Green) to satisfy a corporate initiative (Purple). It is incredible for holistic impact analysis but can feel rigid and heavy for day-to-day software design.
* **C4 Model / Structurizr (Day-to-Day Design):** A lightweight abstraction focused *purely* on software architecture (the Blue and Green layers). It is the preferred tool for modeling the actual DDD aggregates, bounded contexts, and component interactions without the overhead of the full enterprise stack.