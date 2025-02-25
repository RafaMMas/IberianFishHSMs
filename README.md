
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

IberianFishHSMs can be installed from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("RafaMMas/IberianFishHSMs")
```

## Example

IberianFishHSMs includes some examples to ilustrate the capabilities of
the package and the general workflow to predict the habitat suitability
from the outputs of hydraulic simulations and field surveys to colect
data on substrate and cover (shelter) distribution across the study
site.

``` r
library(IberianFishHSMs)
## basic example code
```

`ListModels` allows inpecting the vailable models. The queries can be
categorized by Species, Size, River, Model.type, Sampled.season,
Valid.season, and/or Data.origin. This function also provides de Codes
to internally call the habitat suitability models during the habitat
evaluation. The output of this function also renders a summary of their
main characteristics, including sample sizes, and serveal perfomrance
criteria.

``` r
ListModels(Species = "Salmo trutta")
#>      Code                                Model           River River.short
#> 603 ABELZ   Salmo.trutta.GAM.Large.Curueno.All Curueño (Douro)     Curueno
#> 604 ABEMQ   Salmo.trutta.HSC.Large.Curueno.All Curueño (Douro)     Curueno
#> 605 ABEMV  Salmo.trutta.NNET.Large.Curueno.All Curueño (Douro)     Curueno
#> 606 ABEMZ    Salmo.trutta.RF.Large.Curueno.All Curueño (Douro)     Curueno
#> 607 ABENR   Salmo.trutta.SVM.Large.Curueno.All Curueño (Douro)     Curueno
#> 608 ABEMN  Salmo.trutta.GAM.Medium.Curueno.All Curueño (Douro)     Curueno
#> 609 ABEMR  Salmo.trutta.HSC.Medium.Curueno.All Curueño (Douro)     Curueno
#> 610 ABEMW Salmo.trutta.NNET.Medium.Curueno.All Curueño (Douro)     Curueno
#> 611 ABENO   Salmo.trutta.RF.Medium.Curueno.All Curueño (Douro)     Curueno
#> 612 ABENS  Salmo.trutta.SVM.Medium.Curueno.All Curueño (Douro)     Curueno
#> 613 ABEMO   Salmo.trutta.GAM.Small.Curueno.All Curueño (Douro)     Curueno
#> 614 ABEMS   Salmo.trutta.HSC.Small.Curueno.All Curueño (Douro)     Curueno
#> 615 ABEMX  Salmo.trutta.NNET.Small.Curueno.All Curueño (Douro)     Curueno
#> 616 ABENP    Salmo.trutta.RF.Small.Curueno.All Curueño (Douro)     Curueno
#> 617 ABENT   Salmo.trutta.SVM.Small.Curueno.All Curueño (Douro)     Curueno
#>     Model.type Default      Species   Size Sampled.season
#> 603        GAM    TRUE Salmo trutta  Large         Summer
#> 604        HSC    TRUE Salmo trutta  Large         Summer
#> 605       NNET    TRUE Salmo trutta  Large         Summer
#> 606         RF    TRUE Salmo trutta  Large         Summer
#> 607        SVM    TRUE Salmo trutta  Large         Summer
#> 608        GAM    TRUE Salmo trutta Medium         Summer
#> 609        HSC    TRUE Salmo trutta Medium         Summer
#> 610       NNET    TRUE Salmo trutta Medium         Summer
#> 611         RF    TRUE Salmo trutta Medium         Summer
#> 612        SVM    TRUE Salmo trutta Medium         Summer
#> 613        GAM    TRUE Salmo trutta  Small         Summer
#> 614        HSC    TRUE Salmo trutta  Small         Summer
#> 615       NNET    TRUE Salmo trutta  Small         Summer
#> 616         RF    TRUE Salmo trutta  Small         Summer
#> 617        SVM    TRUE Salmo trutta  Small         Summer
#>                       Valid.season Valid.seasons.short  Data.origin N.presences
#> 603 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 604 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 605 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 606 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 607 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 608 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 609 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 610 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 611 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 612 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 613 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 614 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 615 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 616 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 617 Winter; Spring; Summer; Autumn                 All Field survey         385
#>     N.absences N.interviews.or.studies True.positive False.positive
#> 603        896                      NA            24            215
#> 604        896                      NA            NA             NA
#> 605        896                      NA            24            106
#> 606        896                      NA            24            106
#> 607        896                      NA            22            157
#> 608        839                      NA            70            218
#> 609        839                      NA            NA             NA
#> 610        839                      NA            75            197
#> 611        839                      NA            75            197
#> 612        839                      NA            68            200
#> 613        535                      NA           275            210
#> 614        535                      NA            NA             NA
#> 615        535                      NA           286            211
#> 616        535                      NA           286            211
#> 617        535                      NA           262            179
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 603           681              0       1.000       0.760 0.760
#> 604            NA             NA          NA          NA    NA
#> 605           790              0       1.000       0.882 0.882
#> 606           790              0       1.000       0.882 0.882
#> 607           739              2       0.917       0.825 0.741
#> 608           621             11       0.864       0.740 0.604
#> 609            NA             NA          NA          NA    NA
#> 610           642              6       0.926       0.765 0.691
#> 611           642              6       0.926       0.765 0.691
#> 612           639             13       0.840       0.762 0.601
#> 613           325            110       0.714       0.607 0.322
#> 614            NA             NA          NA          NA    NA
#> 615           324             99       0.743       0.606 0.348
#> 616           324             99       0.743       0.606 0.348
#> 617           356            123       0.681       0.665 0.346
#>     Balanced.accuracy
#> 603             0.880
#> 604                NA
#> 605             0.941
#> 606             0.941
#> 607             0.871
#> 608             0.802
#> 609                NA
#> 610             0.846
#> 611             0.846
#> 612             0.801
#> 613             0.661
#> 614                NA
#> 615             0.674
#> 616             0.674
#> 617             0.673
#> $Current.summary.table
#>      Code                                Model           River River.short
#> 603 ABELZ   Salmo.trutta.GAM.Large.Curueno.All Curueño (Douro)     Curueno
#> 604 ABEMQ   Salmo.trutta.HSC.Large.Curueno.All Curueño (Douro)     Curueno
#> 605 ABEMV  Salmo.trutta.NNET.Large.Curueno.All Curueño (Douro)     Curueno
#> 606 ABEMZ    Salmo.trutta.RF.Large.Curueno.All Curueño (Douro)     Curueno
#> 607 ABENR   Salmo.trutta.SVM.Large.Curueno.All Curueño (Douro)     Curueno
#> 608 ABEMN  Salmo.trutta.GAM.Medium.Curueno.All Curueño (Douro)     Curueno
#> 609 ABEMR  Salmo.trutta.HSC.Medium.Curueno.All Curueño (Douro)     Curueno
#> 610 ABEMW Salmo.trutta.NNET.Medium.Curueno.All Curueño (Douro)     Curueno
#> 611 ABENO   Salmo.trutta.RF.Medium.Curueno.All Curueño (Douro)     Curueno
#> 612 ABENS  Salmo.trutta.SVM.Medium.Curueno.All Curueño (Douro)     Curueno
#> 613 ABEMO   Salmo.trutta.GAM.Small.Curueno.All Curueño (Douro)     Curueno
#> 614 ABEMS   Salmo.trutta.HSC.Small.Curueno.All Curueño (Douro)     Curueno
#> 615 ABEMX  Salmo.trutta.NNET.Small.Curueno.All Curueño (Douro)     Curueno
#> 616 ABENP    Salmo.trutta.RF.Small.Curueno.All Curueño (Douro)     Curueno
#> 617 ABENT   Salmo.trutta.SVM.Small.Curueno.All Curueño (Douro)     Curueno
#>     Model.type Default      Species   Size Sampled.season
#> 603        GAM    TRUE Salmo trutta  Large         Summer
#> 604        HSC    TRUE Salmo trutta  Large         Summer
#> 605       NNET    TRUE Salmo trutta  Large         Summer
#> 606         RF    TRUE Salmo trutta  Large         Summer
#> 607        SVM    TRUE Salmo trutta  Large         Summer
#> 608        GAM    TRUE Salmo trutta Medium         Summer
#> 609        HSC    TRUE Salmo trutta Medium         Summer
#> 610       NNET    TRUE Salmo trutta Medium         Summer
#> 611         RF    TRUE Salmo trutta Medium         Summer
#> 612        SVM    TRUE Salmo trutta Medium         Summer
#> 613        GAM    TRUE Salmo trutta  Small         Summer
#> 614        HSC    TRUE Salmo trutta  Small         Summer
#> 615       NNET    TRUE Salmo trutta  Small         Summer
#> 616         RF    TRUE Salmo trutta  Small         Summer
#> 617        SVM    TRUE Salmo trutta  Small         Summer
#>                       Valid.season Valid.seasons.short  Data.origin N.presences
#> 603 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 604 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 605 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 606 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 607 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 608 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 609 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 610 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 611 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 612 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 613 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 614 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 615 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 616 Winter; Spring; Summer; Autumn                 All Field survey         385
#> 617 Winter; Spring; Summer; Autumn                 All Field survey         385
#>     N.absences N.interviews.or.studies True.positive False.positive
#> 603        896                      NA            24            215
#> 604        896                      NA            NA             NA
#> 605        896                      NA            24            106
#> 606        896                      NA            24            106
#> 607        896                      NA            22            157
#> 608        839                      NA            70            218
#> 609        839                      NA            NA             NA
#> 610        839                      NA            75            197
#> 611        839                      NA            75            197
#> 612        839                      NA            68            200
#> 613        535                      NA           275            210
#> 614        535                      NA            NA             NA
#> 615        535                      NA           286            211
#> 616        535                      NA           286            211
#> 617        535                      NA           262            179
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 603           681              0       1.000       0.760 0.760
#> 604            NA             NA          NA          NA    NA
#> 605           790              0       1.000       0.882 0.882
#> 606           790              0       1.000       0.882 0.882
#> 607           739              2       0.917       0.825 0.741
#> 608           621             11       0.864       0.740 0.604
#> 609            NA             NA          NA          NA    NA
#> 610           642              6       0.926       0.765 0.691
#> 611           642              6       0.926       0.765 0.691
#> 612           639             13       0.840       0.762 0.601
#> 613           325            110       0.714       0.607 0.322
#> 614            NA             NA          NA          NA    NA
#> 615           324             99       0.743       0.606 0.348
#> 616           324             99       0.743       0.606 0.348
#> 617           356            123       0.681       0.665 0.346
#>     Balanced.accuracy
#> 603             0.880
#> 604                NA
#> 605             0.941
#> 606             0.941
#> 607             0.871
#> 608             0.802
#> 609                NA
#> 610             0.846
#> 611             0.846
#> 612             0.801
#> 613             0.661
#> 614                NA
#> 615             0.674
#> 616             0.674
#> 617             0.673
#> 
#> $Models
#>  [1] "Salmo.trutta.GAM.Large.Curueno.All"  
#>  [2] "Salmo.trutta.HSC.Large.Curueno.All"  
#>  [3] "Salmo.trutta.NNET.Large.Curueno.All" 
#>  [4] "Salmo.trutta.RF.Large.Curueno.All"   
#>  [5] "Salmo.trutta.SVM.Large.Curueno.All"  
#>  [6] "Salmo.trutta.GAM.Medium.Curueno.All" 
#>  [7] "Salmo.trutta.HSC.Medium.Curueno.All" 
#>  [8] "Salmo.trutta.NNET.Medium.Curueno.All"
#>  [9] "Salmo.trutta.RF.Medium.Curueno.All"  
#> [10] "Salmo.trutta.SVM.Medium.Curueno.All" 
#> [11] "Salmo.trutta.GAM.Small.Curueno.All"  
#> [12] "Salmo.trutta.HSC.Small.Curueno.All"  
#> [13] "Salmo.trutta.NNET.Small.Curueno.All" 
#> [14] "Salmo.trutta.RF.Small.Curueno.All"   
#> [15] "Salmo.trutta.SVM.Small.Curueno.All"  
#> 
#> $Codes
#>  [1] "ABELZ" "ABEMQ" "ABEMV" "ABEMZ" "ABENR" "ABEMN" "ABEMR" "ABEMW" "ABENO"
#> [10] "ABENS" "ABEMO" "ABEMS" "ABEMX" "ABENP" "ABENT"
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
