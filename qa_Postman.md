```javascript
// filename: collection_prerequest.js
pm.variables.unset('skipTest');

if (pm.info.iteration > 0) {
    if (pm.variables.get("important_var") !== "099") {
        throw new Error("COLLECTION SHOULD ONLY BE RUN FOR 099!");
    }
}
```

```javascript
// filename: collection_tests.js
letskipTest=pm.variables.get('skipTest');

pm.test("Nothing is a Server Error",function(){
    pm.expect(pm.response.code).to.be.below(500);
});

if(pm.request.method==="GET"){
    (skipTest? pm.test.skip: pm.test)("GET is not a Client Error",function(){
        pm.expect(pm.response.code).to.be.oneOf([200,404]);
    });
}

if(pm.request.method==="PUT"){
    (skipTest? pm.test.skip: pm.test)("PUT is not a Client Error",function(){
        pm.expect(pm.response.code).to.be.oneOf([204,404]);
    });
}

if(pm.request.method==="POST"){
    (skipTest? pm.test.skip: pm.test)("POST is not a Client Error",function(){
        pm.expect(pm.response.code).to.be.oneOf([201,202,204]);
    });
}

if(pm.request.method==="DELETE"){
    (skipTest? pm.test.skip: pm.test)("DELETE is not a Client Error",function(){
        pm.expect(pm.response.code).to.be.oneOf([204,404]);
    });
}

if(pm.request.method==="PATCH"){
    (skipTest? pm.test.skip: pm.test)("PATCH is not a Client Error",function(){
        pm.expect(pm.response.code).to.be.oneOf([204,404]);
    });
}

pm.variables.unset('skipTest');
pm.environment.unset('skipTest');
```

```javascript
// filename: folder_prerequest_script.js
pm.variables.set('skipTest',true);

pm.variables.set('skipTest',["Development Environment"].indexOf(pm.environment.name)<0);

pm.variables.unset('skipTest');
```

```javascript
// filename: test_schema.js
/// https://www.jsonschema.net/home
constschema={
    "$schema": "http://json-schema.org/draft-04/schema",
    "id": "http://example.com/example.json",
    "type": "object",
    "title": "The root schema",
    "description": "The root schema comprises the entire JSON document.",
    "default": {},
    "required": [
    ],
    "properties": {
    },
    "additionalProperties": false
}


pm.test('JSON Schema is valid',()=>{
    pm.response.to.have.jsonSchema(schema)
});


// Setting a variable programatically 
varjson_data=pm.response.json();
varitem_id=json_data._embedded['items'][0].id;
pm.environment.set("item_id",item_id);
```

```javascript
// filename: tests_overrides.js
// Set a skip that will expire, so we don't forget to update our stuff
letskipTest=(newDate()<newDate("2020-11-25"))&&(["Development","Test"].indexOf(pm.environment.name)<0);

(skipTest? pm.test.skip: pm.test)("Status code is 201",function(){
    pm.response.to.have.status(201);
});

(skipTest? pm.test.skip: pm.test)("Location is present",function(){
    pm.response.to.have.header("Location");
});

(skipTest? pm.test.skip: pm.test)("Validate schema",()=>{
    pm.response.to.have.jsonSchema({
        "type": "object",
        "properties": {
            "total_items": {
                "type": "number"
            },
            "page_count": {
                "type": "number"
            },
            "page_size": {
                "type": "number"
            }
        },
        "required": ["total_items","page_count","page_size"]
});
});

pm.variables.unset('skipTest');
```

```bash
// filename: trigger.sh
#!/usr/bin/env bash

BRANCH="development"
REPO="cloud/my/api-resources"
REPOID=345

./helper MY_API_TOKEN

#https://docs.gitlab.com/ee/ci/triggers/#adding-a-new-trigger
curl --request POST \
  --form token=$GITLAB_TRIGGER_TOKEN\
  --form ref=$BRANCH\
  --form "variables[NEWMAN_API_TOKEN]=$MY_API_TOKEN"\
  "https://git.example.com//api/v4/projects/$REPOID/trigger/pipeline"|jq .
```
