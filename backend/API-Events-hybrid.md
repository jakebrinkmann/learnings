#

To generate a hybrid documentation that links OpenAPI (RESTful paths/resources) and CloudEvents (event subjects/types) in YAML, you should:

Define REST resources as OpenAPI paths: Each REST endpoint (e.g., /storeUser/{storeUserId}) is a resource.
Map CloudEvents subjects to REST paths: The subject in each event (e.g., storeUser/{storeUserId}) should match the REST resource path.
Describe events in YAML: List CloudEvents types, subjects, schemas, and descriptions, referencing the REST paths.
Here’s a template for your documentation

```yaml
openapi: 3.0.0
info:
  title: Biometrics Portal API & Events
  version: 1.0.0

paths:
  /storeUser/{storeUserId}:
    get:
      summary: Get Store User
      # ...other OpenAPI details...
    post:
      summary: Create Store User
      # ...other OpenAPI details...

  /customer/{netsuiteCustomerId}:
    get:
      summary: Get Customer
      # ...other OpenAPI details...

events:
  - type: biometrics.store.passwordforgot
    subject: /storeUser/{storeUserId}
    dataContentType: application/json
    dataSchema: "#/schemas/PasswordForgot"
    description: Emitted when a store user initiates a password reset.

  - type: biometrics.customer.lookup
    subject: /customer/{netsuiteCustomerId}
    dataContentType: application/json
    dataSchema: "#/schemas/CustomerLookup"
    description: Emitted when a customer lookup is initiated via email or phone.

  # ...other events...
```
