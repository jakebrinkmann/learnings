---
tags:
  - architecture
  - ddd
---
# Context Maps & Bounded Contexts

### Enterprise / Company Level
**Context Maps & Strategic Design**:
- **Bounded Contexts**: Define clear boundaries where a specific model applies.
  - *Example*: "Customer" in CRM vs "Customer" in Accounting vs "Customer" in Logistics.
- **Upstream/Downstream**: "If you are upstream and you pollute the river... People downstream will be impacted."
- Use **Anti-Corruption Layers (ACL)** to protect downstream contexts.

```
+----------------------+                       +------------+
| Context              | UPSTREAM              | CONTEXT    |
| <<Products Catalog>> |-----------------------| <<Search>> |
+----------------------+            DOWNSTREAM +------------+
                                                /
                 ANTI-CORRUPTION LAYER --------/
```

<img width="1270" alt="image" src="https://user-images.githubusercontent.com/4110571/282520042-05efb67d-9808-4000-a3b4-d94ac6677a9f.png">
