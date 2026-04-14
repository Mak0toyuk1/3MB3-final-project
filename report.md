---
title: Topic 5 - Arms Race
author: Zeyn Jaswal, Azzaam Khan, Timothy Palin, Tony Xu, Meredith Reeves
#date: \today
linestretch: 2.0
fontsize: 12pt
#boxlinks: true
toccolor: blue
linkcolor: blue
urlcolor: blue
citecolor: blue
#pagestyle: empty
papersize: a4
geometry: margin=1in
csl: ieee.csl
bibliography: ref.bib
# thanks: MATH 3MB3 Introduction to Modelling Final Project
# geometry:
# - top = 30mm
# - bottom = 30mm
# - left = 30mm
# - right = 30mm
header-includes: |
    \newcommand{\pb}{\pagebreak}
    \renewcommand{\familydefault}{\sfdefault}
    \usepackage{float}
    \makeatletter\def\fps@figure{H}\makeatother
    \usepackage{amsmath}
    \usepackage{amssymb}
    \usepackage{lmodern}
    \usepackage{sansmath}
    \usepackage[T1]{fontenc}
    \sansmath
#    \pagestyle{empty}
---

<!--\pagenumbering{gobble}-->
\setlength{\parindent}{36pt}

# Introduction

<!-- > This section should outline the real-world background and context of your model. Discuss
the motivation one might have to study this model. You may want to research the relevant
literature and include some citations to support your framing of the real-world context
(depending on the project). Be sure to include only background information and context
that is directly related to your research project. Really focus on what the reader needs to
know to understand your work, and be interested and excited by it. -->

<!-- > The final paragraph of your Introduction should frame your research question and de-
scribe what you will be studying in your paper. Briefly mention, in words, what you will
be doing and showing in the rest of the paper. It is often good to lay out your main find-
ing/result here, too.  -->
<!-- A good Introduction section for an applied mathematics paper ideally
has no mathematical symbols or jargon; instead, it should be focused on the real-world con-
text and what you are trying to study. The math is a tool you will introduce later, not the
main focus of the paper. -->

The spread of military technology and the persistence of geopolitical tensions have made arms races a central issue in international relations.
Since the Iranian Revolution in 1979, relations between the United States and Iran have been defined by long-term strategic competition rather than direct warfare @grant_us_iran_timeline.
Over the past several decades, both countries have invested in military capabilities aimed at deterring one another, including missile systems, regional alliances, and, most notably, nuclear-related technologies
@cfr_us_iran_relations.
This type of rivalry reflects a broader global pattern in which nations respond to perceived threats by increasing their own military strength.
In February 2026, the long-standing arms race between the United States and Iran escalated into open conflict, with both sides carrying out direct military strikes on each other’s strategic targets, marking a radical shift from indirect competition to active confrontation @britannica2026iranwar.

Arms races are often understood through the lens of strategic interaction, where the actions of one country influence the decisions of another. 
When one state increases its military spending, its rival may interpret this as a threat and respond in kind, leading to a cycle of escalation.
Understanding how and why arms races escalate, or stabilize, is important for global security and peacekeeping. 
Governments and policymakers rely on predictive tools to assess whether increased military investment by one side will provoke retaliation or eventually lead to equilibrium.
Mathematical models provide a way to explore these dynamics in a <!-- simplified, --> controlled setting, and help us identify the conditions under which competition intensifies or de-escalates.
These insights can be used to inform development of policies that promote peace between warring countries, and prevent conflict from escalating to a point of no return. 

<!-- In February 2026, the arms race between the two countries escalated to a global conflict, with both sides launching attacks on the other's TODO TODO TODO TODO  -->
<!-- 
In this paper, we investigate how an arms race between two rival states, Purple and Green, evolves over time, using the relationship between the United States and Iran as a motivating example. 
First, we develop a mathematical model to describe how each country adjusts its level of armament in response to the other, factoring in assumptions about public sentiment between the two countries. 
Then, we analyze the model under different assumptions, such as public sentiment or resource constraints, and we explore whether the system leads to stable outcomes and peace or continuous escalation and eventual conflict.
Finally, we extend the base model by implementing self limiting mutual logistic fear to account for resource constraints in a real world scenario.  -->
<!-- Our results show that TODO TODO TODO TODO TODO --> 
<!-- the balance between defensive concerns and internal limitations plays a crucial role in determining whether an arms race stabilizes or spirals upward. --> 
<!-- The remainder of the paper introduces the model, analyzes its behavior, and discusses the implications of our findings for real-world geopolitical tensions. -->

<!-- In this paper, we investigate how arms spending between two economically competing countries evolves over time. 
We develop and analyze a mathematical model to represent  -->

In this paper, we investigate how the military spending of two rival countries, Purple (P) and Green (G), evolves over time, using the relationship between the United States and Iran as a motivating example. 
First, we develop a mathematical model in which each country’s arms spending depends not only on its own policies but also on the actions of its rival. 
Then, by analyzing both a baseline and an extended version of the model, we show that the base model predicts that each country’s military spending is determined by its response to its rival, leading to a stable equilibrium level of armament. 
Building on this, the extended model examines how these interactions evolve over time and shows that, if both countries maintain consistent strategies, the system will converge to a stable outcome. 
Depending on the conditions, this may result in a steady level of military spending or, in some cases, mutual disarmament. 
The remainder of the paper introduces the model, presents our analysis, and discusses the implications of these results for understanding real-world arms races.

<!-- Then, by analyzing this model, we show that if both countries maintain consistent strategies, the system will tend toward a stable outcome over time. -->
<!-- Depending on the conditions, this may result in a steady level of military spending or, in some cases, mutual disarmament.  -->

# Base Model

For either hypothetical country, P and G, the assumptions for our base model are as follows:

1. The rate of change in one nation's arms spending is directly proportional to the other nation's arms spending
1. The rate of change in one nation's arms spending is also negatively directly proportional to that nation's own current spending
1. There may be underlying trust and hostility between the two nations, which will have a constant effect on rate of change
1. For now, we assume that each country has infinite amounts of wealth at their disposal (not realistic at all in a real-world context)

Based on these assumptions, the following model was derived:
\begin{equation}
    \dfrac{\partial p}{\partial t} = ag(t) - bp(t) + r
\end{equation}
\begin{equation}
    \dfrac{\partial g}{\partial t} = cp(t) - dg(t) + s
\end{equation}

In particular, $p(t),g(t)$ denote the arms spending at time $t$ for countries P and G respectively. Meanwhile, $\dfrac{\partial p}{\partial t},\dfrac{\partial g}{\partial t}$ denote the rate of change of each country's arm spending. The variables $a,c$ measure the effect of mutual fear that each country has on the other's arms spending, $b,d$ measure the effect of expenditure burden that each country has on their own spending, and $r,s$ measure the underlying hostility or trust that the each nation has to another.

For the sake of realism, $p(t),g(t)$ are held to be non-negative values as negative arms spending would not make sense in this scenario.

Moreover, to ensure that mutual fear and expenditure burden match the behavior as laid out in the assumptions, $a,b,c,d$ are held to be non-negative as well. On the other hand, $r,s$ can assume any value where negative values denote trust and positive values denote hostility.

The parameters in the model $(a,b,c,d,r,s)$ assume no form of units as they serve as abstractions of qualitative measures (i.e. it would be hard to attach a unit to expenditure burden or fear). However, the state variables $p(t),g(t)$ themselves would be expressed in some common currency (e.g. U.S. dollars) and the derivatives of those state variables $(\dfrac{\partial p}{\partial t},\dfrac{\partial g}{\partial t})$ would be expressed in that currency over time (e.g. U.S. dollars per year).

Theoretically speaking, this model is a system of multivariate, autonomous linear differential equations. In this situation, the Jacobian would have to be computed for the purposes of stability analysis.

# Analysis of Base Model

To facilitate the stability analysis of the base model, we now reformulate the system of equations into matrix form:
$$
\begin{bmatrix}
     \dfrac{\partial p}{\partial t} \\  
     \dfrac{\partial g}{\partial t}
\end{bmatrix}
=
\begin{bmatrix}
    -b & a \\
    c & - d
\end{bmatrix}
\begin{bmatrix}
    p(t) \\ g(t)
\end{bmatrix}
+
\begin{bmatrix}
    r \\ s
\end{bmatrix}
$$

## Analysis without underlying trust or hostility

As a starting point, we assume that both nations have no underlying trust or hostility such that $r=s=0$. Thus, the model equations are now:
$$
\begin{bmatrix}
     \dfrac{\partial p}{\partial t} \\  
     \dfrac{\partial g}{\partial t}
\end{bmatrix}
=
\begin{bmatrix}
    -b & a \\
    c & - d
\end{bmatrix}
\begin{bmatrix}
    p(t) \\ g(t)
\end{bmatrix}
$$

Note that by having the system in linear form, the Jacobian is simply the matrix
$$J=\begin{bmatrix}
    -b & a \\
    c & - d
\end{bmatrix}$$

Setting $r=s=0$ lends a unique advantage in that the resulting system of linear differential equations is now homogenous (i.e. there is no constant term). This means that a closed-form of the state-variables can be found in the form of:
$$
\begin{bmatrix}
     p(t) \\  
     g(t)
\end{bmatrix}
= P
\begin{bmatrix}
    e^{\lambda_1 t} & 0 \\
    0 & e^{\lambda_2 t}
\end{bmatrix}
P^{-1}
\begin{bmatrix}
    p(0) \\ g(0)
\end{bmatrix}
$$

Where $\lambda_1,\lambda_2$ denotes the eigenvalues of the Jacobian $J$, $P$ denotes the matrix of eigenvectors, and $p(0),g(0)$ denotes the initial spending of the two countries.

To determine equilibrium points, set
$$\begin{bmatrix}
     \dfrac{\partial p}{\partial t} \\  
     \dfrac{\partial g}{\partial t} \end{bmatrix}
=0$$
Thus,
$$
\begin{bmatrix}
     0 \\  
     0
\end{bmatrix}
=
\begin{bmatrix}
    -b & a \\
    c & - d
\end{bmatrix}
\begin{bmatrix}
    p(t) \\ g(t)
\end{bmatrix}
$$

An obvious equlibrium that can be derived from this formulation is:
$$\begin{bmatrix}
    p^*(t) \\ g^*(t)
\end{bmatrix} = \begin{bmatrix}0 \\ 0\end{bmatrix}$$

This equilibrium point corresponds to a scenario where both nations mutually demilitarize.

To determine the stability conditions of such a scenario, we need to compute the Jacobian. Since the system of differential equations are already in linear form, the Jacobian is simply given by:
$$
J =
\begin{bmatrix}
    -b & a \\
    c & - d
\end{bmatrix}
$$

In order for the scenario of mutual disarmament to be asymptotically stable, the eigenvalues of the Jacobian should both be negative. The eigenvalues are given by:
$$
\det(J-I\lambda) =
\begin{bmatrix}
    -b-\lambda & a \\
    c & - d-\lambda
\end{bmatrix} = \lambda^2 +(b+d)\lambda +bd-ac = 0
$$

The solutions to these eigenvalues are of the form:
$$
\lambda = \dfrac{-(b+d)\pm\sqrt{(b+d)^2-4(bd-ac)}}{2}
$$

Expanding the square term in the discriminant and simplifying the equation yields the following:
$$
\lambda = \dfrac{-(b+d)\pm\sqrt{(b-d)^2+4ac}}{2}
$$

It should be noted that because of the non-negative restrictions imposed upon $a,b,c,d$, the discriminant will always remain positive. From this, we expect that the model will always behave monotonically. In other words, the arms spending of countries P and G will not oscillate.

To check when the eigenvalues remain negative, we look for conditions when $(b+d)$ is greater than $\sqrt{(b-d)^2+4ac}$ in magnitude. After doing some algebra, the result turns out to be: $bd>ac$. In the context of the scenario, the arms spending of countries P and G will converge to complete mutual disarmament if their combined expenditure burden outweighs the combined mutual fear they have for each other.

On the other hand, if $bd<ac$, then the combined mutual fear will outweigh the combined expenditure burden. In this case, the equilibrium of mutual disarmament will become unstable and both nations will engage in a perpetual arms race.

Another point to consider is what happens when $bd = ac$. In this case, we substitute $ac =bd$ in the formula for the eigenvalues:
$$
\lambda = \dfrac{-(b+d)\pm\sqrt{(b+d)^2-4(bd-ac)}}{2} \\
\lambda = 0,-(b+d)\\
$$

In this case, one eigenvalue is negative and the other is $0$. The closed form sheds further light onto what this implies for the model. To this end, the eigenvalues were substitued back in the Jacobian to derive the eigenvectors.

These eigenvectors are
$$\vec{v}_1=\begin{bmatrix}
\dfrac{a}{b}
\\
1
\end{bmatrix}$$ for $\lambda_1 = 0$ and
$$
\vec{v}_2=\begin{bmatrix}
-\dfrac{a}{d}
\\
1
\end{bmatrix}$$ for $\lambda_2 = -(b+d)$.

The closed form solution is therefore:
$$
\begin{bmatrix}
     p(t) \\  
     g(t)
\end{bmatrix}
=
\begin{bmatrix}
    \dfrac{a}{b} & -\dfrac{a}{d} \\
    1 & 1
\end{bmatrix}
\begin{bmatrix}
    e^{(0) t} & 0 \\
    0 & e^{-(b+d) t}
\end{bmatrix}
\begin{bmatrix}
    \dfrac{a}{b} & -\dfrac{a}{d} \\
    1 & 1
\end{bmatrix}^{-1}
\begin{bmatrix}
    p(0) \\ g(0)
\end{bmatrix}
$$

To determine the long-term behavior of the closed form, we let $t\to\infty$, which results in the following convergence.

$$
\begin{bmatrix}
     p(\infty) \\  
     g(\infty)
\end{bmatrix}
=
\begin{bmatrix}
   \dfrac{dp(0)+ag(0)}{b+d} \\
   \dfrac{cp(0)+bg(0)}{b+d}
\end{bmatrix}
$$

Within the scope of the scenario, this convergence suggests that both countries will reach a stabilized level of spending contingent on what they were initially spending.

## Summary

To summarize the analysis, the base model without any underlying trust or hostily has three types of convergences. Attached alongside each explanation of these convergences are vector plots to illustrate the scenarios. These vector plots were constructed using R. For each R simulation, the parameter values are listed in the title of each plot. The vector plot shows the direction of the nations' arms spending for each possible point in the simulation (showcased by the arrows). The red lines indicate the possible trajectories that each nation's arm spending can take based on their initial spending.

![Mutual Disarmament](Vecplot1_disarm.png){fig-pos="H" width=50%}

When $bd>ac$, both countries mutually disarm for various initial spending points ($(0,0)$ is a stable equilibrium point). 
Figure 1 indicates that all the paths in this scenario reach $(0,0)$.

![Perpetual Arms Race](Vecplot2_race.png){fig-pos="H" width=50%}

When $bd<ac$, both countries engage in an a perpetual arms race ($(0,0)$ is an unstable equilibrium point). 
Figure 2 shows each simulation path veering away from $(0,0)$ and going beyond the borders of the graph.

![Stable Spending](Vecplot3_stable.png){fig-pos="H" width=50%}

When $bd=ac$, both countries reach a stabilized level of spending contingent on initial spending (There is a line of stable equilibrium points). Figure 3 shows each path reaching to a stable line in a straight trajectory.

## Analysis with trust or hostility

Now that we assume $r,s$ to be some other value other than zero, the model is not homogenous anymore, meaning that there is not a convenient closed form solution of the system as there was before.

The equilibrium point also changes:
$$\begin{bmatrix}
    p^*(t) \\ g^*(t)
\end{bmatrix} = \begin{bmatrix} \dfrac{rd+sa}{bd-ac} \\  \dfrac{rc+sb}{bd-ac}\end{bmatrix}$$

Now the convergences of the model may not necessarily converge to zero. To determine the stability conditions of this equilibrium, the Jacobian from the previous form of the model can be reused as the system is still linear. In this case, we have the same stability conditions for the equilibrium point as before: $bd>ac$.

To determine what happens when $bd=ac$, we conduct simulations to adjust the values of $r$ and $s$. 
We uncover four cases when we loosen $r$ and $s$ conditions, allowing our trust/hostility parameters to take on $r,s \neq 0$ values. 
For each case, we provide an explanation accompanied by a vector plot which visualizes convergence. 
Vector plots were constructed using R, we provide the parameter values in the title of each plot for each case.
The vector plot shows the direction of the nations' arms spending for each possible point in the simulation (showcased by the arrows). 
The red lines indicate the possible trajectories that each nation's arm spending can take based on their initial spending.

![Mutual Disarmament](S5_bd_eq_ac.png){fig-pos="H" width=50%}

We observe mutual disarmament in Figure 4, in which spending for all trajectories decays to $(0,0)$ for both nations, when $r<0$ and $s<0$. 
This represents opposing nations trusting each other. 
This first case is most similar to the mutual disarmament seen when r and s are zero; however, this mutual disarmament is solely driven by trust between Nations P and G.

![Disarmament and Aramament](S4_bd_eq_ac.png){fig-pos="H" width=50%}

When $r$ and $s$ are of opposing sign, we find that one nation is conciliatory and will disarm, decaying to $(0,0)$, while the other nation is hostile and will arm itself (with bound, not infinitely) for all trajectories. 
In Figure 5, we set $r<0$ and $s>0$ and observe that, for all trajectories, Nation P fully disarms, while Nation G converges to a bounded value depending on the inital conditions of the system and system parameters. 

![Symmetric Perpetual Arms Race](S6_bd_eq_ac.png){fig-pos="H" width=50%}

We observe a perpetual arms race in Figure 6, in which spending grows without bound for both nations, when $r>0$ and $s>0$. 
This represents that opposing nations hold independent grievances. 
Arms spending will diverge the quickest as Nations P and G arm independently and reactively to the other nation arming itself. 
It is important to note that this perpetual armament is balanced; as one can observe, the red trajectory lines converge in a symmetric fashion relative to x- and y-axes.

![Asymmetric Perpetual Arms Race](S3_bd_eq_ac.png){fig-pos="H" width=50%}

We observe a perpetual arms race in Figure 7, in which spending grows without bound for both nations. 
When one of $r$ and $s$ is set to zero (no feelings towards the opposing nation), and the other is set to a positive value (hostile feelings towards the opposing nation). 
Unlike in the previous perpetual arms race, this armament is unbalanced; one nation drives the arms race while the other reacts and arms accordingly. 
In this case, we set $r=0$ and $s>0$ and observe that Nation G drives the arms race while Nation P lags behind in spending; the red trajectory converge in an asymmetric fashion relative to x- and y-axes, growing more quickly in the y-axis (Nation G arms spending).

We believe that the inclusion of $r,s \neq 0$ possiblities, we more accruately predict how real-world nations react to the (dis)aramament of their contemporaries. 
With $r,s \neq 0$, we can account for goodwill and grievance between nations, where in previous cases with parameters $r$ and $s$ excluded, we could only predict independent behaviour. 
This model still has flaws, however. 
In particular, nations are able to arm themselves without bound, which is not realistic as money is a finite resource. 
We hope that our model extension will correct the issues that our base model is restricted by.

<!-- > This subsection should describe the various analysis you’ve performed on your base model
and the results you’ve obtained from them. You should be using a mix of analytical tools
(e.g., finding equilibrium points, determining stability) and numerical tools (e.g., model sim-
ulations in R). When discussing analytical calculations, you don’t need to list out every
single step of your calculation; just present the important/key steps. When discussing nu-
merical simulations, you should describe what your R code is doing and present some plots
to supplement your written descriptions; all R code should be presented in an appendix at
the end of the paper (see below). Be sure to describe what these analysis tell you about your
base model and what predictions they make (this should be in the context of the real-world
scenario framing your project). -->

# Model Extension

<!-- > Here, you should describe the extension you’ve chosen to study for your model. Start by
discussing what the extension is and how you plan to change your base model to account
for it. Similar to the base model subsection, be sure to talk about any assumptions in
your modelling, define state variables and parameters (including units), and describe any
modelling choices made. In particular, you should highlight how your extended model differs
from your base model. If appropriate, it would be good to include a model diagram. You
should also write out the model equations. Do not discuss any analysis of the extended model
here. That will go in the next section -->

## Mutual Logistic Fear Model

One major limitation of the base model is the assumption that each country has access to infinite resources. In reality, arms spending is constrained by each country's limited amounts of funds. As a result, the base model produces unrealistic outcomes such as unbounded growth in arms expenditure. To address this limitation, we extend the model by introducing logistic growth terms.

## Model overview

For either hypothetical country P and G, the assumptions for the extended model are as follows:

1. The rate of change in one nation’s arms spending follows a logistic growth depending on the other nation’s arms spending. This is accompanied by a finite resource constraint that limits how much each country can spend.
2. The rate of change is negatively proportional to the nation’s own current spending.
3. There may still be underlying trust or hostility between the two nations, which has a constant effect on the rate of change.

<!--### Model Formulation
To incorporate resource limits, we introduce carrying capacities $K_p$ and $K_g$, which represent the maximum sustainable arms levels for countries P and G respectively. The mutual fear terms are now scaled by logistic factors that reduce growth as spending approaches these limits.-->

Based on these assumptions, the following model was formulated:
\begin{equation}
\frac{\partial p}{\partial t} = a\left(1 - \frac{p(t)}{K_p}\right)g(t) - bp(t) + r
\end{equation}
\begin{equation}
\frac{\partial g}{\partial t} = c\left(1 - \frac{g(t)}{K_g}\right)p(t) - dg(t) + s
\end{equation}

Here, $K_p, K_g$ denote the maximum level of sustainable arms spending for countries P and G respectively. The units these parameters assume would be in a common currency such as U.S. dollars. The rest of the parameters and state variables assume the same meaning as specified for the base model.

<!-- ### Definition of Variables and Parameters

- $p(t), g(t)$: arms spending of countries P and G

Parameters:
- $a, c$: mutual fear coefficients
- $b, d$: expenditure burden coefficients
- $r, s$: exogenous trust/hostility terms
  - $r, s > 0$: hostility / pressure to increase arms
  - $r, s < 0$: trust / pressure to reduce arms
- $K_p, K_g$: carrying capacities representing maximum sustainable arms levels -->

## Differences from the Base Model

The extended model differs from the base model in one fundamental way: the inclusion of the logistic terms $\left(1 - \frac{p}{K_p}\right)$ and $\left(1 - \frac{g}{K_g}\right)$.

In particular:

1. The base model allows for unbounded growth when mutual fear dominates.
1. The extended model prevents unbounded growth by enforcing resource constraints.

This extension therefore provides a more realistic representation of arms dynamics by combining strategic interaction with physical and economic limitations.

## Analysis of Mutual Logistic Fear Model



<!-- In contrast with the base model, there is generally no simple closed-form equilibrium such as $(0,0)$ unless the trust/hostility terms are chosen appropriately. Instead, the equilibria depend jointly on the parameters
$$
a,b,c,d,r,s,K_p,K_g.
$$

Thus, the long-term behavior of the extended model is governed by the location and stability of the solutions to this nonlinear system. -->

## Jacobian Matrix

To determine the local stability of an equilibrium point, we compute the Jacobian matrix:
$$
J(p,g)=
\begin{bmatrix}
\frac{\partial f}{\partial p} & \frac{\partial f}{\partial g} \\
\frac{\partial h}{\partial p} & \frac{\partial h}{\partial g}
\end{bmatrix}
$$


After computing the partial derivatives, the Jacobian of the extended model is
$$
J(p,g)=
\begin{bmatrix}
-\frac{ag}{K_p}-b & a\left(1-\frac{p}{K_p}\right) \\
c\left(1-\frac{g}{K_g}\right) & -\frac{cp}{K_g}-d
\end{bmatrix}
$$

Evaluating this Jacobian at an equilibrium point $(p^*,g^*)$ yields
$$
J(p^*,g^*)=
\begin{bmatrix}
-\frac{ag^*}{K_p}-b & a\left(1-\frac{p^*}{K_p}\right) \\
c\left(1-\frac{g^*}{K_g}\right) & -\frac{cp^*}{K_g}-d
\end{bmatrix}
$$

The eigenvalues of this matrix determine the local stability of the equilibrium.

## Equilibrium Points 

We set:
$$
a\left(1 - \frac{p^*}{K_p}\right)g^* - bp^* + r = 0
$$
$$
c\left(1 - \frac{g^*}{K_g}\right)p^* - dg^* + s = 0.
$$

These equations define the equilibrium point $(p^*, g^*)$.


Rearranging the first equation yields:
$$
a\left(1 - \frac{p^*}{K_p}\right)g^* = bp^* - r,
$$
$$\implies
g^* = \frac{K_p(bp^* - r)}{a(K_p - p^*)}, \qquad p^* \neq K_p.
$$

Similarly, rearranging the second equation gives:
$$
c\left(1 - \frac{g^*}{K_g}\right)p^* = dg^* - s,
$$
$$\implies
p^* = \frac{K_g(dg^* - s)}{c(K_g - g^*)}, \qquad g^* \neq K_g.
$$

## Stability Conditions

For a two-dimensional system, an equilibrium point is locally asymptotically stable if the Jacobian evaluated at that point has
$\operatorname{tr}(J(p^*,g^*))<0$
and
$\det(J(p^*,g^*))>0$.

## Trace

The trace is
$$
\operatorname{tr}(J(p^*,g^*))=
\left(-\frac{ag^*}{K_p}-b\right)+\left(-\frac{cp^*}{K_g}-d\right).
$$
<!-- So, -->
$$\implies
\operatorname{tr}(J(p^*,g^*))=
-\frac{ag^*}{K_p}-\frac{cp^*}{K_g}-(b+d).
$$

Since
$a,b,c,d,K_p,K_g,p^*,g^* \geq 0,$
it follows that
$\operatorname{tr}(J(p^*,g^*))<0$
for any nonnegative equilibrium point, provided $b+d>0$.

Thus, in the extended model, the trace is automatically negative under the natural assumptions of the scenario.

## Determinant

The determinant is
$$
\det(J(p^*,g^*))=
\left(-\frac{ag^*}{K_p}-b\right)\left(-\frac{cp^*}{K_g}-d\right)
-
a\left(1-\frac{p^*}{K_p}\right)c\left(1-\frac{g^*}{K_g}\right).
$$

Expanding this gives
$$
\det(J(p^*,g^*))=
\left(b+\frac{ag^*}{K_p}\right)\left(d+\frac{cp^*}{K_g}\right)
-
ac\left(1-\frac{p^*}{K_p}\right)\left(1-\frac{g^*}{K_g}\right).
$$

Unlike the base model, the determinant of the Jacobian in the extended model depends explicitly on the equilibrium values $p^*$ and $g^*$. 

As a result, it is generally not possible to derive a simple analytical condition for stability in terms of the parameters alone.

## Eigenvalues and Stability

The eigenvalues of the Jacobian are given by
$$
\lambda = \frac{\operatorname{tr}(J(p^*,g^*)) \pm \sqrt{\operatorname{tr}(J(p^*,g^*))^2 - 4\det(J(p^*,g^*))}}{2}.
$$

Clearly, this expression depends on the equilibrium values $p^*$ and $g^*$, which are not generally available explicitly. Consequently, the eigenvalues do not yield simple analytical conditions for stability, unlike in the base model.


## Simulations

 We consider the following three representative parameter regimes while keeping $K_p = K_g = 5$ fixed.

#### Case 1: $bd < ac,\; r < 0,\; s < 0$

![Case 1: Mutual disarmament](logistic_rs_case1.png){fig-pos="H" width=70%}

In this case, both countries experience negative external pressure, representing trust or incentives to de-escalate. Arms spending falls over time, leading to mutual disarmament.

#### Case 2: $bd = ac,\; r < 0,\; s > 0$

![Case 2: Stabilized but unequal spending](logistic_rs_case2.png){fig-pos="H" width=70%}

Here, the two countries face asymmetric external pressures. Country P experiences trust or downward pressure, while country G experiences hostility or upward pressure. The model predicts stabilization, but at unequal long-run spending levels.

#### Case 3: $bd > ac,\; r > 0,\; s > 0$

![Case 3: High steady-state spending](logistic_rs_case3.png){fig-pos="H" width=70%}

In this case, both countries experience positive external pressure, representing hostility or incentives to increase arms. Both countries converge to a high steady-state level of arms spending.

# Results
## Sensitivity Analysis
With regards to the sensivity, we tested how changes in each of the variables in our model would impact nations arms spending. Here, only $a$, $b$, and $r$ will be tested, but the conclusions relate to $c$, $d$ and $s$ in the same way respectively.

## Sensitivity of *a*:

![Sensitivity of a](sensitivity_a.png){fig-pos="H" width=70%}

In this case, we can see that increases in one country's mutual fear ($a$) will lead to increases in both countries' spending at all times. This is due to the fact that a higher $a$ will lead to country P wanting to spend more for each unit of G's arms, so P's arms will be higher. Since $c>0$ (model definitition), this higher level of P's arms will also lead to higher arms spending by G.

## Sensitivity of *b*:

![Sensitivity of b](sensitivity_b.png){fig-pos="H" width=70%}

In this case, we can see that increases in one country's expenditure burden ($b$) will lead to decreases in both countries spending at all times, this is due to the fact that a higher $b$ will lead to P wanting to spend less for each unit of P's arms, so P's arms will be lower. Since $c>0$ (model definitition), this lower level of P's arms will also lead to lower G's arms spending

## Sensitivity of *r*:

![ Sensitivity of $r$](sensitivity_c.png){fig-pos="H" width=70%}

In this case, we can see that increases in one country's trust/hostility $r$ will lead to increases in both countries' spending at all times. 
This is due to the fact that a higher $r$  will lead to P wanting to spend more due to its higher grievance towards G, so P's arms will be higher. 
Since $c>0$ (model definitition), this higher level of P arms will also lead to higher G arms spending.

<!-- > n this section, you should describe the analysis you performed on your extended model. Be
sure to motivate your analysis in the context of your research question (i.e., why do you
want to perform each analysis, what are you hoping it will tell you). These analysis can be
purely simulation-based: you are not required to perform any mathematical analysis of your
extended models, but if you can, you should! Mathematical analysis generally tell you more
about model behaviour than simulations (when both are possible). You should be including
plots here, as well, to go along with any simulations you did. Unlike with the draft, this
section of the paper should now be complete and all results should be discussed in the pape -->

## Motivated analysis of US-Iran with our model

With the consequences of the current US-Iran conflict being felt around the world, we wanted to see if our model could properly reflect the sitution. 
Our assumptions for modelling the conflict were as follows (we set the US=Country P in our model setup, Iran=Country G);

Initial arms spending of the two countries, while relations between US and Iran would not really have been called "good" for a long time, the countries were in a relatively stable place of arms spending against one another prior to this year.

Early this year, the US leadership was convinced that Iran was a more serious threat than previous, and as a result increased their military action against Iran.
In our model this will be taken as an increase in both the grievance held ($r$ increased) and an increase in the fear caused by Iranian spending ($a$ increased).

![US vs Iran](US_Vs_IRAN.png){fig-pos="H" width=70%}

Above, we can see the result of modelling as if this change occurs at $t=25$ (changing from the conditions in main title, to $a=0.8$, $r=0.05$), with the US's escalation also causing Iran to increase their spending. 
This is a key prediction, because while the US seemed to think that Iran would simply give up, that is not very realistic assumption as countries are almost always more willing to fight to protect their nation than to give up. 
Despite reduced spending because of relatively good relations over the last while, Iran was still willing to rearm themselves if needed, which is exactly what we saw happen.




# Discussion

<!-- > This is the final section of the main body of your paper. Start by briefly summarizing
the main results you presented in the last section and relating them back to your research
question. This is also where you should be providing answers, based on your results, to your research question(s). Be sure to interpret your results in the context of the real-world
scenario framing your project. What are the implications of your results? -->

<!-- > You should also discuss limitations of your work. This is usually related to the modelling
assumptions you made before. When are your results applicable and when are they not
applicable? What factors have you omitted from your model that may affect the predictions?
This is important to discuss, otherwise the reader may come away from your paper with the
impression that your results are universal which is rarely the case.

> Finally, you should discuss possible directions for future research. Did your results open
up any other questions? Where else could you go with this work? Are there other things
you’ve read about in the literature that could be interesting to look at? You should also use
this as a way to conclude your whole paper. -->

In this paper, we examined how an arms race between two rival countries evolves, motivated by the long-standing strategic competition between the United States and Iran. 
Our goal was to understand how military spending decisions are influenced not only by internal policies but also by the actions of a rival state. 
By developing and analyzing both a baseline and an extended version of the model, we were able to explore how these interactions shape long-term outcomes.

Our results show that arms spending is inherently interdependent: each country’s decisions are influenced by the behavior of the other. 
In the base model, this interaction leads to a stable equilibrium level of military spending determined by mutual responses. 
In the extended model, we introduced self-limiting logistic growth to reflect the idea that military expansion is constrained by factors such as economic capacity and resource limitations. 
With this addition, we found that when countries maintain consistent strategies over time, the system converges to a stable outcome.
Depending on the conditions, this may result in a sustained level of military expenditure or, in some cases, mutual disarmament. 
These results reinforce the idea that long-term arms race dynamics are shaped not only by strategic competition but also by inherent limits on growth.

In the real-world context, this suggests that even in persistent rivalries such as that between the United States and Iran, unlimited escalation is unlikely. 
Economic and practical constraints can naturally restrict the growth of military spending, potentially leading to stabilization over time. 
This highlights the importance of considering both strategic interactions and internal limitations when analyzing global security dynamics.

However, this model has several limitations. 
First, it simplifies the real-world situation by considering only two interacting countries, but actual arms race dynamics often involve multiple states, alliances, and broader geopolitical blocs. 
Second, the model assumes that all parameters remain constant over time, including levels of trust, hostility, and responsiveness to rival actions, despite the fact that these factors can change significantly due to political events, leadership shifts, or international agreements.
Third, we assume that both countries behave in a rational and consistent manner according to the model’s structure, whereas in reality decision-making may be influenced by misperceptions, misinformation, or domestic political pressures. 
Fourth, the representation of trust and hostility as a constant additive effect is a major simplification, since these relationships evolve dynamically based on historical interactions and ongoing signals between states. 
Finally, although the extended model introduces logistic growth to incorporate resource limitations, this remains a simplified approximation of real economic and structural constraints, which are influenced by a wide range of unpredictable factors such as sanctions, technological development, and economic shocks.

<!-- However, this model has several limitations. 
It assumes that each country follows a consistent and rational strategy, which may not hold in practice due to changing political leadership, misperceptions, or unexpected external events. 
The use of logistic growth captures resource limitations in a simplified way, but real-world constraints are more complex and may vary over time.
Additionally, the model focuses only on two countries and does not account for the influence of allies, regional conflicts, or non-state actors. 
Other important factors, such as technological innovation and political pressures, are also not explicitly included. -->

<!-- Future research could extend this model by allowing parameters to change over time or by incorporating additional actors to better reflect real-world complexity.
It would also be valuable to explore how uncertainty, communication, or policy shifts affect the stability of the system. 
Further work could refine the representation of resource constraints beyond logistic growth to capture more realistic economic and political factors. 
Overall, this study demonstrates how incorporating realistic limitations into mathematical models can lead to more accurate and meaningful insights into arms race dynamics. -->

Future research could extend this framework by considering interactions between multiple countries rather than just two. 
This would allow the model to better reflect real-world alliance structures and the way conflicts can spread between groups of states. 
In more advanced models, such dynamics have been studied in classical work such as Richardson’s equations @Gold1962, which describe how arms competition can evolve in larger systems of interacting countries.

\pb

# Appendix: Individual Contributions

### Zeyn Jaswal

1. Presentation: Overview
1. Report: Introduction, Discussion

### Azzaam Khan
1. Presentation: Base Model
1. Report: Base Model

### Timothy Palin
1. Presentation: Results
1. Report: Results 

### Tony Xu
1. Presentation: Logistic Mutual Fear Extension
1. Report: Logistic Mutual Fear Extension

### Meredith Reeves
1. Presentation: Public Sentiment
1. Report: Base Model

\pb

# References

<!-- Consider @Talele2025, a great guy who wrote some cool stuff.

Bipolar arms races between two countries @Wallace1979  -->