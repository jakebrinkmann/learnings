    Test Cases
    --------

    **Given that** _<initial case>_,
    **When** _<case changes or action happens>_,
    **Then ensure** _<the way it should be>_.


---

Acceptance Test for a Story
> Setup: The cashier has a new customer
> Operation: The cashier scans three cans of beans @
> $.99, two pounds of spinach @ $.59/lb, and a
> toothbrush @$2.00
> Verify: The receipt has all of the scanned items and
> their correctly listed prices




---
### Test Category

#### Test Case Name

A short english language description of what property this test verifies. The description should include enough detail
for a reader to be able to understand the test without having to search for any additional information. Prefer a long,
unambiguous description to a terse one that could be subject to interpretation.

<details><summary>Show test</summary></details>
##### Reference Implementation

```ts
// GIVEN
export class Foo {
  /* ... */
}

// WHEN
const bar = new Foo().bar();

// THEN
expect(bar.baz).toBeUndefined();
```

##### Reference Kernel Messaging

```python
## You can omit the initial hello/load messages
# < { "hello": "@jsii/runtime@1.2.3" }
# > { "load": { "name": "test-case-001", "version": "1.2.3", "tarball": "/tmp/jsii-kernel-test/lib.tgz" } }
# < { "assembly": "test-case-001", "types": 3 }
```

</details>