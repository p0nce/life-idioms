# Software personality traits

I want to reason on qualitative "traits" that software artifacts may have. Like personality studies, if we can enumerate those possible traits and find the correlation, we will maybe stumble upon a "Big Five" of software.

Here is the method:
- First, find any pair of opposite traits that software artifacts may have, even if their definition is rather blurry.
- Second: rate imaginary software artifacts alongside those different axis.


## The before rating

Here is some traits I can think ok:

- H. **Private** (H+) vs **Public** (H-)
  _Is information hiding important in this artifact? Are namespace clashes likely?_

- D. **Declarative** (D+) vs **Imperative** (D-) 
  _Does the artifact describes things to do, or do it directly?_

- U. **Pure** (U+) vs **Mutable** (U-) _Does the artifact promote lack of state?
- Q. **High-quality** (Q+) vs **Low-quality** (Q-) _Does the artifact NEED to be "high quality"?_
- S. **Large** (S+) vs **Small** (S-) _Does the artifact NEED to be small to justify existence?_
- B. **Buggy** (B+) vs **Correct** (B-) _Does NEED to be correct to justify existence?_
- F. **Fast** (F+) vs **Slow** (F-) _Does the artifact NEED to be fast to justify existence?_
- T. **Top-down** (T+) vs **Bottom-up** (T-) _Was the software made rather with topdown design, or with bottom-up design?_
- R. **Reused** (R+) vs **Throwable** (R-) _Does the artifact NEED to be reusable to justify existence?_
- C. **Creative** (C+) vs **Conventional** (C-) _Do you know what the result will be like at creation?_
- U. **User-rich** (U+) vs **User-poor** (U-) _Does the artifact offer many modalities?_
- P. **Professional** (P+) vs **Consumer** (P-) _Is the artifact intended for consumers?_
- M. **Maintenance** (M+) vs **No-maintenance** (M-) _Does the artifact need much maintenance?_
- N. **Big runtime** (N+) vs **Small runtime** (N-) _Does the artifact relies on another big artifact to exist? (relative size)_
- E. **Errors matter** (E+) vs **Errors can be ignored** (E-) _Does the artefact NEED to manage errors in a meaningful way?_


_Obviously this choosen set isn't perfect at all._


## The artifacts

Let's rate all of the artifacts alongside those axis, and see what happens.

### 1. An informal Excel ERP made by a small business owner
```
H- D+ U+ Q- S- B+ F- T- R- C+ U- P+ M= N+ E-
```

### 2. A web browser made in C++, started after year 2000
```
H+ D= U= Q+ S+ B+ F+ T+ R- C- U+ P- M+ N- E+
```

### 3. A synthesizer plugin made in C++ and JUCE
```
H- D= U- Q+ S+ B- F+ T= R- C+ U+ P- M= N+ E-
```

### 4. The backend of a bank in COBOL
```
H+ D= U= Q= S+ B- F+ T= R- C+ U- P+ M+ N= E+
```

### 5. The std::allocator API
```
H- D- U- Q+ S- B- F+ T- R+ C+ U- P+ M- N- E+
```

### 6. A C standard library for a custom processor
```
H+ D- U+ Q+ S+ B- F+ T- R+ C- U- P+ M- N- E+
```

### 7. A small VM interpreter to run scripts in a business application
```
H- D- U- Q= S- B+ F= T+ R= C= U- P+ M- N- E-
```

### 8. The build script that builds this blog from Markdown
```
H- D= U- Q- S+ B- F- T- R- C- U- P+ M- N= E-
```

### 9. The HTML page that host this blog
```
H- D+ U+ Q- S+ B+ F- T+ R- C+ U+ P- M= N+ E-
```

### 10. A Mobile video game made in Unity and C#
```
H- D= U- Q+ S+ B- F+ T- R- C+ U+ P- M= N+ E-
```

### 11. A short R script to compute one curve fitting for a paper
```
H- D- U+ Q- S- B+ F- T- R- C+ U- P+ M- N= E-
```

### 12. A command prompt made in C, as a teaching exercise
```
H- D- U- Q- S+ B+ F- T+ R= C- U+ P+ M- N- E-
```

### 13. The interface of an Unicode Java library
```
H+ D- U+ Q+ S- B- F- T+ R+ C+ U- P+ M- N- E+
```

### 14. The implementation of an Unicode Java library
```
H- D= U- Q= S+ B- F- T- R- C+ U- P+ M+ N- E+
```


## Image of the dataset


<img style="image-rendering: pixelated; width:50%" src="software-traits/dataset.png" />


## Image of the cross-correlations

<img style="image-rendering: pixelated; width:50%" src="software-traits/correlations.png" />



## Conclusions

Here are the strongest autocorrelations analysis in our small dataset:

- "Consumer" software is associated with "User-rich". Which could also means non-consumer software can be poor in this regards and have less modalities.

- Software where error reporting matters also are software where information-hiding matter. Perhaps an explicitely "throwable" traits would highlight this lack of correctness, and under what conditions.

- Software comprised of "declarative" style is also associated with a bigger runtime.

- Declarative code is less meant to be reused. Which makes sense if we think of HTML, CSS, etc.

- Software that needs to be fast often also needs to be of a high-quality, or vice-versa. Perhaps would need to clarify what high-quality means.


Well, that's not bad for an informal made-up dataset. If done with more rigor, one should perhaps discover useful phenomenon and even reduce to core dimensional traits of software artifacts.