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

## Pragmatic Advice: The Job Story
A highly pragmatic way to apply JTBD in agile software development is to replace traditional User Stories ("As a [persona], I want to [action], so that [outcome]") with **Job Stories**. Traditional user stories often fail because they focus on demographic personas and assumed features rather than causality and context.

The Job Story format focuses on the situation, motivation, and outcome:
> **When** [situation], **I want to** [motivation], **so I can** [expected outcome].

- **When (Situation):** Focuses on the context, triggering event, or struggling moment.
- **I want to (Motivation):** Focuses on the push/pull forces and what the user is actually trying to achieve.
- **So I can (Outcome):** Focuses on how the user's life improves and the progress they make.

By using this format, engineering teams design solutions around actual user struggles rather than arbitrary persona assumptions.

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