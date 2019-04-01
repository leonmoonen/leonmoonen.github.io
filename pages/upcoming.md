---
layout: page
show_meta: false
title: "Upcoming"
subheadline: ""
teaser: "I'm involved in the following upcoming conferences and events:"
header:
   image_fullwidth: "header_unsplash_balloons.jpg"
permalink: "/activities/upcoming/"
upcoming:
- 27th IEEE/ACM International Conference on Program Comprehension ([ICPC 2019](https://conf.researchr.org/home/icpc-2019), program committee)
- 7th International Workshop on Realizing Artificial Intelligence Synergies in Software Engineering ([RAISE 2019](http://promisedata.org/raise/2019/), program committee), co-located with ICSE 2019
- 27th ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering ([ESEC/FSE 2019](https://esec-fse19.ut.ee), Student Research Competition chair, Tallinn, Estonia, 26-30 August 2019)
- 19th IEEE International Working Conference on Source Code Analysis and Manipulation ([SCAM 2019](http://www.ieee-scam.org/2019/), program committee)


---
<ul>
    {% for item in page.upcoming %}
    <li>{{ item | markdownify | remove: '<p>' | remove: '</p>' }}</li>
    {% endfor %}
</ul>
Consider submitting a paper and/or attending!
