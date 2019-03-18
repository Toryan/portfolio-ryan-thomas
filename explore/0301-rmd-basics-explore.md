Test report
================

Author Name
2019-03-18

Introduction
------------

This display illustrates the distribution of speeds attained by skiers in three downhill events in the 2012 Olympic Winter Games disaggregated by sex.

Requirements
------------

This display meets the data requirements for D1 distributions

-   250 observations
-   One quantitative variable (speed)
-   Two categorical variables: sex (2 levels) and event (3 levels)

This display also meets the following document requirements

-   sports data limit (this display is one of two)

<!-- -->

    ## -- Attaching packages ---------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.1.0       v purrr   0.3.1  
    ## v tibble  2.0.1       v dplyr   0.8.0.1
    ## v tidyr   0.8.3       v stringr 1.4.0  
    ## v readr   1.3.1       v forcats 0.4.0

    ## -- Conflicts ------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    ## Observations: 87
    ## Variables: 13
    ## $ name       <chr> "Luke Skywalker", "C-3PO", "R2-D2", "Darth Vader", ...
    ## $ height     <int> 172, 167, 96, 202, 150, 178, 165, 97, 183, 182, 188...
    ## $ mass       <dbl> 77.0, 75.0, 32.0, 136.0, 49.0, 120.0, 75.0, 32.0, 8...
    ## $ hair_color <chr> "blond", NA, NA, "none", "brown", "brown, grey", "b...
    ## $ skin_color <chr> "fair", "gold", "white, blue", "white", "light", "l...
    ## $ eye_color  <chr> "blue", "yellow", "red", "yellow", "brown", "blue",...
    ## $ birth_year <dbl> 19.0, 112.0, 33.0, 41.9, 19.0, 52.0, 47.0, NA, 24.0...
    ## $ gender     <chr> "male", NA, NA, "male", "female", "male", "female",...
    ## $ homeworld  <chr> "Tatooine", "Tatooine", "Naboo", "Tatooine", "Alder...
    ## $ species    <chr> "Human", "Droid", "Droid", "Human", "Human", "Human...
    ## $ films      <list> [<"Revenge of the Sith", "Return of the Jedi", "Th...
    ## $ vehicles   <list> [<"Snowspeeder", "Imperial Speeder Bike">, <>, <>,...
    ## $ starships  <list> [<"X-wing", "Imperial shuttle">, <>, <>, "TIE Adva...
