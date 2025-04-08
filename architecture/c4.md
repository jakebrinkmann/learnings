http://www.codingthearchitecture.com/2017/04/27/visualising_and_documenting_software_architecture_cheat_sheets.html

https://github.com/arc42/arc42-template

Context

A high-level diagram that sets the scene; including key system dependencies and people (actors/roles/personas/etc). Context diagrams are standard in software engineering (even if not used often).

Container

A container diagram shows the high-level technology choices, how responsibilities are distributed across them and how the containers communicate.

Component

For each container, a component diagram lets you see the key logical components and their relationships. 4.

Classes (or Code)

This is optional and is the lowest level of detail.

# [The C4 model for visualising software architecture](https://c4model.com/)

Level 1: A System Context diagram provides a starting point,
          showing how the software system in scope fits into the world around it.

Level 2: A Container diagram zooms into the software system in scope,
          showing the high-level technical building blocks.

Level 3: A Component diagram zooms into an individual container,
          showing the components inside it.

Level 4: A code (e.g. UML class) diagram can be used to zoom into an individual component,
          showing how that component is implemented.
