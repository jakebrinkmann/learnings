
## [As Time Goes By… (a Bi-temporal Event Sourcing story) - Thomas Pierrain - DDD Europe 2018](https://www.youtube.com/watch?v=xzekp1RuZbM)

Think in **problem space** (use cases).. don't jump too much into *solution space* developers


## [Ddd reboot (english version)](https://www.slideshare.net/ThomasPierrain/ddd-reboot-english-version)

LEVELS:
- CODE / PAIR
- APPLICATION / TEAM
- ENTERPRISE / COMPANY

### CODE / PAIR

- `[#Ubiquitous Language]`
- `[#Value Types]`

 **DOMAIN**? A set of *CONCEPTS* that, through *USE CASES*, allows us to *SOLVE PROBLEMS*
 
    DOMAIN: Double Entry Accounting
    SOLVED PROBLEMS: Tracking, Robustness
    CONCEPTS: Account, Debit, Credit, Amount

**CODE SMELLS:**
1. Magic Numbers
2. Duplication
3. Primitive Obsession
4. Mixed Concerns (TECH-BIZ)
5. Fuzzy Terminology

<img width="980" alt="image" src="https://user-images.githubusercontent.com/4110571/282518085-f1d4ee95-fcfb-44fc-a853-6e54806163c0.png">

<img width="1285" alt="image" src="https://user-images.githubusercontent.com/4110571/282518231-ea71a203-9a39-4d26-b2b4-1d77e7fcdd87.png">

> Let's Find the IMPLICITS! Make the IMPLICIT, EXPLICIT 💀

<img width="1271" alt="image" src="https://user-images.githubusercontent.com/4110571/282518317-ba59d61c-75d5-40f0-a7dd-84e36c973b6e.png">

**VALUE TYPES** (Domain Logic)
```java
// STRONG EQUALITY
// STRONG UNICITY (hashCode)
public Days daysToNewYear(LocalDate fromDate) {
    LocalDate newYear = fromDate.plusYears(1).withDayOfYear(1)
    return Days.daysBetween(fromDate, newYear)
}
```

- ❌ `amount.add(blueBookAmount)`
- ✅ `amount = amount.add(blutBookAmount)`

<img width="1099" alt="image" src="https://user-images.githubusercontent.com/4110571/282519939-cc590b89-f393-43ea-8efb-aa23260d27d2.png">


> It's developer's *understanding*, NOT your knowledge, that becomes software!
> - Alberto BRANDOLINI

**BOUNDED CONTEXT** (Ubiquitous Langauge)

    CONTEXT: CRM/Sales
    - Customer=> Economic group & center of interest
    CONTEXT: Accounting
    - Customer=> Method of & Payment Period
    CONTEXT: Order-Shipment/Logicstics
    - Customer=> addresses, availability

### APPLICATION / TEAM

- `[#Hexagonal Architecture]` `[#DDD-friendly]`
- `[#Bubble Context]`

**HEXAGONAL ARCHITECTURE**
> The world divides in two categories: DOMAIN (inside), INFRA (outside; Http Db ...)

```
+--------+----------+-----+
| APP UI | DATABASE | ... |
+--------+----------+-----+
|         DOMAIN          |
+-------------------------+
```

<img width="1268" alt="image" src="https://user-images.githubusercontent.com/4110571/282518524-bf411cc9-db5b-4ba5-b2ef-39470e322d88.png">

<img width="1207" alt="image" src="https://user-images.githubusercontent.com/4110571/282518603-de930925-90b5-4f17-a398-50b2193211d8.png">

<img width="1213" alt="image" src="https://user-images.githubusercontent.com/4110571/282518659-e91f49af-9ed6-4868-b45c-58fb704fb5be.png">

<img width="1149" alt="image" src="https://user-images.githubusercontent.com/4110571/282518724-e984d7bf-e4d7-4294-9277-657398d0b26d.png">

### ENTERPRISE / COMPANY

- `[#Bounded Contexts]`
- `[#Context Maps]`

**CONTEXT MAP** (Strategic Design)
> If you are upstream and you pollute the river...
> ... People downstream will be impacted. Not the inverse.

```
+----------------------+                       +------------+
| Context              | UPSTREAM              | CONTEXT    |
| <<Products Catalog>> |-----------------------| <<Search>> |
+----------------------+            DOWNSTREAM +------------+
                                                /
                 ANTI-CORRUPTION LAYER --------/
```

<img width="1270" alt="image" src="https://user-images.githubusercontent.com/4110571/282520042-05efb67d-9808-4000-a3b4-d94ac6677a9f.png">
