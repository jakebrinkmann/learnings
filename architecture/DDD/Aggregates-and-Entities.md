---
tags: [architecture, ddd, tactical-design]
---
# Aggregates and Entities

### Core Concepts
- **Entity**: Identity + Thread of Continuity. Mutates over time.
- **Aggregate**: Cluster of Entities & Value Objects. Transactional consistency boundary.
- **Aggregate Root**: The single Entity acting as the gatekeeper. Outside objects only reference the Root.

### F# Pseudo-code Example
```fsharp
// Value Object (No identity, immutable)
type Money = { Amount: decimal; Currency: string }

// Entity (Has identity, mutates)
type OrderItem = { ItemId: Guid; ProductId: Guid; Quantity: int }

// Aggregate Root (Enforces invariants, transactional boundary)
type Order = {
    OrderId: Guid           // Identity
    Items: OrderItem list   // Internal Entities
    Total: Money            // Value Object
    Status: OrderStatus
}
```

### Design Rules (Vaughn Vernon)
1. **Model True Invariants**: Aggregate guarantees business rules within a single DB transaction.
2. **Keep them Small**: Reduces DB concurrency conflicts and memory footprint.
3. **One Aggregate per Transaction**: 
   - Spanning multiple aggregates? Use **Domain Events** (eventual consistency).
4. **Reference by Identity**: Don't hold object references to other Aggregates.
   - *Bad*: `type Order = { Customer: Customer }`
   - *Good*: `type Order = { CustomerId: Guid }`
