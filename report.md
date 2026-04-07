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

Consider @Talele2025, a great guy who wrote some cool stuff.

# Base Model

For either hypothetical country, P and G, the assumptions for our base model are as follows:

1. The rate of change in one nation's arms spending is directly proportional to the other nation's arms spending
1. The rate of change in one nation's arms spending is also negatively directly proportion to that nation's own current spending
1. There may be underlying trust and hostility between the two nations, which will have a constant effect on rate of change
1. For now, we assume that each country has infinite amounts of wealth at their disposal (not realistic at all in a real-world context)

Based on these assumptions, the following model was derived:
\begin{equation}
    \dfrac{\partial p}{\partial t} = ag(t) - bp(t) + r 
\end{equation}
\begin{equation}
    \dfrac{\partial g}{\partial t} = cp(t) - dg(t) + s
\end{equation}

In particular $\dfrac{\partial p}{\partial t},\dfrac{\partial g}{\partial t}$ denote the rate of change of each country's arm spending.
The variables $a,c$ measure the effect of mutual fear that each country has on the other's arms spending, 
$b,d$ measure the effect of expenditure burden that each country has on their own spending, and 
$r,s$ measure the underlying hostility or trust that the each nation has to another. 

For the sake of realism, $p(t),g(t)$ are held to be non-negative values as negative arms spending would not make sense in this scenario.
Moreover, to ensure that mutual fear and expenditure burden match the behavior as laid out in the assumptions, $a,b,c,d$ are held to be non-negative as well. On the other hand, $r,s$ can assume any value where negative values denote trust and positive values denote hostility.

The parameters in the model $(a,b,c,d,r,s)$ assume no form of units as they serve as abstractions of qualitative measures (i.e. it would be hard to attach a unit to expenditure burden or fear). However, the state variables themselves would be expressed in some common currency (e.g. U.S. dollars) and the derivatives of those state variables $(\dfrac{\partial p}{\partial t},\dfrac{\partial g}{\partial t})$ would be expressed in that currency over time (e.g. U.S. dollars per year).

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

In order for the scenario of mutual disarmament to be asymptotically stable, the eigenvalues of the jacobian should both be negative. The eigenvalues are given by:
$$
\det(J-I\lambda) =
\begin{bmatrix}
    -b-\lambda & a \\
    c & - d-\lambda
\end{bmatrix} = \lambda^2 +(b+d)\lambda +bd-ac = 0
$$

The solutions to these eigenvalues are of the form:
$$
\lambda = \frac{-(b+d)\pm\sqrt{(b+d)^2-4(bd-ac)}}{2}
$$

Expanding the square term in the discriminant and simplifying the equation yields the following:
$$
\lambda = \frac{-(b+d)\pm\sqrt{(b-d)^2+4ac}}{2}
$$

It should be noted that because of the non-negative restrictions imposed upon $a,b,c,d$, the discriminant will always remain positive. From this, we expect that the model will always behave monotonically.

To check when the eigenvalues remain negative, we look for conditions when $(b+d)$ is greater than $\sqrt{(b-d)^2+4ac}$ in magnitude. After doing some algebra, the result turns out to be: $bd>ac$. In the context of the scenario, the arms spending of countries P and G will converge to complete mutual disarmament if their combined expenditure burden outweighs the combined mutual fear they have for each other.

On the other hand, if $bd<ac$, then the combined mutual fear will outweigh the combined expenditure burden. In this case, the equilibrium of mutual disarmament will become unstable and both nations will engage in a perpetual arms race.

Another point to consider is what happens when $bd = ac$. In this case, we substitute $ac =bd$ in the formula for the eigenvalues:
$$
\lambda = \frac{-(b+d)\pm\sqrt{(b+d)^2-4(bd-ac)}}{2} \\
\lambda = 0,-(b+d)\\
$$

In this case, one eigenvalue is negative and the other is 0. The closed form sheds further light onto what this implies for the model. To this end, the eigenvalues were substitued back in the Jacobian to derive the eigenvectors. 

These eigenvectors are 
$$\vec{v}_1=\begin{bmatrix} 
\frac{a}{b}
\\ 
1 
\end{bmatrix}$$ for $\lambda_1 = 0$ and 
$$\vec{v}_2=\begin{bmatrix} 
-\frac{a}{d}
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
    \frac{a}{b} & -\frac{a}{d} \\
    1 & 1
\end{bmatrix}
\begin{bmatrix}
    e^{(0) t} & 0 \\
    0 & e^{-(b+d) t}
\end{bmatrix}
\begin{bmatrix}
    \frac{a}{b} & -\frac{a}{d} \\
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
   \frac{dp(0)+ag(0)}{b+d} \\
   \frac{cp(0)+bg(0)}{b+d}
\end{bmatrix}
$$

Within the scope of the scenario, this convergence suggests that both countries will reach a stabilized level of spending contingent on what they were initially spending.

To summarize the analysis, the base model without any underlying trust or hostily has three types of convergences. Attached alongside each explanation of these convergences are vector plots to illustrate the scenarios.

- When $bd>ac$, both countries mutually disarm ((0,0) is a stable equilibrium point) (Figure 1)
- When $bd<ac$, both countries engage in an a perpetual arms race ((0,0) is an unstable equilibrium point) (Figure 2)
- When $bd=ac$, both countries reach a stabilized level of spending contingent on initial spending (There is a line of stable equilibrium points) (Figure 3)

![Mutual Disarmament](Vecplot1_disarm.png)

![Perpetual Arms Race](Vecplot2_race.png)

![Stable Spending](Vecplot3_stable.png)


## Analysis with trust or hostility

Now that we assume $r,s$ to be some other value other than zero, the model is not homogenous anymore, meaning that there is not a convenient closed form solution of the system as there was before.

The equilibrium point also changes:

$$\begin{bmatrix}
    p^*(t) \\ g^*(t)
\end{bmatrix} = \begin{bmatrix} \frac{rd+sa}{bd-ac} \\  \frac{rc+sb}{bd-ac}\end{bmatrix}$$ 

Now the convergences of the model may not necessarily converge to zero. To determine the stability conditions of this equilibrium, the Jacobian from the previous form of the model can be reused as the system is still linear. In this case, we have the same stability conditions for the equilibrium point as before: $bd>ac$.

To determine what happens when $bd=ac$, we conduct simulations to adjust the values of r and s.


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

<!-- > Here, you should describe the extension you’ve chosen to study for your model. Start by
discussing what the extension is and how you plan to change your base model to account
for it. Similar to the base model subsection, be sure to talk about any assumptions in
your modelling, define state variables and parameters (including units), and describe any
modelling choices made. In particular, you should highlight how your extended model differs
from your base model. If appropriate, it would be good to include a model diagram. You
should also write out the model equations. Do not discuss any analysis of the extended model
here. That will go in the next section -->

## Mutual Logistic Fear Model (Extension)

One major limitation of the base model is the assumption that each country has access to infinite resources. In reality, arms spending is constrained by economic capacity, political limitations, and logistical considerations. As a result, the base model may produce unrealistic outcomes such as unbounded growth in arms expenditure.

To address this limitation, we extend the model by introducing **self-limiting logistic growth terms**. The purpose of this extension is to incorporate resource constraints directly into the dynamics of arms accumulation.

### Assumptions

For either hypothetical country P and G, the assumptions for the extended model are as follows:

1. The rate of change in one nation’s arms spending is still directly proportional to the other nation’s arms spending (mutual fear).
2. The rate of change is negatively proportional to the nation’s own current spending (expenditure burden).
3. Each country faces a finite resource constraint that limits how much arms spending can grow.
4. There may still be underlying trust or hostility between the two nations, which has a constant effect on the rate of change.
5. Arms spending remains non-negative at all times.

### Model Formulation

To incorporate resource limits, we introduce **carrying capacities** $K_p$ and $K_g$, which represent the maximum sustainable arms levels for countries P and G, respectively. The mutual fear terms are now scaled by logistic factors that reduce growth as spending approaches these limits.

The resulting model is:

$$
\frac{\partial p}{\partial t} = a\left(1 - \frac{p(t)}{K_p}\right)g(t) - bp(t) + r
$$

$$
\frac{\partial g}{\partial t} = c\left(1 - \frac{g(t)}{K_g}\right)p(t) - dg(t) + s
$$

### Definition of Variables and Parameters

- $p(t), g(t)$: arms spending of countries P and G (e.g. in U.S. dollars)
- $\frac{\partial p}{\partial t}, \frac{\partial g}{\partial t}$: rate of change of arms spending (e.g. dollars per year)

Parameters:
- $a, c$: mutual fear coefficients (response to the opponent’s arms level)
- $b, d$: expenditure burden coefficients (self-damping effects)
- $r, s$: exogenous trust/hostility terms
  - $r, s > 0$: hostility / pressure to increase arms
  - $r, s < 0$: trust / pressure to reduce arms
- $K_p, K_g$: carrying capacities representing maximum sustainable arms levels

As in the base model, $a, b, c, d \geq 0$, while $r$ and $s$ may take any real value. The parameters remain unitless abstractions of qualitative effects, while the state variables retain units of currency.

### Modelling Choices

The key modelling choice in this extension is the introduction of **logistic scaling** in the interaction terms. This ensures that:

- When arms levels are low relative to capacity, the system behaves similarly to the base model.
- As arms levels approach $K_p$ or $K_g$, growth slows down.
- If arms exceed these capacities, the interaction term becomes negative, pushing the system back toward feasible levels.

### Differences from the Base Model

The extended model differs from the base model in one fundamental way: the inclusion of the logistic terms $\left(1 - \frac{p}{K_p}\right)$ and $\left(1 - \frac{g}{K_g}\right)$.

This modification transforms the system from a **linear system of differential equations** into a **nonlinear system**, and introduces bounded dynamics. In particular:

- The base model allows for unbounded growth when mutual fear dominates.
- The extended model prevents unbounded growth by enforcing resource constraints.
- Long-term outcomes are no longer solely determined by the relationship between $ac$ and $bd$, but also by the carrying capacities and the external terms $r$ and $s$.

This extension therefore provides a more realistic representation of arms dynamics by combining strategic interaction with physical and economic limitations.

### Illustrative Simulations

To visualize the effect of the added trust/hostility terms, we consider three representative parameter regimes while keeping $K_p = K_g = 5$ fixed.

#### Case 1: $bd < ac,\; r < 0,\; s < 0$

![Case 1: Mutual disarmament](logistic_rs_case1.png){ width=70% }

In this case, both countries experience negative external pressure, representing trust or incentives to de-escalate. Arms spending falls over time, leading to mutual disarmament.

#### Case 2: $bd = ac,\; r < 0,\; s > 0$

![Case 2: Stabilized but unequal spending](logistic_rs_case2.png){ width=70% }

Here, the two countries face asymmetric external pressures. Country P experiences trust or downward pressure, while country G experiences hostility or upward pressure. The model predicts stabilization, but at unequal long-run spending levels.

#### Case 3: $bd > ac,\; r > 0,\; s > 0$

![Case 3: High steady-state spending](logistic_rs_case3.png){ width=70% }

In this case, both countries experience positive external pressure, representing hostility or incentives to increase arms. Due to the logistic caps, the system does not grow without bound; instead, both countries converge to a high steady-state level of arms spending.

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

\pb

# Appendix: Individual Contributions

### Zeyn Jaswal

1. Presentation: Overview 
1. Report: Introduction and Conclusion 


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
1. Report: Public Sentiment

\pb

# References
