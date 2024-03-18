# The Structured Project Life Cycle

```
                        ┌─────────┐             ┌──────────────┐             ┌─────────────┐
                        │  USERS  │             │  MANAGEMENT  │             │  OPERATIONS │
                        └──┬────┬─┘             └─┬────────────┘  operational└─┬───────┬───┘
              system       │    │  user policy    │ constraints   restrictions │       │ existing
              requirements │    └─────────────┐   │  ┌─────────────────┬───────┘       │ database
                           │                  │   │  │                 │               │
                      ┌────▼─────┐          ┌─▼───▼──▼─┐        ┌──────▼─┐  design   ┌─▼────────┐
                      │  1.      │ charter  │ 2.       │        │ 3.     │  spec     │ 8.       │
                      │  SURVEY  ├──────────► ANALYSIS ├────────► DESIGN ├───────────► DATABASE │
                      └┬─▲───────┘          ┌─┬──────┬─┘        └───────┬┘           └────┬─────┘
                       │ │     cost/benefit │ │      │                  │                 │
                       │ │  ◄───────────────┘ │      │ structured       │                 │
                       │ │                    │      │ specification   ┌▼───────────────┐ │
                       │ │               ┌────┘      │                 │ 4.             │ │
              tentative│ │               │         ┌─▼───────────┐     │ IMPLEMENTATION │ │  converted
           cost/benefit│ │ ┌─────────────▼───┐     │ 7.          │     └┬───────────────┘ │  database
              report   │ │ │  5.             │     │ PROCEDURE   │      │                 │
                       │ │ │  ACCEPTANCE     │     │ DESCRIPTION │      │ integrated      │
                       │ │ │  TEST GENERATION│     └────┬────────┘      │ system          │
                       │ │ └────────────┬────┘   user   │               │                 │
                       │ │              │      manual   │    ┌──────────┘                 │
                       │ │              │               │    │                            │
                       │ │              │          ┌────▼────▼─┐               ┌──────────▼───┐
                       │ │ constraints  │          │ 6.        │               │ 9.           │
                       │ │              └──────────► QUALITY   ├───────────────► INSTALLATION │
                   ┌───▼─┴──────┐           test   │ ASSURANCE │               └──────────────┘
                   │ MANAGEMENT │           set    └───────────┘      accepted
                   └────────────┘                                     system                        installed
                                                                                                    system
```
