# ATM Case Studies #2: Should you fix this bug?

_For that problem we will avoid all discussions of ownership, as they are often tautological._

Some things you can't know before building them, for example the outcome of an algorithm, or the cost of a bug fix.


## The problem to illustrate this

Edouard resize images with lanczos3. He's trying the magic kernel, but the result has a new bug. What to do? Persevere or abandon the effort?


## Translated in ATM terms

In entity `E` codebase, there is an image resizer `R`.

`E` wants to try another image resizing algorithm `A`, and take the best one. `R' = R + A` is created.
Unfortunately, to use the new algorithm there is a bug fix `B` to be found first, a memory corruption.

- The new algorithm suitability (`R'` better than `R`) can only be _assessed_ once `R'` has been built.
- The new algorithm can only be _used_ once `R''` with `R'' = R' + B` has been built.

We suppose independent decomposition of R' into R and A, and of R'' into R' and B.

**What should do E:
  1. keep `R`
  2. develop `R' = R + A`? (the new resizer)
  3. develop `R'' = R + A + B`? (the new resizer, fixed)

- Intuitively, it's not worth building `R'` if we know the new algorithm can't be better.
- Intuitively, it's not worth fixing it, if the new algorithm doesn't prove better in tests.


Obviously the ATM outcome of doing nothing is the "BATNA" choice, `ATM(R)`.


**For the R vs R' decision**

The algorithm should be built if:
```
ATM(R') - ATM(R) > 0
```

Under our postulate of independence this is equivalent to:
```
ATM(A) > 0
```

`A` being the specific modification of R that implements the new algorithm.


**For the R' vs R'' decision**

Likewise, the algorithm should be debugged if the fix is a positive ATM artifact:
```
ATM(B) > 0
```


## So we are stuck there

We need a way to decomposate ATM alongside conditionals.
Much like we assume stock price to vary in the future depending on yet unknown events (such as the earth exploding).

We'll define **conditionals** with small letters.
```
ATM(X | e) = ATM of artifact X, given than e will occur in the future.
ATM(X | ~e) = ATM of artifact X, given than e will not occur in the future.
```

`ATM(X)` being a perfect, unknown price, it is equal to either exactly `ATM(X | e)` or exactly `ATM(X | ~e)`.


## Let's get back to our problem

Let `c` be the conditional "new algorithm better than older".
Let `D` be the ATM gain of "having a better algorithm".

We estimate:
```
ATM_approx(A | c) = price of writing(A) + price-of-maintaining(A) + D
```

and

```
ATM_approx(A | ~c) = price of writing(A)
```

Thus we can estimate `ATM(A)`:
```
ATM_approx(A) = ATM_approx(A | c) * prob(c) + ATM_approx(A | ~c) * (1 - prob(c))
```

So this is exactly a **Bayesian** rule.

Our solution is now:

```
ATM_approx(A) = price of writing(A) + ( price-of-maintaining(A) + D) * prob(c)
```

**We can evaluate this to know approximately if this is worth it to attempt to write `A`.**



## Should `E` fix the bug?

This is equivalent, `E` should attempt to fix the bug if `ATM_approx(B)` is estimated to be > 0.


Let `b` be the conditional "E manages to fix the bug".
Let `G` be the ATM gain of "having the bug fixed".
```
ATM(B | b) = price of writing(B) + ( price-of-maintaining(B) + G) * prob(b)
ATM(B | ~b) = price of failing to write(B)
```

The ATM of the fix is, in our analysis:
```
ATM(B) = price of failing to write(B) * (1 - prob(b)) + price of writing(B) + ( price-of-maintaining(B) + G)
```

This respects the **tautological nature of our ATM theory**, since if the bug fix can be found 100% of the time, then ATM(B) = ATM(B | b).

