```
project = "PROJECT" 
AND status != Open 
AND sprint in openSprints() 
AND (
  resolution is EMPTY 
  OR resolution in (Completed, Done)
 ) 
 AND (
  (updatedDate < endofweek("-8d") AND updatedDate > startofday("-3d")) 
  OR (updatedDate > startofday("-1d"))
 ) 
 ORDER BY status ASC, updated DESC
```

```
project = "PROJECT" 
AND priority in (Blocker, Critical) 
AND (created >= -14d OR resolved >= -14d) 
ORDER BY resolution DESC, priority DESC, created DESC
```

ONE COLUMN Dashboard.jspa

* Sprint Health Gadget
* Pie Chart: Sprint Remaining
* Filter Results: Critical/Blocker Bugs
  * Priority
  * Created
  * Status Category
  * Resolved
  * Assignee
  * Issue Type
  * Summary
  * Epic Link
* Filter Results: Sprint Updates
  * Epic Link
  * Priority
  * Reporter
  * Issue Type
  * Summary
  * Status
  * Assignee