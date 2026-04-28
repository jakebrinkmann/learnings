---
tags: [architecture, events, examples]
---
# Event-Driven Implementation Examples

Reference architectures and payloads.

### 1. DaniloP Event Table (Workflow)
| Service | Action | Output Event | Notes |
|---|---|---|---|
| Order | CreateOrder | `OrderCreated` | Public API |
| Inventory | ReserveItem | `ItemReserved` / `ItemNotAvailable` | |
| Payment | MakePayment | `PaymentMade` / `PaymentFailed` | |

### 2. Async Work Requests (Status Modeling)
| Service Name | Operation | entityType | actionType |
|---|---|---|---|
| Big Data | CreateBdsInstance | bds-instance | `ACCEPTED`, `IN_PROGRESS`, `FAILED`, `SUCCEEDED` |

### 3. AWS EventBridge Payload
```json
{
  "EventBusName": "arn...",
  "Time": "2022-11-14T19:00:00Z",
  "DetailType": "orderQuery",
  "Source": "orderPipeline",
  "Detail": "{\"query\": \"monthlySalesByItem\",\"itemid\": \"z4444\"}"
}
```

### 4. Code: Python EventManager (Gaphor)
```python
class EventManager(Service):
    def subscribe(self, handler: Handler) -> None: ...
    def unsubscribe(self, handler: Handler) -> None: ...
    def handle(self, *events: Event) -> None: ...
```