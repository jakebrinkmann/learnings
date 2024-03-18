
## Postman Testing

```js
pm.test("Your test name", function () {
    pm.response.to.have.status(200);
    var responseJson = xml2Json(responseBody);
    console.log(responseJson["soapenv:Envelope"]["soapenv:Body"]);
});
```
