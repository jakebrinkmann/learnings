# Documenting your REST API

common API specifications, depending on the type of API:
- [OpenAPI](https://spec.openapis.org/oas/latest.html) – JSON or YAML descriptions of all web APIs and webhooks
- [AsyncAPI](https://www.asyncapi.com/docs) – JSON or YAML descriptions of event‑driven APIs
- [JSON Schema](https://json-schema.org/) – JSON descriptions of the schema objects used for APIs

# API

Title
<!--Additional information about your API call. Try to use verbs that match both request type (fetching vs modifying) and plurality (one vs multiple).-->
  - URL
<!--The URL Structure (path only, no root url)-->
  - Method: GET | POST | DELETE | PUT
<!--The request type-->
  - URL Params
<!--If URL params exist, specify them in accordance with name mentioned in URL section. Separate into optional and required. Document data constraints.-->
      - Required:
          - id=[integer]
      - Optional:
          - photo_id=[alphanumeric]
  - Data Params
<!--If making a post request, what should the body payload look like? URL Params rules apply here too.-->
  - Success Response:
<!--What should the status code be on success and is there any returned data? This is useful when people need to to know what their callbacks should expect!-->
    - Code: 200
    - Content: { id : 12 }
  - Error Response:
<!--Most endpoints will have many ways they can fail. From unauthorized access, to wrongful parameters etc. All of those should be liste d here. It might seem repetitive, but it helps prevent assumptions from being made where they should be.-->
    - Code: 401 UNAUTHORIZED
    - Content: { error : "Log in" }
    - OR
    - Code: 422 UNPROCESSABLE ENTRY
    - Content: { error : "Email Invalid" }
  - Sample Call:
<!--Just a sample call to your endpoint in a runnable format ($.ajax call or a curl request) - this makes life easier and more predictable.-->
  - Notes:
<!--This is where all uncertainties, commentary, discussion etc. can go. I recommend timestamping and identifying oneself when leaving comments here.-->


# EXAMPLE

    Show User
    Returns json data about a single user.
      - URL
    /users/:id
      - Method:
    GET
      - URL Params
    Required:
    id=[integer]
      - Data Params
    None
      - Success Response:
        - Code: 200
    Content: { id : 12, name : "Michael Bloom" }
      - Error Response:
        - Code: 404 NOT FOUND
          Content: { error : "User doesn't exist" }
        - Code: 401 UNAUTHORIZED
          Content: { error : "You are unauthorized to make this request." }
      - Sample Call:
        $.ajax({url: "/users/1",dataType: "json",type: "GET",success: function(r){console.log(r);}});
