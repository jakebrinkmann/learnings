---
tags: "[architecture, ddd]"
---
# Domain Modeling & Workflows

### Modeling Approach
* **Scenario**: Goal for user; **Use-case**: user interactions to take
* **Process**: goal for business; **Workflow**: detailed part of process (single-team)

Try to model processes:
`Events -(triggers)-> Commands -(Input)-> Workflows -(Output)-> [Event, Event, Event]`

### Workflow Example: Order-Taking

**Problem Space (Bounded Context: Order-Taking)**
- **Workflow**: "Place order"
    - **Trigger**: "Order form received" event (when Quote is not checked)
    - **Primary Input**: An order form
    - **Other Input**: Product catalog
    - **Output Events**: "Order Placed" event
    - **Side-effects**: An acknowledgment is sent to the customer, along with the placed order

**Solution Space (Workflow Implementation)**
```
workflow "Place Order" =
    input: OrderForm
    output:
       OrderPlaced event (put on a pile to send to other teams)
       OR InvalidOrder (put on appropriate pile)
    // step 1
    do ValidateOrder
    If order is invalid then:
        add InvalidOrder to pile
        stop
    // step 2
    do PriceOrder
    // step 3
    do SendAcknowledgementToCustomer
    // step 4
    return OrderPlaced event (if no errors)

substep "ValidateOrder" =
    input: UnvalidatedOrder
    output: ValidatedOrder OR ValidationError
    dependencies: CheckProductCodeExists, CheckAddressExists
    validate the customer name
    check that the shipping and billing address exist
    for each line:
        check product code syntax
        check that product code exists in ProductCatalog
    if everything is OK, then:
        return ValidatedOrder
    else:
        return ValidationError
```

### Domain Data Structures
*(Example from Order-Taking Context)*
```
data WidgetCode = string starting with "W" then 4 digits
data GizmoCode = string starting with "G" then 3 digits
data ProductCode = WidgetCode OR GizmoCode

data PricedOrder =
    ValidatedCustomerInfo
    AND ValidatedShippingAddress
    AND ValidatedBillingAddress
    AND list of PricedOrderLine  // different from ValidatedOrderLine
    AND AmountToBill             // new
data PricedOrderLine =
    ValidatedOrderLine
    AND LinePrice                // new
data PlacedOrderAcknowledgment =
    PricedOrder
    AND AcknowledgmentLetter

data ValidatedOrder =
    ValidatedCustomerInfo
    AND ValidatedShippingAddress
    AND ValidatedBillingAddress
    AND list of ValidatedOrderLine
data ValidatedOrderLine =
    ValidatedProductCode
    AND ValidatedOrderQuantity

data UnvalidatedOrder =
    UnvalidatedCustomerInfo
    AND UnvalidatedShippingAddress
    AND UnvalidatedBillingAddress
    AND list of UnvalidatedOrderLine
data UnvalidatedOrderLine =
    UnvalidatedProductCode
    AND UnvalidatedOrderQuantity

data OrderQuantity = UnitQuantity OR KilogramQuantity
data UnitQuantity = integer between 1 and 1000
data KilogramQuantity = decimal between 0.05 and 100.00

data CustomerInfo = ???   // don't know yet
data BillingAddress = ??? // don't know yet
```
