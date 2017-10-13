---
layout: page
show_meta: false
title: "News"
subheadline: ""
teaser: "An overview of news items in reverse chronological order"
header:
   image_fullwidth: "header_unsplash_dawn.jpg"
permalink: "/research/news/"
news:
-  "Our article ``Improving Change Recommendation using Aggregated Association Rules'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati, and Dave Binkley) has been accepted in the Journal of Empirical Software Engineering (EMSE)."
-  "Our paper ``[Predicting Relevance of Change Recommendations](https://evolveit.bitbucket.io/publications/ase2017/)'' (with Thomas Rolfsnes, and Dave Binkley) has been accepted for the main research track at [ASE 2017](http://ase2017.org)."
-  "Our article ``Safety Evidence Change Impact Analysis Practice'' (with Jose Luis de la Vara, Markus Borg, and Krzysztof Wnuk) has been accepted for the journal first track at [ICSE 2017](http://icse2017.gatech.edu/)."
-  "I will give a keynote on Leveraging Machine Learning to Guide Software Evolution at the [IEEE International Workshop on Empirical Software Engineering in Practice (IWESEP), Tokyo, Japan, 2017](https://iwesep2017.github.io/)."
-  "Our SCAM2016 paper ``[Exploring the Effects of History Length and Age on Mining Software Change Impact](https://evolveit.bitbucket.io/publications/scam2016)'' has been invited for a Special Issue in the Journal of Empirical Software Engineering."
-  "Our MSR2016 paper ``[Improving Change Recommendation using Aggregated Association Rules](https://evolveit.bitbucket.io/publications/msr2016)'' has been invited for a Special Issue in the Journal of Empirical Software Engineering."
-  "Our paper ``[Exploring the Effects of History Length and Age on Mining Software Change Impact](https://evolveit.bitbucket.io/publications/scam2016)'' (with Stefano Di Alesio, Thomas Rolfsnes, and Dave Binkley) has been accepted for the main research track at [SCAM 2016](http://2016.msrconf.org/)."
-  "Our paper ``[Practical Guidelines for Change Recommendation using Association Rule Mining](https://evolveit.bitbucket.io/publications/ase2016)'' (with Stefano Di Alesio, Dave Binkley, and Thomas Rolfsnes) has been accepted for the main research track at [ASE 2016](http://saner.inf.usi.ch/)."
-  "Our paper ``[Improving Change Recommendation using Aggregated Association Rules](https://evolveit.bitbucket.io/publications/msr2016)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati, and Dave Binkley) has been accepted for the main research track at [MSR 2016](http://2016.msrconf.org/)."
-  "Our paper ``[Generalizing the Analysis of Evolutionary Coupling for Software Change Impact Analysis](https://evolveit.bitbucket.io/publications/saner2016)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati and Dave Binkley) has been accepted for the main research track at [SANER 2016](http://saner.inf.usi.ch/)."
-  "Summer 2015: New website: moved from an overbooked shared Wordpress hosting service to a combination of handcrafted and DSL generated content on GitHub Pages."
-  "I will give a keynote at [BENEVOL 2014](http://benevol.cwi.nl/2014/) in Amsterdam, the Netherlands"
-  "New article ``[Towards Evidence-Based Recommendations to Guide the Evolution of Component-Based Product Families](https://www.simula.no/publications/towards_evidence-based_recommendations)'' has been accepted in [SCP](http://www.sciencedirect.com/science/article/pii/S0167642313002931)"
-  "Our paper ``[Assembling Multiple-Case Studies: Potential, Principles and Practical Considerations](https://www.simula.no/publications/Simula.simula.1916)'' (with Aiko Yamashita) has been accepted at [EASE 2014](http://ease2014.org/)."
---

<ul>
    {% for item in page.news %}
    <li>{{ item | markdownify | remove: '<p>' | remove: '</p>' }}</li>
    {% endfor %}
</ul>
