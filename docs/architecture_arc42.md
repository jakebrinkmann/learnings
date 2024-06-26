
```
# Introduction & Goals
- Fundamental requirements esp. quality goals

# Constraints
- 

# Context & Scope
- External Systems & Interfaces

# Solution Strategy
- Core ideas and solution approaches

# Building Block View
- Structure of source code, modularization (hierarchical)

# Runtime View
- important runtime scenarios

# Deployment View
- Hardware, infrastructure, & deployment

# Crosscutting Concepts
- Topics often very technical and detailed

# Architectural Decisions
- Important decisions (links to description elsewhere)

# Quality Requirements
- Quality tree, quality scenarios

# Risks & Technical Debt
- Known problems & risks

# Glossary
- Important and specific terms ("ubiquitous language")
```

---

<!-- https://github.com/arc42/arc42-template/tree/master/EN/asciidoc/src -->

```bash
cd $NEW_PROJECT_DIR
git clone --no-checkout --depth 1 https://github.com/arc42/arc42-template/ docs/
cd docs/
git checkout master -- EN/asciidoc/src/
mv EN/asciidoc/src/??_*.adoc .
rm -rf .git EN
```

##  1. [Introduction and Goals](https://docs.arc42.org/section-1)

Describes the relevant requirements and the driving forces that software architects and development team must consider. 
These include

* underlying business goals, 
* essential features, 
* essential functional requirements, 
* quality goals for the architecture and
* relevant stakeholders and their expectations

### Requirements Overview

Short description of the functional requirements, driving forces, extract (or abstract)
of requirements

### Quality Goals

The top three (max five) quality goals for the architecture whose fulfillment is of highest importance to the major stakeholders. 
We really mean quality goals for the architecture. Don't confuse them with project goals.

### Stakeholders

Explicit overview of stakeholders of the system, i.e. all person, roles or organizations that

##  2. [Architecture Constraints](https://docs.arc42.org/section-2/)

Any requirement that constraints software architects in their freedom of design and
implementation decisions or decision about the development process. These constraints
sometimes go beyond individual systems and are valid for whole organizations and companies.


##  3. [System Scope and Context](https://docs.arc42.org/section-3/)

System scope and context - as the name suggests - delimits your system (i.e. your scope) from all its communication partners
(neighboring systems and users, i.e. the context of your system). It thereby specifies the external interfaces.

If necessary, differentiate the business context (domain specific inputs and outputs) from the technical context (channels, protocols, hardware).

### Business Context

All stakeholders should understand which data are exchanged with the environment of the system.

### Technical Context

Technical interfaces (channels and transmission media) linking your system to its environment. In addition a mapping of domain specific input/output to the channels, i.e. an explanation with I/O uses which channel.

##  4. [Solution Strategy](https://docs.arc42.org/section-4/)

A short summary and explanation of the fundamental decisions and solution strategies, that shape system architecture. It includes

* technology decisions
* decisions about the top-level decomposition of the system, e.g. usage of an architectural pattern or design pattern
* decisions on how to achieve key quality goals
* relevant organizational decisions, e.g. selecting a development process or delegating certain tasks to third parties.

Motivate what was decided and why it was decided that way,
based upon problem statement, quality goals and key constraints.

##  5. [Building Block View](https://docs.arc42.org/section-5/)

The building block view shows the static decomposition of the system into building blocks (modules, components, subsystems, classes,
interfaces, packages, libraries, frameworks, layers, partitions, tiers, functions, macros, operations,
datas structures, ...) as well as their dependencies (relationships, associations, ...)

This view is mandatory for every architecture documentation.
In analogy to a house this is the _floor plan_.

Maintain an overview of your source code by making its structure understandable through
abstraction.

This allows you to communicate with your stakeholder on an abstract level without disclosing implementation details.

##  6. [Runtime View](https://docs.arc42.org/section-6/)

The runtime view describes concrete behavior and interactions of the system’s building blocks in form of scenarios from the following areas:

* important use cases or features: how do building blocks execute them?
* interactions at critical external interfaces: how do building blocks cooperate with users and neighboring systems?
* operation and administration: launch, start-up, stop
* error and exception scenarios

Remark: The main criterion for the choice of possible scenarios (sequences, workflows) is their *architectural relevance*. It is *not* important to describe a large number of scenarios. You should rather document a representative selection.

You will mainly capture scenarios in your documentation to communicate your architecture to stakeholders that are less willing or able to read and understand the static models (building block view, deployment view).


##  7. [Deployment View](https://docs.arc42.org/section-7/)

The deployment view describes:

 1. technical infrastructure used to execute your system, with infrastructure elements like geographical locations, environments, computers, processors, channels and net topologies as well as other infrastructure elements and

2. mapping of (software) building blocks to that infrastructure elements.

Software does not run without hardware.

### Infrastructure Level 1

Describe (usually in a combination of diagrams, tables, and text):

* distribution of a system to multiple locations, environments, computers, processors, .., as well as physical connections between them
* important justifications or motivations for this deployment structure
* quality and/or performance features of this infrastructure
* mapping of software artifacts to elements of this infrastructure


##  8. [Cross-cutting Concepts](https://docs.arc42.org/section-8/)

This section describes overall, principal regulations and solution ideas that are relevant in multiple parts (= cross-cutting) of your system.
Such concepts are often related to multiple building blocks.
They can include many different topics, such as

* models, especially domain models
* architecture or design patterns
* rules for using specific technology
* principal, often technical decisions of an overarching (= cross-cutting) nature
* implementation rules


Concepts form the basis for _conceptual integrity_ (consistency, homogeneity) of the architecture. 
Thus, they are an important contribution to achieve inner qualities of your system.


##  9. [Architecture Decisions](https://docs.arc42.org/section-9/)

Important, expensive, large scale or risky architecture decisions including rationals.
With "decisions" we mean selecting one alternative based on given criteria.

* ADR ([Architecture Decision Record](https://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions)) for every important decision
* List or table, ordered by importance and consequences or:
* more detailed in form of separate sections per decision

Refer to section 4, where you already captured the most important decisions of your architecture.

Stakeholders of your system should be able to comprehend and retrace your decisions.

## 10. [Quality Requirements](https://github.com/arc42/arc42-template/tree/master/EN/asciidoc/src/10_quality_requirements.adoc)

This section contains all quality requirements as quality tree with scenarios. The most important ones have already been described in section 1.2. (quality goals)

Since quality requirements will have a lot of influence on architectural
decisions you should know for every stakeholder what is really important to them,
concrete and measurable.

### Quality Tree

The quality tree (as defined in ATAM – Architecture Tradeoff Analysis Method) with quality/evaluation scenarios as leafs.

* tree-like refinement of the term "quality". Use "quality" or "usefulness" as a root
* a mind map with quality categories as main branches

### Quality Scenarios

Concretization of (sometimes vague or implicit) quality requirements using (quality) scenarios.

These scenarios describe what should happen when a stimulus arrives at the system.

## 11. [Risks and Technical Debts](https://github.com/arc42/arc42-template/tree/master/EN/asciidoc/src/11_technical_risks.adoc)

A list of identified technical risks or technical debts, ordered by priority

> "Risk management is project management for grown-ups" (Tim Lister, Atlantic Systems Guild.) 

## 12. [Glossary](https://github.com/arc42/arc42-template/tree/master/EN/asciidoc/src/12_glossary.adoc)

The most important domain and technical terms that your stakeholders use when discussing the system.

You should clearly define your terms, so that all stakeholders

* have an identical understanding of these terms
* do not use synonyms and homonyms
