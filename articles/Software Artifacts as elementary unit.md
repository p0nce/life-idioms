# Software Artifacts as elementary unit

I want to reason upon any kind of software artifacts:
- an octet
- a for loop
- a function
- a class object
- a whole product
- a product portfolio

In this blog they will all be "software artifacts".

A _Software Artifact_:

- **Existence.** Has a physical extent in lines of codes, documentation, or data presence `Extent(x)`.
  Arguably if it isn't there, then it doesn't exist.

- **Price.** For each artifact `x`, we note `ATM(x)` the amount of Attention/Time/Money.
  This can be the cost to write the artifact, the cost to maintain it, etc. aggregated.


## Equality

Two artifacts `A` and `B` are **equal** iff `Extent(A) == Extent(B)`.
They have equal ATM.


## Composition

A software artifact is **composed of** other software artifacts, down to a unit level of minimum physical existence.
For example, the for loop is made of the `for` keyword, itself composed of `f`, `o`, `r` characters.

While it is difficult to think of an ATM just for a `f` letter, we postulate that it exists.

Composition is noted `A + B`.


## Independence

Two artifacts `A` and `B` are **independent** if for every artifact `a` that compose `A`, `a` cannot be found composing `B`.

Example: 
```
Company Comcom has two completely independent software products Toto and Titi,
that don't share a single file.
```


Postulate: if `A` and `B` are independent, then `ATM(A + B) = ATM(A) + ATM(B)`.


Example:
```
The Toto product earns $1000 a month and the Titi product $2000 a month, 
without any attention or time commitment, without sharing a single file.
Since ATM(Titi + Toto) = ATM(Titi) + ATM(Toto), their earnings add up independently.
```


## Decomposition rule

If software artifacts `A` and `B` are not independent, there exist 3 independent artifacts `a`, `b`, `C` such that:

- `A == C + a`
- `B == C + b`

In this case: `ATM(A + B) = 2.ATM(C) + ATM(a) + ATM(b)`


Example:
```
The Toto and Titi products now share some library code Baba.
Toto earns $10000 a month and the Titi product only $100 a month, 
without any attention or time commitment.
ATM(Titi + Toto) = ATM($10100 a month) 
  = 2.ATM(Baba) + ATM(Toto-specific code) + ATM(Titi-specific code)
```

Intuitively, we find that the most reused software artifacts have the most impact in the earnings of the company.
Obviously in this case, Toto-specific artifact has a big `ATM` but we don't know the exact division of value.