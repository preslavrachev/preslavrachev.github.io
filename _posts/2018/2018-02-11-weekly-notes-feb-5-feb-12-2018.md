---
layout: post
title: Weekly Notes (Feb 05th / Feb 12th, 2018)
date: '2018-02-11 07:16:02'
tags:
- ios
- weekly-notes
---

A rather quiet week this time. I am happy that during the week, I managed to wake early enough every day, and add a bit of work to my personal projects. 

The Swift version of [MediumReader](https://github.com/preslavrachev/medium-reader-swift) slowly starts getting a shape. Every list item (a.k.a Medium article) now has a “Play/Pause” button, tapping on which causes the content of the article to be fetched and ready for TTS. I had to work on a couple of different iterations to get the communication between the different article view table cells and the main view controller. At first, I let them all [send and subscribe to](https://github.com/preslavrachev/medium-reader-swift/commit/e96ea1faf71e7881c1cabd9dd4601c5ec8f81e59) `NotificationCenter` events. It was obvious over-engineering for such a simple scenarios, so eventually, I [implemented](https://github.com/preslavrachev/medium-reader-swift/commit/a955d7d0a4a779a347390882ad476fcbb0232d98) simple old-school delegation and now I am ready to move on. Along this journey, I rediscovered an old [objc.io](https://www.objc.io/issues/7-foundation/communication-patterns/)[article](https://www.objc.io/issues/7-foundation/communication-patterns/)  on iOS communication design patterns, which I can't remember how many times I've already referred to, and hotly recommend to junior and expert iOS developers alike. 

---

On the topic of iOS development, my odyssey with AppCode has so far come to temporary peace. I decided to just stop nagging and see how it behaves throughout a day or two. The catch was kicking XCode completely. This improved build times significantly and my laptop's fan is no longer threatening to break loose. Having XCode lying around previously, resulted in it reindexing the project multiple times for every change I was making within AppCode. I know, having them both open sounds counter-intuitive but I'm sure that this is what most devs do all the time, due to Interface Builder etc.

---
For much of the foray I've been doing into iOS, I can hardly say the same about my machine learning endeavors of the past week. Every time I get to convince myself that I know enough about one ML topic or another, the more experiments I keep running, the more the results of those experiments try to refute much of what I have learned. My favorite ML toy of recent - decision trees, are not an exception. Though the idea of a decision tree seems simple enough for starters, early results can be optimistically misleading. Accuracy high enough to make you believe you have discovered a statistical edge against the market. Hooked on early success? Now, run the same experiment 10 times with pretty much similar data, only to find results ranging from one end of the spectrum to the other. All of them with the same high levels of accuracy 🤦

I have some assumptions as to why this might be happening and will be checking each of them out in the next days. Here are a few ideas as to what might be happening:

* High accuracy is almost always a sign of overfitting, and decision trees are very prone to it.
    * Keeping a balance between accuracy and tree size is important. [Proper pruning](https://en.wikipedia.org/wiki/Pruning_(decision_trees)) is key.
* Never share the same data in both training and testing! Much of the early excitement can come from the fact that you've been using the same data set the whole time. Measuring accuracy must always be done on data that the tree has not seen before
* Check out how the gini coeffiecent gets computed. The gini coefficient the main measurement which helps decide the order in which a decision tree gets built, as well as the thresholds for every split. It might well be the case that feature splitting is inefficient, which would require searching for better ones.

I will stop here, because this might as well be a topic for a whole different post.

---
For a change, I switched back to improving my old clustering algorithm. I reduced the number of clusters to 3 (from 9) and moved over to using the features I had previously discovered as part of my decision tree experiment. The result is a much nicer-looking portrayal of the different phases that prices switch between, as they move up and down.

To illustrate the recent progress, I picked up one of my favorite altcoins, called Lisk (no trade recommendations given, always do your own research!), which has had a spectacular run to the top these past few days. One can clearly see the green segments at the bottom, which the algorithm has marked as good entry points for buying.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">What an incredible journey to the top it has been for Lisk ($LSK) lately! <a href="https://t.co/xMcwpJKbNm">pic.twitter.com/xMcwpJKbNm</a></p>&mdash; Preslav Rachev (@preslavrachev) <a href="https://twitter.com/preslavrachev/status/962386415664365570?ref_src=twsrc%5Etfw">February 10, 2018</a></blockquote>

---

## Links and other resources

### iOS Development

[Communication Patterns | ObjC.io](https://www.objc.io/issues/7-foundation/communication-patterns/)
The aforementioned article. This one should be in the reference arsenal of every iOS developer.

> Every application consists of multiple more or less loosely coupled objects that need to communicate with each other to get the job done. In this article we will go through all the available options, look at examples how they are used within Apple’s frameworks, and extract some best-practice recommendations regarding when you should use which mechanism

[iOS: How To Make Weak Delegates In Swift | Natasha The Robot](https://www.natashatherobot.com/ios-weak-delegates-swift/)
By making references to delegates **weak** (where possible), we can avoid retain cycles and possible memory leaks


### Tweets

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">This is Mr. Square, my custom Animoji built using AvatarKit. <a href="https://t.co/zKhTLBrH5v">pic.twitter.com/zKhTLBrH5v</a></p>&mdash; Simon B. Støvring (@simonbs) <a href="https://twitter.com/simonbs/status/962423836556910593?ref_src=twsrc%5Etfw">February 10, 2018</a></blockquote>

