# Non-Functional Requirements

> The devil is in the details.

Intended to specify 'system qualities' (not directly related to functionality):

- Performance: Fast response
- Scalability: Handles increase in workload
- Availability: Up and running and Meant-Time-Between-Failure (MTBF)
- Security: Protects against unauthorized access
- Usability: Easy to use
- Maintainability: How easy is it to update/modify

Not "what the system does" but "how well it does it".

> "The [feature] should do X for Y users within Z timeframe."

NOT BACKLOG ITEMS: NFRs are persistent constraints on the design and development of the system.

[//]: # (Security & Compliance; Maintainability; Availability; Cost Effectiveness; Performance; Resilience)

# The Importance of Not Simply “Working”

The "ility" of engineering:
- *Quality*: "high value"; a high level of conformance and relatively low cost
- *Safety*: dysfunctional or detrimental interactions
- *Usability/Operability*: understanding human capability, needs, and limitations
- *Maintainability/Reliability*: Corrective (restore to fully functioning)/preventitive (ensure doesn't break down)

# Maintainability

- Operability: Making life easy for operations
- Simplicity: Managing complexity
- Evolvability: Making change easy

# Specification

- Includes NFR and functional requirements: compares fixed vs variable solution intent
    - Fixed: Well-known in advance (eg. "Adventure ride holds 12 people")
    - Variable: Refined over time (eg. "Acceleration at load shall be no less than x Gs")

- Step 1: Define NFR quality (name, scale, method of measure)
- Step 2: Quantifies NFR values (current/baseline; target/success; constraint/unacceptable)

# Major Issues in Systems Development

1. Time-to-Market
2. Productivity
3. Software Quality and Reliability
4. Maintainability
5. [Efficiency, Portability, Security, Usability]

# Non-Functional Types

- *Performance* - How fast does the system return results?
- *Scalability* - How much will this performance change with higher workloads?
- *Portability* - Which hardware, operating systems, and browsers, along with their versions does the software run on?
- *Compatibility* - Does it conflict with other applications and process within these environments?
- *Reliability* - How often does the system experience critical failures
- *Maintainability* - How much time does it take to fix the issue when it arises?
- *Availability* - How is user availability time compared to downtime?
- *Security* - How well are the system and its data protected against attacks?
- *Localization* - Is the system compatible with local specifics?
- *Usability* - How easy is it for the customer to use the system?
