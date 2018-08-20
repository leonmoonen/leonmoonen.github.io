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
- 18th IEEE International Working Conference on Source Code Analysis and Manipulation ([SCAM 2018](http://www.ieee-scam.org/2018/), program committee)
- 34rd IEEE International Conference on Software Maintenance and Evolution ([ICSME 2018](https://icsme2018.github.io/), program committee)
- Euromicro Conference on Software Engineering and Advanced Applications (SEAA 2018), session on Software Engineering and Technical Debt ([SEaTeD 2018)](http://dsd-seaa2018.fit.cvut.cz/seaa/index.php?sec=sessions_seated), program committee)
- 26th IEEE/ACM International Conference on Program Comprehension ([ICPC 2018](https://conf.researchr.org/home/icpc-2018), program committee)

---
<ul>
    {% for item in page.upcoming %}
    <li>{{ item | markdownify | remove: '<p>' | remove: '</p>' }}</li>
    {% endfor %}
</ul>
Consider submitting a paper and/or attending!
