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
- 28th IEEE/ACM International Conference on Program Comprehension ([ICPC 2020](https://conf.researchr.org/home/icpc-2020), co-chair of the Early Research Achievements track (ERA))
- 27th IEEE International Conference on  Software Analysis, Evolution and Reengineering ([SANER 2020](https://saner2020.csd.uwo.ca), co-chair of the Reproducibility Studies and Negative Results track (RENE))


---
<ul>
    {% for item in page.upcoming %}
    <li>{{ item | markdownify | remove: '<p>' | remove: '</p>' }}</li>
    {% endfor %}
</ul>
Consider submitting a paper and/or attending!
