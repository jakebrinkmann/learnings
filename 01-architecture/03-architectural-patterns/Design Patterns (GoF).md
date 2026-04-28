---
tags: [architecture, patterns, gof, design]
---
# Design Patterns (GoF)

Reference: [Refactoring Guru](https://refactoring.guru/design-patterns)

### Creational
Object creation mechanisms to increase flexibility and reuse.
- **Abstract Factory**: Families of related objects.
- **Builder**: Step-by-step creation of complex objects.
- **Factory Method**: Interface for creating objects in a superclass.
- **Prototype**: Copy existing objects without coupling to their classes.
- **Singleton**: Ensure a class has only one instance.

### Structural
Assembling objects and classes into larger structures while keeping them flexible.
- **Adapter**: Incompatible interfaces collaborate.
- **Bridge**: Split large classes into two separate hierarchies.
- **Composite**: Compose objects into tree structures.
- **Decorator**: Attach new behaviors to objects dynamically.
- **Facade**: Simplified interface to a complex library.
- **Flyweight**: Share common state between multiple objects (save RAM).
- **Proxy**: Substitute/placeholder to control access to another object.

### Behavioral
Algorithms and assignment of responsibilities between objects.
- **Chain of Responsibility**: Pass requests along a chain of handlers.
- **Command**: Turn a request into a stand-alone object.
- **Iterator**: Traverse elements of a collection without exposing underlying representation.
- **Mediator**: Restrict direct communications between objects (force via mediator).
- **Memento**: Capture and restore object state.
- **Observer**: Subscription mechanism for state changes.
- **State**: Alter behavior when internal state changes.
- **Strategy**: Define a family of interchangeable algorithms.
- **Template Method**: Define skeleton of an algorithm in superclass.
- **Visitor**: Separate algorithms from the objects on which they operate.