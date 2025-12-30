# TaskPaper / Todo+ Cheatsheet

A plain-text project management methodology that uses indentation and tags to organize tasks. Optimized for VS Code with the **Todo+** extension.

## 1. Core Syntax

The file structure relies on three element types defined by punctuation.

```taskpaper
Project Name:
    - Task item
    - Another task item
    Plain text notes go here (no prefix).

```

| Element     | Syntax                 | Example                       |
| ----------- | ---------------------- | ----------------------------- |
| **Project** | Ends with colon `:`    | `Migration:`                  |
| **Task**    | Starts with hyphen `-` | `- Update DNS`                |
| **Note**    | No prefix              | `Waiting on client approval.` |
| **Tag**     | Starts with `@`        | `@critical`                   |

## 2. Status & Tags

Tags are used for metadata, status, and filtering. You can create custom tags, but these are standard.

| Tag          | Usage          | Behavior (Todo+)             |
| ------------ | -------------- | ---------------------------- |
| `@done`      | Completed task | Renders ✔ and strikethrough |
| `@cancelled` | Abandoned task | Renders ✘ and strikethrough  |
| `@started`   | In progress    | Highlights item              |
| `@critical`  | High priority  | Custom highlight (red)       |
| `@due(date)` | Due date       | `@due(2025-01-15)`           |

## 3. VS Code Shortcuts (Todo+ Extension)

These shortcuts make the plain text interactive.

| Action               | Windows / Linux        | Mac                   |
| -------------------- | ---------------------- | --------------------- |
| **New Task**         | `Alt` + `Enter`        | `Cmd` + `Enter`       |
| **Toggle Done**      | `Alt` + `D`            | `Cmd` + `D`           |
| **Toggle Cancelled** | `Alt` + `C`            | `Cmd` + `C`           |
| **Toggle Start**     | `Alt` + `S`            | `Cmd` + `S`           |
| **Archive Finished** | `Ctrl` + `Shift` + `A` | `Cmd` + `Shift` + `A` |

## 4. Workflow Example

```taskpaper
Azure Consolidation:
    Discovery Phase:
        - Inventory "Victim" API @done(2023-12-28)
        - Inventory "Survivor" API @done(2023-12-28)

    Migration Actions:
        - Migrate Auth Policies @started
            Note: Ensure we don't break existing consumers.
        - Update DNS Records @critical @due(2025-01-01)
        - Decommission old resources

```

## 5. Filtering (VS Code Command Palette)

You can filter the view to focus only on what matters.

1. `Cmd+Shift+P` -> **Todo: Focus**
2. Select:

- `Focus on Pending` (Hides `@done` and `@cancelled`)
- `Focus on Current Project` (Hoists the current project)

---

### Raw Markdown

Would you like to copy the source code for this cheatsheet?

````markdown
# TaskPaper / Todo+ Cheatsheet

A plain-text project management methodology that uses indentation and tags to organize tasks. Optimized for VS Code with the **Todo+** extension.

## 1. Core Syntax

The file structure relies on three element types defined by punctuation.

```taskpaper
Project Name:
    - Task item
    - Another task item
    Plain text notes go here (no prefix).
```
````

| Element     | Syntax                 | Example                       |
| ----------- | ---------------------- | ----------------------------- |
| **Project** | Ends with colon `:`    | `Migration:`                  |
| **Task**    | Starts with hyphen `-` | `- Update DNS`                |
| **Note**    | No prefix              | `Waiting on client approval.` |
| **Tag**     | Starts with `@`        | `@critical`                   |

## 2. Status & Tags

Tags are used for metadata, status, and filtering. You can create custom tags, but these are standard.

| Tag          | Usage          | Behavior (Todo+)             |
| ------------ | -------------- | ---------------------------- |
| `@done`      | Completed task | Renders ✔ and strikethrough |
| `@cancelled` | Abandoned task | Renders ✘ and strikethrough  |
| `@started`   | In progress    | Highlights item              |
| `@critical`  | High priority  | Custom highlight (red)       |
| `@due(date)` | Due date       | `@due(2025-01-15)`           |

## 3. VS Code Shortcuts (Todo+ Extension)

These shortcuts make the plain text interactive.

| Action               | Windows / Linux        | Mac                   |
| -------------------- | ---------------------- | --------------------- |
| **New Task**         | `Alt` + `Enter`        | `Cmd` + `Enter`       |
| **Toggle Done**      | `Alt` + `D`            | `Cmd` + `D`           |
| **Toggle Cancelled** | `Alt` + `C`            | `Cmd` + `C`           |
| **Toggle Start**     | `Alt` + `S`            | `Cmd` + `S`           |
| **Archive Finished** | `Ctrl` + `Shift` + `A` | `Cmd` + `Shift` + `A` |

## 4. Workflow Example

```taskpaper
Azure Consolidation:
    Discovery Phase:
        - Inventory "Victim" API @done(2023-12-28)
        - Inventory "Survivor" API @done(2023-12-28)

    Migration Actions:
        - Migrate Auth Policies @started
            Note: Ensure we don't break existing consumers.
        - Update DNS Records @critical @due(2025-01-01)
        - Decommission old resources

```

## 5. Filtering (VS Code Command Palette)

You can filter the view to focus only on what matters.

1. `Cmd+Shift+P` -> **Todo: Focus**
2. Select:

- `Focus on Pending` (Hides `@done` and `@cancelled`)
- `Focus on Current Project` (Hoists the current project)

```

```
