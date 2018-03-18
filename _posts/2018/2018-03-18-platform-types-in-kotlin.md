---
layout: post
title: Platform Types in Kotlin
date: '2018-03-18 13:14:00'
tags:
- kotlin
- programming
- tips
---
Having worked a bit with Kotlin, I assume that you must have met the `?` and `!!` operators by now. In case you haven’t, I’d suggest that you bookmark this post and come again once you have gained a little more experience with the basics of the language.

Just kidding, let’s briefly review both. If you have a variable which can be `null`, Kotlin requires you to mark it as optional, by adding a question mark to its type:

```kotlin
var person: Person?
```

To access properties and methods of the `person` variable, you must then either use the safe call operator  (`?`):
```kotlin
// the end result will either be a value of null, never an NPE
var name = person?.name

// The opertor allows for deep chaining as well
var firstName = person?.name?.firstName
```
or if you are really sure that the variable can never be null, you can assert it with a *not-null-assertion* (`!!`):
```kotlin
// an exception will be thrown if person == null
var name = person!!.name
```
The difference with Java is that by applying the *not-null-assertion*, it is your own responsibility as a developer, and not the compiler’s.

## OK, but what about `!` ?
Indeed, besides explicitly specifying a type as optional (`Person?`), Kotlin presents us with another beast, called *platform type*, specified by putting a single exclamation mark instead (e.g. `Person!`). This concept has been created for compatibility reasons, when accessing code  from null-unsafe platforms like Java. It is often the case that when using a Java library, many methods return `SomeType!`, since the Kotlin compiler cannot infer if the result is nullable or not.

As a developer, you should treat platform types in pretty much the same way as optional types.  They are just  annoying because they require seemingly unnecessary boilerplate. As Kotlin developers, we love designing method contracts around non-nulls,  avoiding optional types as part of the parameter signature. If something can be optional, one would rather assign a reasonable default value than accept an optional parameter.  Therefore, Java-style `if (person == null)` checks, although perfectly legal, look very inelegant and Kotlin developers grunt when having to do them.

If you work with a Java API which returns you `SomeType!`, which you then want to use in some Kotlin code, expecting `SomeType` instead, you have three choices:

1. Do a Java-style `null` check (😒)
2. Explicitly /unwrap/ the variable, using `!!` (but you have to 100% sure that it will never return null, otherwise you are back in Java-land)
3. Use the built-in let magic function

Let takes a lambda as a parameter, and passes the value of the variable as a parameter to this lambda. Look at the following piece of code:
```kotlin
var result = someJavaApi.doSomething() // returns SomeType!
result?.let { someKotlinApi.doSomething(it) } // someKotlinApi.doSomething expects SomeType
```
The above piece of code compiles perfectly and solves the problem with platform types. The magic lies in the fact that `let` will be called only if the value of `result` is not `null`, otherwise the call to it will be skipped altogether. If `let` ever gets reached, the Kotlin compiler is smart enough to infer the type of `it` (default parameter name in lambdas) to `SomeType` and not to `SomeType!` or `SomeType?`.

Which approach will you choose? Let me know in the comments.

---
## Further Reading
[Single exclamation mark in Kotlin - Stack Overflow](https://stackoverflow.com/a/43826700/1107412)
[Calling Java from Kotlin - Kotlin Programming Language](https://kotlinlang.org/docs/reference/java-interop.html#notation-for-platform-types)
[let - Kotlin Programming Language](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/let.html)
[The difference between Kotlin’s functions: ‘let’, ‘apply’, ‘with’, ‘run’ and ‘also’](https://proandroiddev.com/the-difference-between-kotlins-functions-let-apply-with-run-and-else-ca51a4c696b8)
