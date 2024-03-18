
# Logical vs Physical

- Logical: Business-related names, entities/attributes, logical naming convention (mixed case). Platform-agnostic.
- Physical: Technical names, tables/fields, platform-driven naming convention, field length and data types. Platform-specific.

# Notation

- `=` is composed of
- `+` and
- `( )` optional
- `{ }` iteration (zero or more; `minOcc{item}maxOcc`)
- `[ ]` select one choice
- `**` comment
- `@` identifier
- `|` or `;` alternative choices

    name = courtesy-title + first-name + (middle-name) + last-name
    courtesy-title = [Mr. | Miss | Mrs. | Ms. | Dr. | Professor]
    first-name = {legal-character}
    middle-name = {legal-character}
    last-name = {legal-character}
    legal-character = [A-Z|a-z|0-9|'|-| | ]


# Data Element

- `A = B + C` :: "A is defined as B and C"
- Meaning, Composition, Values:
    - Meaning: within this user's application (narrative for non self-defining term)
    - Composition: composed of meaningful elementary components
    - Values: elementary data element that cannot be decomposed further

    current-weight = *patient's weight upon admission to the hospital*
		     *units: kilograms; range 1-200*
    current-height = *patient's height upon admission to the hospital*
		     *units: centimeters; range: 20-200*
    sex = **
          *values: [M | F]*
    client = *alias for customer*
