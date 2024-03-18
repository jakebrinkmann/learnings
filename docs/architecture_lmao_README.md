# LMAO - Logging, Monitoring, Alerting, Observability

1. [[Logging]] / Metrics
3. Monitoring
4. Alerting

> it's in your best interest to be prepared with the proactive tools necessary to demonstrate that your component works correctly, or at worst that the problem can be analyzed from your logs.
> - https://commons.apache.org/proper/commons-logging/guide.html#Best_Practices_General
## A. Logging & Metrics

- Structured Logs
- Log Levels
- Event Ids
********
## A1. Log Levels

| Severity | Description | Examples |
|----------|-------------|----------|
| Emergency, Alert | **USE METRICS INSTEAD** | |
| 🔴`CRITICAL`/`FATAL` |  Use only when the component can’t do anything, and it **requires** an external human intervention. | when a component starts and require a Database connection and the Connection class returns an error saying that it is an unknown host (DNS failure). |
| 🟠`ERROR` | Use when something unexpected and should be investigated, **possibly recoverable automatically**. | disconnected from the messaging system or the DB |
| 🟡`WARNING` | Often used for non ordinary events but not impacting the system itself, potential non-critical loss of information. | handled unexpected message by ignoring it; checksum failure; receiving a keep-alive when device reported to be down; unsupported message format; missing expected information. |
| 🟢 Notice |  Something happened, a normal operation. Normal but significant [[notable](https://en.wikipedia.org/wiki/Notability)] condition. | reception of a message, 
| 🔵`INFO` | Additional (un-notable) information, highlight the progress of the application at coarse-grained level. | identification of the message serialization version and format.|
| ⚫️`DEBUG` | Anything, which would help deep debugging and diagnostically helpful. (Expect these to be written to logs only.) | entering and existing a method, reporting interval values like index of a for-loop, temporary computation value, …|
| ⚪️`TRACE` | Fine-grained debug message, typically capturing the flow through the application. | trying to find one **part** of a function specifically (`trace1 → trace8`)|

- [Apache httpd](https://httpd.apache.org/docs/2.4/mod/core.html#loglevel)
---

### Solutions
- DataDog
- Sentry
- AWS CloudWatch
