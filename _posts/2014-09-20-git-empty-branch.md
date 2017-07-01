---
layout: post
title: "Tip: Create an empty branch in Git"
tags:
    - python
author:
    name: Preslav Rachev
---

By default, when you create a new branch off an existing one, the entire history as well as the index get replicated to the new branch. Of course, this makes total sense for branches concerning the source code. Want to develop a new feature? Make a copy of the main branch, add your changes, and merge it back with the core. Yet, the source code is only one part of a project. There are other aspects of a project, such as documentation, runtime, and deployment configuration, etc, which you’d rather not want to mix with the flow of your code. You can of course make a normal branch, add your files there and simply never merge back. A cleaner and a preferred option is to create an empty branch with no pre-existing history or files. 

Git calls these "orphan branches"

To create an orphan branch simply call `git checkout`:
`git checkout --orphan <NEW_BRANCH>`

This puts you in the newly created orphan branch automatically. If you then call `git status`, you will see that the branch has no files yet. Now you can add files to it.