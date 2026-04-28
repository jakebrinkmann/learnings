---
tags: [architecture, events, design]
---
# Event Design and Naming Conventions

Events and Commands SHOULD be first-class elements (with schema version control!).

### Naming Standards
Past-tense, action-oriented, past-participle verb.
Granularity scales down:
- **Entity**: `New Person`
- **Component**: `Change in contact point`
- **Field**: `Change in email address for home`

### Payload Structure
Split payload into `data` (business context) and `metadata` (non-functional requirements).
```json
"detail": {
  "metadata": { ... },
  "data": { ... }
}
```

### Standards & Interoperability
- **CloudEvents**: Standardized metadata (`type`, `source`, `subject`, `id`, `specversion`) for infrastructure interoperability.
- **Telemetry**: Common keys (`type`, `system`, `service`, `action`, `resource`).

### Open Questions / Edge Cases
- **Dry Runs**: How to test event flows? Use `isSynthetic` or `isFake` flags in metadata.
- **Traceability**: Pass `Trace ID` to aggregate consumer "touches" along the way.