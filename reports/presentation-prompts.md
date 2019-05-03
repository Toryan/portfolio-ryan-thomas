
presentation prompts
====================

D1 box plot
-----------

State the number of observations: 5,854

List the variables:

variable name: Country

-   type: Categorical, nominal
-   levels (if categorical): 234

variable name: Type of good

-   type: Categorical, nominal
-   levels (if categorical): 29

variable name: Trade balance

-   type: quantitative, discrete

State the graph type: Box plot

Explain why the graph type is suited to the data structure:

-   There is only one quantitative variable and a number of categorical (or categorical levels) (it is univariate)
-   There are far too many observations to be distinsguishable in a dot plot, so a box plot is better
-   My goal is to compare several distributions with large data sets, and several box plots on the same graph work well for this purpose (Doumont, [2009](#ref-Doumont:2009))

Explain each design choice and cite its supporting reference

-   I put the commodities on the y-axis, so they could be easily read, which was more important then easily reading labeled data points. (Doumont, [2009](#ref-Doumont:2009))
-   I made the graph very large so it could accomidate the labeling I wanted. (Doumont, [2009](#ref-Doumont:2009))
-   I jittered th outliers and made them translucent so that they can all be seen. (Robbins, [2013](#ref-Robbins:2013a))
-   I only labeled a few key outliers because labeling too many of them would cause the data to become unreadible. (Robbins, [2013](#ref-Robbins:2013a))
-   I ordered the data by its mean, going from highest to lowest.This makes it easier to pick out discrepencies between the data sets. (Knaflic, [2013](#ref-Knaflic:2013-09))
-   I used a cubic scale to serve the same purpose as a log scale, but It also works for negative numbers (Wainer, [2014](#ref-Wainer:2014))

Comments from peers

-   write deficiet / surplus directly on chart
-   use a linear scale to better focus on outliers
-   sort by absolute value of max min / or standary deviation
-   work in vertical and only flip at end

D2 multiway
-----------

State the number of observations: 100

List the variables:

Variable name: Number of Incididents

-   type: Quantitative, discrete

variable name: Category of Indident

-   type: Categorical, nominal
-   levels (if categorical): 25

variable name: Time of day

-   type: Categorical, ordinal
-   levels (if categorical): 4

State the graph type: Multiway

Explain why the graph type is suited to the data structure:

-   I have a quantitative result for every combination of levels from the two categories, which is what this type of graph is made for.
-   I want to make comparisons between the two categories and within their levels

Explain each design choice and cite its supporting reference

-   I put the Incident Category on the y-axis, so they could be easily read (Doumont, [2009](#ref-Doumont:2009))
-   I used a position representation (dots) rather than a length representation (bars) because I am using a logscale and a bar chart is not suited to that (Doumont, [2009](#ref-Doumont:2009))
-   I chose to have 5 columns and 5 rows because more than 5 becomes overly difficult to read (Doumont, [2009](#ref-Doumont:2009))
-   I maintained a constant scale and order of variables in each multiple so they can be easily compared (Robbins, [2013](#ref-Robbins:2013a))
-   I ordered the data by its mean, going from highest to lowest.This makes it easier to pick out discrepencies between the data sets. (Knaflic, [2013](#ref-Knaflic:2013-09))

Comments from peers

-   SWAP THE AXES, time always on x
-   bin to 1 hour, even thrity minute increments
-   time can work as a category but be careful with it

D3 correlations
---------------

State the number of observations: 144

List the variables:

Variable name: Propeller Angular Velocity

-   type: Quantitative, continuous

variable name: Propeller Thrust Coefficient

-   type: Quantitative, continuous

variable name: Propeller Brand

-   type: Categorical, nominal
-   levels (if categorical): 9

State the graph type: Scatterplot

Explain why the graph type is suited to the data structure:

-   There are two quantitative sets of data that I am looking for a correlation between, which is the purpose of the scatterplot.

Explain each design choice and cite its supporting reference

-   I maintained a constant scale and order of variables in each facet so they can be easily compared (Robbins, [2013](#ref-Robbins:2013a))
-   I have faceted on the categorical variable because 9 is too many colors or shapes to keep track of, and the different levels can still be easily compared even when faceted. When plotting on the same graphs some of the symbols or colors blend together, making the dispay look cluttered (Doumont, [2009](#ref-Doumont:2009))
-   I ordered the data by its mean, going from highest (Top right) to lowest (bottom left).This grouping of categories makes it easier to pick out discrepencies between the data sets. (Knaflic, [2013](#ref-Knaflic:2013-09))
-   I made the graph as small as I could without making the labels indistinguishable. This helps emphasize the data (Doumont, [2009](#ref-Doumont:2009)).
-   Another reason I went with the Facet was to avoid having the audience memorize a legend (Wainer, [2014](#ref-Wainer:2014))
-   I changed the x label from RPM to thousand RPM so they woulden't write over each other.

Comments from peers

-   Could use in another display, multivariate data, more of a story (power, torque) (coplot 3 or 4, parrellel coordinate any number)
-   9 columns in one row, much easier to compare, easier to get to 45 degrees can shorten name

D4 injuries or fatalities displayed ethically
---------------------------------------------

**Context**

Type of injury or fatality: death caused by air pollution.

People affected: ranges from &lt;50 per 1 million to 1500 per 1 million depending on time and country.

Over what span of time: 1999 to 2017.

**Graph the data conventionally**

-   If you are redesigning someone else's graph, include an image of the original
-   If not, graph the data yourself using a graph type suited to the data

State the number of observations: 18525

List the variables:

Variable name: Year

-   type: Quantitative, discrete

variable name: Number of deaths per million

-   type: Quantitative, continuous

variable name: Country

-   type: Categorical, nominal
-   levels (if categorical): 5

variable name: Pollution type

-   type: Categorical, nominal
-   levels (if categorical): 195

State the graph type: Linegraph

Explain why the graph type is suited to the data structure:

-   It suits the timeseries data, allowing trends to be seen. If the lines were dots they would all blend together.

Explain the visual-rhetoric features of the graph that make it unethical:

-   According to Voss and Dragga the lack of "humanizing" features that demonstrate the human suffering that results from the pollution makes the graph unethical.
-   If someone who was a victim of disease from pollution came across this graph they might hypothetically be hurt or offended by it.

**Redesign the graph to display the data ethically**

State the new graph type (if any): Same.

Explain each design choice in the redesign and cite its supporting reference

-   I maintained a constant scale and order of variables in each facet so they can be easily compared (Robbins, [2013](#ref-Robbins:2013a))
-   I ordered the data by its mean, going from highest to lowest. This grouping of categories makes it easier to pick out discrepencies between the data sets. (Knaflic, [2013](#ref-Knaflic:2013-09))
-   I made the graph as small as I could without making the labels indistinguishable. This helps emphasize the data (Doumont, [2009](#ref-Doumont:2009)).
-   Another reason I went with the Facet was to avoid having the audience memorize a legend (Wainer, [2014](#ref-Wainer:2014))
-   I changed the x label from year to the last two digits of the year so they woulden't write over each other.
-   I used text about the suffering caused by the pollution to humanize the data (Dragga and Voss, [2001](#ref-Dragga+Voss:2001)).

Comments from peers

-   Put quote in critique or to side of graph
-   make a graph out of the left text
-   try gray for lines and and try removing gridlines / border
-   label some other lines
-   image of particulate matter

D5 redesign a graphical lie
---------------------------

**The original deceptive graph**

The original image is included in the portfolio: Yes

Explain the visual-rhetoric features of the graph that make it deceptive:

-   It panders to a specific political audience
-   It limits the data shown to one political party and one voting pattern in order to fit it's agenda.
-   It suggestions a correlation (between money donated and voting yes) where there is none.
-   There is no comparison, just raw numbers and an ideological implication.

Comments from peers

-   Are there additional deceptive practices that have not been mentioned?
-   Other comments
-   etc

**The redesigned graph**

State the number of observations: 100

Identify the variables:

Variable name: Donation Amount - type: Quantitative, discrete

variable name: Party

-   type: Categorical, nominal
-   levels (if categorical): 3

variable name: Vote

-   type: Categorical, nominal
-   levels (if categorical): 2

State the graph type:

Explain why the graph type is suited to the data structure:

-   I want to compare one quantitative variable across multiple categories, which is what a dot plot is made for.
-   100 observations is small enought that a box and whisker plot might obscure more than it would clarify.

Explain each design choice and cite its supporting reference

-   I jittered the data and made them translucent so that they can all be seen. (Robbins, [2013](#ref-Robbins:2013a))
-   I directly labeled the points so the viewer doesn't need to memorize a legend (Wainer, [2014](#ref-Wainer:2014))
-   I colored the data by convention, to match what a viewer would expect.
-   I included all the data from the vote, to provide context (Wainer, [2000](#ref-Wainer:2000:Ch.1))

Comments from peers

-   Does the data structure satisfy the portfolio display requirements?
-   From the Doumont paper, what type of story is being told?
-   Is the graph type suited to the data structure?
-   Other suggestion
-   etc

D6 multivariate
---------------

State the number of observations:

List the variables:

-   quantitative var 1
-   quantitative var 2
-   etc
-   categorical var 1 and its levels
-   categorical var 1 and its levels
-   etc

State the graph type: strip plot

Explain why the graph type is suited to the data structure:

-   point 1
-   point 2
-   etc

Explain each design choice and cite its supporting reference

-   choice, reference
-   choice, reference
-   etc

(Doumont, [2009](#ref-Doumont:2009)) (Robbins, [2013](#ref-Robbins:2013a)) (Wainer, [2014](#ref-Wainer:2014)) (Knaflic, [2013](#ref-Knaflic:2013-09)) (Wainer, [2000](#ref-Wainer:2000:Ch.1))

Comments from peers

-   Does the data structure satisfy the portfolio display requirements?
-   From the Doumont paper, what type of story is being told?
-   Is the graph type suited to the data structure?
-   Other suggestion
-   etc

D7 self-taught
--------------

State the number of observations:

List the variables:

-   quantitative var 1
-   quantitative var 2
-   etc
-   categorical var 1 and its levels
-   categorical var 1 and its levels
-   etc

State the graph type:

Explain why the graph type is suited to the data structure:

-   point 1
-   point 2
-   etc

Explain each design choice and cite its supporting reference

-   choice, reference
-   choice, reference
-   etc

Comments from peers

-   Does the data structure satisfy the portfolio display requirements?
-   From the Doumont paper, what type of story is being told?
-   Is the graph type suited to the data structure?
-   Other suggestion
-   etc

References
==========

Doumont J-l (2009) Designing the graph. *Trees, maps, and theorems: Effective communication for rational minds*. Principiae, Kraainem, Belgium, 133–143 <http://www.treesmapsandtheorems.com/>

Dragga S and Voss D (2001) Cruel pies: The inhumanity of technical illustrations. *Technical Communication* **48**(3), 265–274

Knaflic CN (2013) Logic in order. <http://tinyurl.com/yxf8gspl>

Robbins N (2013) General principles for creating effective graphs. *Creating More Effective Graphs*. Chart House, Wayne, NJ, 154–225 <http://www.nbr-graphs.com/resources/recommended-books/>

Wainer H (2000) Graphical failures: How to display data badly. *Visual revelations: Graphical tales of fate and deception from Napoleon Bonaparte To Ross Perot*. Psychology Press, Mahwah, NJ, 11–40

Wainer H (2014) Fifteen displays about one thing. *Medical illuminations: Using evidence, visualization, and statistical thinking to improve healthcare*. Oxford University Press, Oxford, UK, 32–49
