---
tags: [architecture, ddd, strategic-design, subdomains]
---
# Shared Core Subdomain

While traditional [[Subdomain-Distillation]] categorizes domains into Core, Supporting, and Generic, complex ecosystems often reveal a **Shared Core Subdomain**.

### What is a Shared Core?
A Shared Core is a foundational domain that anchors the semantics for multiple distinct Core domains. It is the "one thing everyone touches" and relies upon to maintain consistency across the system.

**Characteristics:**
- It does not belong exclusively to any single downstream domain (e.g., not exclusively manufacturing, logistics, or warehouse ops).
- It is used uniformly by all contexts.
- If modeled incorrectly, all dependent contexts will drift and suffer from misaligned semantics.

### Example: Partner Program
In an ecosystem with both White-Label Manufacturing and 3PL Fulfillment, the **Partner Program** acts as the Shared Core. 

It defines:
- Partner identity
- Commercial terms
- Capabilities (White-Label? 3PL? Both?)
- Branding rules

*Key Insight:* Even when the same actor (a Partner) participates in multiple programs (e.g., both White-Label and 3PL), the semantics of their *operations* remain different and belong in separate Core subdomains. The Shared Core only manages their universal identity and overarching terms.
