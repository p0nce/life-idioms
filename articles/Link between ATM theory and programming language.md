# Link between ATM theory and programming language

What kind of programming language (or programming language feature) could take advantage of our newfound [ATM Theory of Software](#Attention-Time-Money-(ATM))?


### The keyword: `deprecated`

A feature that seems related to artifact ATM cost is the `deprecated` keyword in Java and D.

`deprecated` is a statement that said: "This has (probably) negative ATM".

Another way to express this is a comment that says its discontent with something, typically:
```d
// this is bad
// to be removed
// inadequate for xyz reasons
```

But why these deprecations accumulate in real programs?


### `TODO` comments

Programs are littered with interesting debt statements in the form of TODO comments.

`TODO` is a statement that says: "This change would (probably) have positive ATM". There is something "to do", but why not now? Is that a certainty? The comment usually tells why waiting.

If part of the cost is a statistics uncertainty (typically: "extend this only if artifact end up being used"), this TODO reflects that bayesian cost in its comment content usually.

**`deprecated` and `TODO` act as roughly reverse of each other, and express a statement about profitability of some software artifact: "good" or "bad".**

Both could be "conditional" and explain the key [bayesian decision](#ATM-Case-Study:-Should-you-fix-this-bug?) behind them. Why not being able to express "this needs to be removed, if xyz".

We can see intuitively that "to do" and "deprecated" are actually the same, in the same way that software asset and debt are the same. **Each provide an ATM statement about an artifact.**

Moreover, **the time that these annotations accumulate** is also significant and tells a statement about why the ATM to do something is not that positive. For example, it may be too costly to remove a widely used abstraction.

**Tracking TODO and deprecated over time could maybe hint at areas where value is concentrated.**

### Language Proposal

The experimental proposal is such:

_A first-class TODO system that replaces both deprecated keyword and TODO comments, and is tracked over time to estimate the ATM of a particular artifact (class, function, file...)_

_The compiler would track use of sub-artifact debt estimates, and would possibly provide an estimated ATM cost of the maintenance of that complete program._

_In other words: if you depend on an abstraction that is rated negatively in ATM, then your ATM cost depreciate (you will need to remove the dependency eventually), and conversely for depending on an abstraction with many positive TODO. A bit like cyclomatic complexity in a way._


### What about perfect things without change proposal annotations?

Some classes are rather perfect and contain no TODO or deprecation. We postulate that their ATM is smaller in absolute value than the surrounding code. If it weren't, there would be change friction around it. The programmer probably anticipated this wouldn't bring value to make it good, nor to remove it.