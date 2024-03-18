  - unit: fast to run, fast to fix
  - functional: "given this kind of input, I expect this output back"
  - user stories: "When I perform this kind of thing, given the system is in this kind of state or has this data, I expect to see this kind of thing as a result."
  
  - Performing A/B testing on production traffic to compare a new ML model with the old model 

structurally separate unit and integration:

  pytest tests/unit          #test cycle: one piece independently of other pieces (Pure Functions)
  pytest tests/functional    #asserting expected functionality of the component (from the outside-in, "wrapping")
  pytest tests/integration   #multiple pieces together, integrating both new and existing code (mock as little as possible)
  pytest tests/e2e           #the complete flow of the application from end-user's POV (robot-as-user, application as a whole)

BDD (Gherkin tests/"specs") are great for sharing tests with non-technical people ("acceptance"/"contract" testing)
  - https://github.com/pytest-dev/pytest-bdd#example
  - https://github.com/rest-assured/rest-assured

# Test Double Glossary
  - Monkey Patch: replacing functions or object properties
  - Mock: capture the parameters passed into the function
  - Spy: track how many times a function is called
  - Stub: drop-in replacement for data or functionality
