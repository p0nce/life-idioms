# Why I avoid Jai and CLAP


_Disclaimer: I don't mean to pick on people or things. For the record I predicted the demise of start-ups that were bought for many, many times their initial investments. here I describe my 3 criterions to judge if I will depend on some piece of software to build upon._

It seems "obvious" to me that using [Jai](https://en.wikipedia.org/wiki/Jonathan_Blow#Jai_language) (the programming language) or [CLAP](https://en.wikipedia.org/wiki/CLever_Audio_Plug-in) (an open-source audio plugin format) are rather risky choices (3 out of 3).

On the contrary, using [D language](https://dlang.org/) is seen as a big risk in my circles, even though by my criterions it's not (0 out of 3).

A small business like mine shouldn't take unsubstantiated bets. You cannot build on sand. I'll try to dissecate my reasoning for how I consider something to be sand or concrete.

But what if I was just reasoning out my desires and giving them a varnish of rationality? This is a possibility, so let's analyze it.



## Criterion 1. Length of money runway

Things that last need almost _boundless funding_ compared to things that are just made as a one-off. 
- [LV2](https://fr.wikipedia.org/wiki/LV2_(plugin)) existed since _2006_.
- [Python](https://en.wikipedia.org/wiki/Python_(programming_language)), a wildly successful language, appeared in _1991_.

This kind of longevity takes a lot of dedication and money.

Things that last for a while are typically made by:
- Labs with government funding (eg: Faust, Postgres)
- Successful product paying virtually indefinitely for its implementation (Dplug)
- Continued effort as _durable_ personal itch, with BigCo employment (VisualD)
- A business which is not a "startup", and somehow benefits from "community"

It's important to know how likely it is that the people _building_ the artifact you would depend on will be forced to stop, due to lack of money.


_Example:_

_- SOUL was made by a money-loosing start-up. The start-up (predictably) died and SOUL was buried, since not making money._

_- Thekla has funding because of The Witness, but the astute observer will see that both this last game and their last last game almost bankrupted the company. If they also go near-bankrupt for this next game, how will they find funding to develop Jai on top of it? On top of it, games are one of the hardest market to be in._

_- CLAP is mainly made by a contractor. Whatever the intention, if the money dries up, there might not be any reason for a contractor to keep working. To put it politely, audio software companies are more interested by piling up money than giving it to open-source. If they loved open source, they would have funded and supported LV2 instead. Meanwhile, LV2 survived for years and years while being maintained._

Whatever is a moneymaker will probably get maintained and **blossom**, even in complete absence of passion.


## Criterion 2. Intrinsic need

Using [Flutter](https://flutter.dev/) would **make me pause**, because Google doesn't really NEED it to operate. For what it's worth, it could invent an even superior UI library and abandon this one, leaving you with debt. Google has unlimited funding, but Flutter will be dumped if it's not strategic to do.

At a more fundamental level, what you depend on must be an integral part of its creator plan, strategy, and perhaps a bit of personal narrative.

_Example:_

_- Thekla doesn't NEED Jai: they do write a Sokoban game in it, but its success stems from The Witness (a C++ game), not from a Jai game. What will happen if the game will fail? No incentive to develop Jai at all. That completely changes if the game is a financial success!_

_- u-he and Bitwig do not NEED CLAP: they funded it, but it likely pro-bono and their success builds upon unrelated other things (successful audio software). The problem is that there is a need for such a plugin format, but LV2 already exists that solve the same problem._


## Criterion 3. Window of hype

It is important to correct for hype.

Typically, people ask others "why not use X?" for a few years during a "window of hype". It can even get tiring. For example D people being pressured to rewrite in Rust, as if the language was 100% independent of the thing being made.

What the heck? I mean, this technique is exactly the same as Instagram pyramidal NFT schemes.

I've found that _hype_ is a great indicator of something that is likely overrated and unsustainable. Things that are good (like PHP or FLStudio) instead **quietly powers the world** without too much noise. The presence of noise instead indicate they are not going to be mainstay, or they are goig to only appeal to higher-class people.

_Example:_

_- SOUL language was presented like "the future", and discontinued the next year. Compiler was kept closed-source, probably in anticipation of that event._

_- Jai has been 9 years in the making, with excitement going down as the novelty wears off. It is being kept closed-source and in private beta, either to generate excitement, or to prepare for keeping it private/abandoned._

_- CLAP is mentionned to me, but with less energy in 2023 than 2022, in the mean time LV2 is also making progress. The current hype wouldn't have happened without a marketing effort, something that LV2 never had._

_- FLStudio is **by a large amount** the most used DAW in the world, but if measured by Internet noise you would think it is Ableton Live._

_- [Odin language](https://odin-lang.org/) doesn't have this problem._

_- [Resolve](https://www.blackmagicdesign.com/products/davinciresolve) is an amazing software that has well-deserved hype, however it's not the aggressive style of hype. Sometimes the hype is well-deserved, but in many cases the style and effectiveness of people that push something should inform you. In its domain Resolve is not yet the dominating choice._

