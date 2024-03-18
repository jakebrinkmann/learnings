
##################################################################
> spend minimal time on tasks until they reach the top of the list
##################################################################

`task add +next 'create bug / send email / whatever'`

# Bugwarrior

- MRs I own: `+inprogress`
- MRs awaiting review: `+review`
- MRs requiring my review: `+respond`

# Today

- Filters: `+BLOCKED` or I've put up for a `+review`
- Not due soon: 
- Immediately: `+next`
- Requires my review / respond to someone else: `+respond`
- Started and should finish sooner: `+inprogress`
- I would like to do `+today` or everynight becomes `yesterday`

`task rc.bulk=0 rc.confirmation=off status:pending +today modify -today +yesterday`

# Depends / Waiting

> It is BLOCKED, and the task it depends on is BLOCKING it.

- Internal: `task 123 modify depends:99` 
- External: `task 123 modify wait:1wk`

`task +BLOCKING -BLOCKED` <- Focus on tasks that block everything else.

# Triage

- Missing/empty `proj:` or `due:`
