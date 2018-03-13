---
layout: post
title: 'Properties in Swift: How to Avoid Shooting Yourself in the Foot'
date: '2017-07-23 18:54:19'
tags:
- programming
- swift
- ios
---

Swift provides several constructs which make writing code a more fluid experience, with less boilerplate. Sometimes this succinctness of syntax comes at a potential cost though. One such aspect are properties, and more specifically, property initialisation. A small difference in the syntax might result in unnecessary memory consumption, unexpected state inconsistencies, etc. Those might remain unnoticed when the project is still small and reappear at a later stage, when the project is large enough to make it difficult to debug.

Though an experienced Swift programmer will immediately notice the difference between the following two expressions, people relatively new to the language may not. Consider the following expression:

```swift
var urlSession: URLSession = {
  let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default.copy() as! URLSessionConfiguration
  urlSessionConfiguration.requestCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad

  // some further configuration

  return URLSession(configuration: urlSessionConfiguration)
}()
```

and compare it with this one:

```swift
var urlSession: URLSession {
  let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default.copy() as! URLSessionConfiguration
  urlSessionConfiguration.requestCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad

  // some further configuration

  return URLSession(configuration: urlSessionConfiguration)
}
```

Noticed the difference? In case you haven't, the fllowing piece of code might help:

```swift
for _ in 1...10 {
  print(urlSession)
}
```

While the former expression will always print out the same instance ID, the latter will output **10 different instances**. Swift makes a distinction between [stored properties](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID255) with a closure initiializer (ex 1) and [computed properties](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259) (ex 2). Stored properties get initialized once,and though their values may change over the lifetimeof the application, the initializer gets called only once. This is made clear by the fact that this is actually an assignment operation (denoted by the `=` operator) and that the closure gets executed prior to the assignment (The `()` brackets after the closure). A readonly computed property on the other hand is nothing more than a partial application of the full [computed property](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID259) declaration:

```swift
var myProp: MyClass {
  get {
    // optionally do some necessary pre-work
    return MyClass(/* set some intial values */)
  }
  set(newProp) {
    a = newProp.a
    b = newProp.b
  }
}
```

A readonly computed property is one that has no setter, in which case, the `get` and `set` keyword can be omitted. Which leads us to the second example above. In its case, the closure, serving the purpose of a getter method, will be called every time the `urlSession` property is accessed. This in turn will create a new `URLSession` instance every time, potentially leading to an app slowdown, inconsistent state, or memory leaks.

NOTE: Since a computed property gets reassigned upon every access, it can only be declared as a `var` and not a `let`. The first of the examples however, is a stored property which is assigned only once, so might as well declare it as a `let` constant in case we won't need to reassign it again (always recommended)

## Further Reading
- [Properties / The Swift Programming Language (Swift 4)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html)
- [Swift + Initialization with Closures](https://medium.com/the-traveled-ios-developers-guide/swift-initialization-with-closures-5ea177f65a5)
- [Swift: Beware of Computed Properties / Natasha The Robot](https://www.natashatherobot.com/swift-computed-properties/)
