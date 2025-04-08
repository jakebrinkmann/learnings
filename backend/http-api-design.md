## Authentication

A client must have a valid token before being able to make requests to the API resources.

Therefore, all clients must request a JWT Access Token [RFC 7519]. The token should not
be decoded by the client for information other than the lifetime (`exp`) of the token.
The lifetime can vary by scope, but is usually at most 1 hour.

### Scope

OAuth2 [RFC 6749] scope are used for explicit access control.

| Scope             | Description                              |
|-------------------|------------------------------------------|
| admin.roles:read  | List role assignments for your workspace |
| admin.roles:write | Add and remove role assignments          |


## List

Get list of THINGS. The response is paginated by the limit of items per page.

`HTTP GET /facility/{facility_id}/things`

### Query Parameters

|  Key |  Type  |         Description          |
|------|--------|------------------------------|
| type | string | filter list by type (AB, XY) |
| page | int    | limit number of items        |

### Authorization

The request is using an authorization helper.


# References

[OpenApi]: https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.3.md#specification
[JSON Schema]: http://json-schema.org/learn/examples/calendar.schema.json
[Lambda Integration]: https://docs.aws.amazon.com/apigateway/latest/developerguide/api-as-lambda-proxy-export-swagger-with-extensions.html

[HTTP Semantics]: https://datatracker.ietf.org/doc/html/rfc7231
[Oauth]: https://datatracker.ietf.org/doc/html/rfc6749
[JWT]: https://tools.ietf.org/html/draft-ietf-oauth-access-token-jwt-12
[Problem]: https://tools.ietf.org/html/rfc7807
[Resource Oriented Design]: https://cloud.google.com/apis/design/resources
[Slack Scopes]: https://api.slack.com/scopes

[HAL]: https://datatracker.ietf.org/doc/html/draft-kelly-json-hal-05
[Level 3 APIs]: https://martinfowler.com/articles/richardsonMaturityModel.html#level3

[WebSockets]: https://datatracker.ietf.org/doc/html/rfc6455
[JSON RPC]: https://www.jsonrpc.org/specification
[Includes]: https://jsonapi.org/format/#fetching-includes
