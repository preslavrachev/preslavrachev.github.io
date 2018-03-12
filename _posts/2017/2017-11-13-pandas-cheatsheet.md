---
layout: post
title: Pandas Cheatsheet
featured: true
date: '2017-11-13 06:37:00'
tags:
- programming
- data-science
- python
image: 2017/photo-1494228366869-07a7106eca9f.jpg
---


<small>_**NOTE:** This post is an ongoing collection of tips and tricks I have learned around my work with Pandas. It is a live document,  intended to remain in progress forever, as I keep-adding more and more things to it. You can share your personal tips and tricks in the comments below, or on my blog’s [subreddit](https://www.reddit.com/r/preslav_me/comments/7qz7k2/pandas_cheatsheet/)._</small>

---

# The Basics

## Selection

[Finding a Row Where One of Its Values Is at a Minimum/Maximum](http://www.preslav.me/2018/02/16/pandas-finding-a-row-where-one-of-its-values-is-at-a-minimum-maximum/)

---

## Reducing Output
Often, you will be inspecting extremely large data frames. Usually, when printing out a large data frame, pandas would print out a few rows from start (head) of the frame, followed by a few rows from the end (tail).  Though smaller, this representation would still require a bit of scrolling around. Instead of having to spend effort on scrolling, you might as well only request the [head](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.head.html) or the [tail](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.tail.html) of the data frame respectively:

```python
print(df.head()) # prints a default number of rows (5) from the head
print(df.head(10)) # or you can specify how man yexactly you want to display

# same goes for printing out the end of a data frame
print(df.tail())
print(df.tail(10))
```

## Grouping Data
### Obtaining Basic Statistics on Grouped Data at a Glance
When you group a data frame by a given column or a set of columns, a function which comes quite handy is `describe()`. This example has been provided as part of an [Udemy](https://www.udemy.com/python-for-data-science-and-machine-learning-bootcamp/) course on data science with Python.

Let’s say we have the following piece of data:

```python
data = {
    'Company': ['GOOG', 'GOOG', 'MSFT', 'MSFT', 'FB', 'FB'],
    'Person': ['Sam', 'Charlie', 'Amy', 'Vanessa', 'Carl', 'Sarah'],
    'Sales': [200, 120, 340, 124, 243, 350]
}

df = pd.DataFrame(data)
```

Calling  [`describe()`](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.describe.html) on a group object from this data frame will return some quite useful statistics, without us having to ask for each one individually:

```python
df.groupby('Company').describe()
```

![Pandas---GroupBy-2018-01-17-07-26-37](/assets/img/2017/Pandas---GroupBy-2018-01-17-07-26-37.png)

Additionally, we can transpose the data, i.e. shift rows and columns using the [`transpose()`](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.transpose.html) function:

```python
df.groupby('Company').describe().transpose()
```

![Pandas---GroupBy-2018-01-17-07-31-58](/assets/img/2017/Pandas---GroupBy-2018-01-17-07-31-58.png)
