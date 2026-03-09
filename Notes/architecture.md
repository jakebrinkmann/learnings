---
tags: "[architecture]"
---
> Notes provided “AS IS” for Agile Software Delivery, NOT official documentation.

## 🎯 Goals
* List your goals for how architecture should work together.

##  📋 Overview
* Explains how the structural components of your architecture currently work together.

## 📐 Architecture
<!--Add diagram-->

## 🔗 System Flow
* Add detail about the architecture diagram above using numbers or other labels. 

## 📦 Types

For each type in the API:

- Document what each type represents
- Document how to *produce* a value of that type
- Document how to *transform* a value of that type
- Document how to *consume* a value of that type

## ✉️  Events

```json
{
    "specversion" : "1.0",
    "type" : "com.github.pull_request.opened",
    "source" : "https://github.com/cloudevents/spec/pull",
    "subject" : "123",
    "id" : "A234-1234-1234",
    "time" : "2018-04-05T17:31:00Z",
    "datacontenttype" : "application/json",
    "data" : {
	"doge": "much wow"
    }
}
```

## 💻 REST API details

**example request**

```shell
PUT '/v2/service_instances/binding-1'
```

**example response**

```json
// Some comments here
{
		"foo": "bar"
}
```

## 🎛️ Quality Metrics
* scenarios, most important quality goals, how close to achieving the set aims (health)
* This is usually done by continuously monitoring system health and alerting operations staff in the event of a failure.

## 🚀 Deployment Strategy
* Deployment region

## 🤝 SLA
* Requests per second, Latency
		
## 🚩 Architecture issues
* Issues with current architecture.

## ✅ Action Items
* Action - Description - Owner - Due Date - JIRA Ticket    

## 👣 Next Steps
* Explain the work your team plans to do and how it helps.

## 📁 Documentation
* Add links to references and documentation
