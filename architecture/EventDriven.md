>  “Why would I try to remember all the systems I need to send information to and how to send them. I am going to miss one. Instead, I am going to throw an event out for everything I do and then any system who wants it can come grab it”

> The design of events can come in all shapes and sizes. They can be as low level as a single data element changing(changing one’s email address), to an entire business process completing (completing a transfer in a bank account).

> Event design standards are critical to the success of an Event Driven Architecture as the strategy is scaled up within the organization... the organization needs standards and governance to enforce these standards

- [Event-driven architecture for microservices | Red Hat Developer](https://developers.redhat.com/topics/event-driven)

- **Message** - Domain packet of info (fact or request)
	- **Event** - Inform listeners about something in the past (cannot be rejected, can be ignored)
		 - Stateless Notification
		 - Event Carried State Transfer
	- **Command** - trigger some action in the near future (typically producer -1:to:1-> consumer)
	- **Audit** - Publish object's state (eventual consistency in consumer caches)

###### **Events** and **Commands** SHOULD be first-class elements of the application.
- Including schema version control!

```
                     Msg Broker                Services
  ┌───────────┐    ┌────────────┐           ┌────────────┐
  │initiating │    │   event    │           │  event     │
  │event      ├────►   channel  ├───────────►  processor │
  └───────────┘    └────────────┘           └─────┬──────┘
                         ▲       ┌─────────┐      │
                         │       │ derived │      │
                         └───────┤ event   │◄─────┘
                                 └─────────┘
```

simplifies horizontal scalability in distributed computing models and makes them more resilient to failure.

By decoupling your services, they are only aware of the event router, not each other.

Event-driven architectures are push-based, so everything happens on-demand as the event presents itself in the router.

There are two main types of routers used in event-driven architectures: event buses (predefined schema) and event topics (very high fanout).
  - event emitters (or agents): detect
  - event consumers (or sinks): reaction
  - event channels (or conduits): transmit

depending on the type of information a `message` contains, it can fall under an _event_, _query_, or _command_... Theoretically, _"message-driven"_ is the most generic term -meaning you may use events and commands- while _event-driven_ means that it's purely about events.

```
	  +--------+
	  | Message|
	  +--------+
	   |      |
+-------+    +---------+
| Event |    | Request |
+-------+    +---------+
			  |      |
         +-------+   +---------+
         | Query |   | Command |
         +-------+   +---------+
```

# Asynchronous-Work-Requests

| Service Name     | Operation         | entityType   | actionType  |
|------------------|-------------------|--------------|-------------|
| Big Data Service | CreateBdsInstance | bds-instance | ACCEPTED    |
|                  |                   |              | IN_PROGRESS |
|                  |                   |              | FAILED      |
|                  |                   |              | SUCCEEDED   |
|                  |                   |              | CANCELING   |
|                  |                   |              | CANCELED    |

# Commands
- Intent to perform some action
- Explicit expectation that _something_ (state change / side effect) will happen in the future
- Commands can be rejected

commands are somewhat synchronous (request/reply), where events are mostly asynchronous

Naming: Imperative Verb

| Status | Status |
|-|-|
| Created | Completed |
| Validated | Invalid |
| Started | Stopped |
| In Error | Aborted |
| Canceled | Restarted |

People think of a command as encapsulating a request - with a command you tell a system to do X. Events, however, just communicate that something happened - with an event you let a system know that Y has happened.
Another difference is that you think of broadcasting events to everyone who may be interested but sending commands only the a specific receiver.

# Event Bubbling
when an event that’s triggered by a child element travels up through the DOM hierarchy

# event-driven-arch

Reactive #EventDrivenArchitecture domain-driven-design
  - "Microservices" -- Bounded Contexts (Choreographed, not controlled, process flows)
  - Context Map, Domain Models, and Big-Picture Event Storming: (Context -> 1. Operation -> Context -> 2. Operation -> 3. Operation -> Context)
  - Collaboration: type-safe, asynchronous, event-driven, and message-based communication
  - "Operation": relates to a domain concept but is not natural part of an Entity/Value object
  - "Domain Event": simple object represents an intersting occrence in the domain
  - "Aggregate": a group acting as a unit for data changes. ("Root" member)
  - "Entity" always has unique identifier (state that can change) (distinguished from all other objects)
  - "Value" object is just a value, no identity (important relationships)

# event-sourcing
you can simply take a copy of the application state, feed it a stream of events and run with it.
every change is captured and stored. If you ask for the state, the system conceptually starts with nothing and applies every change event that occurred and gives you the result.

# events
> "When you start modeling events, it forces you to think about the behavior of the system. As opposed to thinking about the structure of the system." - Greg Young

Events do not travel, they just occur.
  - something has happened (verbs in past tense)
  - Immutable, no processing expectations (observable, not directed)
  - Producer is the source of truth for audits, not consumers
An event can be defined as "a significant change in state".


# Naming

https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event-list.html

Indicate past-tense action-oriented, and past-participle verb

Can vary in semantic granularity or scope.
- At the _Entity_ level: `New Person`
- At the _Component_ level: `Change in contact point`
- At the _Field_ level: `Change in email address for home`

# examples
  - https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEventsRequestEntry.html
  - https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html
  
```json
{ 
	"detail-type": "com.example.ticket.created.v1", 
	"trace-header": "Root=1-5759e988-bd862e3fe1be46a994272793;Parent=53995c3f42cd8ad8;Sampled=1", 
	"source": "cloud.partner/com.example/123", 
	"detail": { "ticketId": "987654321", "department": "billing", "creator": "user12345" ... } }
```

> The `version`, `account`, `time` and `region` are all properties that AWS handles for us. That leaves core properties `detail`, `detail-type` and `source` to be defined by us.


```json
[
  {
    "EventBusName" : "<EventBridge Event Bus ARN>",
    "Time" : "2022-11-14T19:00:00Z",  
    "DetailType": "orderQuery",
    "Source": "orderPipeline",
    "Detail": "{\"query\": \"monthlySalesByItem\",\"itemid\": \"z4444\"}"
  }
]

[
  {
	"EventBusName" : "<EventBridge Event Bus ARN>",
	"Time" : "2022-10-13T19:00:00Z",
	"DetailType": "orderCommand",
	"Source": "orderPipeline",
	"Detail": "{\"command\": \"createOrder\",\"orderId\": \"6101\",\"items\" : [{\"itemid\": \"z3333\",\"quantity\": 6},{\"itemid\": \"z4444\",\"quantity\": 3}]}"
  }
]
```

Splitting event payloads into `data` and `metadata` sections:

```json
"detail": {
      "metadata": {
        ...
      },
      "data": {
        ...
      }
   }
```
Telemetry
{
    "type": "api",
    "system": "name",
    "service": "my-api",
    "action": "POST",
    "resource": "users",
    "keys": { "email": "email@site.com" }
}

  - https://github.com/cloudevents/spec/blob/master/primer.md
The CloudEvents approach to achieving interoperability is to take the expressed concepts and fit them into the context constraints we set with “type”, “source”, and “subject” such that a CloudEvents-aware infrastructure can handle them consistently.

We design event domains or application domains around the concept of a topic hierarchy.

{ "specversion": "1.0", "type": "coolevent", "id": "xxxx-xxxx-xxxx", "source": "bigco.com", "data": { ... } }

The payload is business data, the Cloudevents attributes are metadata... that is to say if it's used to implement [[Non-FunctionalRequirements]] rather than functional requirements, than I would say it belongs in the metadata.

  - https://docs.oracle.com/en-us/iaas/Content/Events/Reference/eventenvelopereference.htm
{ "eventType": "com.oraclecloud.apigateway.creategatewaycertificate.begin", "cloudEventsVersion": "0.1", "eventTypeVersion": "2.0", "source": "apigateway", "eventTime": "2019-08-16T15:09:04.550Z", "contentType": "application/json", "data": { "compartmentId": "ocid1.compartment.oc1..<unique_ID>", "compartmentName": "example_compartment", "resourceName": "My_Certificate", "resourceId": "ocid1.apigatewaycertificate.oc1.phx.<unique_ID>", "availabilityDomain": "availability_domain" }, "eventID": "<unique_ID>", "extensions": { "compartmentId": "ocid1.compartment.oc1..<unique_ID>" } }


# lifecycle
State is similar to props, but it is private and fully controlled by the component.
it’s very important to free up resources taken by the components when they are destroyed.
neither parent nor child components can know if a certain component is stateful or stateless
"top-down" or "unidirectional" data flow. If you imagine a component tree as a waterfall of props, each component’s state is like an additional water source that joins it at an arbitrary point but also flows down.

# message
Event-Driven architectures atop message-driven architectures
the notification message itself, text-only input, the message differentiate how each communication should be handled

# notifications
Message order guarantee is an expensive operation
In this mode, the event producer sends a notification to the event system that a change has happened to the entity.
Consumers are expected to query the read endpoint to understand the latest state of the data.
A service is said to have the idempotence characteristic if the same input being thrown at it multiple times does not change its state unexpectedly
Notification Events tell subscribers that something has changed. Typically the event contains a reference to the thing that has changed. The back reference could 'point' to different things. The simplest is probably back-reference to latest.


## Example: [Event System - Gaphor documentation](https://docs.gaphor.org/en/latest/event_system.html)

```python
class EventManager(Service):
    """The Event Manager."""

    def shutdown(self) -> None:

    def subscribe(self, handler: Handler) -> None:
        """Register a handler."""

    def unsubscribe(self, handler: Handler) -> None:
        """Unregister a previously registered handler."""

    def handle(self, *events: Event) -> None:
        """Send event notifications to registered handlers."""
```

## Example: [events-and-workflows/event-table.md](https://github.com/danilop/events-and-workflows/blob/main/event-table.md)

Event design table

| API (sync)  |            Input Events            |  Service   |      Action      |                 Output Events                  |             Notes             |
|-------------|------------------------------------|------------|------------------|------------------------------------------------|-------------------------------|
| CreateOrder |            CreateOrder             |   Order    |   CreateOrder    |                  OrderCreated                  |          Public API.          |
|             |            OrderCreated            | Inventory  |   ReserveItem    |         ItemReserved ItemNotAvailable          |                               |
|             |            ItemReserved            | Inventory  |   DescribeItem   |                 ItemDescribed                  |                               |
|             |            ItemDescribed           |  Customer  | DescribeCustomer |    CustomerDescribed ErrorCustomerDescribed    |  Get name, address, and email |
|             |         CustomerDescribed          |  Delivery  | EstimateDelivery |               DeliveryEstimated                |   Including delivery price.   |
|             |          DeliveryEstimated         |  Payment   |   MakePayement   |            PaymentMade PaymentFailed           |                               |
|             |             PaymentMade            | Inventory  |    RemoveItem    |        ItemRemoved ErrorItemUnreserved         |                               |
|             |             ItemRemoved            |  Delivery  |   StartDelivery  |                DeliveryStarted                 |                               |
|             |     Delivered (from logistics)     |  Delivery  |    Delivered     | DeliveryWasDelivered ErrorDeliveryWasDelivered |                               |
|             |        DeliveryWasDelivered        |   Order    |   UpdateOrder    |    OrderDelivered (END) ErrorOrdeDelivered     |       Order delivered.        |
|             |        DeliveryWasCanceled         |   Order    |   UpdateOrder    |        OrderCanceled ErrorOrderCanceled        |        Order canceled.        |
|             |            PaymentFailed           | Inventory  |   UnreserveItem  |    ItemUnreserved (END) ErrorItemUnreserved    |                               |
|             |            OrderCanceled           |  Inventory |    ReturnItem    |          ItemReturned ItemNotReturned          |                               |
|             |            ItemReturned            |   Payment  |   CancelPayment  |             PaymentCanceled (END)              |                               |
|             |  DeliveryCanceled (from logistics) |  Delivery  |  CancelDelivery  |  DeliveryWasCanceled ErrorDeliveryWasCanceled  |           Public API.         |


## Example: [Amazon RDS event categories and event messages - Amazon Relational Database Service](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.Messages.html)

| Category                  | Amazon RDS event ID | Description                                                                                               |
|---------------------------|---------------------|-----------------------------------------------------------------------------------------------------------|
| availability              | RDS-EVENT-0006      | The DB instance restarted.                                                                                |
| backup                    | RDS-EVENT-0001      | Backing up the DB instance.                                                                               |
| configuration change      | RDS-EVENT-0009      | The DB instance has been added to a security group.                                                       |
| creation                  | RDS-EVENT-0005      | DB instance created.                                                                                      |
| deletion                  | RDS-EVENT-0003      | The DB instance has been deleted.                                                                         |
| failover                  | RDS-EVENT-0013      | A Multi-AZ failover that resulted in the promotion of a standby instance has started.                     |
| failure                   | RDS-EVENT-0031      | The DB instance has failed due to an incompatible configuration or an underlying storage issue.           |
| low storage               | RDS-EVENT-0007      | The allocated storage for the DB instance has been consumed.                                              |
| maintenance               | RDS-EVENT-0155      | The DB instance has a DB engine minor version upgrade required.                                           |
| maintenance, notification | RDS-EVENT-0194      | The upgrade of your Oracle time zone file has completed.                                                  |
|                           |                     | For more information, see Oracle time zone file autoupgrade.                                              |
| maintenance, failure      | RDS-EVENT-0195      | The upgrade of the time zone file failed.                                                                 |
|                           |                     | For more information, see Oracle time zone file autoupgrade.                                              |
| notification              | RDS-EVENT-0044      | Operator-issued notification. For more information, see the event message.                                |
| recovery                  | RDS-EVENT-0020      | Recovery of the DB instance has started. Recovery time will vary with the amount of data to be recovered. |
| restoration               | RDS-EVENT-0019      | The DB instance has been restored from a point-in-time backup.                                            |
| security                  | RDS-EVENT-0068      | RDS is decrypting the CloudHSM partition password to make updates to the instance.                        |



# QUESTIONS

- Test/Dry Run
	- Dont perform actions?
	- `isSynthetic`/`isFake`
- Trace ID
	- Aggregate the consumers ("touches") along the way?