---
layout: post
title: Weekly Notes (Feb 13th / Feb 19th, 2018)
---

I am quite happy. I managed to get quite a bit of work done on my personal projects. I also managed to publish two blog posts.

As a starter, I finished writing [My Thoughts on React Native](http://www.preslav.me/2018/01/07/my-thoughts-on-react-native/). It ended up being quite a bit of an opinionated piece, even for my taste, but it is what is. The post is out there, so feel free to check it out, and I will be happy to get your feedback on it.

---

## Project Work
### CryptoTrader

This week I dusted off my [CryptoTrader](https://github.com/preslavrachev/cryptotrader) algotrading project. I started [working on a feature](https://github.com/preslavrachev/cryptotrader/issues/24) I've been kind of thinking about for a while, but somehow I did not get to sit down and implement it. When finished, it will allow for placing order pairs (BUY-SELL / SELL-BUY), with a single REST request. The first order will get executed immediately at the market rate (or placed as a limit order if price is specified). The second order will be stored locally, but not executed, until a confirmation gets received, about a successful trade after the first order. The API will be flexible enough to allow for setting a percentage margin (to not have to compute prices manually), as well provide a cancellation window (essentially, executing the second order at a given time, regardless of profit or loss).

This feature would allow essentially anyone running CryptoTrader to test new trading strategies without having to have them built as part of the application. I usually start my experiments by writing a quick and dirty Python script. If the script works well, I would eventually move the idea over to CryptoTrader. Having this feature on board, will allow me to do easier backtesting and figuring out the right parameters.

Enough about the feature, I wanted to demonstrate a couple of things I learned while working on it. The first one is a way to make a Kotlin enum de/serializable using Jackson. Normally, this should work out of the box, but Jackson will serialize enum values to their string name representations, which is not a best practice. Normally, one would map those values to numeric identifiers which will ideally remain unchanged. In this case, even if enum value names changed, this will not break the compatibility with API consumers.

```kotlin
enum class PairType(@JsonValue val id: Long) {
    BUY_SELL(id = 1L),
    SELL_BUY(id = 2L)
    ;

    companion object {
        /**
         * JSON creator
         * NOTE: when giving the creator function parameter the same name as the underlying property we're about to
         * check, the method would not work. Changing the name (to @{link requestId} in this case) seems to have done the job
         *
         * @see <a href="https://github.com/FasterXML/jackson-module-kotlin/issues/75" />
         * @see <a href="https://github.com/FasterXML/jackson-module-kotlin/issues/78" />
         *
         * NOTE: Don't forget the @JvmStatic annotation, Jackson requires a proper
         * static JVM method.
         */
        @JsonCreator
        @JvmStatic
        fun fromId(requestId: Long): PairType {
            return values().first { it. id == requestId }
        }
    }
}
```

There is however a quirk, which seems to be Kotlin-related, according to [this](https://github.com/FasterXML/jackson-module-kotlin/issues/75) and [this](https://github.com/FasterXML/jackson-module-kotlin/issues/78) issue on GitHub.

---

## Links and other resources
### Links
More on what **goroutines** are: https://golangbot.com/goroutines/

> *Goroutines are *[*functions*](https://golangbot.com/functions/)* or *[*methods*](https://golangbot.com/methods/)* that run concurrently with other functions or methods. Goroutines can be thought of as light weight threads. The cost of creating a Goroutine is tiny when compared to a thread. Hence its common for Go applications to have thousands of Goroutines running concurrently.*

---

### Tweets
<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Managed to implement goroutines in Swift using GCD. Took a while to figure out, but the implementation and usage ended up simple (and hopefully, correct).<a href="https://t.co/yGwFi65y1U">https://t.co/yGwFi65y1U</a> <a href="https://t.co/Si2pBZKRMl">pic.twitter.com/Si2pBZKRMl</a></p>&mdash; Chris Eidhof (@chriseidhof) <a href="https://twitter.com/chriseidhof/status/964479193546416128?ref_src=twsrc%5Etfw">February 16, 2018</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">We&#39;re focusing our efforts on a great Twitter experience that&#39;s consistent across platforms. So, starting today the Twitter for Mac app will no longer be available for download, and in 30 days will no longer be supported.</p>&mdash; Twitter Support (@TwitterSupport) <a href="https://twitter.com/TwitterSupport/status/964635739517407232?ref_src=twsrc%5Etfw">February 16, 2018</a></blockquote>
