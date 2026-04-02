---
title: Topic 5 - Arms Race
author: Zeyn Jaswal, Azzaam Khan, Timothy Palin, Aoxing Xu, Meredith Reeves
# date: \today
linestretch: 2.0
fontsize: 12pt
#boxlinks: true
toccolor: blue
linkcolor: blue
urlcolor: blue
citecolor: blue
pagestyle: empty
papersize: a4
geometry: margin=1in
csl: ieee.csl
bibliography: ref.bib
# thanks: MATH 3MB3 Introduction to Modelling Final Project 
papersize: a4
# geometry:
# - top = 30mm
# - bottom = 30mm
# - left = 30mm
# - right = 30mm
header-includes: |
    \usepackage{geometry}
    \newcommand{\pb}{\pagebreak}
    \renewcommand{\familydefault}{\sfdefault}
    \pagestyle{empty}
---

\pagenumbering{gobble}
\setlength{\parindent}{36pt}

# Introduction 

> This section should outline the real-world background and context of your model. Discuss
the motivation one might have to study this model. You may want to research the relevant
literature and include some citations to support your framing of the real-world context
(depending on the project). Be sure to include only background information and context
that is directly related to your research project. Really focus on what the reader needs to
know to understand your work, and be interested and excited by it.

> The final paragraph of your Introduction should frame your research question and de-
scribe what you will be studying in your paper. Briefly mention, in words, what you will
be doing and showing in the rest of the paper. It is often good to lay out your main find-
ing/result here, too. A good Introduction section for an applied mathematics paper ideally
has no mathematical symbols or jargon; instead, it should be focused on the real-world con-
text and what you are trying to study. The math is a tool you will introduce later, not the
main focus of the paper.



# Base Model 

> Start by explaining the real-world mechanisms you’re modelling, and any you’re omitting.
Discuss the assumptions you’re making in reducing the real-world system to a mathematical
model. Define the state variables you’ll be working with. Don’t forget to clearly state the
units of the variables.

> Define parameters (and their units) and cite any sources for the values you’re using to
parameterize your model. If you cannot find specific parameter values in the literature, make
educated guesses for values and explain why you’re using these particular values (in this case,
you may want to consider a range of parameters instead of just one specific value to ensure
your modelling results are robust to some uncertainty in parameter values).

> You may want to to include a model diagram (e.g., if it’s a compartmental model).
Write out the model equation(s) and explain any modelling choices you’ve made in them
(e.g., discrete- vs. continuous-time)


# Analysis of Base Model 

> This subsection should describe the various analysis you’ve performed on your base model
and the results you’ve obtained from them. You should be using a mix of analytical tools
(e.g., finding equilibrium points, determining stability) and numerical tools (e.g., model sim-
ulations in R). When discussing analytical calculations, you don’t need to list out every
single step of your calculation; just present the important/key steps. When discussing nu-
merical simulations, you should describe what your R code is doing and present some plots
to supplement your written descriptions; all R code should be presented in an appendix at
the end of the paper (see below). Be sure to describe what these analysis tell you about your
base model and what predictions they make (this should be in the context of the real-world
scenario framing your project).

# Model Extension 

> Here, you should describe the extension you’ve chosen to study for your model. Start by
discussing what the extension is and how you plan to change your base model to account
for it. Similar to the base model subsection, be sure to talk about any assumptions in
your modelling, define state variables and parameters (including units), and describe any
modelling choices made. In particular, you should highlight how your extended model differs
from your base model. If appropriate, it would be good to include a model diagram. You
should also write out the model equations. Do not discuss any analysis of the extended model
here. That will go in the next section

# Results

> n this section, you should describe the analysis you performed on your extended model. Be
sure to motivate your analysis in the context of your research question (i.e., why do you
want to perform each analysis, what are you hoping it will tell you). These analysis can be
purely simulation-based: you are not required to perform any mathematical analysis of your
extended models, but if you can, you should! Mathematical analysis generally tell you more
about model behaviour than simulations (when both are possible). You should be including
plots here, as well, to go along with any simulations you did. Unlike with the draft, this
section of the paper should now be complete and all results should be discussed in the pape

# Discussion

> This is the final section of the main body of your paper. Start by briefly summarizing
the main results you presented in the last section and relating them back to your research
question. This is also where you should be providing answers, based on your results, to your research question(s). Be sure to interpret your results in the context of the real-world
scenario framing your project. What are the implications of your results?

> You should also discuss limitations of your work. This is usually related to the modelling
assumptions you made before. When are your results applicable and when are they not
applicable? What factors have you omitted from your model that may affect the predictions?
This is important to discuss, otherwise the reader may come away from your paper with the
impression that your results are universal which is rarely the case.

> Finally, you should discuss possible directions for future research. Did your results open
up any other questions? Where else could you go with this work? Are there other things
you’ve read about in the literature that could be interesting to look at? You should also use
this as a way to conclude your whole paper.

<!-- ![A Hexapod](hexy.png){ height=130px } -->


<!-- A subset of vertices and edges of any graph form a *subgraph* @west2001. -->



\pb

# References

\pb

# Appendix: Individual Contributions