# Libertarian moral concerns may explain D?

A while ago I stumbled upon this fascinating article:

[Understanding Libertarian Morality: The Psychological
Dispositions of Self-Identified Libertarians](https://pmc.ncbi.nlm.nih.gov/articles/PMC3424229/pdf/pone.0042366.pdf)

It basically describes the moral values of 3 clusters of people positionned in the political compass. 

Now, some of the moral values here for the "libertarian" group might are highly shared by the IT community in general, 
but I feel like in the D language it may be more concentrated. 

**This is only a pet theory but I feel like it can explain a lot.**

For years I was wondering what values and traits underlies the D community:
  - Should we appeal to tradition with the C lineage and conservatism?
  - Should we appeal to the desire for more innovation and community?
  - What if we should instead consider the lack of community as a feature?


## Event 1

A young man, never seen before, come to the D forums, having built his own D runtime from scratch (that is, avoiding the stdlib) to run in his vintage self-modified car. This is a highly celebrated story.

## Event 2

Fatigued by inertia, a fork is announced with a purposed goal of being more "open" and core team says: "The D leadership does not endorse the fork, but we also do not bemoan the people who are involved", then publicly hope for the forkers to eventually come back.

## Event 3

A half-troll, superdan, getting a bit of a mascott status on the D newsgroup. Official leaders of the group publicly regret its disappeance.



## Implicit context

When communicating with language, people hear words but also assume a large implicit context from their cultural background. This is the "prompt" part that comes with language.

If I were to imagine what is this implicit context in D:

- **Defiance towards totalizing systems** of thinking: "Every thing is-a" is considered a dangerous fantasy. For this reason, purity/`pure` is not highly valued even though it promises to do things... without State.

- **General indifference** to `@safe` features, or rather the shared impression that it won't be worth the freedom restriction. On the contrary, extraordinaty effort is produced to make D escape any platform constraints (runtime, GC, standard library) it may have and be as isolated as possible.

- **Low verticality.** Any form of process is "too heavy". D members make their code available for others to use, in a way that don't restrict other's liberty but may not want to create a community out of it or accept related social contracts. Because community is not that important, there is little verticality and the banhammer will rarely be used. Time and time again, complete outcasts and trolls gets accepted and often become productive member of the D community, with a complex and invisible bottom-up reputation system as a police. If not enough drama is produced, members will go out of their way to create some.

- **Large tolerance** of deviant behaviours, infighting, and of course multiple code styles. Highly tolerant in general. Existence of "idiomatic" code is not interesting. As such, multiple ways to see things or do things, are accepted at the same time ; not to feel unique, but to have choice by itself based on the situation. A one-size-fits-all solution like Golang's channels wouldn't be accepted at all. 
   
- **Two ways to do things:**
  - Error codes and exceptions.
  - `struct` (RAII value type) and `class` (GC reference type).
  - Static polymorphism and dynamic polymorphism.
  - Many attributes that split the language in two, with the default always being the less restrictive (`@safe`, `pure`, `nothrow`, `@nogc`...).

- There is a shared understanding there that **official truth might be completely wrong** (or even _is_ probably completely wrong), in a way that just stops right before entering conspiracy theory. Instead, a call to action and getting information by oneself, is highly valued. Empirical truth is much more considered than theory there. Truth is highly valued... until moral values in this list are attacked.

_...ana again, that's just my opinion._