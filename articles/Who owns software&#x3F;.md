# Who owns the software?

Once we have the concept of [ATM](#Attention-Time-Money-(ATM)) we can define the concept of software ownership more precisely.

## Observation

Smart companies have their employees maintain "ownership" over codebases. The idea is that worker `W` knows more than anyone else about software artifact `A`. Repairing A will be less costly when `W` is doing it.

In economical terms, by virtue of having `W` know more about `A`, `ATM(A)` gets a higher value. 

On the other hand, the company gets to be the "shareholder" and obviously pay for this software being created.


## Who owns the software?

Who owns the software artifact `A`? Is it `W` or the company employing `W` to work on `A`?  

Our proposal is that `ATM(A)` is split between the "owner"/worker `W` and the sharedholder `S`.

    ATM(A) = ATM-W(A) + ATM-S(A)

The sum of ATM of individual actors.

**`ATM-S`** (ATM for Shareholder) would contain:
- Aggregated benefits from A existing: sales, future velocity, industry contacts, distribution opportunities...
- Labor costs: workers current and future salaries (Money here being traded for Time and Attention).

**`ATM-W`** (ATM for Worker) would contain:  
  * Gain of [positive ATM knowledge](#Thoughts-should-pay-for-themselves).
  * The economical loss that stems from negative ATM knowledge.
  * The pain or pleasure derived from working with artifact A.
- Aggregated benefits from working on A: work opportunities.

All these factors include _current and future events_.

Whether W or S should be considered the "owner" of artifact A depends on the particular split. 

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

`S` in this case is the real _owner_ of `L` since its ATM fraction `ATM-S` is equal to `ATM`. `S` will benefit completely from `L` losses and gains, and `W` won't be affected.


