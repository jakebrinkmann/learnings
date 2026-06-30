# Jobs to be Done (JTBD)

## Overview
The Jobs to be Done (JTBD) framework posits that users do not simply buy products or use features; instead, they "hire" them to fulfill a specific need and make progress in their lives. It shifts product development focus away from purely demographic-based [[Personas]] or ambiguous feature checklists, and toward the actual *struggles* and *desired outcomes* of the user.

## Core Concepts
A true "Job to be Done" is independent of demographics or specific technologies. It is typically defined by these core elements:
- **Struggling Moments**: The pain points, friction, or context that cause a user to seek a new solution.
- **Pushes and Pulls**: The forces that "push" a user away from their current solution (dissatisfaction) and "pull" them toward a new one (attraction to a better way). These are often countered by the forces holding the user back: *Habit* and *Anxiety*.
- **Desired Outcomes**: The progress, transformation, or end-state the user is trying to achieve.
- **Hiring and Firing**: Users "hire" a product when it successfully helps them make progress, and "fire" it when it fails to do so or introduces too much friction.

### The Jobs-as-Progress Model
Popularized by Alan Klement in *When Coffee and Kale Compete*, this model emphasizes that humans are goal-directed and driven by a desire for self-betterment. 
- **Progress over Tasks**: Tasks and activities are merely a means to an end. Customers want the end result (a "better me"), not the work required to get there.
- **Eliminating Friction**: True innovation is often about *eliminating* tasks rather than designing features for them. 

### Redefining Competition (Coffee vs. Kale)
Competition is defined by the Job, not the product category. Traditional business logic assumes a coffee company only competes with other coffee brands. However, if a customer's Job is *"Give me a healthy, energizing start to my morning,"* a cup of coffee and a green kale smoothie are in direct competition. Understanding this protects against "creative destruction" from unexpected outside innovations.

## Pragmatic Advice

### The 8-Step Universal Job Map (Product Discovery)
While the 3-step Job Story format is excellent for agile *execution*, Tony Ulwick’s **8-Step Universal Job Map** provides a higher-signal framework for product *discovery*. By breaking a job down into its complete lifecycle, it helps identify exactly where a user is struggling, rather than just focusing on the core execution phase.

1. **Define** (Determine goals/approach)
2. **Locate** (Gather tools/info)
3. **Prepare** (Set up the environment)
4. **Confirm** (Verify readiness)
5. **Execute** (Carry out the core task)
6. **Monitor** (Assess execution success)
7. **Modify** (Make adjustments)
8. **Conclude** (Finish and clean up)

**Why use this map?** Most engineering teams over-index on step 5 (Execute) and miss the actual struggling moments. The 8-step map forces you to look at the friction in the setup (Prepare) and tear-down (Conclude) phases. It provides massive signal for identifying where a user is *actually* struggling without adding bureaucratic noise.

### The Job Story
A highly pragmatic way to apply JTBD in agile software development is to replace traditional User Stories ("As a [persona], I want to [action], so that [outcome]") with **Job Stories**. Traditional user stories often fail because they focus on demographic personas and assumed features rather than causality and context.

The Job Story format focuses on the situation, motivation, and outcome:
> **When** [situation], **I want to** [motivation], **so I can** [expected outcome].

- **When (Situation):** Focuses on the context, triggering event, or struggling moment.
- **I want to (Motivation):** Focuses on the push/pull forces and what the user is actually trying to achieve.
- **So I can (Outcome):** Focuses on how the user's life improves and the progress they make.

By using this format, engineering teams design solutions around actual user struggles rather than arbitrary persona assumptions.

### Reconciling Jobs: The Market Definition Canvas
When defining a broader product strategy or architecture, you may encounter multiple competing "micro-jobs" across different features or complementary tools. Strategyn’s **JTBD Market Definition Canvas** provides a framework for reconciling and abstracting these into a unified market definition. 

In this model, a **Market** is explicitly defined as: *A group of people + the job they are trying to get done.*

To reconcile and abstract the core job, follow this process:
1. **Identify the Job Executor:** Who is the overarching group using the product?
2. **Catalog Product Functions:** What specific jobs do your product *and* complementary products get done?
3. **Abstract and Reconcile:** Synthesize these micro-jobs into an overarching "Abstracted Job Statement" that represents the ultimate core functional job the user is trying to accomplish.

**The Functional Job Syntax:**
To maintain precision, the framework mandates that all reconciled job statements must be written in a strict, functional format:
> **[Verb] + [Object of the verb] + [Contextual clarifier]**

*Example:* "Safely [Verb] deploy code [Object] to production without downtime [Contextual clarifier]."

This abstraction forces teams to step back from product-specific features and focus on the overarching outcome, ensuring conceptual integrity when prioritizing architectural decisions.

## Application in Software Engineering
In software architecture and engineering, JTBD provides a strong foundation for building solutions with true conceptual integrity:
- **[[Spec-Driven-Development]]**: Identifying the JTBD and Core Intent is the very first step in the kick-off plan. It ensures the engineering team understands the *why* before sketching UI or writing code.
- **Requirements Engineering**: Shifts the conversation from "What features do you want?" to "What progress are you trying to achieve?" This helps prevent feature bloat.
- **[[Architecture Advice Process]]**: When proposing architectural changes, understanding the underlying "job" (e.g., *I need a way to rapidly deploy isolated test environments so I can verify my code without breaking staging*) helps clarify the value proposition of the decision.

## References
- [When Coffee and Kale Compete (Alan Klement)](https://www.whencoffeeandkalecompete.com/)
- [The Complete Guide to Jobs to be Done (Rewired Group)](https://therewiredgroup.com/learn/complete-guide-jobs-to-be-done/)
- [The Jobs to be Done Playbook (Jim Kalbach)](https://jobs-to-be-done-book.com/)
- [Replacing The User Story With The Job Story (Alan Klement)](https://jtbd.info/replacing-the-user-story-with-the-job-story-af7cdee10c27)
- [Strategyn JTBD Market Definition Canvas](https://strategyn.com/wp-content/uploads/2024/06/Strategyn_JTBD-Market-Definition_Canvas.pdf)
- The 8-Step Universal Job Map (Tony Ulwick / Strategyn)