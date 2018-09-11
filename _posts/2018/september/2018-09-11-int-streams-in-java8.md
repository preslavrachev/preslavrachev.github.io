---
layout: post
title: "Revisiting IntStreams in Java8+"
date: '2018-09-11 19:00:00'
author_profile: true
read_time: true
comments: true
share: true
related: true
tags: ["Programming", "Java", "Tips"]
header:
  show_overlay_excerpt: true
---

This post is mainly a reiteration of [an article](http://www.deadcoderising.com/2015-05-19-java-8-replace-traditional-for-loops-with-intstreams/), I found online. As of Java 8, we have had the ability to replace looping operations on collections with streams and functional operations. This applies to situations where we don't have an up-front collection to iterate upon.

What traditionally would have been solved by a `for-loop`:

```java
List<String> list = new ArrayList<>();

for (int i = 0; i < 100; i++) {
    list.add("Username" + i);
}

// we can now use list
```

can be replaced by the much more elegant-looking [`IntStream`](https://docs.oracle.com/javase/8/docs/api/java/util/stream/IntStream.html):

```java
final List<String> list = IntStream.range(0, 100)
	.mapToObj(it -> "Username" + it)
	.collect(Collectors.toList());
```

It is a matter of taste, but I prefer the functional approach from the latter example. A nice advantage of using `IntStream` are the reducing helper methods coming from `Stream`, such as `allMatch`, `anyMatch`, `noneMatch`, or even `reduce` itself. This is helpful when testing multiple conditions and need a single answer at the end:

```java
boolean allMatch = final List<String> list = IntStream.range(0, 100)
	.allMatch(it -> booleanTestOn(it))
```

This is really nothing special that the `IntStream` class itself brings on the table, but functionality that it inherits from [`Stream`](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html).

Analogous to the `IntStream` class, alternatives exist for handling Long (https://docs.oracle.com/javase/8/docs/api/java/util/stream/LongStream.html) and Double ([`DoubleStream`](https://docs.oracle.com/javase/8/docs/api/java/util/stream/DoubleStream.html)) values.