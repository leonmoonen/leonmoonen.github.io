---
layout: page
show_meta: false
title: "News"
subheadline: ""
teaser: "An overview of older and newer news in reverse chronological order"
header:
   image_fullwidth: "header_unsplash_dawn.jpg"
permalink: "/research/news/"
news:
-  "Our paper ``[Exploring the Effects of History Length and Age on Mining Software Change Impact](https://evolveit.bitbucket.io/publications/scam2016)'' (with Stefano Di Alesio, Thomas Rolfsnes, and Dave Binkley) was accepted for the main research track at [SCAM 2016](http://2016.msrconf.org/)."
-  "Our paper ``[Practical Guidelines for Change Recommendation using Association Rule Mining](https://evolveit.bitbucket.io/publications/ase2016)'' (with Stefano Di Alesio, Dave Binkley, and Thomas Rolfsnes) was accepted for the main research track at [ASE 2016](http://saner.inf.usi.ch/)."
-  "Our paper ``[Improving Change Recommendation using Aggregated Association Rules](https://evolveit.bitbucket.io/publications/msr2016)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati and Dave Binkley) was accepted for the main research track at [MSR 2016](http://2016.msrconf.org/)."
-  "Our paper ``[Generalizing the Analysis of Evolutionary Coupling for Software Change Impact Analysis](https://evolveit.bitbucket.io/publications/saner2016)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati and Dave Binkley) was accepted for the main research track at [SANER 2016](http://saner.inf.usi.ch/)."
-  "Summer 2015: New website: moved from an overbooked shared Wordpress hosting service to a combination of handcrafted and DSL generated content on GitHub Pages."
-  "I will give a keynote at [BENEVOL 2014](http://benevol.cwi.nl/2014/) in Amsterdam, the Netherlands"
-  "New article ``[Towards Evidence-Based Recommendations to Guide the Evolution of Component-Based Product Families](https://www.simula.no/publications/towards_evidence-based_recommendations)'' accepted in [SCP](http://www.sciencedirect.com/science/article/pii/S0167642313002931)"
-  "Our paper ``[Assembling Multiple-Case Studies: Potential, Principles and Practical Considerations](https://www.simula.no/publications/Simula.simula.1916)'' (with Aiko Yamashita) was accepted at [EASE 2014](http://ease2014.org/)."

---

<ul>
    {% for item in page.news %}
    <li>{{ item | markdownify | remove: '<p>' | remove: '</p>' }}</li>
    {% endfor %}
</ul>
