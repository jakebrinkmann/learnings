A list of common terms used in programming and their respective antonyms.

# Motivation
Using sensible, consistent wording in APIs improves readability, usability and greatly helps new users getting started. There is nothing more annoying than wondering what a function call is supposed to do while reading (someone else's or your own) code.

# Antonym List
Note: The table headings (positive/negative) are not necessarily meaningful.

| Positive  | Negative                                                        |
|-----------|-----------------------------------------------------------------|
| acquire   | release                                                         |
| add       | remove (e.g. an item), subtract (arithmetic)                    |
| advance   | retreat                                                         |
| allocate  | deallocate (correct), free (common)                             |
| allow     | deny                                                            |
| assemble  | disassemble                                                     |
| assign    | deassign (e.g. a task)                                          |
| associate | dissociate                                                      |
| attach    | detach                                                          |
| begin     | end                                                             |
| bind      | unbind                                                          |
| commit    | rollback                                                        |
| compile   | decompile                                                       |
| compress  | decompress                                                      |
| connect   | disconnect                                                      |
| construct | destruct                                                        |
| create    | destroy                                                         |
| do        | undo                                                            |
| enable    | disable                                                         |
| encode    | decode                                                          |
| encrypt   | decrypt                                                         |
| enqueue   | dequeue                                                         |
| enter     | leave, exit                                                     |
| expand    | collapse (e.g. a tree view), contract                           |
| first     | last                                                            |
| freeze    | unfreeze                                                        |
| front     | back                                                            |
| get       | set                                                             |
| grant     | revoke                                                          |
| head      | tail                                                            |
| import    | export                                                          |
| include   | exclude                                                         |
| increase  | decrease                                                        |
| increment | decrement                                                       |
| indent    | dedent                                                          |
| inflate   | deflate                                                         |
| inject    | eject                                                           |
| input     | output                                                          |
| insert    | delete (e.g. from a collection), extract (e.g. in a stream)     |
| install   | uninstall                                                       |
| link      | unlink                                                          |
| load      | unload (e.g. a module), save (e.g. state), store (e.g. a value) |
| lock      | unlock                                                          |
| maximum   | minimum                                                         |
| new       | old                                                             |
| next      | previous                                                        |
| open      | close                                                           |
| compose   | parse                                                           |
| paste     | cut                                                             |
| push      | pop (e.g. a stack item), pull (communication strategy)          |
| raise     | lower                                                           |
| read      | write                                                           |
| reference | dereference, unreference                                        |
| register  | deregister                                                      |
| resume    | suspend                                                         |
| select    | deselect                                                        |
| send      | receive                                                         |
| serialize | deserialize                                                     |
| set       | unset (e.g. a key), clear (e.g. a bit), get (e.g. a value)      |
| set up    | tear down                                                       |
| show      | hide                                                            |
| start     | stop                                                            |
| start up  | shut down, clean up (maybe)                                     |
| up        | down                                                            |
| upper     | lower                                                           |



# Initialize

There is no precise antonym for initialize and I don't think there has to be: By using initialize only for simple initializations that don't need any clean up code (initialize as its own antonym) you can
    1. establish a convention through that initialization routines without a corresponding clean up routine can be easily recognized, and
    2. circumvent the need for an antonym ;).

For routines that do not fall into this category, select another verb from the table above (most of the time there is a more descriptive alternative anyway).
If you still feel like you need an antonym; possibilities include but are not limited to: exit (very common in conjunction with init), reset, finalize, terminate.


# "De-" vs. "Un-"

Both prefixes (de- and un-) can be defined as a reversal of action. Most of the time the prefix de- is used for verbs while un- is used for adjectives. There are many exceptions to this rule though. In some cases careful usage of these prefixes can avoid ambiguity. For example, "he was unregistered" is ambiguous because it can mean either "he was not registered" or "his registration was removed", while "he was deregistered" is not.
