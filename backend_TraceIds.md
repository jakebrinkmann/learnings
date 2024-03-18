-  [W3C Trace Context](https://www.w3.org/TR/trace-context/) specification defines a standard to HTTP headers and formats to propagate the distributed tracing context information.
	- `traceparent` describes the position of the incoming request in its trace graph in a portable, fixed-length format.
	- `tracestate` extends `traceparent` with vendor-specific data represented by a set of name/value pairs.
 
>  This is also referred to as participating in a trace.

```yaml
Exchange:
Properties:
	type: "WorkerService.Messages.SaySomething"
	message_id: "0d0117b4-77f3"
	reply_to: "NsbActivities.WebApplication"
	correlation_id: "0d0117b4-77f3"
	headers:
		traceparent: "00-e688ccd000ea"
	content_type: "application/json"
Payload: {"Message": "tracecontent ftw!"}
```

> Systems based on [OpenTracing] use term TraceID where it represents the chain from the start to end and under every trace, there can be spans for particular unit of work that are recognized by spanID

```json
{
    "correlationId": "b490ea4b7230260a",
    "status": "BAD_REQUEST",
    "datetime": "2022-07-13 18:47:20",
    "error": "Exception from Hello World Service"
}
```

[OpenTracing]: https://opentracing.io/specification/
[W3 Trace Context]: https://www.w3.org/TR/trace-context/

Instrumentation SHOULD create a new span and populate the [CloudEvents Distributed Tracing Extension](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/extensions/distributed-tracing.md) on the event.

[CloudEvents | OpenTelemetry]: https://opentelemetry.io/docs/specs/otel/trace/semantic_conventions/cloudevents/

Spans can be nested to form a trace tree.
```
+-------------------------------------------------+
|    Trace 1                                      |
|                                                 |
|    +---------------------------------------+    |
|    | Send (auto-instr)                     |    |
|    +---------------------------------------+    |
|       +------------------------------------+    |
|       | Intermediary: Received (auto-instr)|    |
|       +------------------------------------+    |
|       +------------------------------------+    |
|       | Intermediary: Send (auto-instr)    |    |
|       +------------------------------------+    |
|                                                 |
|    Trace 2                                      |
|                                                 |
|    +---------------------------------------+    |
|    | Consumer: Receive (auto-instr)        |    |
|    +---------------------------------------+    |
|                                                 |
+-------------------------------------------------+
```


| Span Name | Guidance |
|-|-|
| `get` | Too general |
|`get_account/42` | Too specific (high cardinality) |
| `get_account` | Good (`account_id=42` would make a nice attribute) |
| `get_account/{accountId}` | Also good |


[Correlation IDs - Code With Engineering Playbook (microsoft.github.io)](https://microsoft.github.io/code-with-engineering-playbook/observability/correlation-id/)

X-Request-ID, X-Correlation-ID --> Correlates HTTP requests between a client and server.
`X-Request-ID: f058ebd6-02f7-4d3f-942e-904344e8cde5`


To obtain a correlation ID, 
1. checks for one in the source message (the X-CORRELATION-ID header)
2. If the source does not set a correlation ID, generates one

```java
    String correlationId = request.getHeader("correlation-id");
    if (null == correlationId || !UUID_PATTERN.matcher(correlationId).matches()) {
      // only allow UUIDs, if it's not valid according to our contract, allow it to be rewritten
      // alternatively, we would reject the request with an HTTP 400 Bad Request, as a client
      // hasn't fulfilled the contract
      correlationId = UUID.randomUUID().toString();
    }
```

[Standard structured keys]: https://awslabs.github.io/aws-lambda-powertools-python/2.14.0/core/logger/#standard-structured-keys

| Key                           | Example                             | Note                                                        |
|-------------------------------|-------------------------------------|-------------------------------------------------------------|
| level: str                    | INFO                                | Logging level                                               |
| location: str                 | collect.handler:1                   | Source code location where statement was executed           |
| message: Any                  | Collecting payment                  | Unserializable JSON values are casted as str                |
| timestamp: str                | 2021-05-03 10:20:19,650+0200        | Timestamp with milliseconds, by default uses local timezone |
| logger_name / service         | payment                             | Service name defined, by default service_undefined          |
| correlationId / xray_trace_id | 1-5759e988-bd862e3fe1be46a994272793 | When tracing is enabled, it shows X-Ray Trace ID            |
| sampling_rate: float          | 0.1                                 | When enabled, it shows sampling rate in percentage e.g. 10% |
| exception_name: str           | ValueError                          | When logger.exception is used and there is an exception     |
| exception: str                | Traceback (most recent call last).. | When logger.exception is used and there is an exception     |
