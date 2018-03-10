---
layout: post
title: Weekly Notes (Jan 29th / Feb 04th, 2018)
date: '2018-02-04 08:45:16'
tags:
- weekly-notes
---

It was quite an eventful week.

On Thursday, I visited [Elastic{ON}](https://www.elastic.co/elasticon/tour/2017/munich) conference in Munich, organised by Elastic. It was a chance to meet like-minded people and see what the industry is up to. The very positive surprise was to see Mr. Shay Banon, the creator of ElasticSearch, deliver the keynote:

![IMG_4083](/assets/img/2018/IMG_4083.jpg)

In his casual manner, Mr. Banon told an anecdote of how the ELK-stack came to be, once three programmers, situated across the world, decided to join forces and  turn their side-projects into a full-time job.

![IMG_4102](/assets/img/2018/IMG_4102.jpg)

The slightly sadder takeaway of the conference (at least for me), was the fact that ElasticSearch as a product seems to have become less about the search and more about being elastic. Much of what was being spoken about, revolved around a few terms: logging, metrics, reporting, dashboards, security. This of course, should not come to diminish the fact that ElasticSearch is and will remain one of the best search engine products available. Whether it is full-text documents we feed it with or log file metrics, it is the speed and the flexibility of the engine, which helps makes sense of the data. The reality is that logging and metrics is where business demand is at the moment. I guess, I was just hoping for a few more creative demos of what ElasticSearch can do - discovery and recommender systems, full-text search, data aggregation, etc.

One bit that I found particularly interesting was the integration of predictive analysis and basic machine learning techniques into the ELK stack:

![IMG_4098](/assets/img/2018/IMG_4098.jpg)

I am sure that it isa bit complicated behind the scenes, but basically, it works like this. Having a running trend line (e.g. average price, number of customer requests, incidents, etc), the system will compute a normal curve, given the mean and the standard deviation of the incoming data. If a data point (or a set of nearby points) happens to fall outside of a predefined threshold (usually (-2 std, +2 std)), it is considered an anomaly and an alarm gets triggered. Depending on the severity of the incident, this alarm could be a simple additional log message, an email, or an SMS message. This automated setting of thresholds will help companies avoid using biased heuristics, but would also require a bit of taming, to prevent the algorithm from triggering alarms too often (e.g. expected seasonality in sales).

## Links and other Resources
### Podcasts
[The Tony Robbins Podcast: Upholder, questioner, obliger or rebel? - happiness expert Gretchen Rubin talks about the 4 tendencies](https://www.tonyrobbins.com/podcasts/upholder-questioner-obliger-or-rebel/) Ever since I did my first personality questionnaire at the end of last year, I became a firm believer that there are certain identifiable patterns that define who we are. By figuring out these patterns, and by being aware of the typical strengths and weaknesses attributed to our personality type, we can learn to live better lives. Gretchen Rubin is definitely on the top of the list of people who have done insightful research into personality types and how they affect us achieving a happy and fulfilled life. She has designed a [personality study](https://gretchenrubin.com/2015/01/ta-da-the-launch-of-my-quiz-on-the-four-tendencies-learn-about-yourself/) (a.k.a. the four tendencies quiz), which I am definitely going to try out (I may share the results in a future post).

### Tweets
<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Okay, so Bitcoin.</p>&mdash; C:\temp\ (@BryceElder) <a href="https://twitter.com/BryceElder/status/959770192107601920?ref_src=twsrc%5Etfw">February 3, 2018</a></blockquote>
