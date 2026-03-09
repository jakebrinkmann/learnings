---
tags: "[architecture, hexagonal]"
---
# Hexagonal architecture 

## [hexagonal-layers](http://tpierrain.blogspot.com/2016/04/hexagonal-layers.html)
### (a.k.a. ports & adapters) #DDD-friendly

> **the hexagonal architecture was designed to prevent the infiltration of the business logic into the UI code**

And like with any pattern, **it is much more interesting** to remember the intent / the problem to be solved than the solution. Otherwise *there is a risk* we use it because we know it instead of using it because it fulfills to our need...

```
 ┌──────────────────────┬────────────────┐
 │ *Class*              │ *Collaborator* │
 │   Layer J            │  - Layer J-1   │
 ├──────────────────────┤                │
 │ *Responsibility*     │                │
 │ - provides services  │                │
 │   used by Layer J+1  │                │
 │ - delegates subtasks │                │
 │   to Layer J-1       │                │
 │                      │                │
 └──────────────────────┴────────────────┘
```

in real life, you can usually count the number of layers within an application by knowing the number of tech leads previously involved on the project ;-) Leading to what we called a "Baklava architecture" (anti-pattern).

- **the inside** (i.e. the business application logic)  
- **the outside** (i.e. the infrastructure code like the APIs, the SPIs, the databases, etc.).

Two distinct areas of our code with adapters positioned in what looks like a DMZ to protect the domain code from the infrastructure one. We just have to rely on the Dependency Inversion Principle (DIP) and the Repository pattern to prevent the domain code to be binded to the infrastructure code when it want to get some information outside, and voila!

- **the "port"** describes the intention
- **the "Adapter"** is the code that bridges the 2 separated worlds

## DDD Perspective (Application / Team Level)
- The world divides in two categories: **DOMAIN** (inside), **INFRA** (outside; Http, Db...).
- Isolate the domain model from the infrastructure.

```
+--------+----------+-----+
| APP UI | DATABASE | ... |
+--------+----------+-----+
|         DOMAIN          |
+-------------------------+
```

<img width="1268" alt="image" src="https://user-images.githubusercontent.com/4110571/282518524-bf411cc9-db5b-4ba5-b2ef-39470e322d88.png">
<img width="1207" alt="image" src="https://user-images.githubusercontent.com/4110571/282518603-de930925-90b5-4f17-a398-50b2193211d8.png">
<img width="1213" alt="image" src="https://user-images.githubusercontent.com/4110571/282518659-e91f49af-9ed6-4868-b45c-58fb704fb5be.png">
<img width="1149" alt="image" src="https://user-images.githubusercontent.com/4110571/282518724-e984d7bf-e4d7-4294-9277-657398d0b26d.png">
