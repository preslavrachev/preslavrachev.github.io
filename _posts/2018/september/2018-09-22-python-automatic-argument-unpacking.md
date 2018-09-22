---
layout: post
title: "Python: Automatic Argument Unpacking from a Dictionary"
date: '2018-09-22 09:30:00'
author_profile: true
read_time: true
comments: true
share: true
related: true
category: "Programming"
tags: ["Python", "Tips"]
---

Programming often involves creating configuration objects/dicts and passing them around to functions. Let's say we want to pass the following configuration dict to a function:

```python
config = {
    'prop_a': 'foo',
    'prop_b': 'bar'
}
```

Usually, a function that consumes this configuration dict would either expect a single parameter:

```python
def do_something(config):
    prop_a = config['prop_a']
    prop_b = config['prop_b']
    # do something with the props
```

Or would rather have them listed as separate params, but those have to be manually read out of `config` when calling the function:

```python
def do_something(prop_a, prop_b):
    # do something with the props
    
do_something(prop_a=config['prop_a'], prop_b=config['prop_b'])    
```

What if we didn't have to explicitly unpack each and every property? If the keys in the dictionary exactly match the names of parameters expected by the function, one could simply use the `**` operator and those would be unpacked and assigned automatically:

```python
def do_something(prop_a, prop_b):
    # do something with the props

do_something(**config)
```

## See also
[Unpacking Argument Lists](https://docs.python.org/3/tutorial/controlflow.html#unpacking-argument-lists)