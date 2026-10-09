---
layout: page
title: "Research"
subheadline: ""
show_meta: false
teaser: ""
permalink: "/research/"
header:
    image_fullwidth: "header_unsplash_coffee_beans.jpg"
---

My research investigates the interplay between artificial intelligence and software engineering, with a focus on security. Software systems increasingly combine conventional code with machine-learned components and AI agents. This brings new capabilities, but also new ways to fail and to be attacked, and the methods traditionally used to assure software were not designed for systems whose behavior is learned from data and can change over time. My team develops data-driven techniques, tools, and agents that help keep such systems secure, resilient, and under control. This work combines several fields, such as program analysis, machine learning, software repository mining, cybersecurity, and empirical software engineering. Usually, I try to find answers to these questions in close collaboration with industry and the public sector.

We work in two directions: we apply software and security engineering to AI, and we use AI to make software more secure and resilient. Our current topics include:

* **AI security:** how AI components can be attacked, misled, or exploited, for example through prompt injection, jailbreaks, data poisoning, and backdoors. We red-team large language models (LLMs) and the systems built on them, adapt program-analysis techniques such as fuzzing and information-flow analysis to audit and harden AI components, and assess the risks of AI in high-stakes and regulated settings. Our attackIT project develops automated techniques for adversarial probing and red-teaming of AI models and AI-based systems. Through the [Centre for AI Security and Safety (CAISS)][caiss], this work includes security audits of language models used in Norway.
* **Monitoring and control of agentic AI:** AI agents that plan, call tools, and act on their environment have behavior that emerges at run time. We develop runtime monitoring, guardrails, and containment for agentic systems, and study how to check that an agent stays within the limits it was given. We also build agents ourselves, such as multi-agent systems that write, test, and repair code, which shows us how they fail.
* **Detection and repair of vulnerabilities:** we use LLMs and other machine learning techniques to detect and repair bugs and security vulnerabilities in source code, and to predict the impact of newly disclosed vulnerabilities. We also build datasets for this research, such as [CVEfixes][cvefixes].
* **Cyber threat intelligence:** we build knowledge graphs that connect software versions, vulnerabilities, threats, exploits, and incidents, including mappings of known exploited vulnerabilities to attacker techniques, to support proactive risk assessment.
* **Self-healing and resilient systems:** we investigate adaptive, bio-inspired methods for autonomously self-healing systems that monitor themselves and adjust their operation without human intervention, using artificial immune systems and reinforcement learning on operational data.
* **Log analysis for anomaly detection and incident response:** we analyze large-scale logging data, using LLMs for log parsing, to detect anomalies and support incident response.

Other topics that we are, or have been, investigating include:

* recommendation systems for smarter evolution and testing of software-intensive systems, using evolutionary coupling mined from version histories to support change impact analysis;
* smarter evolution and testing of safety-critical cyber-physical product families, and software analytics for continuous quality and maintainability assessment, in collaboration with industrial partners such as Kongsberg Maritime and Cisco Norway;
* intelligent analytics of logging data from continuous engineering, to group similar failures and highlight the log sections that relate to a failure;
* assessing and improving the cost-effectiveness of automated software inspections by building on our work on static program analysis & (static) profiling;
* measuring and managing technical debt;
* empirically investigating the relation between source code characteristics (such as code smells) and software process characteristics (such as observed maintenance problems);
* software analytics and software repository mining to find and monitor software engineering characteristics and qualities (e.g., maintainability);
* reconstruction of models from existing software artifacts;
* source-based and model-based techniques for software verification and validation;
* identification of crosscutting concerns in source code (a.k.a. aspect mining), both for the purpose of improving program comprehension and to support evolution of those systems;
* methods and techniques to reverse engineer and visualize (architectural) views on existing software systems to improve their understanding.

An overview of our results in these areas can be found in my [publications][publications].

[caiss]: https://www.simula.no/research/research-centres/caiss-centre-ai-security-and-safety
[cvefixes]: https://github.com/secureIT-project/CVEfixes
[publications]: /publications/
