Technical Review Checklist:

Rank these according to criticality (1st - Vital, Last - Inconsequential):
- Small code contributions
- Merged quickly
- JIRA card attached
- In-depth intensity of review
- Automated style checks
- Automated deployment
- Automated tests
- Single Project Maintainer sign-off / approval
- Every thread is resolved
- People liked your work
- Many reviewers

```plantuml
@startuml
(*) --> "Incoming Merge Request"

if "Is the effort small?" then
  if "JIRA card attached?" then
    --> [Yes] if "Critical/Major priority?" then
      --> [Yes] "High Priority" as HP
    else
      --> [No] "Medium Priority" as MP
    endif
  else
    --> [No] "Low Priority" as LP
    --> "Try to gather support"
  endif
endif

@enduml
```

1. Find something to work on
2. Design
3. Work your Magic
4. Merge Request
5. Merge
