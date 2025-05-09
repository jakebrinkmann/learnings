# [Feature Driven Development]()

  - Develop an overall model:
    - Team members and experts work together to create a "walk-though" version of the system.
  - Build a features list:
    - a collection of features representing the system. Features are small items useful in the eyes of the client, written in a language understandable by all parties.
  - Plan by feature:
    - prioritized into subsections called "design packages" (sequences)
  - (iterative) Design by feature & build by feature:
    - features are then planned in more detail, built, tested, and integrated.

```plantuml
component "Develop an Overall Model" as A
component "Build a Features List" as B
component "Plan by Feature" as C
frame {
  component "Design by Feature" as D
  component "Build by Feature" as E
}

A --> B
note left of A: More shape than content
B --> C
note left of B: categorized list of features
C --> D
note left of C: A development plan
D --> E
note left of D: More content than shape
```

we got epics. Then we derive stakeholder requirements, then features, then use cases, then user stories.
  - Insight - Interpretation: What led us to believe this was a MEANINGFUL problem to design for?
  - Job Story - Motivation: What is the MOTIVATION behind their behavior?
  - User Story - Implementation: What SPECIAL use cases do we need to consider?

# new-feature

Implement (e.g. Implement POST /api/v1/users) Create endpoint (e.g. Create endpoint POST /api/v1/users)

Features are defined using a Features and Benefits (FAB) Matrix:

Feature – A short phrase giving a name and context

Benefit hypothesis – The proposed measurable benefit to the end user or business

Acceptance criteria are used to determine whether the implementation is correct and delivers the business benefits.

Capabilities must be decomposed into features to be implemented. They, in turn, are split into stories consumable by teams within an iteration.