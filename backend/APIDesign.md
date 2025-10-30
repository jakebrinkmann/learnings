j> You are not a drop in the ocean. You are the entire ocean in a drop.
> <_protocol_> :// <_hostname_> [: <_port_>] / <_path_> [? <_query_>] [# <fragment>]

Resource Model
  - API service: `<_service_name_>.<_domain_>.com`
    - A collection of instances: `projects/*/instances/*`.
      - A collection of databases: `projects/*/instances/*/databases/*`.
    - A collection of users: `users/*`.
      - A collection of messages: `users/*/messages/*`.
      - A collection of change history: `users/*/history/*`.
      - A resource representing the user profile: `users/*/profile`.
      - A resource representing user settings: `users/*/settings`.

# General CRUD design

| Endpoint         | Action | Description           |
|------------------|--------|-----------------------|
| /users           | GET    | List Users Collection |
| /users           | POST   | Add a User            |
| /users/{user_id} | GET    | Show a User Entity    |
| /users/{user_id} | PUT    | Edit a User           |
| /users/{user_id} | PATCH  | Modify a User         |
| /users/{user_id} | DELETE | Remove a User         |

# REST-ful resources

#### 2×× Success
| Endpoint         | Action | Code | Description  | Notes               |
|------------------|--------|------|--------------|---------------------|
| /users           | GET    | 200  | Users list   | Empty Array allowed |
| /users           | POST   | 201  | User added   | Location Header     |
| /users/{user_id} | GET    | 200  | User found   |                     |
| /users/{user_id} | PUT    | 204  | User updated |                     |
| /users/{user_id} | DELETE | 204  | User removed |                     |

#### 3xx Redirection
| Endpoint          | Action | Code | Description         | Notes                     |
|-------------------|--------|------|---------------------|---------------------------|
| /files            | POST   | 303  | Begin Upload        | Location Header           |
| /files/{filename} | GET    | 304  | Contents Unmodified | If-None-Match/ETag Header |

#### 4×× Client Error
| Endpoint          | Action | Code | Description             | Notes                |
|-------------------|--------|------|-------------------------|----------------------|
| /users            | POST   | 400  | Invalid request body    |                      |
| /users/{user_id}  | PUT    | 400  | Invalid input parameter |                      |
| /users/{user_id}  | GET    | 404  | User not found          |                      |
| /users/{user_id}  | PUT    | 412  | User edit collision     | If-Match/ETag Header |
| /users/{user_id}  | DELETE | 404  | User not found          |                      |
| /files/{filename} | DELETE | 409  | File is in-use          |                      |

# Collections
```json
GET /files?page=0&offset=100&limit=100&search=glob&sort=-updated&filters=field:thing,tag:two
{
  "results": [
    { FileResponse } // Array of objects],
  "meta": {
    "page": {
      "number": 0,
      "size": 100,
      "totalPages": 3,
      "totalElements": 250}
  }
}
```

# Example API Resources

### Tokens: `POST /tokens`
Retrieve an access token using client credentials

##### Parameters

| Name       | Description                                                  |
|------------|--------------------------------------------------------------|
| grant_type | String. REQUIRED. Value MUST be set to "client_credentials". |

##### Request

```bash
curl -X POST 'https://api.subdomain.domain.cloud/v1/tokens' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'grant_type=client_credentials' \
  --data-urlencode 'client_id=xxxxxxxxxx' \
  --data-urlencode 'client_secret=xxxxxxxxxx' \
  --data-urlencode 'scope=calls:read'
```

##### Response
```json
HTTP/1.1 200 OK
{
	"access_token": "MTQ0NjJkZmQ5OTM2NDE1ZTZjNGZmZjI3...",
	"token_type": "bearer",
	"expires_in": 3600,
	"refresh_token": "IwOGYzYTlmM2YxOTQ5MGE3YmNmMDFkNTVk...",
	"scope":"irc:read irc:write stay:611bf1e3-0fd5"
}
```

##### Errors
| Status Code | Response Meaning             |
|-------------|------------------------------|
| 400         | Invalid request parameters.  |
| 403         | Requested prohibited scopes. |
