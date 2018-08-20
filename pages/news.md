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
- "Our paper ``[The Case for Adaptive Change Recommendation](https://www.simula.no/publications/case-adaptive-change-recommendation)'' (with Sydney Pugh and Dave Binkley) has been accepted at [SCAM 2018](http://www.ieee-scam.org/2018/)."
- "Our paper ``[Improving Problem Identification via Automated Log Clustering using Dimensionality Reduction](https://www.simula.no/publications/improving-problem-identification-automated-log-clustering-using-dimensionality)'' (with Carl Martin Rosenberg) has been accepted at [ESEM 2018](http://eseiw2018.wixsite.com/esem2018)."
- "Our article ``[What are the Effects of History Length and Age on Mining Software Change Impact?](https://www.simula.no/publications/what-are-effects-history-length-and-age-mining-software-change-impact)'' (with Thomas Rolfsnes, Dave Binkley and Stefano Di Alesio) has been accepted in the Journal of Empirical Software Engineering ([EMSE](https://doi.org/10.1007/s10664-017-9588-z))."
- "Our article ``[Improving Change Recommendation using Aggregated Association Rules](https://www.simula.no/publications/aggregating-association-rules-improve-change-recommendation)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati, and Dave Binkley) has been accepted in the Journal of Empirical Software Engineering ([EMSE](https://doi.org/10.1007/s10664-017-9560-y))."
- "From early Sept - mid Dec 2017, I will be a Visiting Researcher in Katsuro Inoue's [Software Engineering Laboratory](http://sel.ist.osaka-u.ac.jp/index.html.en) at Osaka University, Japan. During this time, I'll give talks at various institutes in Japan, [contact me](/contact/) if you want to catch up."
- "On Sept 1st, my PhD student Thomas Rolfsnes successfully defended his dissertation entitled ``[Improving History-Based Change Recommendation Systems for Software Evolution](https://evolveit.bitbucket.io/publications/rolfsnes_thesis/thomas_rolfsnes_phdthesis.pdf)'' in front of opponents [David Lo](http://www.mysmu.edu/faculty/davidlo/) and [Anya Helene Bagge](http://www.ii.uib.no/~anya)."
- "Our paper ``[Predicting Relevance of Change Recommendations](https://evolveit.bitbucket.io/publications/ase2017/)'' (with Thomas Rolfsnes, and Dave Binkley) has been accepted for the main research track at [ASE 2017](http://ase2017.org)."
- "Our article ``Safety Evidence Change Impact Analysis Practice'' (with Jose Luis de la Vara, Markus Borg, and Krzysztof Wnuk) has been accepted for the journal first track at [ICSE 2017](http://icse2017.gatech.edu/)."
- "I will give a keynote on Leveraging Machine Learning to Guide Software Evolution at the [IEEE International Workshop on Empirical Software Engineering in Practice (IWESEP), Tokyo, Japan, 2017](https://iwesep2017.github.io/)."
- "Our SCAM2016 paper ``[Exploring the Effects of History Length and Age on Mining Software Change Impact](https://evolveit.bitbucket.io/publications/scam2016)'' has been invited for a Special Issue in the Journal of Empirical Software Engineering."
- "Our MSR2016 paper ``[Improving Change Recommendation using Aggregated Association Rules](https://evolveit.bitbucket.io/publications/msr2016)'' has been invited for a Special Issue in the Journal of Empirical Software Engineering."
- "Our paper ``[Exploring the Effects of History Length and Age on Mining Software Change Impact](https://evolveit.bitbucket.io/publications/scam2016)'' (with Stefano Di Alesio, Thomas Rolfsnes, and Dave Binkley) has been accepted for the main research track at [SCAM 2016](http://2016.msrconf.org/)."
- "Our paper ``[Practical Guidelines for Change Recommendation using Association Rule Mining](https://evolveit.bitbucket.io/publications/ase2016)'' (with Stefano Di Alesio, Dave Binkley, and Thomas Rolfsnes) has been accepted for the main research track at [ASE 2016](http://saner.inf.usi.ch/)."
- "Our paper ``[Improving Change Recommendation using Aggregated Association Rules](https://evolveit.bitbucket.io/publications/msr2016)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati, and Dave Binkley) has been accepted for the main research track at [MSR 2016](http://2016.msrconf.org/)."
- "Our paper ``[Generalizing the Analysis of Evolutionary Coupling for Software Change Impact Analysis](https://evolveit.bitbucket.io/publications/saner2016)'' (with Thomas Rolfsnes, Stefano Di Alesio, Razieh Behjati and Dave Binkley) has been accepted for the main research track at [SANER 2016](http://saner.inf.usi.ch/)."
- "Summer 2015: New website: moved from an overbooked shared Wordpress hosting service to a combination of handcrafted and DSL generated content on GitHub Pages."
- "I will give a keynote at [BENEVOL 2014](http://benevol.cwi.nl/2014/) in Amsterdam, the Netherlands"
- "New article ``[Towards Evidence-Based Recommendations to Guide the Evolution of Component-Based Product Families](https://www.simula.no/publications/towards_evidence-based_recommendations)'' has been accepted in [SCP](http://www.sciencedirect.com/science/article/pii/S0167642313002931)"
- "Our paper ``[Assembling Multiple-Case Studies: Potential, Principles and Practical Considerations](https://www.simula.no/publications/Simula.simula.1916)'' (with Aiko Yamashita) has been accepted at [EASE 2014](http://ease2014.org/)."
- (the start of these pages in 2014)
---

<ul>
    {% for item in page.news %}
    <li>{{ item | markdownify | remove: '<p>' | remove: '</p>' }}</li>
    {% endfor %}
</ul>
