- [Domain Modeling Made Functional](https://github.com/swlaschin/DomainModelingMadeFunctional)

## Workflow (problem-space)

Try to capture the domain in a slightly structured way:

    Bounded context: Order-Taking
    Workflow: "Place order"
       triggered by:
          "Order form received" event (when Quote is not checked)
       primary input:
          An order form
       other input:
          Product catalog
       output events:
          "Order Placed" event
       side-effects:
          An acknowledgment is sent to the customer,
          along with the placed order


## Workflow (solution-space)

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
