---
title: GOTO EDA DAY NASHVILLE 2023
date: 2023-10-27T13:33:24-05:00
tags: #GOTOEDAday #Nashville
url: https://gotopia.us/2023-eda-aws-day
---

# Keynote: Event-Driven Integration Today and Tomorrow

[Flow Architectures](https://www.oreilly.com/library/view/flow-architectures/9781492075882/)
- ![](https://learning.oreilly.com/library/cover/9781492075882/250w/)


> __What do I mean by `Flow` in this context?__  
> **Event Driven Integration**  
>       ACROSS  
> **Organization Boundaries**  
>       Through  
> **Standard Interfaces and Protocols**  

Scale - Geoffrey West
[Scale: The Universal Laws of Growth...](https://www.amazon.com/Scale-Universal-Innovation-Sustainability-Organisms/dp/1594205582)

# Prinicpals of "Data Gravity"
> “As Data accumulates (builds mass) there is a greater likelihood that additional Services and Applications will be attracted to this data.”   
> ...the closer you are (i.e. in the same facility) the higher the Throughput and lower the Latency to the Data and the more reliant those Applications and Services will become on Low Latency and High Throughput.
 - [Dave McCrory](https://datagravitas.com/2010/12/07/data-gravity-in-the-clouds/)

# Action Distance: "Information Half-Life"
 
```
        │
    $$$$│ ▲ Business Event
        │
  V  $$$│ +──────────────► ◄► Data Stored (Ready for Analysis)
  A     │     Capture
  L   $$│     Latency     +───────────────► ◄► Analysis Delivered
  U     │                     Analysis
  E    $│                     Latency        +──────────────► ◄► Action Taken
        │                                       Decision
        │                                       Latency
        │
        └──────────────────────────────────────────────────────────────────────
                            TIME
          +Preventative (milliseconds)
                                  +Actionable (seconds)
                                                +Reactive (minutes/hours)
```


Categories of EDA:
- telemetry and analytics
- command and control

- Messaging of Eventing?
    - Messaging: Message Queue (`RabbitMQ`)
    - Eventing: Discrete Events or Event Series?
        - Series: Log-Based Event Processor (`Kafka`)
        - Discrete: Workflow or Single Action?
            - Workflow: Workflow Automation (`Step Functions`)
            - Single: Stateful or Atomic?
                - Atomic: Functions or Event Routing (`Lambda/EventBridge`)
                - Statefull: Stateful Processor (`Flink`)

"Digital Twin"?

```plantuml
@startuml
allow_mixing
title Walmart Electronic Data Exchange \n(EDI) Interface
rectangle "Walmart" as W
rectangle "Drop Ship\nVendor" as D

W <=[#Grey]> D: 997
W -[#Green]-> D: 850
W -.[#Blue]-> D: 860
W -.[#e91e63]-> D: 824
D -[#Red]-> W: 846
D -[#Purple]-> W: 856
D -[#Orange]-> W: 855

legend
    | <color:Green>850PO | Purchase Order |
    | <color:Blue>860PC | Purchase Order Cancellation |
    | <color:e91e63>824AG | Application Advice/Error |
    | <color:Red>846IB | Inventory Advice |
    | <color:Purple>856SH | Advance Ship Notice |
    | <color:Orange>855PR | Purchase Order Acknowledgement |
    | <color:Grey>997FA | Functional Acknowledgement |
endlegend
@enduml
```

[ ] Salesforce Eventbridge SaaS Integration
