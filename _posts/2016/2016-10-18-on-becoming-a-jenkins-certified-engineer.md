---
layout: post
title: On Becoming a Jenkins Certified Engineer
date: '2016-10-18 14:46:00'
tags:
- jenkins
---


A few days ago, I took and [successfully passed](https://certificates.cloudbees.com/10368095) the first ever [Jenkins certification exam](https://www.cloudbees.com/jenkins/jenkins-certification) designed by [CloudBees](https://www.cloudbees.com/) and administered by [Prometric](http://www.prometric.com/). My interest in DevOps, and especially continuous integration techniques had already grown significantly during the last couple of years. That's why, when a colleague of mine sent me a link about the certification exam a few months ago, I did not hesitate, but signed up right away. This post describes my personal motivation to go through the certification, and shares a couple of study tips, in case you decide to go through it as well.

First and foremost, I took the exam as an opportunity to learn a bit more about what the technology offers, and potentially, bring in a few ideas for improving our existing pipelines. IMHO, even in large teams nowadays, setting up and maintaining a CI pipeline is still considered something of a "nice-to-have" activity. Everyone in the team is convinced in the benefits of having a CI infrastructure, but time and developer effort constraints often prevail. As a result, usually only a couple of teammates get to work on it, mostly as a side activity. Typically, much of the early work is experimental. It ends up setting a basic pipeline which meets the requirements of the team, but over time, becomes difficult to maintain and extend. 

By studying for the exam, I was actually forced to study the (sometimes tedious, but useful) internals of the Jenkins ecosystem. It seems to me that extensibility via third-party plugins is one of the things that still make the already antiquated-looking-like Jenkins, stand apart form the competitors. Taking away the CI server, the bulk of what comprises the Jenkins Universe, are the thousands of open-source and proprietary plugins available. Having so many possible extensions to choose from, can oftentimes be confusing or lead to a system that is impossible to manage. Therefore, a large portion of the exam actually revolves around getting to know some of the tried and proven extensions that most teams might find useful. Among those, I found quite a few, which having really known about them earlier, I’d have saved myself a few roadblocks later on. 

### Is this stuff for you?

I can’t really tell you that. For one, you have to have a passion for tinkering with servers and low-level OS administration. This is usually beyond the scope of what developers nowadays are dealing with. My impression so far has been that only a few developers like to mess with stuff which has been traditionally done by system administrators. Based on my experience, you can't really force developers to like this kind of stuff.

Will this have a direct impact on your salary? Probably not in the moment. As said, if you have been doing this kind of stuff all along already, a certificate will not automatically create a new position for you, making you your own boss or something. That said though, assuming that the number of developers interested in doing DevOps is still quite small, I am sure that the market demand will keep getting stronger in the upcoming years. 

### A few final tips and study materials

Without getting into further details, here are a couple of tips and materials which have helped me get through the exam:

#### Read some basic DevOps theory
 A thing to point out is that although this is a Jenkins certification, it will most likely fit people interested in DevOps. Therefore, one should certainly expect a few more questions testing the theory, so please take look at [Continuous Integration vs. Continuous Delivery vs. Continuous Deployment - Stack Overflow](https://stackoverflow.com/questions/28608015/continuous-integration-vs-continuous-delivery-vs-continuous-deployment)

#### Instead of just reading about Jenkins, play with it
Especially, if you are new to it. Jenkins is free, relatively easy to install and does not consume a lot of resources. Try to install a fresh instance early on and play with, rather than simply memorise the book. Avoid experimenting on a production instance,  because Jenkins could be a bit unforgiving at times - like the one time, I was setting up my permissions, and ended up not being able to log in again. Rookie mistake!  Having your own fresh instance of Jenkins will help learn by crashing as much as you want.

#### Don’t go to the exam without having set up at least one pipeline
Deployment pipelines are what it is all about in big companies, so you should know, even vaguely how they are set up. Create one the old way (using a graph of connected tasks), and one using the [Pipeline plugin](https://wiki.jenkins.io/display/JENKINS/Pipeline+Plugin) (which has become the /defacto/ standard during recent years).  

#### Some materials…
[Jenkins: The Definitive Guide](http://wakaleo.com/books/jenkins-the-definitive-guide): The main book whose content the exam has chosen to follow. This should be your #1 study source. The book is also freely available as a [PDF](http://wakaleo.com/books/jenkins-the-definitive-guide/download-jtdg-pdf) copy in the same site. 

[jeanne’s experiences with the jenkins certification beta exam / Down Home Country Coding With Scott Selikoff and Jeanne Boyarsky](https://www.selikoff.net/2016/02/27/jeannes-experiences-with-the-jenkins-certification-beta-exam/) - Jeanne is known to the Java developer community as a programmer and author of many Java certification books. She was also one of the first people to pass the beta of the Jenkins certification exam. It was her [study notes](https://www.selikoff.net/wp-content/uploads/2016/02/Study-Notes.docx) and [flash cards](https://ankiweb.net/shared/info/1993369597) that I consulted most of the time.