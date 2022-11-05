# ATM Case Studies #1: Dependency vs Write-your-own

That is a very typical situation!

Entity `E` _owns_ software artifact `A`. `E` wants a new feature which is in library `B`, completely developped by others. However, there is also the possibility to write its own feature instead of depending on `B`.


## Translated in ATM terms

Let `A'` be the software artifact `A` after the change.

`E` wants to maximize its [own ATM share](#Who-owns-software?) of `A'` (maximize: `ATM-E(A')`).

Depending on the path followed, `A' could be equal to:
  - `A'` = `A` + `B` (dependency case)
  - `A'` = `A` + `C` (write-your-own case)


Posed as an inequality, `E` should write its own if:
  
    ATM-E(A + B) < ATM-E(A + C)

We know that `A` and `B` are [independent](#Software-Artifacts-as-elementary-unit).

    ATM-E(A) + ATM-E(B) < ATM-E(A + C)

We know that `E` owns A and C completely. That gives `ATM-E(A) = ATM(A)` and `ATM-E(C) = ATM(C)`.

    ATM(A) + ATM-E(B) < ATM(A + C)

We know that `A` and `C` are not independent (it is expected that `C` will reuse parts of `A`), so we factor out their common part `D`

    A = D + (A without C)
    C = D + (C without A)

Replacing:

    ATM(D) + ATM(A without C) + ATM-E(B) < 2 x ATM(D) + ATM(A without C) + ATM(C without A)

Simplifying:

    ATM-E(B) < ATM(D) + ATM(C without A)

Simplifying again:

    ATM-E(B) < ATM(C)


So we've gone in a full circle tautology: `E` should write its own if the expected value of `C` over its lifetime exceeds the value of `B`, for `E`, over its lifetime.

_We haven't said anything there yet._


## Attempt at decomposing costs

We postulate for this problem that ATM(x) will be split between:
  - a creation cost `C(x)`, that also includes learnings and injuries, not just initial work
  - increased business value because of the feature `P(x)`
  - a maintenance cost `M(x)`

Of those:
  - `P(x)` would be typically >= 0
  - `M(x)` would be typically <= 0
  - in the case of infinitely long-lived software, `C(x)` is much smaller in magnitude than `M(x)` and `P(x)`.


Our equation becomes:

    C-E(B) + M-E(B) + P-E(B) < C(C) + M(C) + P(C)

Because `B` is completely _owned_ by others, C-E(B) is zero:

    M-E(B) + P-E(B) < C(C) + M(C) + P(C)

Now, we postulate that the feature leads to equal sales, whether it comes from artifact B or C. **This is, debatable postulate.**

    P(C) = P-E(B)
    M-E(B) < C(C) + M(C)

We stumble upon our second tautology: the cumulated maintenance ATM of C, plus its creation ATM, plus the learnings and injuries ATM, must be greater than the ATM cost of maintaining `B` (partially).

