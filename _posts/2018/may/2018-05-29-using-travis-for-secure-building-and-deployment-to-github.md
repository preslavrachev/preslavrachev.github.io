---
layout: post
title: "Using Travis for Secure Building and Deployment to GitHub"
tags: ["Programming", "GitHub", "Travis"]
date: '2018-05-29 10:10:00'
---

Travis is an incredibly useful tool for the open-source community. Its main purpose is to execute test suites and ensure the stability of the repository being under observation. Due to its generic execution nature, it can however be used creatively for many other tasks:

- fetch data from remote APIs and data sources
- build and render outputs in different formats (e.g. using a templating engine directly, or a static-site generator, such as Jekyll)
- push data to remote APIs, or use GitHub branches as persistent storage

What many of these have in common, is the need for authentication when calling an external API, or trying to push transformed outputs to a GitHub branch. This post will show you how to make Travis build and deploy the outputs to a separate branch.

Let's say we are hosting a [Jekyll](https://jekyllrb.com/) blog on GitHub, and would like to push the transformed content, once changes to the content have been made:

Here is how our `.travis.yml` file might look like:

```yaml
language: ruby/python/java/etc
script:
- ./deploy.sh
```

And the corresponding `deploy.sh` Bash script:

```bash
#!/bin/sh

./build_your_outputs
git push origin gh-pages
```

Calling `git push` directly as part of the Travis build script is guaranteed to fail. Travis does not have credentials to make changes to our repositories. No problem.

First of all, you need to issue a special token, for Travis or any other tool to be able to do stuff with your GitHub repositories. GitHub calls these [Personal API Tokens](https://blog.github.com/2013-05-16-personal-api-tokens/). You can [issue](https://github.com/settings/tokens) as many as you want, but beware that these are basically like passwords, so should be treated with care. To make Travis be able to make any modifications to a repo or branch, you need to give the token at least the `public_repo` permission. 

Now, we have the token set up, but how do we make use of it within Travis, and more importantly, how do we do his in a secure manner? After all, the `.travis.yml` file is kind of public, right? Indeed, it is, but we are not going to store tokens in plain text.

Let me introduce you to [storing encrypted values in Travis](https://docs.travis-ci.com/user/encryption-keys/). For this, you will need to install the Travis CLI: 

```bash
gem install travis
```

Having installed the Travis CLI, you can now encrypt anything you want and add it to the `.travis.yml` file:

```bash
travis encrypt GITHUB_TOKEN=1234abcxyz —add
```

What this will do, is add the following line to your `.travis.yml` file:

```bash
secure: "abunchofrandomgibberish...."
```

Behind the scenes, Travis will use a private key that has been set up with the creation of your account, and only Travis knows about. So, this should be rather secure.

During the execution of your script, Travis will decrypt the secrets and interpret them as bash commands. In our case, this will set the value of our GitHub token to the `GITHUB_TOKEN` environment variable. It should then be accessible from all parts of your build script. Sweet!

The one remaining part is to make Travis call your site generator and push the generated outputs to the root of a branch called `gh-pages`. According to GitHub’s conventions, all HTML files in this branch can be publicly accessed, under `https://your name.guthub.io/reponame`, or a custom domain of your choice. Although you can execute all command s in one line, it is advisable to create a small Bash script (e.g. `deploy.sh`) and call that instead. Here is a how a sample deploy script would look like:

```bash
git remote add origin-pages https://${GITHUB_TOKEN}@github.com/your_username/your_repo.git
git push origin-pages gh-pages
```

This should now let Travis build and deploy automatically.
