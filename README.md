
<!-- README.md is generated from README.Rmd. Please edit that file -->

# IberianFishHSMs

<!-- badges: start -->
<!-- badges: end -->

IberianFishHSMs: Compilation of models and tools to evaluate the habitat
suitability at the microhabitat scale for Iberian freshwater fish
species. The modelling approaches include sets of Habitat Suitability
Curves (HSCs), Artificial Neural Networks (Multilayer Perceptrons,
ANN-MLPs), Random Forests (RFs), Generalised Additive Models (GAMs), and
Support Vector Machines (SVMs), all based on empirical data collected
across several river basins in the Iberian Peninsula. The HSCs have been
reviewed by an expert panel which coauthored the package. The package
also compiles sets of HSCs and Fuzzy Rule-Based Systems (FRBSs) based on
expert knowledge, which was gathered through online forms. Functions for
evaluating habitat suitability from hydraulic simulations and for
plotting the modelled suitability are also included. An thorough example
of the capabilitites of the packages appears below.

## Installation

You can install the development version of IberianFishHSMs from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("RafaMMas/IberianFishHSMs")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(IberianFishHSMs)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
