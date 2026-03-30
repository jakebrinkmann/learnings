---
tags:
  - architecture
  - ddd
---
# Value Objects & Code Level DDD

### Code / Pair Level
**Domain**: A set of CONCEPTS that, through USE CASES, allows us to SOLVE PROBLEMS.
- **Ubiquitous Language**: Make the IMPLICIT, EXPLICIT.
- **Value Types**: Strong equality, strong unicity, domain logic inside.
  - ❌ `amount.add(blueBookAmount)`
  - ✅ `amount = amount.add(blueBookAmount)`

**Code Smells to Avoid**:
1. Magic Numbers
2. Duplication
3. Primitive Obsession
4. Mixed Concerns (TECH-BIZ)
5. Fuzzy Terminology

<img width="980" alt="image" src="https://user-images.githubusercontent.com/4110571/282518085-f1d4ee95-fcfb-44fc-a853-6e54806163c0.png">
<img width="1285" alt="image" src="https://user-images.githubusercontent.com/4110571/282518231-ea71a203-9a39-4d26-b2b4-1d77e7fcdd87.png">
<img width="1271" alt="image" src="https://user-images.githubusercontent.com/4110571/282518317-ba59d61c-75d5-40f0-a7dd-84e36c973b6e.png">
<img width="1099" alt="image" src="https://user-images.githubusercontent.com/4110571/282519939-cc590b89-f393-43ea-8efb-aa23260d27d2.png">
