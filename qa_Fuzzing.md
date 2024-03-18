# [Web API Fuzz Testing | GitLab](https://docs.gitlab.com/ee/user/application_security/api_fuzzing/#openapi-specification)

API fuzzing uses an OpenAPI document to generate the request body.

> **Never** run fuzz testing against a production server.
> Not only can it perform any function that the API can, it may also trigger bugs in the API.
> This includes actions like modifying and deleting data. Only run fuzzing against a test server.

```yaml
# https://gitlab.com/gitlab-org/security-products/demos/api-fuzzing-example/
include:
    - template: API-Fuzzing.gitlab-ci.yml

apifuzzer_fuzz:
    services:
        - name: $OPENAPI_TARGET_IMAGE
          alias: target
# https://gitlab.com/gitlab-org/security-products/demos/api-fuzzing-example/-/raw/openapi/test_openapi.v2.0.json
```
