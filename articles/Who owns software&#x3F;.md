# Who owns the software?

Once we have the concept of [ATM](#Attention-Time-Money-(ATM)) we can define the concept of software ownership more precisely.


## Observation 1

The customer pays for software typically with Money, and derive some positive or negative value out of its existence.


## Observation 2

Smart companies have their employees maintain "ownership" over codebases. The idea is that worker `W` knows more than anyone else about [software artifact](#Software-Artifacts-as-elementary-unit) `A`. Repairing A will be less costly when `W` is doing it.

In economical terms, by virtue of having `W` know more about `A`, `ATM(A)` gets a higher value. 

On the other hand, the company gets to be the "shareholder" and obviously pay for this software being created.


## Who owns the software?

**Who "owns" the software artifact `A`?** Is it `W` or the company employing `W` to work on `A`? Is it `C` the customer that bought it?

Our proposal is that `ATM(A)` is typically split between:
- the "code owner"/worker `W`,
- the sharedholder `S`,
- the customer `C`.

The new definition of ATM is that **it is the sum of individual ATM contribution of every entity:**
```
ATM(A) = sum[for every entity E](ATM(E, A))
```

Hence:
```
ATM(A) = ATM-W(A) + ATM-S(A) + ATM-C(A)
```

In our split with 3 entities it is the sum of ATM of individual actors. Here is how to account for it:

**`ATM-S`** (ATM for Shareholder) would contain:
- Aggregated benefits from A existing: sales, future velocity, industry contacts, distribution opportunities...
- Labor costs: workers current and future salaries (Money here being traded for Time and Attention).

**`ATM-W`** (ATM for Worker) would contain:  
  * Gain of [positive ATM knowledge](#Thoughts-should-pay-for-themselves).
  * The economical loss that stems from negative ATM knowledge.
  * The pain or pleasure derived from working with artifact A.
- Aggregated benefits from working on A: eg. work opportunities.

**`ATM-C`** (ATM for Customer) would contain:
- Aggregated benefits from A existing.
- Present and future costs from operating the software (price, brain damage, recurrent costs...)

All these factors include _current and future events_.

Whether W, S, or C should be considered the "owner" of artifact A depends on the particular split. 

**Note that this is only one of the possible value split, since S, W and C can be one and the same.**


## Example: Contractor

_Ben is a contractor hired by TotoMetrics to make a small bug fix on their JSON parsing library. Ben charges $500 for that fix. He is done in 5 minutes and go on with his day. he forgets everything about it. He never works for TotoMetrics again._

In ATM terms: 
- let `L` be the JSON parsing library with the bug
- let `Lf` be the JSON parsing library after the fix
- let `S` be the shareholder TotoMetrics 
- let `W` be Ben

The company S hopes that:

    ATM-S(Lf) > ATM-S(L) + $500

That is equivalent to:

    ATM(Lf) - ATM-W(Lf) > ATM(L) - ATM-W(L) + $500

Now, for all intent and purpose Ben has no real exposure to `L`. `ATM-W(x)` is 0. That simplifies the equation to:

    ATM(Lf) > ATM(L) + $500

`S` in this case is the real "owner" of `L` since its ATM fraction `ATM-S` is equal to `ATM`. `S` will benefit completely from `L` losses and gains, and `W` won't be affected.


## Example: Idea Man

_Steve has an idea and tells Walter his idea of a new piece of software A. Walter like the idea and propose to build it for only $1000. When Steve fails to sell the early result, Walter steals the code, sabotage Steve online store, and sells it for its own benefit with no additional development. The customer of the software derive just recoup their investment, as they get $10 of value for their $10 of membership._

In ATM terms: 
- let `A` be the product being built
- let `S` be the shareholder Steve 
- let `W` be the worker Walter
- let `C` be the customers (but we know that `ATM-C(A)` is 0)

The hope of Steve is to get a positive ATM for himself:

    ATM-S(A) > 0

However if, as Steve will fail to sell the result forever it is pretty clear that ATM-S is known at: -$1000. No upside is expected for Steve forever, and salary was paid.

    ATM-S(A) = -$1000

For all intent and purpose Steve no exposure to `A` other than that loss.
Walter doesn't know if `A` will be an asset (positive ATM), but he knows he gets a $1000 head start on its own share of ATM.

    ATM-W(A) = ATM(A) + $1000

As Walter knows that its own rate on the market is $500/day, he hopes to have a good estimate of `ATM(A)` before 2 days, so he knows whether to abandon the project or not.

Obviously, a measure of "ownership" would need to account for the possibility of negative ATM. I'm not sure if a zero ATM means no ownership either, of if the whole concept of "ownership" is moot.