---
title: How to Create a New Empty Branch for a New Project
layout: post
date: 2018-05-14 07:40:59 +0200
share: true
category: Programming
tags: []
header: []

---
Sometimes, you might need branches in your git repositories, which are off the track of the main repository timeline. You want to store specific files there, and none of the original files, stored across your master and other feature branches. Luckily, git comes with an option called **orphan** branch. An orphan branch is basically like a store on its own, with its own history. You can delete all the existing files inside an orphan branch, and this won’t affect their state across master and other branches at all.

You can create a branch as an **orphan**:

```bash
git checkout --orphan <branchname>
```

This will create a **new branch with no parents**. You can then clean the working directory with:

```bash
git rm --cached -r .
```
and add the new files you only want to have there
