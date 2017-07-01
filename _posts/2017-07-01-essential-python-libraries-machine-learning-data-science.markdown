---
layout: post
title: Essential Python Libraries for Machine Learning and Data Science
author:
    name: Preslav Rachev
---

Whether new to Python, or simply coming from a different domain,  the data science enthusiast’s foray into the field can be intimidating.  From entering the door,  one gets overwhelmed with a bunch of unfamiliar libraries, one would need for their daily work:

NumPy, SciPy, SciKit, Matplotlib,  Pandas, Theano, Tensorflow, Keras, CNTK, just to name a few …

In this article, I am going to list some of the fundamental libraries every data scientist working with Python should know of. I will also provide a human-readable, brief description as to what each of these libraries does, how it is used, and how it fits in the overall picture.

### Overview of the Python Data Science Ecosystem
The diagram below creates a map of the libraries, most widely used within the data science and machine learning community:

<figure>
    <img src="{{ '/assets/img/2017/5B4D5F7C-8465-4ACD-989C-9E6874178AAA.png' | prepend: site.baseurl }}" alt=""> 
    <figcaption>Fig1. - an overview of the Python data science ecosystem <a href="/assets/img/2017/5B4D5F7C-8465-4ACD-989C-9E6874178AAA.png">(hi-res version here)</a> </figcaption>
</figure>

One thing becomes immediately evident from this diagram. In the center of the entire Python data science universe stays one library - NumPy. Its use is so widespread that it has become a de facto standard and a required foundation for pretty much any Python library which contributes to the field.  Not surprisingly, it will be the first library we’ll have a look at in our list.

### NumPy
[NumPy — NumPy](http://www.numpy.org/) is at the bottom of the Python scientific computing ecosystem. It provides powerful N-dimensional array data structures. Unlike a Python list, NumPy’s `ndarray` is way more memory and CPU-efficient, able to pack billions of data points into a fraction of the memory footprint of a comparable Python list. Less flexible than a Python list, an `ndarray` is optimised for storing single and double-precision numbers, and executing fast numeric operations on them. NumPy’s `ndarray` structures are perfectly suitable for storing vector and matrix data. On top, NumPy provides a myriad of statistics and linear algebra functions for handling vector and matrix manipulations, which are extremely fast and with a scientific level of precision.  What follows are a few examples, I shamelessly borrowed from a [SciPy tutorial](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html). Feel free to check out there rest them [here](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html)

```python
# lots of examples inspired by https://docs.scipy.org/doc/numpy-dev/user/quickstart.html
# you can create an ndarray out of an existing list
a = np.array([2,3,4])

# or multiple dimensions out of lists
b = np.array([[1,2,3], [4,5,6], [7,8,9]])
#array([[1 2 3]
#         [4 5 6]
#         [7 8 9]])

# or use one of NumPy's many generator functions, ideal for initialization purposes
# np.zeros(...), np.ones(...), np.random.random(...), np.arange(...) etc
np.zeros( (3,4) ) 
=> array([[ 0.,  0.,  0.,  0.],
          [ 0.,  0.,  0.,  0.],
          [ 0.,  0.,  0.,  0.]])

np.arange( 0, 2, 0.3 )
=> array([ 0. ,  0.3,  0.6,  0.9,  1.2,  1.5,  1.8])

# you can reshape arrays in whatever ways you like, also slice, iterate, etc
c = np.arange(24).reshape(2,3,4)
=> [[[ 0  1  2  3]
    [ 4  5  6  7]
    [ 8  9 10 11]]
   [[12 13 14 15]
    [16 17 18 19]
    [20 21 22 23]]]

# NumPy also allows fast computations on entire arrays:
a = np.ones((2,3), dtype=int)
a *= 3
=> array([[3, 3, 3],
         [3, 3, 3]])

# and many many more ...
```