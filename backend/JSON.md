# JSON RPC (Websocket)

# gateway-responses

- https://docs.aws.amazon.com/apigateway/api-reference/
- The Amazon API Gateway web service is a resource-based API that uses Hypertext Application Language (HAL)

```json
{
  "_links": {
    "curies": {
      "href": "http://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-gatewayresponse-{rel}.html",
      "name": "gatewayresponse",
      "templated": true
    },
    "self": {
      "href": "/restapis/o81lxisefl/gatewayresponses"
    },
    "first": {
      "href": "/restapis/o81lxisefl/gatewayresponses"
    },
    "gatewayresponse:by-type": {
      "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}",
      "templated": true
    },
    "item": [
      {
        "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE"
      },
      {
        "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND"
      },…    ]
  },
  "_embedded": {
    "item": [
      {
        "_links": {
          "self": {
            "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE"
          },
          "gatewayresponse:put": {
            "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}",
            "templated": true
          },
          "gatewayresponse:update": {
            "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE"
          }
        },
        "defaultResponse": true,
        "responseParameters": {},
        "responseTemplates": {
          "application/json": "{\"message\":$context.error.messageString}"
        },
        "responseType": "INTEGRATION_FAILURE",
        "statusCode": "504"
      },
      {
        "_links": {
          "self": {
            "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND"
          },
          "gatewayresponse:put": {
            "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}",
            "templated": true
          },
          "gatewayresponse:update": {
            "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND"
          }
        },
        "defaultResponse": true,
        "responseParameters": {},
        "responseTemplates": {
          "application/json": "{\"message\":$context.error.messageString}"
        },
        "responseType": "RESOURCE_NOT_FOUND",
        "statusCode": "404"
      },
…
    ]
  }
}
```


# HAL

- https://martinfowler.com/articles/richardsonMaturityModel.html#level3
- https://blog.kloud.com.au/2015/10/26/creating-service-contract-with-autorest-swagger-and-hal/
- https://www.oreilly.com/library/view/restful-web-clients/9781491921890/ch04.html

```json
{
  "_links": {
    "self": { "href": "/orders"},
    "curies": [{ "name":"ea", "href":"http://example.com/docs/rels/{rel}", 1
      "templated": true}],
    "next": { "href": "/orders?page=2"},
    "ea:find": {
      "href": "/orders{?id}",
      "templated": true
    },
    "ea:admin": [{
      "href": "/admins/2",
      "title": "Fred"
    }, {
      "href": "/admins/5",
      "title": "Kate"
    }]
  },
  "currentlyProcessing": 14,
  "shippedToday": 20,
  "_embedded": {
    "ea:order": [{
      "_links": {
        "self": { "href": "/orders/123"},
        "ea:basket": { "href": "/baskets/98712"},
        "ea:customer": { "href": "/customers/7809"}
      },
      "total": 30.00,
      "currency": "USD",
      "status": "shipped"
    }, {
      "_links": {
        "self": { "href": "/orders/124"},
        "ea:basket": { "href": "/baskets/97213"},
        "ea:customer": { "href": "/customers/12369"}
      },
      "total": 20.00,
      "currency": "USD",
      "status": "processing"
    }]
  }
}
```


# hateoas-jsonapi
- https://jsonapi.org/ `(application/vnd.api+json)`

```json
{
  "jsonapi": {
    "version": "1.0"
  },
  "data": [
    {
      "id": "1",
      "type": "movies",
      "attributes": {
        "title": "The Shawshank Redemption",
        "year": 1994,
        "rating": 9.3
      },
      "relationships": {
        "directors": {
          "data": [
            {
              "id": "2",
              "type": "directors"
            }
          ],
          "links": {
            "self": "http://localhost:8080/api/movies/1/relationships/directors",
            "related": "http://localhost:8080/api/movies/1/directors"
          }
        }
      },
      "links": {
        "self": "http://localhost:8080/api/movies/1"
      }
    }
  ],
  "included": [
    {
      "id": "2",
      "type": "directors",
      "attributes": {
        "name": "Frank Darabont"
      }
    }
  ],
  "links": {
    "self": "http://localhost:8080/api/movies?page[number]=0&page[size]=1",
    "next": "http://localhost:8080/api/movies?page[number]=1&page[size]=1",
    "last": "http://localhost:8080/api/movies?page[number]=249&page[size]=1"
  },
  "meta": {
    "page": {
      "number": 0,
      "size": 1,
      "totalPages": 250,
      "totalElements": 250
    }
  }
}
```



# ld
- https://schema.org/Thing

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "3.5",
    "reviewCount": "11"
  },
  "description": "0.7 cubic feet countertop microwave. Has six preset cooking categories and convenience features like Add-A-Minute and Child Lock.",
  "name": "Kenmore White 17\"Microwave",
  "image": "kenmore-microwave-17in.jpg",
  "offers": {
    "@type": "Offer",
    "availability": "https://schema.org/InStock",
    "price": "55.00",
    "priceCurrency": "USD"
  }
}
```


# oauth-jwt
- https://tools.ietf.org/html/draft-ietf-oauth-access-token-jwt-12

```json
   // Header:
   {"typ":"at+JWT","alg":"RS256","kid":"RjEwOwOA"}
   // Claims: 
   {
     "iss": "https://authorization-server.example.com/",
     "sub": "5ba552d67",
     "aud":   "https://rs.example.com/",
     "exp": 1544645174,
     "client_id": "s6BhdRkqt3_",
     "scope": "openid profile reademail"
   }
```


# problem
- https://tools.ietf.org/html/rfc7807

```json
{
    "type": "about:blank",
    "title": "Not Found",
    "detail": "Parent ID not found in system database",
    "status": 404
   }
```



# rpc-2-0
- https://www.jsonrpc.org/specification

```json
{
    "jsonrpc": "2.0",
    "method": "subtract",
    "params": [42, 23],
    "id": 1
}
```


# schema
- https://jsonschema.net/home
- https://json-schema.org/latest/json-schema-validation.html

```json
{
    "$schema": "http://json-schema.org/draft-07/schema",
    "$id": "http://example.com/example.json",
    "type": "object",
    "title": "The root schema",
    "description": "The root schema comprises the entire JSON document.",
    "required": [
        "jsonrpc",
        "method",
        "params",
        "id"
    ]
}
```


# emf (Embedded metric format)

MUST contain the following top-level member on the root node. This is a Metadata object.

```json
{
  "_aws": {
    "Timestamp": 1574109732004,
    "CloudWatchMetrics": [
      {
        "Namespace": "lambda-function-metrics",
        "Dimensions": [["functionVersion"]],
        "Metrics": [
          {
            "Name": "time",
            "Unit": "Milliseconds",
            "StorageResolution": 60
          }
        ]
      }
    ]
  },
  "functionVersion": "$LATEST",
  "time": 100,
  "requestId": "989ffbf8-9ace-4817-a57c-e4dd734019ee"
}
```

# CloudEvent

```json
{
    "specversion" : "1.0",
    "type" : "com.github.pull_request.opened",
    "source" : "https://github.com/cloudevents/spec/pull",
    "subject" : "123",
    "id" : "A234-1234-1234",
    "time" : "2018-04-05T17:31:00Z",
    "comexampleextension1" : "value",
    "comexampleothervalue" : 5,
    "datacontenttype" : "text/xml",
    "data" : "<much wow=\"xml\"/>"
}
```

- [AWS S3 events](https://docs.aws.amazon.com/AmazonS3/latest/dev/notification-content-structure.html)

| CloudEvents Attribute | Value                                                                         |
|-----------------------|-------------------------------------------------------------------------------|
| `id`                  | "responseElements.x-amz-request-id" + `.` + "responseElements.x-amz-id-2"     |
| `source`              | "eventSource" value + `.` + "awsRegion" value + `.` + "s3.buckets.name" value |
| `specversion`         | `1.0`                                                                         |
| `type`                | `com.amazonaws.s3.` + "eventName" value                                       |
| `datacontenttype`     | S3 event type (e.g. `application/json`)                                       |
| `dataschema`          | Omit                                                                          |
| `subject`             | "s3.object.key" value                                                         |
| `time`                | "eventTime" value                                                             |
| `data`                | S3 event                                                                      |

- [CouchDB Document events](http://docs.couchdb.org/en/stable/api/database/changes.html)

| CloudEvents Attribute | Value                                 |
|-----------------------|---------------------------------------|
| `id`                  | The event sequence identifier (`seq`) |
| `source`              | The server URL / `db`                 |
| `specversion`         | `1.0`                                 |
| `type`                | `org.apache.couchdb.document.updated` |
| `datacontenttype`     | `application/json`                    |
| `subject`             | The document identifier (`id`)        |
| `time`                | Current time                          |
| `data`                | `changes` value (array of `revs`)     |

# OTLP (OpenTelemetry)
- https://opentelemetry.io/docs/specs/otlp/

```json
# TRACES

{
  "resourceSpans": [ {
      "scopeSpans": [ {
          "spans": [ {
              "traceId": "",
              "spanId": "",
              "parentSpanId": "",
              "name": "operationA",
              "startTime": "2023-09-13T07:01:33+0000",
              "endTime": "2023-09-13T07:01:33+0000",
              "events": [ {
                  "time": "2023-09-13T07:01:33+0000",
                  "name": "event-with-attr",
                  "attributes": [ {
                      "key": "span-event-attr",
                      "value": "span-event-attr-val"
                    } ] }, {
                  "time": "2023-09-13T07:01:33+0000",
                  "name": "event"
                } ],
              "droppedEventsCount": 1,
              "status": {
                "message": "status-cancelled",
                "code": 2
} } ] } ] } ] }

# METRICS

{
  "resourceMetrics": [ {
      "resource": { ... },
      "scopeMetrics": [ {
          "metrics": [ {
              "name": "counter-int",
              "unit": "1",
              "sum": {
                "dataPoints": [ {
                    "attributes": [ {
                        "key": "label-1",
                        "value": {
                          "stringValue": "label-value-1"
                        } } ],
                    "startTime": "2023-09-13T07:01:33+0000",
                    "time": "2023-09-13T07:01:33+0000",
                    "asInt": "120"
                  }, { ... }
                ],
                "aggregationTemporality": 2,
                "isMonotonic": true
              } } ] } ] } ] }

# LOGS

{
  "resourceLogs": [ {
      "resource": {
        "attributes": [ {
            "key": "resource-attr",
            "value": "resource-attr-val-1"
          } ] },
      "scopeLogs": [ {
          "logRecords": [ {
              "time": "2023-09-13T07:01:33+0000",
              "severityNumber": 9,
              "severityText": "Info",
              "name": "logA",
              "body":  "This is a log message",
              "attributes": [ {
                  "key": "app",
                  "value": "server"
                }, {
                  "key": "instance_num",
                  "value": "1"
                } ],
              "droppedAttributesCount": 1,
              "traceId": "08040201000000000000000000000000",
              "spanId": "0102040800000000"
            } ] } ] } ] }
```