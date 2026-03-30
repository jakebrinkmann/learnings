---
tags: "[process, templates, workflows]"
---
# ..... LIMIT WORK IN PROGRESS AGE ..... 

# Statuses

    In Backlog [Open] (Requires Triage... What is it?)
    In Planning [Needs Grooming] (Is it actionable? Waiting for...? Eliminate/Incubate)
    In Elaboration (What is the next action?)
    Ready for Development [Groomed]
    In Development [In progress]
    Ready for QA [Technical Review]
    In QA [QA Test]
    Ready for Release
    Closed
    
    
# Card Colors

    green   #009755     comment ~ "#ThisIsGroomed"
    blue    #176ced     comment ~ "#ReadyForReview"
    yellow  #ffb300     comment ~ "#WaitingFor"
    red     #d8432e     commentedBy is empty or (comment !~ "#ThisIsGroomed" OR comment !~ "#ReadyForReview" OR comment !~ "#WaitingFor")

# Grooming

* ⭐ `*` **Ready**: team agrees with assignee that ticket is clearly defined
* 🔼 `**` **Follows**: can be done, but needs to happen after something else
* ❓ `?` **Waiting**: questions need answering before work can start
* ♻ `?*` **Review**: assignee has updated this ticket
* 💥 `!` **Blocked**: something outside our control has/will stop progress


# Definition of Done

* Designed/Prototype
* Coded
* Integrated
* Documented
* All Tests Pass