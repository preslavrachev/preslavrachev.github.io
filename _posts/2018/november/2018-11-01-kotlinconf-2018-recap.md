---
title: KotlinConf 2018 Recap
date: 2018-11-01 00:00:00 +0000
share: true
header:
- template: header
  overlay_filter: '1.0'
  overlay_image: "/assets/img/2018/november/TJ1QL%KsR8evl5H0LZjn4Q_thumb_14ca.jpg"
undefined:
- Kotlin
- Conference
- Amsterdam
layout: ''
category: Programming
tags:
- Kotlin

---
[KotlinConf 2018](https://kotlinconf.com/) took place in beautiful Amsterdam at the beginning of October, and this year, I had the chance to attend. Though only the second edition, KotlinConf has already become something of an institution within the developer community. Events like these help you meet the people whose work you admire, but would otherwise not be able to meet in person.

This is my short recollection of the two wonderful days in Amsterdam:

<iframe width="560" height="315" src="https://www.youtube.com/embed/TczXQ_9qoA4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## The Announcements

> We ❤️ Kotlin and Kotlin ❤️s us too!

### Kotlin 1.3

The long-awaited [Kotlin 1.3](https://blog.jetbrains.com/kotlin/2018/10/kotlin-1-3/) release was announced, which would supposedly remove the “experimental” flag off of coroutines and make it a first-class language feature. It will also help promote the concept of multi-platform programming forward. Using Kotlin to develop backend systems is not a new idea, but the 1.3 release is going to firmly set foot in many domains, beyond Android.

Best of all, we can finally use one IDE to develop on Kotlin for all platforms. We no longer need to jump back and forth over to CLion or AppCode, unless we really want to. Otherwise, IntelliJ (incl. the free Community Edition) should be more than sufficient. For finalizing the iOS builds, we ultimately still need XCode, but that’s not something under JetBrains’ control.

## The Topics

> There is a DSL for that…

Of course, topics revolved mainly around the major announcements, including, but not limited to, the development of DSLs (domain-specific languages) for solving just about any problem, multi-platform development (for the JVM, JavaScript, or natively on iOS, macOS, Linux, etc), server-side, data science and machine learning, and of course, many, many sessions targeting Android.

### Kotlin on the Server

I was happy to see the [involvement of Google into Kotlin](https://cloud.google.com/kotlin/), beyond Android. In fact, there was quite a Google presence from the Cloud Platform team. Other companies, well-known using Kotlin on the server-side, such as German online-bank [N26](https://n26.com/), were there to inspire the community.

If you are interested into trying out Kotlin on the server, I recommend these three talks straight out of KotlinConf:

<iframe width="560" height="315" src="https://www.youtube.com/embed/8xfQA10Cd7g" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

for a quick overview, before checking out [http4k](https://www.http4k.org/)

<iframe width="560" height="315" src="https://www.youtube.com/embed/vdxBNh1qx1Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

and, of course, [Ktor](https://ktor.io/)

<iframe width="560" height="315" src="https://www.youtube.com/embed/V4PS3IjIzlw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Kotlin for Data Science
Ever since I tried Kotlin for the first time, I was convinced that it has the potential to outpace Scala, and stand shoulder to shoulder with Python and R, as the dominant programming language trio of data science. Although we are still far from this moment of ultimate bliss, the efforts of folks like [Holger Brand](https://twitter.com/holgerbrandl) l and [Thomas Nield](https://twitter.com/thomasnield9727) (and to some limited extend, my humble self) can only help reassure that there is a serious potential, which is about to unroll in the coming months.

<iframe width="560" height="315" src="https://www.youtube.com/embed/yjVW6uCmVBA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/-zTqtEcnM7A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Kotlin … Everywhere (Even on iOS)
Yes, the big keyword of KotlinConf 2018 was */multi-platform/*. Although not a silver bullet, and definitely not a write-once-deploy-everywhere proposition, multi-platform has the potential to help developers organize big projects around modules that can be shared across platforms. Kotlin/Native makes this possible. Unlike Flutter or React Native, however, the idea is not to overtake the UI development of each platform, but rather, deliver the native look-and-experience, by sharing the shared business logic across.

<iframe width="560" height="315" src="https://www.youtube.com/embed/UyTBXEZ983g" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Dul17VSiejo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

