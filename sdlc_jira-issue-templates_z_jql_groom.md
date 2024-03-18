* Ready for Review `project = "PROJECT" AND labels = ReadyForReview AND StatusCategory = "To Do" ORDER BY sprint ASC, Rank ASC`
  * Epic Link
  * Sprint
  * Story Points
  * Issue Type
  * Key
  * Summary
* Groomed `project = "PROJECT" AND labels = Groomed AND StatusCategory = "To Do" AND (sprint is empty OR sprint not in openSprints()) ORDER BY sprint ASC, Rank ASC`
  * Epic
  * Sprint
  * Story Points
  * Issue Type
  * Key
  * Summary
* Needs Grooming `project = "PROJECT" AND labels = NeedsGrooming AND StatusCategory = "To Do" ORDER BY sprint ASC, Rank ASC`
  * Assignee
  * Epic
  * Sprint
  * Issue Type
  * Key
  * Summary