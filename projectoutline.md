Imagine two economically competing countries: Purple and Green.  Both countries desire peace and hope to avoid war.

While neither country will go out of its way to launch an aggression, it also would not sit idly by if their country was attacked.  Each country believes in self-defence and will prepare to fight to protect itself.  Both nations feel that the maintenance of certain amount of army and the stockpiling of weapons is ”defensive” when they do it but ”offensive” when the other nation does it.

In this project, you will investigate with a simple model about how arms or military spending varies over time in each nation, based on various assumptions about how each country’s arming and military behaviour influences the other.

## Base model

Let $p(t)$ and $g(t)$ represent the total arms and military spending in year t by Purple and Green, respectively.  The two nations are in competition, so there is an underlying sense of mutual fear:  the more one nation arms, the more the other nation is incentivized to arm.  To start, we could assume that each nation’s armament rate is directly proportional to the other’s arms spending (these should be linear terms in your model).  We may also want to account for the fact that excessive armament expenditures come at a cost to each nation’s economy, i.e., the rate of change of each nation’s expenditures is directly and negatively proportional to its own expenditure (again, these should be linear terms in your model).  The sign of these constant parameters determines whether the term models grievances, which increase armament spending, or feelings of good will, which decrease it.

Construct a continuous model to describe this scenario.  What does your model predict for the long-term arms spending of each country?  Notice that analytical discussions will be required to get full score of this part of the base model for this topic.

Finally, we can additionally model any underlying grievances or feelings of goodwill of each country toward the other using constant terms, which should be invariant to spendings or time.  Try to discuss the impact of such goodwills to the model predictions using simulations.

## Possible extensions

### Logistic mutual fear

For the mutual fear terms, assume that there is some inherent limit to the amount a nation can spend on armaments each year (call it $K_p$ and $K_g$ for Purple and Green, respectively).  Then, you could replace the linear terms with logistic terms (e.g. $a(1 − p(t)/K_p)g(t)$ for Purple).  What could be changed in your model prediction after the replacement?
