
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
reviewed by an expert panel, which coauthored the package. The package
also compiles sets of HSCs and Fuzzy Rule-Based Systems (FRBSs) based on
expert knowledge, which was gathered through online forms. Functions for
evaluating habitat suitability from hydraulic simulations and for
plotting the modelled suitability are also included. An thorough example
of the capabilitites of the packages appears below. The package includes
797 habitat suitability models for 43 species and up to 4 size classes
(Large, Medium, Small, Very small) and spawning (for *Salmo trutta* and
*Salmo salar*).

<br/>

## Authors

This package was developed by:

- **Rafael Muñoz-Mas** (Author, Creator and Maintainer) -
  <rafa.m.mas@gmail.com>
- **Carlos Alonso** (Contributor)
- **Enric Aparicio Manau** (Contributor)
- **Fernando Cobo Gradín** (Contributor)
- **Gustavo González Fernández** (Contributor)
- **Javier Gortázar** (Contributor)
- **Francisco Martínez-Capel** (Contributor)
- **Francisco J. Oliva-Paterna** (Contributor)
- **Jose Prenda** (Contributor)
- **Jose Maria Santos** (Contributor)
- **Rafael Miranda Ferreiro** (Contributor)

<br/>

## Installation

IberianFishHSMs can be installed from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("RafaMMas/IberianFishHSMs")
```

<br/>

## Example

IberianFishHSMs includes examples that illustrate the package’s
capabilities and the general workflow for predicting habitat suitability
using outputs from hydraulic simulations and field data. Fiel data
includes the substrate and cover (shelter) distribution across the study
site, by pattch, pixel or cell.

``` r
library(IberianFishHSMs)
```

<br/>

### ListModels - List available models and their key characteristics.

`ListModels` allows inpecting the available models. The queries can be
categorized by Species, Size, River, Model.type, Sampled.season,
Valid.season, and/or Data.origin. This function also provides de Codes
to internally call the habitat suitability models during the habitat
evaluation. The output of this function also renders a summary of their
main characteristics, including sample sizes, and serveal perfomrance
criteria.

``` r
ListModels(Species = "Salmo trutta", verbose = F)
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

There exist an interaction between the training data and the modelling
technique, which can vary variable effects and importance (Eugster,
Leisch, and Strobl 2014). By means of cross-validation, during the
development of the habitat suitbility models we carried out a variable
selection approach discarding those cover types that not improved model
performance. This approach lead to a different sets of relevant cover
types in each model. The function `ListSelectedCoverTypes` allows
inspecting the selcted cover types for each model. The queries can be
categorized by Species, Size, River, Model.type, Sampled.season,
Valid.season, and/or Data.origin. When evaluating the habitat
suitability `PredictHabitatSuitability` selects and aggregates the
appropriate cover types internally and this functions does not need to
be called.

``` r

ListSelectedCoverTypes(Species = "Salmo trutta")
#>      Code                                Model Leaves Algae  Root
#> 603 ABELZ   Salmo.trutta.GAM.Large.Curueno.All   TRUE FALSE  TRUE
#> 604 ABEMQ   Salmo.trutta.HSC.Large.Curueno.All  FALSE FALSE  TRUE
#> 605 ABEMV  Salmo.trutta.NNET.Large.Curueno.All   TRUE FALSE  TRUE
#> 606 ABEMZ    Salmo.trutta.RF.Large.Curueno.All  FALSE FALSE  TRUE
#> 607 ABENR   Salmo.trutta.SVM.Large.Curueno.All   TRUE FALSE  TRUE
#> 608 ABEMN  Salmo.trutta.GAM.Medium.Curueno.All   TRUE FALSE FALSE
#> 609 ABEMR  Salmo.trutta.HSC.Medium.Curueno.All  FALSE FALSE  TRUE
#> 610 ABEMW Salmo.trutta.NNET.Medium.Curueno.All  FALSE FALSE FALSE
#> 611 ABENO   Salmo.trutta.RF.Medium.Curueno.All  FALSE FALSE FALSE
#> 612 ABENS  Salmo.trutta.SVM.Medium.Curueno.All  FALSE  TRUE FALSE
#> 613 ABEMO   Salmo.trutta.GAM.Small.Curueno.All  FALSE FALSE FALSE
#> 614 ABEMS   Salmo.trutta.HSC.Small.Curueno.All  FALSE FALSE  TRUE
#> 615 ABEMX  Salmo.trutta.NNET.Small.Curueno.All  FALSE FALSE  TRUE
#> 616 ABENP    Salmo.trutta.RF.Small.Curueno.All   TRUE FALSE  TRUE
#> 617 ABENT   Salmo.trutta.SVM.Small.Curueno.All   TRUE  TRUE FALSE
#>     Aquatic.vegetation  Reed  Wood  Sand  Rock  Cave Shade
#> 603               TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE
#> 604               TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
#> 605               TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
#> 606               TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
#> 607              FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
#> 608               TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
#> 609               TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
#> 610               TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE
#> 611              FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE
#> 612              FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
#> 613               TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
#> 614               TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE
#> 615               TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE
#> 616               TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
#> 617              FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
```

<br/>

### Sensitivity analysis

The package includes a number of models (i.e., 797) and species (i.e.,
43) several size classes and activities. Among other things, the
available models vary by modelling technique, sampling site and the
aggregation of data from different sites. The variable `Default`
indicates which models are recommended becuase it was considered they
generalised better but users can select other models when they consider
it adequate. For example, when they are going to evalaute the habitat
suitability in the basin where data for an alternative models was
colected. In adiition to `ListSelectedCoverTypes`, users can carry out
sensitivity analyses to compare the predictions of the different
alternatives before selecting any particular set of models. The
sensitivity analysis can be carried out employing function
`Plot Habitat Suitability Models` as follows:

``` r

## Pseudochondrostoma.polylepis, large, FRBS for Spring, Summer, and Autumn

(Selected.model <- ListModels(Species = "Pseudochondrostoma polylepis", verbose = FALSE)$Codes[1])
#> [1] "ABEIO"

PlotHabitatSuitabilityModels(Selected.model = Selected.model, Quantiles = TRUE)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

**Figure 1** - Sensitivity analysis (i.e., partial dependence plots) for
*Pseudochondrostoma polylepis* large. The figure shows the results for
for the Fuzzy Rule-Based System to evaluate the microhabitat suitability
during Spring, Summer, and Autumn.

<br/>

### Habitat suitability prediction

Habitat suitability predictions are carried out based on mean flow
velocity (m/s), water depth (m) substrate index (-) and the sum of the
number of relevant types of cover in the evaluate microhabitats
(i.e. pixels or cells from the hydraulic simulation). The package
includes functions to prepare the input data.

``` r
data("Velocity.example.df")
data("Depth.example.df")
data("Substrate.index.example.df")
data("Cover.example.df")

summary(Velocity.example.df)
#>        x                y           Velocity.0.05      Velocity.0.1     
#>  Min.   :732536   Min.   :4302306   Min.   :0.00000   Min.   :0.000000  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0.00000   1st Qu.:0.000000  
#>  Median :732614   Median :4302560   Median :0.00000   Median :0.000000  
#>  Mean   :732615   Mean   :4302545   Mean   :0.00439   Mean   :0.009547  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0.00480   3rd Qu.:0.010900  
#>  Max.   :732686   Max.   :4302710   Max.   :0.15973   Max.   :0.235300  
#>   Velocity.0.2      Velocity.0.3      Velocity.0.4        Velocity.0.5      
#>  Min.   :0.00000   Min.   :0.00000   Min.   :0.0000000   Min.   :0.0000000  
#>  1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.0000000   1st Qu.:0.0000000  
#>  Median :0.00000   Median :0.00020   Median :0.0005417   Median :0.0009875  
#>  Mean   :0.02132   Mean   :0.03182   Mean   :0.0409337   Mean   :0.0490286  
#>  3rd Qu.:0.02330   3rd Qu.:0.03495   3rd Qu.:0.0456458   3rd Qu.:0.0570938  
#>  Max.   :0.46400   Max.   :1.10900   Max.   :0.9499000   Max.   :0.9249000  
#>   Velocity.0.6       Velocity.0.7       Velocity.0.8       Velocity.0.9     
#>  Min.   :0.000000   Min.   :0.000000   Min.   :0.000000   Min.   :0.000000  
#>  1st Qu.:0.000000   1st Qu.:0.000000   1st Qu.:0.000000   1st Qu.:0.000000  
#>  Median :0.001829   Median :0.002842   Median :0.004575   Median :0.006317  
#>  Mean   :0.056653   Mean   :0.063327   Mean   :0.069818   Mean   :0.076080  
#>  3rd Qu.:0.067975   3rd Qu.:0.078525   3rd Qu.:0.088050   3rd Qu.:0.098337  
#>  Max.   :1.129450   Max.   :1.108475   Max.   :1.126450   Max.   :1.150800  
#>    Velocity.1        Velocity.1.1      Velocity.1.2      Velocity.1.3    
#>  Min.   :0.000000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000  
#>  1st Qu.:0.000000   1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000  
#>  Median :0.008683   Median :0.01137   Median :0.01483   Median :0.01817  
#>  Mean   :0.082039   Mean   :0.08771   Mean   :0.09346   Mean   :0.09886  
#>  3rd Qu.:0.107563   3rd Qu.:0.11629   3rd Qu.:0.12534   3rd Qu.:0.13383  
#>  Max.   :1.172300   Max.   :1.19100   Max.   :1.20873   Max.   :1.22618  
#>   Velocity.1.4      Velocity.1.5      Velocity.1.6      Velocity.1.7    
#>  Min.   :0.00000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000  
#>  1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000  
#>  Median :0.02123   Median :0.02622   Median :0.03292   Median :0.03658  
#>  Mean   :0.10394   Mean   :0.10918   Mean   :0.11446   Mean   :0.11946  
#>  3rd Qu.:0.14185   3rd Qu.:0.15036   3rd Qu.:0.15794   3rd Qu.:0.16599  
#>  Max.   :1.24295   Max.   :1.25937   Max.   :1.26780   Max.   :1.28395  
#>   Velocity.1.8      Velocity.1.9       Velocity.2       Velocity.2.1    
#>  Min.   :0.00000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000  
#>  1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000  
#>  Median :0.04162   Median :0.04521   Median :0.04945   Median :0.05523  
#>  Mean   :0.12415   Mean   :0.12914   Mean   :0.13384   Mean   :0.13813  
#>  3rd Qu.:0.17359   3rd Qu.:0.18294   3rd Qu.:0.19030   3rd Qu.:0.19733  
#>  Max.   :1.29995   Max.   :1.31590   Max.   :1.33078   Max.   :1.34385  
#>   Velocity.2.2      Velocity.2.3      Velocity.2.4      Velocity.2.5    
#>  Min.   :0.00000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000  
#>  1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000   1st Qu.:0.00000  
#>  Median :0.06072   Median :0.06641   Median :0.07333   Median :0.07972  
#>  Mean   :0.14257   Mean   :0.14741   Mean   :0.15204   Mean   :0.15641  
#>  3rd Qu.:0.20422   3rd Qu.:0.21264   3rd Qu.:0.21995   3rd Qu.:0.22650  
#>  Max.   :1.35532   Max.   :1.36563   Max.   :1.37525   Max.   :1.38437  
#>   Velocity.2.6      Velocity.2.7     Velocity.2.8      Velocity.2.9   
#>  Min.   :0.00000   Min.   :0.0000   Min.   :0.00000   Min.   :0.0000  
#>  1st Qu.:0.00000   1st Qu.:0.0000   1st Qu.:0.00000   1st Qu.:0.0000  
#>  Median :0.08704   Median :0.0912   Median :0.09732   Median :0.1032  
#>  Mean   :0.16067   Mean   :0.1650   Mean   :0.16927   Mean   :0.1733  
#>  3rd Qu.:0.23405   3rd Qu.:0.2421   3rd Qu.:0.24957   3rd Qu.:0.2559  
#>  Max.   :1.39285   Max.   :1.4009   Max.   :1.40843   Max.   :1.4154  
#>    Velocity.3       Velocity.5       Velocity.7       Velocity.9     
#>  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.00000  
#>  1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0032   1st Qu.:0.01614  
#>  Median :0.1080   Median :0.1949   Median :0.2735   Median :0.34360  
#>  Mean   :0.1775   Mean   :0.2504   Mean   :0.3125   Mean   :0.36909  
#>  3rd Qu.:0.2629   3rd Qu.:0.3878   3rd Qu.:0.4968   3rd Qu.:0.59137  
#>  Max.   :1.4217   Max.   :1.4897   Max.   :1.5100   Max.   :1.55310  
#>   Velocity.11       Velocity.13       Velocity.15      Velocity.17    
#>  Min.   :0.00000   Min.   :0.00000   Min.   :0.0000   Min.   :0.0000  
#>  1st Qu.:0.03517   1st Qu.:0.06429   1st Qu.:0.1017   1st Qu.:0.1398  
#>  Median :0.40469   Median :0.46118   Median :0.5171   Median :0.5676  
#>  Mean   :0.42151   Mean   :0.46931   Mean   :0.5156   Mean   :0.5597  
#>  3rd Qu.:0.67469   3rd Qu.:0.75199   3rd Qu.:0.8214   3rd Qu.:0.8857  
#>  Max.   :1.79490   Max.   :1.64750   Max.   :1.6997   Max.   :1.7449  
#>   Velocity.19      Velocity.21    
#>  Min.   :0.0000   Min.   :0.0000  
#>  1st Qu.:0.1717   1st Qu.:0.2085  
#>  Median :0.6102   Median :0.6633  
#>  Mean   :0.6002   Mean   :0.6423  
#>  3rd Qu.:0.9499   3rd Qu.:1.0084  
#>  Max.   :1.7885   Max.   :1.8313
summary(Depth.example.df)
#>        x                y             Depth.0.05       Depth.0.1     
#>  Min.   :732536   Min.   :4302306   Min.   :0.0001   Min.   :0.0001  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0.1022   1st Qu.:0.0986  
#>  Median :732614   Median :4302560   Median :0.2598   Median :0.2629  
#>  Mean   :732615   Mean   :4302545   Mean   :0.3001   Mean   :0.3008  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0.4631   3rd Qu.:0.4587  
#>  Max.   :732686   Max.   :4302710   Max.   :1.2471   Max.   :1.2837  
#>                                     NA's   :1917     NA's   :1712    
#>    Depth.0.2        Depth.0.3        Depth.0.4        Depth.0.5     
#>  Min.   :0.0002   Min.   :0.0002   Min.   :0.0000   Min.   :0.0001  
#>  1st Qu.:0.1005   1st Qu.:0.1087   1st Qu.:0.1217   1st Qu.:0.1349  
#>  Median :0.2808   Median :0.2960   Median :0.3078   Median :0.3239  
#>  Mean   :0.3147   Mean   :0.3321   Mean   :0.3469   Mean   :0.3607  
#>  3rd Qu.:0.4729   3rd Qu.:0.4987   3rd Qu.:0.5166   3rd Qu.:0.5362  
#>  Max.   :1.3332   Max.   :1.3676   Max.   :1.3948   Max.   :1.4174  
#>  NA's   :1548     NA's   :1482     NA's   :1437     NA's   :1407    
#>    Depth.0.6        Depth.0.7        Depth.0.8        Depth.0.9     
#>  Min.   :0.0001   Min.   :0.0000   Min.   :0.0001   Min.   :0.0001  
#>  1st Qu.:0.1425   1st Qu.:0.1497   1st Qu.:0.1542   1st Qu.:0.1592  
#>  Median :0.3365   Median :0.3486   Median :0.3584   Median :0.3685  
#>  Mean   :0.3718   Mean   :0.3825   Mean   :0.3911   Mean   :0.3985  
#>  3rd Qu.:0.5500   3rd Qu.:0.5625   3rd Qu.:0.5733   3rd Qu.:0.5860  
#>  Max.   :1.4380   Max.   :1.4566   Max.   :1.4733   Max.   :1.4890  
#>  NA's   :1374     NA's   :1349     NA's   :1322     NA's   :1295    
#>     Depth.1         Depth.1.1        Depth.1.2        Depth.1.3     
#>  Min.   :0.0005   Min.   :0.0004   Min.   :0.0001   Min.   :0.0002  
#>  1st Qu.:0.1645   1st Qu.:0.1697   1st Qu.:0.1744   1st Qu.:0.1818  
#>  Median :0.3774   Median :0.3838   Median :0.3926   Median :0.4007  
#>  Mean   :0.4057   Mean   :0.4130   Mean   :0.4207   Mean   :0.4279  
#>  3rd Qu.:0.5975   3rd Qu.:0.6048   3rd Qu.:0.6130   3rd Qu.:0.6231  
#>  Max.   :1.5037   Max.   :1.5174   Max.   :1.5301   Max.   :1.5427  
#>  NA's   :1271     NA's   :1252     NA's   :1238     NA's   :1223    
#>    Depth.1.4        Depth.1.5        Depth.1.6        Depth.1.7     
#>  Min.   :0.0000   Min.   :0.0001   Min.   :0.0001   Min.   :0.0004  
#>  1st Qu.:0.1850   1st Qu.:0.1886   1st Qu.:0.1887   1st Qu.:0.1938  
#>  Median :0.4060   Median :0.4115   Median :0.4157   Median :0.4235  
#>  Mean   :0.4328   Mean   :0.4378   Mean   :0.4403   Mean   :0.4467  
#>  3rd Qu.:0.6306   3rd Qu.:0.6380   3rd Qu.:0.6431   3rd Qu.:0.6500  
#>  Max.   :1.5545   Max.   :1.5653   Max.   :1.5768   Max.   :1.5865  
#>  NA's   :1201     NA's   :1182     NA's   :1149     NA's   :1140    
#>    Depth.1.8        Depth.1.9         Depth.2         Depth.2.1     
#>  Min.   :0.0004   Min.   :0.0001   Min.   :0.0000   Min.   :0.0001  
#>  1st Qu.:0.1958   1st Qu.:0.2003   1st Qu.:0.1988   1st Qu.:0.2009  
#>  Median :0.4306   Median :0.4374   Median :0.4422   Median :0.4473  
#>  Mean   :0.4520   Mean   :0.4561   Mean   :0.4600   Mean   :0.4643  
#>  3rd Qu.:0.6585   3rd Qu.:0.6645   3rd Qu.:0.6720   3rd Qu.:0.6790  
#>  Max.   :1.5970   Max.   :1.6067   Max.   :1.6164   Max.   :1.6258  
#>  NA's   :1125     NA's   :1107     NA's   :1089     NA's   :1073    
#>    Depth.2.2        Depth.2.3        Depth.2.4        Depth.2.5     
#>  Min.   :0.0003   Min.   :0.0000   Min.   :0.0000   Min.   :0.0001  
#>  1st Qu.:0.2057   1st Qu.:0.2057   1st Qu.:0.2047   1st Qu.:0.2073  
#>  Median :0.4518   Median :0.4568   Median :0.4584   Median :0.4606  
#>  Mean   :0.4684   Mean   :0.4723   Mean   :0.4747   Mean   :0.4782  
#>  3rd Qu.:0.6850   3rd Qu.:0.6909   3rd Qu.:0.6949   3rd Qu.:0.7010  
#>  Max.   :1.6345   Max.   :1.6432   Max.   :1.6518   Max.   :1.6602  
#>  NA's   :1059     NA's   :1044     NA's   :1023     NA's   :1007    
#>    Depth.2.6        Depth.2.7        Depth.2.8        Depth.2.9     
#>  Min.   :0.0002   Min.   :0.0001   Min.   :0.0001   Min.   :0.0003  
#>  1st Qu.:0.2125   1st Qu.:0.2136   1st Qu.:0.2165   1st Qu.:0.2162  
#>  Median :0.4658   Median :0.4704   Median :0.4740   Median :0.4797  
#>  Mean   :0.4834   Mean   :0.4869   Mean   :0.4909   Mean   :0.4954  
#>  3rd Qu.:0.7081   3rd Qu.:0.7128   3rd Qu.:0.7190   3rd Qu.:0.7257  
#>  Max.   :1.6686   Max.   :1.6763   Max.   :1.6845   Max.   :1.6919  
#>  NA's   :1000     NA's   :987      NA's   :975      NA's   :968     
#>     Depth.3          Depth.5          Depth.7          Depth.9      
#>  Min.   :0.0007   Min.   :0.0004   Min.   :0.0000   Min.   :0.0007  
#>  1st Qu.:0.2207   1st Qu.:0.2477   1st Qu.:0.2692   1st Qu.:0.2971  
#>  Median :0.4859   Median :0.5563   Median :0.6065   Median :0.6490  
#>  Mean   :0.4999   Mean   :0.5594   Mean   :0.6065   Mean   :0.6471  
#>  3rd Qu.:0.7317   3rd Qu.:0.8241   3rd Qu.:0.8959   3rd Qu.:0.9541  
#>  Max.   :1.6994   Max.   :1.8265   Max.   :1.9270   Max.   :2.0114  
#>  NA's   :961      NA's   :769      NA's   :624      NA's   :505     
#>     Depth.11         Depth.13         Depth.15          Depth.17     
#>  Min.   :0.0001   Min.   :0.0008   Min.   :0.00017   Min.   :0.0005  
#>  1st Qu.:0.3157   1st Qu.:0.3330   1st Qu.:0.34998   1st Qu.:0.3639  
#>  Median :0.6896   Median :0.7278   Median :0.76386   Median :0.7847  
#>  Mean   :0.6842   Mean   :0.7169   Mean   :0.74752   Mean   :0.7736  
#>  3rd Qu.:1.0131   3rd Qu.:1.0678   3rd Qu.:1.11799   3rd Qu.:1.1590  
#>  Max.   :2.0861   Max.   :2.1529   Max.   :2.21460   Max.   :2.2719  
#>  NA's   :406      NA's   :317      NA's   :238       NA's   :154     
#>     Depth.19         Depth.21     
#>  Min.   :0.0004   Min.   :0.0003  
#>  1st Qu.:0.3685   1st Qu.:0.3804  
#>  Median :0.8087   Median :0.8290  
#>  Mean   :0.7973   Mean   :0.8210  
#>  3rd Qu.:1.1973   3rd Qu.:1.2297  
#>  Max.   :2.3255   Max.   :2.3757  
#>  NA's   :71
summary(Substrate.index.example.df)
#>        x                y             Vegetation      Silt             Sand  
#>  Min.   :732536   Min.   :4302306   Min.   :0    Min.   :  0.00   Min.   :0  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0    1st Qu.:  0.00   1st Qu.:0  
#>  Median :732614   Median :4302560   Median :0    Median : 15.00   Median :0  
#>  Mean   :732615   Mean   :4302545   Mean   :0    Mean   : 20.59   Mean   :0  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0    3rd Qu.: 50.00   3rd Qu.:0  
#>  Max.   :732686   Max.   :4302710   Max.   :0    Max.   :100.00   Max.   :0  
#>   Fine.gravel         Gravel          Cobbles          Boulders     
#>  Min.   :  0.00   Min.   :  0.00   Min.   :  0.00   Min.   :  0.00  
#>  1st Qu.:  0.00   1st Qu.:  0.00   1st Qu.:  0.00   1st Qu.:  0.00  
#>  Median :  0.00   Median :  0.00   Median : 50.00   Median :  0.00  
#>  Mean   : 10.49   Mean   : 15.61   Mean   : 38.49   Mean   : 10.25  
#>  3rd Qu.:  0.00   3rd Qu.: 20.00   3rd Qu.: 50.00   3rd Qu.:  0.00  
#>  Max.   :100.00   Max.   :100.00   Max.   :100.00   Max.   :100.00  
#>     Bed.rock      
#>  Min.   :  0.000  
#>  1st Qu.:  0.000  
#>  Median :  0.000  
#>  Mean   :  4.571  
#>  3rd Qu.:  0.000  
#>  Max.   :100.000
summary(Cover.example.df)
#>        x                y               Leaves      Algae        Root  
#>  Min.   :732536   Min.   :4302306   Min.   :0   Min.   :0   Min.   :0  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0   1st Qu.:0   1st Qu.:0  
#>  Median :732614   Median :4302560   Median :0   Median :0   Median :0  
#>  Mean   :732615   Mean   :4302545   Mean   :0   Mean   :0   Mean   :0  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0   3rd Qu.:0   3rd Qu.:0  
#>  Max.   :732686   Max.   :4302710   Max.   :0   Max.   :0   Max.   :0  
#>  Aquatic.vegetation      Reed              Wood             Sand  
#>  Min.   :0.00000    Min.   :0.00000   Min.   :0.0000   Min.   :0  
#>  1st Qu.:0.00000    1st Qu.:0.00000   1st Qu.:0.0000   1st Qu.:0  
#>  Median :0.00000    Median :0.00000   Median :0.0000   Median :0  
#>  Mean   :0.01703    Mean   :0.01136   Mean   :0.4767   Mean   :0  
#>  3rd Qu.:0.00000    3rd Qu.:0.00000   3rd Qu.:1.0000   3rd Qu.:0  
#>  Max.   :1.00000    Max.   :1.00000   Max.   :1.0000   Max.   :0  
#>       Rock             Cave             Shade     
#>  Min.   :0.0000   Min.   :0.00000   Min.   :0.00  
#>  1st Qu.:0.0000   1st Qu.:0.00000   1st Qu.:0.00  
#>  Median :0.0000   Median :0.00000   Median :1.00  
#>  Mean   :0.1612   Mean   :0.02177   Mean   :0.53  
#>  3rd Qu.:0.0000   3rd Qu.:0.00000   3rd Qu.:1.00  
#>  Max.   :1.0000   Max.   :1.00000   Max.   :1.00
```

The function `SubstrateIndex` computes the substrate index as a weighted
aggregation of the percentage of different granulometry classes (%). The
substrate classes originally used corresponded to a simplification of
the the American Geophysical Union size scale, namely silt (Ø ≤ 62 µm),
sand (62 µm \> Ø ≤ 2 mm), fine gravel (2 \> Ø ≤ 8 mm), gravel (8 \> Ø ≤
64 mm), cobbles (64 \> Ø ≤ 256 mm), boulders (Ø \> 256 mm) and bedrock
Muñoz-Mas et al. (2017). The package includes som examples to ilustrate
the structure of the input files.

``` r
data(Substrate.index.example.df)

summary(Substrate.index.example.df)
#>        x                y             Vegetation      Silt             Sand  
#>  Min.   :732536   Min.   :4302306   Min.   :0    Min.   :  0.00   Min.   :0  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0    1st Qu.:  0.00   1st Qu.:0  
#>  Median :732614   Median :4302560   Median :0    Median : 15.00   Median :0  
#>  Mean   :732615   Mean   :4302545   Mean   :0    Mean   : 20.59   Mean   :0  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0    3rd Qu.: 50.00   3rd Qu.:0  
#>  Max.   :732686   Max.   :4302710   Max.   :0    Max.   :100.00   Max.   :0  
#>   Fine.gravel         Gravel          Cobbles          Boulders     
#>  Min.   :  0.00   Min.   :  0.00   Min.   :  0.00   Min.   :  0.00  
#>  1st Qu.:  0.00   1st Qu.:  0.00   1st Qu.:  0.00   1st Qu.:  0.00  
#>  Median :  0.00   Median :  0.00   Median : 50.00   Median :  0.00  
#>  Mean   : 10.49   Mean   : 15.61   Mean   : 38.49   Mean   : 10.25  
#>  3rd Qu.:  0.00   3rd Qu.: 20.00   3rd Qu.: 50.00   3rd Qu.:  0.00  
#>  Max.   :100.00   Max.   :100.00   Max.   :100.00   Max.   :100.00  
#>     Bed.rock      
#>  Min.   :  0.000  
#>  1st Qu.:  0.000  
#>  Median :  0.000  
#>  Mean   :  4.571  
#>  3rd Qu.:  0.000  
#>  Max.   :100.000

head(SubstrateIndex(Substrate.index.example.df, check.completeness = FALSE)) # check.completeness allows inspecting whether names and percentages are correct.
#>   Substrate.index
#> 1               3
#> 2               3
#> 3               3
#> 4               3
#> 5               3
#> 6               3

Substrate.index <- SubstrateIndex(Substrate.index.example.df, check.completeness = FALSE)
```

``` r

Selected.species <- "Cobitis paludica"

Selected.size <- "Large"
  
(Selected.models <- ListModels(Species = Selected.species, Size = Selected.size)) ## example determining the selected models 
#>      Code                                                  Model
#> 138 ABCKQ Cobitis.paludica.FRBS.Large.EKorL.Spring.Summer.Autumn
#> 139 ABCKP Cobitis.paludica.FRBS.Large.EKorL.Autumn.Winter.Spring
#> 161 ABCKU       Cobitis.paludica.GAM.Large.Estena.and.Yeguas.All
#> 162 ABCLQ       Cobitis.paludica.HSC.Large.Estena.and.Yeguas.All
#> 163 ABCMN      Cobitis.paludica.NNET.Large.Estena.and.Yeguas.All
#> 164 ABCMV        Cobitis.paludica.RF.Large.Estena.and.Yeguas.All
#> 165 ABCNR       Cobitis.paludica.SVM.Large.Estena.and.Yeguas.All
#>                                         River       River.short Model.type
#> 138                                                       EKorL       FRBS
#> 139                                                       EKorL       FRBS
#> 161 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas        GAM
#> 162 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas        HSC
#> 163 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas       NNET
#> 164 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas         RF
#> 165 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas        SVM
#>     Default          Species  Size Sampled.season
#> 138    TRUE Cobitis paludica Large               
#> 139    TRUE Cobitis paludica Large               
#> 161    TRUE Cobitis paludica Large         Summer
#> 162    TRUE Cobitis paludica Large         Summer
#> 163    TRUE Cobitis paludica Large         Summer
#> 164    TRUE Cobitis paludica Large         Summer
#> 165    TRUE Cobitis paludica Large         Summer
#>                       Valid.season  Valid.seasons.short      Data.origin
#> 138         Spring; Summer; Autumn Spring.Summer.Autumn Expert knowledge
#> 139         Autumn; Winter; Spring Autumn.Winter.Spring Expert knowledge
#> 161 Winter; Spring; Summer; Autumn                  All     Field survey
#> 162 Winter; Spring; Summer; Autumn                  All     Field survey
#> 163 Winter; Spring; Summer; Autumn                  All     Field survey
#> 164 Winter; Spring; Summer; Autumn                  All     Field survey
#> 165 Winter; Spring; Summer; Autumn                  All     Field survey
#>     N.presences N.absences N.interviews.or.studies True.positive False.positive
#> 138          NA         NA                       7            NA             NA
#> 139          NA         NA                       7            NA             NA
#> 161          43       1950                      NA            39           1200
#> 162          43       1953                      NA            NA             NA
#> 163          43       1950                      NA            38            959
#> 164          43       1950                      NA            38            959
#> 165          43       1950                      NA            36            678
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 138            NA             NA          NA          NA    NA
#> 139            NA             NA          NA          NA    NA
#> 161           750              4       0.907       0.385 0.292
#> 162            NA             NA          NA          NA    NA
#> 163           991              5       0.884       0.508 0.392
#> 164           991              5       0.884       0.508 0.392
#> 165          1272              7       0.837       0.652 0.490
#>     Balanced.accuracy
#> 138                NA
#> 139                NA
#> 161             0.646
#> 162                NA
#> 163             0.696
#> 164             0.696
#> 165             0.745
#> $Current.summary.table
#>      Code                                                  Model
#> 138 ABCKQ Cobitis.paludica.FRBS.Large.EKorL.Spring.Summer.Autumn
#> 139 ABCKP Cobitis.paludica.FRBS.Large.EKorL.Autumn.Winter.Spring
#> 161 ABCKU       Cobitis.paludica.GAM.Large.Estena.and.Yeguas.All
#> 162 ABCLQ       Cobitis.paludica.HSC.Large.Estena.and.Yeguas.All
#> 163 ABCMN      Cobitis.paludica.NNET.Large.Estena.and.Yeguas.All
#> 164 ABCMV        Cobitis.paludica.RF.Large.Estena.and.Yeguas.All
#> 165 ABCNR       Cobitis.paludica.SVM.Large.Estena.and.Yeguas.All
#>                                         River       River.short Model.type
#> 138                                                       EKorL       FRBS
#> 139                                                       EKorL       FRBS
#> 161 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas        GAM
#> 162 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas        HSC
#> 163 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas       NNET
#> 164 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas         RF
#> 165 Estena (Guadiana) + Yeguas (Guadalquivir) Estena.and.Yeguas        SVM
#>     Default          Species  Size Sampled.season
#> 138    TRUE Cobitis paludica Large               
#> 139    TRUE Cobitis paludica Large               
#> 161    TRUE Cobitis paludica Large         Summer
#> 162    TRUE Cobitis paludica Large         Summer
#> 163    TRUE Cobitis paludica Large         Summer
#> 164    TRUE Cobitis paludica Large         Summer
#> 165    TRUE Cobitis paludica Large         Summer
#>                       Valid.season  Valid.seasons.short      Data.origin
#> 138         Spring; Summer; Autumn Spring.Summer.Autumn Expert knowledge
#> 139         Autumn; Winter; Spring Autumn.Winter.Spring Expert knowledge
#> 161 Winter; Spring; Summer; Autumn                  All     Field survey
#> 162 Winter; Spring; Summer; Autumn                  All     Field survey
#> 163 Winter; Spring; Summer; Autumn                  All     Field survey
#> 164 Winter; Spring; Summer; Autumn                  All     Field survey
#> 165 Winter; Spring; Summer; Autumn                  All     Field survey
#>     N.presences N.absences N.interviews.or.studies True.positive False.positive
#> 138          NA         NA                       7            NA             NA
#> 139          NA         NA                       7            NA             NA
#> 161          43       1950                      NA            39           1200
#> 162          43       1953                      NA            NA             NA
#> 163          43       1950                      NA            38            959
#> 164          43       1950                      NA            38            959
#> 165          43       1950                      NA            36            678
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 138            NA             NA          NA          NA    NA
#> 139            NA             NA          NA          NA    NA
#> 161           750              4       0.907       0.385 0.292
#> 162            NA             NA          NA          NA    NA
#> 163           991              5       0.884       0.508 0.392
#> 164           991              5       0.884       0.508 0.392
#> 165          1272              7       0.837       0.652 0.490
#>     Balanced.accuracy
#> 138                NA
#> 139                NA
#> 161             0.646
#> 162                NA
#> 163             0.696
#> 164             0.696
#> 165             0.745
#> 
#> $Models
#> [1] "Cobitis.paludica.FRBS.Large.EKorL.Spring.Summer.Autumn"
#> [2] "Cobitis.paludica.FRBS.Large.EKorL.Autumn.Winter.Spring"
#> [3] "Cobitis.paludica.GAM.Large.Estena.and.Yeguas.All"      
#> [4] "Cobitis.paludica.HSC.Large.Estena.and.Yeguas.All"      
#> [5] "Cobitis.paludica.NNET.Large.Estena.and.Yeguas.All"     
#> [6] "Cobitis.paludica.RF.Large.Estena.and.Yeguas.All"       
#> [7] "Cobitis.paludica.SVM.Large.Estena.and.Yeguas.All"      
#> 
#> $Codes
#> [1] "ABCKQ" "ABCKP" "ABCKU" "ABCLQ" "ABCMN" "ABCMV" "ABCNR"
```

``` r
Hydraulics <- data.frame(Velocity = Velocity.example.df$Velocity.0.05,
                         Depth = Depth.example.df$Depth.0.05,
                         Substrate.index = Substrate.index,
                         Cover.example.df[,-c(1:2)])

Predictions <- PredictHabitatSuitability(Selected.models = Selected.models, data = Hydraulics, HSC.aggregation = "geometric")
```

``` r

pairs(Predictions)
```

<img src="man/figures/README-plot anc compare predicted microhabitat suitability-1.png" width="100%" />

``` r

Predictions
#>                ABCKQ        ABCKP     ABCKU      ABCLQ      ABCMN       ABCMV
#>    [1,]           NA           NA        NA         NA         NA          NA
#>    [2,]           NA           NA        NA         NA         NA          NA
#>    [3,]           NA           NA        NA         NA         NA          NA
#>    [4,]           NA           NA        NA         NA         NA          NA
#>    [5,]           NA           NA        NA         NA         NA          NA
#>    [6,]           NA           NA        NA         NA         NA          NA
#>    [7,]           NA           NA        NA         NA         NA          NA
#>    [8,]           NA           NA        NA         NA         NA          NA
#>    [9,]           NA           NA        NA         NA         NA          NA
#>   [10,]           NA           NA        NA         NA         NA          NA
#>   [11,]           NA           NA        NA         NA         NA          NA
#>   [12,]           NA           NA        NA         NA         NA          NA
#>   [13,]           NA           NA        NA         NA         NA          NA
#>   [14,]           NA           NA        NA         NA         NA          NA
#>   [15,]           NA           NA        NA         NA         NA          NA
#>   [16,]           NA           NA        NA         NA         NA          NA
#>   [17,]           NA           NA        NA         NA         NA          NA
#>   [18,]           NA           NA        NA         NA         NA          NA
#>   [19,]           NA           NA        NA         NA         NA          NA
#>   [20,]           NA           NA        NA         NA         NA          NA
#>   [21,] 2.380724e-04 6.062323e-05 0.2032533 0.07501802 0.60030981 0.000000000
#>   [22,] 1.193340e-01 3.029651e-02 0.3124884 0.35653146 0.57822838 0.062500000
#>   [23,] 2.348542e-01 5.956090e-02 0.3512410 0.42274721 0.54169509 0.165000000
#>   [24,] 1.506735e-01 3.821252e-02 0.3265323 0.37834247 0.54604534 0.120500000
#>   [25,] 2.174861e-01 5.513930e-02 0.3393189 0.55530023 0.46368977 0.279333333
#>   [26,] 6.629501e-02 1.682495e-02 0.2876124 0.41232109 0.34579718 0.042500000
#>   [27,] 1.980887e-02 5.037652e-03 0.2392434 0.30390690 0.18415814 0.000000000
#>   [28,] 2.599249e-03 6.625021e-04 0.1851466 0.18225829 0.07099247 0.000000000
#>   [29,] 2.084952e-05 5.317467e-06 0.1797465 0.04068155 0.58303352 0.000000000
#>   [30,]           NA           NA        NA         NA         NA          NA
#>   [31,] 6.181795e-05 1.575875e-05 0.1796417 0.07133324 0.06911745 0.000000000
#>   [32,]           NA           NA        NA         NA         NA          NA
#>   [33,]           NA           NA        NA         NA         NA          NA
#>   [34,]           NA           NA        NA         NA         NA          NA
#>   [35,]           NA           NA        NA         NA         NA          NA
#>   [36,]           NA           NA        NA         NA         NA          NA
#>   [37,]           NA           NA        NA         NA         NA          NA
#>   [38,]           NA           NA        NA         NA         NA          NA
#>   [39,]           NA           NA        NA         NA         NA          NA
#>   [40,]           NA           NA        NA         NA         NA          NA
#>   [41,]           NA           NA        NA         NA         NA          NA
#>   [42,]           NA           NA        NA         NA         NA          NA
#>   [43,]           NA           NA        NA         NA         NA          NA
#>   [44,]           NA           NA        NA         NA         NA          NA
#>   [45,]           NA           NA        NA         NA         NA          NA
#>   [46,]           NA           NA        NA         NA         NA          NA
#>   [47,]           NA           NA        NA         NA         NA          NA
#>   [48,]           NA           NA        NA         NA         NA          NA
#>   [49,]           NA           NA        NA         NA         NA          NA
#>   [50,]           NA           NA        NA         NA         NA          NA
#>   [51,]           NA           NA        NA         NA         NA          NA
#>   [52,]           NA           NA        NA         NA         NA          NA
#>   [53,]           NA           NA        NA         NA         NA          NA
#>   [54,]           NA           NA        NA         NA         NA          NA
#>   [55,]           NA           NA        NA         NA         NA          NA
#>   [56,]           NA           NA        NA         NA         NA          NA
#>   [57,]           NA           NA        NA         NA         NA          NA
#>   [58,]           NA           NA        NA         NA         NA          NA
#>   [59,]           NA           NA        NA         NA         NA          NA
#>   [60,]           NA           NA        NA         NA         NA          NA
#>   [61,] 2.547117e-05 6.492771e-06 0.1777687 0.05724774 0.06700191 0.000000000
#>   [62,] 3.621367e-02 9.222306e-03 0.2294312 0.35194145 0.12595713 0.000000000
#>   [63,] 2.080983e-01 5.272239e-02 0.3391911 0.41048643 0.50030517 0.341500000
#>   [64,] 1.354606e-01 3.425765e-02 0.2880180 0.36906184 0.40390339 0.213833333
#>   [65,] 6.415627e-02 1.629484e-02 0.2793994 0.40878034 0.28171906 0.042500000
#>   [66,] 1.688266e-01 4.281861e-02 0.3323202 0.38923789 0.54703139 0.093000000
#>   [67,] 9.926647e-02 2.525839e-02 0.2791373 0.33943422 0.60773052 0.052500000
#>   [68,] 2.874052e-02 7.328489e-03 0.2141181 0.24799360 0.59391243 0.000000000
#>   [69,] 2.779014e-02 7.077560e-03 0.2319691 0.24651610 0.60412356 0.000000000
#>   [70,] 8.996117e-04 2.293984e-04 0.1866311 0.10430315 0.58686787 0.000000000
#>   [71,]           NA           NA        NA         NA         NA          NA
#>   [72,]           NA           NA        NA         NA         NA          NA
#>   [73,]           NA           NA        NA         NA         NA          NA
#>   [74,]           NA           NA        NA         NA         NA          NA
#>   [75,]           NA           NA        NA         NA         NA          NA
#>   [76,]           NA           NA        NA         NA         NA          NA
#>   [77,]           NA           NA        NA         NA         NA          NA
#>   [78,]           NA           NA        NA         NA         NA          NA
#>   [79,]           NA           NA        NA         NA         NA          NA
#>   [80,]           NA           NA        NA         NA         NA          NA
#>   [81,]           NA           NA        NA         NA         NA          NA
#>   [82,]           NA           NA        NA         NA         NA          NA
#>   [83,]           NA           NA        NA         NA         NA          NA
#>   [84,]           NA           NA        NA         NA         NA          NA
#>   [85,]           NA           NA        NA         NA         NA          NA
#>   [86,]           NA           NA        NA         NA         NA          NA
#>   [87,]           NA           NA        NA         NA         NA          NA
#>   [88,]           NA           NA        NA         NA         NA          NA
#>   [89,]           NA           NA        NA         NA         NA          NA
#>   [90,]           NA           NA        NA         NA         NA          NA
#>   [91,]           NA           NA        NA         NA         NA          NA
#>   [92,]           NA           NA        NA         NA         NA          NA
#>   [93,]           NA           NA        NA         NA         NA          NA
#>   [94,]           NA           NA        NA         NA         NA          NA
#>   [95,]           NA           NA        NA         NA         NA          NA
#>   [96,]           NA           NA        NA         NA         NA          NA
#>   [97,]           NA           NA        NA         NA         NA          NA
#>   [98,] 3.026050e-03 7.717034e-04 0.1900263 0.14122704 0.58680869 0.000000000
#>   [99,] 8.320413e-02 2.119632e-02 0.2541997 0.32409822 0.60635026 0.037500000
#>  [100,] 1.805790e-01 4.587217e-02 0.3191414 0.52897334 0.31945321 0.083000000
#>  [101,] 4.234918e-01 1.075653e-01 0.3937849 0.48967900 0.55815028 0.088333333
#>  [102,] 2.491259e-01 6.330746e-02 0.3428499 0.42806182 0.59492293 0.108333333
#>  [103,] 1.998653e-01 5.085649e-02 0.3109590 0.40432407 0.60936082 0.140000000
#>  [104,] 2.039436e-01 5.176016e-02 0.3412276 0.40779424 0.56718639 0.150000000
#>  [105,] 9.445931e-02 2.404184e-02 0.2730624 0.33509281 0.60833713 0.052500000
#>  [106,] 4.045494e-02 1.029965e-02 0.2443938 0.27094032 0.60609949 0.000000000
#>  [107,] 2.109730e-02 5.376986e-03 0.2163561 0.22977793 0.59813805 0.000000000
#>  [108,]           NA           NA        NA         NA         NA          NA
#>  [109,]           NA           NA        NA         NA         NA          NA
#>  [110,]           NA           NA        NA         NA         NA          NA
#>  [111,]           NA           NA        NA         NA         NA          NA
#>  [112,]           NA           NA        NA         NA         NA          NA
#>  [113,]           NA           NA        NA         NA         NA          NA
#>  [114,]           NA           NA        NA         NA         NA          NA
#>  [115,]           NA           NA        NA         NA         NA          NA
#>  [116,]           NA           NA        NA         NA         NA          NA
#>  [117,]           NA           NA        NA         NA         NA          NA
#>  [118,]           NA           NA        NA         NA         NA          NA
#>  [119,]           NA           NA        NA         NA         NA          NA
#>  [120,]           NA           NA        NA         NA         NA          NA
#>  [121,]           NA           NA        NA         NA         NA          NA
#>  [122,]           NA           NA        NA         NA         NA          NA
#>  [123,]           NA           NA        NA         NA         NA          NA
#>  [124,]           NA           NA        NA         NA         NA          NA
#>  [125,] 2.255354e-05 5.751268e-06 0.5859635 0.05485337 0.09421295 0.102473684
#>  [126,]           NA           NA        NA         NA         NA          NA
#>  [127,]           NA           NA        NA         NA         NA          NA
#>  [128,]           NA           NA        NA         NA         NA          NA
#>  [129,]           NA           NA        NA         NA         NA          NA
#>  [130,]           NA           NA        NA         NA         NA          NA
#>  [131,]           NA           NA        NA         NA         NA          NA
#>  [132,]           NA           NA        NA         NA         NA          NA
#>  [133,]           NA           NA        NA         NA         NA          NA
#>  [134,] 4.828705e-03 1.231471e-03 0.1921330 0.15871394 0.58689541 0.000000000
#>  [135,] 1.051382e-01 2.680357e-02 0.2502762 0.34311821 0.60247438 0.037500000
#>  [136,] 3.865749e-01 9.824526e-02 0.3735364 0.47769774 0.59535783 0.088333333
#>  [137,] 4.658014e-01 1.197133e-01 0.3941235 0.50213237 0.58848681 0.088333333
#>  [138,] 3.511886e-01 8.926466e-02 0.3641159 0.46627861 0.59803223 0.088333333
#>  [139,] 2.640827e-01 6.719649e-02 0.3277865 0.43349499 0.60996129 0.088333333
#>  [140,] 1.635160e-01 4.159010e-02 0.3067437 0.38478833 0.60627629 0.073000000
#>  [141,] 1.768012e-01 4.499823e-02 0.3006279 0.39196450 0.61004044 0.073000000
#>  [142,] 1.829496e-01 4.658061e-02 0.2961300 0.39506894 0.61089726 0.135000000
#>  [143,] 3.108616e-02 7.923138e-03 0.2221170 0.25313762 0.10956124 0.017073643
#>  [144,]           NA           NA        NA         NA         NA          NA
#>  [145,]           NA           NA        NA         NA         NA          NA
#>  [146,] 1.468641e-05 3.745627e-06 0.1796154 0.03726940 0.07012198 0.017073643
#>  [147,]           NA           NA        NA         NA         NA          NA
#>  [148,]           NA           NA        NA         NA         NA          NA
#>  [149,]           NA           NA        NA         NA         NA          NA
#>  [150,]           NA           NA        NA         NA         NA          NA
#>  [151,]           NA           NA        NA         NA         NA          NA
#>  [152,]           NA           NA        NA         NA         NA          NA
#>  [153,]           NA           NA        NA         NA         NA          NA
#>  [154,]           NA           NA        NA         NA         NA          NA
#>  [155,]           NA           NA        NA         NA         NA          NA
#>  [156,]           NA           NA        NA         NA         NA          NA
#>  [157,]           NA           NA        NA         NA         NA          NA
#>  [158,]           NA           NA        NA         NA         NA          NA
#>  [159,]           NA           NA        NA         NA         NA          NA
#>  [160,]           NA           NA        NA         NA         NA          NA
#>  [161,]           NA           NA        NA         NA         NA          NA
#>  [162,]           NA           NA        NA         NA         NA          NA
#>  [163,]           NA           NA        NA         NA         NA          NA
#>  [164,]           NA           NA        NA         NA         NA          NA
#>  [165,]           NA           NA        NA         NA         NA          NA
#>  [166,]           NA           NA        NA         NA         NA          NA
#>  [167,]           NA           NA        NA         NA         NA          NA
#>  [168,] 1.558139e-03 3.973762e-04 0.1864772 0.11961996 0.58529818 0.000000000
#>  [169,] 2.603306e-01 6.631139e-02 0.3087320 0.43114431 0.61246453 0.083333333
#>  [170,] 5.223862e-01 1.388051e-01 0.3910050 0.52000322 0.60791393 0.096333333
#>  [171,] 6.545620e-01 1.991317e-01 0.4322607 0.56924483 0.60452312 0.224166667
#>  [172,] 5.445721e-01 1.471214e-01 0.3955928 0.52755930 0.60865920 0.133000000
#>  [173,] 4.054906e-01 1.031577e-01 0.3475517 0.64597366 0.25625489 0.068333333
#>  [174,] 2.951615e-01 7.512894e-02 0.3297640 0.44547844 0.61196981 0.083333333
#>  [175,] 3.211053e-01 8.175731e-02 0.3303626 0.45471815 0.61329393 0.073333333
#>  [176,] 2.787687e-01 7.098214e-02 0.3195889 0.43887858 0.61277789 0.083333333
#>  [177,] 1.873977e-01 4.774481e-02 0.2859394 0.39695542 0.16704845 0.064573643
#>  [178,] 4.787444e-03 1.220957e-03 0.1919723 0.15837117 0.07671630 0.017073643
#>  [179,]           NA           NA        NA         NA         NA          NA
#>  [180,]           NA           NA        NA         NA         NA          NA
#>  [181,]           NA           NA        NA         NA         NA          NA
#>  [182,]           NA           NA        NA         NA         NA          NA
#>  [183,]           NA           NA        NA         NA         NA          NA
#>  [184,]           NA           NA        NA         NA         NA          NA
#>  [185,]           NA           NA        NA         NA         NA          NA
#>  [186,]           NA           NA        NA         NA         NA          NA
#>  [187,]           NA           NA        NA         NA         NA          NA
#>  [188,]           NA           NA        NA         NA         NA          NA
#>  [189,]           NA           NA        NA         NA         NA          NA
#>  [190,]           NA           NA        NA         NA         NA          NA
#>  [191,]           NA           NA        NA         NA         NA          NA
#>  [192,]           NA           NA        NA         NA         NA          NA
#>  [193,]           NA           NA        NA         NA         NA          NA
#>  [194,]           NA           NA        NA         NA         NA          NA
#>  [195,]           NA           NA        NA         NA         NA          NA
#>  [196,]           NA           NA        NA         NA         NA          NA
#>  [197,]           NA           NA        NA         NA         NA          NA
#>  [198,]           NA           NA        NA         NA         NA          NA
#>  [199,]           NA           NA        NA         NA         NA          NA
#>  [200,]           NA           NA        NA         NA         NA          NA
#>  [201,]           NA           NA        NA         NA         NA          NA
#>  [202,]           NA           NA        NA         NA         NA          NA
#>  [203,] 2.473274e-04 6.307766e-05 0.1819154 0.07550111 0.58380838 0.000000000
#>  [204,] 2.228204e-01 5.677824e-02 0.2927008 0.41439217 0.61047458 0.063333333
#>  [205,] 6.466949e-01 1.957842e-01 0.4205187 0.56627463 0.61205433 0.237500000
#>  [206,] 7.039224e-01 2.348191e-01 0.4435150 0.59004649 0.61088876 0.215500000
#>  [207,] 5.794926e-01 1.618367e-01 0.3997368 0.53996053 0.61204583 0.314500000
#>  [208,] 4.490719e-01 1.152937e-01 0.3643117 0.49589860 0.61284723 0.068333333
#>  [209,] 4.655602e-01 1.204123e-01 0.3601870 0.50087476 0.61518904 0.073333333
#>  [210,] 3.043907e-01 7.751581e-02 0.3247088 0.44815973 0.60902806 0.078333333
#>  [211,] 4.097282e-01 1.044430e-01 0.3451654 0.48321186 0.61491844 0.073333333
#>  [212,] 2.929233e-01 7.461021e-02 0.3171650 0.44408351 0.61317282 0.083333333
#>  [213,] 1.838623e-01 4.686495e-02 0.2772209 0.39471728 0.14305312 0.064573643
#>  [214,] 5.064518e-06 1.291656e-06 0.1793330 0.02855999 0.06998751 0.017073643
#>  [215,]           NA           NA        NA         NA         NA          NA
#>  [216,]           NA           NA        NA         NA         NA          NA
#>  [217,]           NA           NA        NA         NA         NA          NA
#>  [218,]           NA           NA        NA         NA         NA          NA
#>  [219,]           NA           NA        NA         NA         NA          NA
#>  [220,]           NA           NA        NA         NA         NA          NA
#>  [221,]           NA           NA        NA         NA         NA          NA
#>  [222,]           NA           NA        NA         NA         NA          NA
#>  [223,]           NA           NA        NA         NA         NA          NA
#>  [224,]           NA           NA        NA         NA         NA          NA
#>  [225,]           NA           NA        NA         NA         NA          NA
#>  [226,]           NA           NA        NA         NA         NA          NA
#>  [227,]           NA           NA        NA         NA         NA          NA
#>  [228,]           NA           NA        NA         NA         NA          NA
#>  [229,]           NA           NA        NA         NA         NA          NA
#>  [230,]           NA           NA        NA         NA         NA          NA
#>  [231,]           NA           NA        NA         NA         NA          NA
#>  [232,]           NA           NA        NA         NA         NA          NA
#>  [233,]           NA           NA        NA         NA         NA          NA
#>  [234,]           NA           NA        NA         NA         NA          NA
#>  [235,]           NA           NA        NA         NA         NA          NA
#>  [236,]           NA           NA        NA         NA         NA          NA
#>  [237,] 1.880806e-01 4.792285e-02 0.2846594 0.39725096 0.60967146 0.105000000
#>  [238,] 7.301645e-01 2.610537e-01 0.4496286 0.60183758 0.61520448 0.193833333
#>  [239,] 7.076675e-01 2.396813e-01 0.4388350 0.59195380 0.61521076 0.193833333
#>  [240,] 6.096468e-01 1.756828e-01 0.4022855 0.55016114 0.61099427 0.337000000
#>  [241,] 6.706144e-01 2.091453e-01 0.4188180 0.57335938 0.60767773 0.244174242
#>  [242,] 5.836625e-01 1.631051e-01 0.3892614 0.53886792 0.60529202 0.290674242
#>  [243,] 4.221472e-01 1.077334e-01 0.3461765 0.48552623 0.60236218 0.063333333
#>  [244,] 5.638906e-01 1.551867e-01 0.3761491 0.53172123 0.60510301 0.204427453
#>  [245,] 5.119512e-01 1.355019e-01 0.3610830 0.51387010 0.60371154 0.031333333
#>  [246,] 4.921987e-01 1.290065e-01 0.3516528 0.50752232 0.22650598 0.047073643
#>  [247,] 2.066005e-02 5.268044e-03 0.2107997 0.22806258 0.09574689 0.017073643
#>  [248,] 1.158425e-04 2.954450e-05 0.1808567 0.06245834 0.58335743 0.000000000
#>  [249,]           NA           NA        NA         NA         NA          NA
#>  [250,]           NA           NA        NA         NA         NA          NA
#>  [251,]           NA           NA        NA         NA         NA          NA
#>  [252,]           NA           NA        NA         NA         NA          NA
#>  [253,]           NA           NA        NA         NA         NA          NA
#>  [254,]           NA           NA        NA         NA         NA          NA
#>  [255,]           NA           NA        NA         NA         NA          NA
#>  [256,]           NA           NA        NA         NA         NA          NA
#>  [257,]           NA           NA        NA         NA         NA          NA
#>  [258,]           NA           NA        NA         NA         NA          NA
#>  [259,]           NA           NA        NA         NA         NA          NA
#>  [260,]           NA           NA        NA         NA         NA          NA
#>  [261,]           NA           NA        NA         NA         NA          NA
#>  [262,]           NA           NA        NA         NA         NA          NA
#>  [263,]           NA           NA        NA         NA         NA          NA
#>  [264,]           NA           NA        NA         NA         NA          NA
#>  [265,]           NA           NA        NA         NA         NA          NA
#>  [266,]           NA           NA        NA         NA         NA          NA
#>  [267,]           NA           NA        NA         NA         NA          NA
#>  [268,]           NA           NA        NA         NA         NA          NA
#>  [269,] 1.016641e-03 2.592807e-04 0.1848758 0.10750513 0.58467416 0.000000000
#>  [270,] 4.147953e-01 1.058503e-01 0.3413632 0.48456082 0.61524655 0.053333333
#>  [271,] 7.188664e-01 2.493849e-01 0.4411893 0.59620969 0.61491782 0.193833333
#>  [272,] 7.060867e-01 2.348924e-01 0.4330368 0.58827961 0.60885715 0.242174242
#>  [273,] 7.453525e-01 2.721065e-01 0.4480156 0.60478897 0.60848927 0.244174242
#>  [274,] 7.221353e-01 2.490898e-01 0.4346167 0.59460892 0.60844212 0.244174242
#>  [275,] 7.044949e-01 2.347212e-01 0.4239400 0.58725231 0.60848989 0.234174242
#>  [276,] 7.139503e-01 2.439049e-01 0.4239104 0.59146141 0.60911644 0.179927453
#>  [277,] 5.902954e-01 1.669061e-01 0.3804590 0.54129839 0.60553881 0.237927453
#>  [278,] 5.575213e-01 1.528166e-01 0.3704692 0.52942506 0.60456800 0.186649676
#>  [279,] 5.870621e-01 1.656453e-01 0.3769189 0.54010016 0.25849627 0.164331219
#>  [280,] 1.021160e-01 2.603013e-02 0.2548998 0.33989462 0.14284986 0.033740310
#>  [281,] 1.830181e-03 4.665780e-04 0.1877144 0.16608237 0.07721578 0.000000000
#>  [282,]           NA           NA        NA         NA         NA          NA
#>  [283,]           NA           NA        NA         NA         NA          NA
#>  [284,]           NA           NA        NA         NA         NA          NA
#>  [285,]           NA           NA        NA         NA         NA          NA
#>  [286,]           NA           NA        NA         NA         NA          NA
#>  [287,]           NA           NA        NA         NA         NA          NA
#>  [288,]           NA           NA        NA         NA         NA          NA
#>  [289,]           NA           NA        NA         NA         NA          NA
#>  [290,]           NA           NA        NA         NA         NA          NA
#>  [291,]           NA           NA        NA         NA         NA          NA
#>  [292,]           NA           NA        NA         NA         NA          NA
#>  [293,]           NA           NA        NA         NA         NA          NA
#>  [294,]           NA           NA        NA         NA         NA          NA
#>  [295,]           NA           NA        NA         NA         NA          NA
#>  [296,]           NA           NA        NA         NA         NA          NA
#>  [297,]           NA           NA        NA         NA         NA          NA
#>  [298,]           NA           NA        NA         NA         NA          NA
#>  [299,]           NA           NA        NA         NA         NA          NA
#>  [300,] 1.155699e-01 2.946515e-02 0.6438111 0.46601003 0.10669122 0.133333333
#>  [301,] 7.478510e-01 2.879682e-01 0.4401857 0.60992823 0.61803242 0.258198287
#>  [302,] 7.953140e-01 4.355984e-01 0.5078348 0.64660812 0.61262025 0.872719156
#>  [303,] 7.954633e-01 4.012310e-01 0.4956208 0.64034126 0.61206207 0.832204004
#>  [304,] 7.948934e-01 4.248406e-01 0.5030446 0.64460371 0.61273625 0.857083941
#>  [305,] 7.905665e-01 3.667538e-01 0.4803728 0.63284015 0.61213188 0.648779352
#>  [306,] 7.770936e-01 3.281306e-01 0.4616650 0.62262985 0.61180993 0.331142448
#>  [307,] 7.587390e-01 2.962996e-01 0.4450047 0.61241408 0.61108750 0.227739953
#>  [308,] 7.031034e-01 2.355020e-01 0.4161974 0.58699228 0.60876741 0.169927453
#>  [309,] 6.741104e-01 2.136489e-01 0.4054523 0.57487130 0.60781290 0.169927453
#>  [310,] 7.226622e-01 2.533008e-01 0.4241045 0.59545831 0.30654221 0.109831219
#>  [311,] 3.473759e-01 8.855256e-02 0.3178268 0.46156178 0.19061468 0.047073643
#>  [312,] 3.997424e-04 1.019285e-04 0.5529366 0.11301091 0.07410679 0.017073643
#>  [313,]           NA           NA        NA         NA         NA          NA
#>  [314,]           NA           NA        NA         NA         NA          NA
#>  [315,]           NA           NA        NA         NA         NA          NA
#>  [316,]           NA           NA        NA         NA         NA          NA
#>  [317,]           NA           NA        NA         NA         NA          NA
#>  [318,]           NA           NA        NA         NA         NA          NA
#>  [319,]           NA           NA        NA         NA         NA          NA
#>  [320,]           NA           NA        NA         NA         NA          NA
#>  [321,]           NA           NA        NA         NA         NA          NA
#>  [322,]           NA           NA        NA         NA         NA          NA
#>  [323,]           NA           NA        NA         NA         NA          NA
#>  [324,]           NA           NA        NA         NA         NA          NA
#>  [325,]           NA           NA        NA         NA         NA          NA
#>  [326,]           NA           NA        NA         NA         NA          NA
#>  [327,]           NA           NA        NA         NA         NA          NA
#>  [328,]           NA           NA        NA         NA         NA          NA
#>  [329,]           NA           NA        NA         NA         NA          NA
#>  [330,]           NA           NA        NA         NA         NA          NA
#>  [331,]           NA           NA        NA         NA         NA          NA
#>  [332,]           NA           NA        NA         NA         NA          NA
#>  [333,] 5.755090e-02 1.467544e-02 0.6192254 0.39098363 0.09504563 0.075000000
#>  [334,] 8.219018e-01 3.121468e-01 0.8017284 0.83099849 0.15674125 0.213622306
#>  [335,] 7.938441e-01 4.962080e-01 0.5279416 0.65573379 0.61424909 0.651306163
#>  [336,] 7.936131e-01 5.386282e-01 0.5441518 0.66095763 0.61476602 0.733246334
#>  [337,] 7.925686e-01 5.485497e-01 0.5461958 0.66173397 0.61559316 0.739674906
#>  [338,] 7.922119e-01 5.062911e-01 0.5287919 0.65668056 0.61537171 0.668889496
#>  [339,] 7.865102e-01 3.579601e-01 0.4724066 0.63026320 0.61271571 0.620922210
#>  [340,] 6.329635e-01 1.885375e-01 0.3911618 0.55790274 0.60653141 0.179927453
#>  [341,] 6.522182e-01 1.998058e-01 0.3964603 0.56587723 0.60702409 0.169927453
#>  [342,] 7.462527e-01 2.796869e-01 0.4360078 0.60629693 0.61051622 0.207739953
#>  [343,] 7.415424e-01 2.731695e-01 0.4346519 0.60393807 0.61027200 0.197739953
#>  [344,] 6.367644e-01 1.911463e-01 0.3886660 0.55956264 0.26065032 0.119831219
#>  [345,] 4.083442e-03 1.041477e-03 0.1935435 0.15180815 0.08490914 0.017073643
#>  [346,]           NA           NA        NA         NA         NA          NA
#>  [347,]           NA           NA        NA         NA         NA          NA
#>  [348,]           NA           NA        NA         NA         NA          NA
#>  [349,]           NA           NA        NA         NA         NA          NA
#>  [350,]           NA           NA        NA         NA         NA          NA
#>  [351,]           NA           NA        NA         NA         NA          NA
#>  [352,]           NA           NA        NA         NA         NA          NA
#>  [353,]           NA           NA        NA         NA         NA          NA
#>  [354,]           NA           NA        NA         NA         NA          NA
#>  [355,]           NA           NA        NA         NA         NA          NA
#>  [356,]           NA           NA        NA         NA         NA          NA
#>  [357,]           NA           NA        NA         NA         NA          NA
#>  [358,]           NA           NA        NA         NA         NA          NA
#>  [359,]           NA           NA        NA         NA         NA          NA
#>  [360,]           NA           NA        NA         NA         NA          NA
#>  [361,]           NA           NA        NA         NA         NA          NA
#>  [362,]           NA           NA        NA         NA         NA          NA
#>  [363,]           NA           NA        NA         NA         NA          NA
#>  [364,]           NA           NA        NA         NA         NA          NA
#>  [365,]           NA           NA        NA         NA         NA          NA
#>  [366,] 8.326257e-01 3.306391e-01 0.8037993 0.83835028 0.15690797 0.233622306
#>  [367,] 7.921332e-01 5.707049e-01 0.5543898 0.66369512 0.61605331 0.826464021
#>  [368,] 7.921179e-01 6.470099e-01 0.5866116 0.66730961 0.61588607 0.733919222
#>  [369,] 7.925922e-01 5.220264e-01 0.5356758 0.65876768 0.61533207 0.697861719
#>  [370,] 7.917348e-01 4.784838e-01 0.5171386 0.65266424 0.61520257 0.676556163
#>  [371,] 7.870420e-01 3.602126e-01 0.4732817 0.63079870 0.61277033 0.620922210
#>  [372,] 6.711068e-01 2.116783e-01 0.4040448 0.57364115 0.60769984 0.169927453
#>  [373,] 6.138881e-01 1.785744e-01 0.3842296 0.55031141 0.60585412 0.197927453
#>  [374,] 6.391253e-01 1.920829e-01 0.3923897 0.56045496 0.60664345 0.179927453
#>  [375,] 7.315235e-01 2.622389e-01 0.4286765 0.59938900 0.60985417 0.187739953
#>  [376,] 7.601800e-01 3.003267e-01 0.4439078 0.61347667 0.32363830 0.127926457
#>  [377,] 2.992312e-01 7.631177e-02 0.2996947 0.44425019 0.15679883 0.047073643
#>  [378,] 1.261649e-01 3.217259e-02 0.6618993 0.47607066 0.07765444 0.101333333
#>  [379,]           NA           NA        NA         NA         NA          NA
#>  [380,]           NA           NA        NA         NA         NA          NA
#>  [381,]           NA           NA        NA         NA         NA          NA
#>  [382,]           NA           NA        NA         NA         NA          NA
#>  [383,]           NA           NA        NA         NA         NA          NA
#>  [384,]           NA           NA        NA         NA         NA          NA
#>  [385,]           NA           NA        NA         NA         NA          NA
#>  [386,]           NA           NA        NA         NA         NA          NA
#>  [387,]           NA           NA        NA         NA         NA          NA
#>  [388,]           NA           NA        NA         NA         NA          NA
#>  [389,]           NA           NA        NA         NA         NA          NA
#>  [390,]           NA           NA        NA         NA         NA          NA
#>  [391,]           NA           NA        NA         NA         NA          NA
#>  [392,]           NA           NA        NA         NA         NA          NA
#>  [393,]           NA           NA        NA         NA         NA          NA
#>  [394,]           NA           NA        NA         NA         NA          NA
#>  [395,]           NA           NA        NA         NA         NA          NA
#>  [396,]           NA           NA        NA         NA         NA          NA
#>  [397,] 3.823538e-01 9.747511e-02 0.7022228 0.63082617 0.14575623 0.033333333
#>  [398,] 7.906182e-01 6.147705e-01 0.5700917 0.66609196 0.61736263 0.771181126
#>  [399,] 7.932319e-01 6.306999e-01 0.5814766 0.66744672 0.61497052 0.737431126
#>  [400,] 7.922510e-01 5.400723e-01 0.5422129 0.66075366 0.61573657 0.733246334
#>  [401,] 7.905805e-01 3.778856e-01 0.4807501 0.63486492 0.61306855 0.826568789
#>  [402,] 7.810173e-01 3.394709e-01 0.4651009 0.62560804 0.61224396 0.438642448
#>  [403,] 7.477782e-01 2.810227e-01 0.4379538 0.60692972 0.61056128 0.207739953
#>  [404,] 7.208828e-01 2.519528e-01 0.4222356 0.59474004 0.60938294 0.187739953
#>  [405,] 7.383663e-01 2.707400e-01 0.4303636 0.60267230 0.61012857 0.203622306
#>  [406,] 7.696499e-01 3.173708e-01 0.4512614 0.61886031 0.61186249 0.329858134
#>  [407,] 7.543554e-01 2.915208e-01 0.4397846 0.61044843 0.61093925 0.233622306
#>  [408,] 7.857210e-01 4.291308e-01 0.4872942 0.64318224 0.35844917 0.470370180
#>  [409,] 2.812100e-01 7.170557e-02 0.6899671 0.58151628 0.10224175 0.094166667
#>  [410,]           NA           NA        NA         NA         NA          NA
#>  [411,] 1.075597e-01 2.742810e-02 0.6702648 0.45584778 0.10927799 0.140807018
#>  [412,]           NA           NA        NA         NA         NA          NA
#>  [413,]           NA           NA        NA         NA         NA          NA
#>  [414,]           NA           NA        NA         NA         NA          NA
#>  [415,]           NA           NA        NA         NA         NA          NA
#>  [416,]           NA           NA        NA         NA         NA          NA
#>  [417,]           NA           NA        NA         NA         NA          NA
#>  [418,]           NA           NA        NA         NA         NA          NA
#>  [419,]           NA           NA        NA         NA         NA          NA
#>  [420,]           NA           NA        NA         NA         NA          NA
#>  [421,]           NA           NA        NA         NA         NA          NA
#>  [422,]           NA           NA        NA         NA         NA          NA
#>  [423,]           NA           NA        NA         NA         NA          NA
#>  [424,]           NA           NA        NA         NA         NA          NA
#>  [425,]           NA           NA        NA         NA         NA          NA
#>  [426,]           NA           NA        NA         NA         NA          NA
#>  [427,]           NA           NA        NA         NA         NA          NA
#>  [428,] 2.593736e-01 6.613457e-02 0.6860266 0.56996211 0.10208981 0.094166667
#>  [429,] 8.661625e-01 6.942289e-01 0.8766928 0.91085331 0.17444720 0.757896813
#>  [430,] 7.898734e-01 7.303090e-01 0.6216887 0.66708820 0.61579717 0.696374536
#>  [431,] 7.913984e-01 6.064706e-01 0.5679398 0.66594260 0.61674042 0.781181126
#>  [432,] 7.913489e-01 4.719949e-01 0.5139297 0.65159243 0.61526585 0.676556163
#>  [433,] 7.907715e-01 4.441652e-01 0.5023069 0.64698671 0.61494764 0.793889496
#>  [434,] 7.897877e-01 4.192142e-01 0.4911610 0.64237501 0.61466947 0.867083941
#>  [435,] 7.758564e-01 3.321019e-01 0.4566257 0.62301115 0.61236334 0.445358134
#>  [436,] 7.680653e-01 3.155615e-01 0.4488685 0.61813963 0.61179676 0.260011195
#>  [437,] 7.833813e-01 3.557911e-01 0.4659917 0.62910187 0.61311138 0.627637896
#>  [438,] 7.850500e-01 3.637375e-01 0.4688240 0.63094556 0.35109480 0.372870180
#>  [439,] 4.742545e-01 1.232403e-01 0.3431519 0.50126099 0.21005882 0.047073643
#>  [440,] 5.465474e-02 1.393854e-02 0.2285000 0.29041706 0.57793993 0.040000000
#>  [441,] 4.109386e-04 1.047919e-04 0.5736923 0.11372865 0.07622140 0.043000000
#>  [442,]           NA           NA        NA         NA         NA          NA
#>  [443,]           NA           NA        NA         NA         NA          NA
#>  [444,]           NA           NA        NA         NA         NA          NA
#>  [445,]           NA           NA        NA         NA         NA          NA
#>  [446,]           NA           NA        NA         NA         NA          NA
#>  [447,]           NA           NA        NA         NA         NA          NA
#>  [448,]           NA           NA        NA         NA         NA          NA
#>  [449,]           NA           NA        NA         NA         NA          NA
#>  [450,]           NA           NA        NA         NA         NA          NA
#>  [451,]           NA           NA        NA         NA         NA          NA
#>  [452,]           NA           NA        NA         NA         NA          NA
#>  [453,]           NA           NA        NA         NA         NA          NA
#>  [454,]           NA           NA        NA         NA         NA          NA
#>  [455,]           NA           NA        NA         NA         NA          NA
#>  [456,]           NA           NA        NA         NA         NA          NA
#>  [457,] 9.296037e-04 2.370313e-04 0.5547219 0.13960852 0.11040074 0.005833333
#>  [458,] 8.644323e-01 6.337335e-01 0.8645850 0.90638515 0.17010399 0.897813479
#>  [459,] 8.657221e-01 8.380710e-01 0.9025039 0.91218426 0.19055520 0.585220495
#>  [460,] 7.894682e-01 6.886509e-01 0.6009307 0.66663211 0.61781365 0.718280333
#>  [461,] 7.894244e-01 6.079778e-01 0.5651213 0.66542032 0.61818985 0.781181126
#>  [462,] 7.889977e-01 6.055445e-01 0.5633464 0.66517050 0.61844857 0.781181126
#>  [463,] 7.890842e-01 5.290989e-01 0.5320480 0.65868592 0.61729597 0.743712020
#>  [464,] 7.874115e-01 3.789484e-01 0.4744498 0.63429317 0.61380288 0.833284476
#>  [465,] 7.619092e-01 3.043893e-01 0.4438929 0.61462219 0.61138375 0.260011195
#>  [466,] 7.878431e-01 3.865385e-01 0.4766474 0.63579475 0.61404777 0.833284476
#>  [467,] 7.884351e-01 4.059659e-01 0.4837394 0.63959160 0.36853778 0.450370180
#>  [468,] 6.857286e-01 2.233776e-01 0.4031812 0.57995333 0.26675439 0.109831219
#>  [469,] 1.585595e-01 4.043389e-02 0.2660006 0.37909233 0.13541300 0.048000000
#>  [470,] 9.509653e-03 2.424919e-03 0.5987059 0.24946739 0.07441838 0.043000000
#>  [471,]           NA           NA        NA         NA         NA          NA
#>  [472,]           NA           NA        NA         NA         NA          NA
#>  [473,]           NA           NA        NA         NA         NA          NA
#>  [474,]           NA           NA        NA         NA         NA          NA
#>  [475,]           NA           NA        NA         NA         NA          NA
#>  [476,]           NA           NA        NA         NA         NA          NA
#>  [477,]           NA           NA        NA         NA         NA          NA
#>  [478,]           NA           NA        NA         NA         NA          NA
#>  [479,]           NA           NA        NA         NA         NA          NA
#>  [480,]           NA           NA        NA         NA         NA          NA
#>  [481,]           NA           NA        NA         NA         NA          NA
#>  [482,]           NA           NA        NA         NA         NA          NA
#>  [483,]           NA           NA        NA         NA         NA          NA
#>  [484,]           NA           NA        NA         NA         NA          NA
#>  [485,]           NA           NA        NA         NA         NA          NA
#>  [486,] 8.362053e-01 3.383391e-01 0.8044385 0.84111612 0.15692679 0.260011195
#>  [487,] 8.622730e-01 8.594601e-01 0.9060426 0.91146734 0.19718147 0.687558030
#>  [488,] 8.650366e-01 8.101077e-01 0.8966348 0.91138248 0.18558371 0.676374536
#>  [489,] 7.877525e-01 6.873978e-01 0.5975643 0.66605155 0.61941001 0.727496019
#>  [490,] 7.874006e-01 6.827042e-01 0.5948102 0.66590560 0.61975273 0.717496019
#>  [491,] 7.920619e-01 6.116840e-01 0.5646193 0.66540202 0.61572994 0.776408717
#>  [492,] 7.987648e-01 5.337531e-01 0.5326777 0.65895816 0.60709295 0.698246111
#>  [493,] 7.984291e-01 4.235328e-01 0.4902802 0.64244646 0.60340540 0.863833718
#>  [494,] 7.985900e-01 4.299712e-01 0.4929347 0.64363637 0.60364415 0.855083718
#>  [495,] 7.986770e-01 4.544202e-01 0.5021326 0.64782131 0.60449535 0.794639274
#>  [496,] 7.972768e-01 4.600037e-01 0.5016479 0.64838143 0.14460736 0.469279271
#>  [497,] 6.273688e-01 1.870058e-01 0.3775062 0.55591703 0.22529518 0.185809806
#>  [498,] 2.063874e-01 5.262545e-02 0.6875686 0.53853951 0.07811211 0.148333333
#>  [499,] 9.276146e-03 2.365423e-03 0.6111029 0.24703880 0.09782967 0.102473684
#>  [500,] 3.044637e-02 7.763949e-03 0.6313928 0.33249777 0.10131801 0.102473684
#>  [501,]           NA           NA        NA         NA         NA          NA
#>  [502,]           NA           NA        NA         NA         NA          NA
#>  [503,]           NA           NA        NA         NA         NA          NA
#>  [504,]           NA           NA        NA         NA         NA          NA
#>  [505,]           NA           NA        NA         NA         NA          NA
#>  [506,]           NA           NA        NA         NA         NA          NA
#>  [507,]           NA           NA        NA         NA         NA          NA
#>  [508,]           NA           NA        NA         NA         NA          NA
#>  [509,]           NA           NA        NA         NA         NA          NA
#>  [510,]           NA           NA        NA         NA         NA          NA
#>  [511,]           NA           NA        NA         NA         NA          NA
#>  [512,]           NA           NA        NA         NA         NA          NA
#>  [513,]           NA           NA        NA         NA         NA          NA
#>  [514,]           NA           NA        NA         NA         NA          NA
#>  [515,] 8.595547e-01 4.114188e-01 0.8200330 0.86464213 0.15942358 0.833284476
#>  [516,] 8.594270e-01 8.618591e-01 0.9072698 0.91094715 0.20262922 0.813735669
#>  [517,] 8.633385e-01 8.391891e-01 0.9014289 0.91115714 0.19049293 0.576649067
#>  [518,] 7.980030e-01 7.133458e-01 0.6079273 0.66685679 0.61117363 0.703275107
#>  [519,] 8.026755e-01 7.045068e-01 0.6036162 0.66716627 0.60676131 0.730252332
#>  [520,] 8.071442e-01 6.881253e-01 0.5967756 0.66751560 0.60169545 0.510063675
#>  [521,] 8.058890e-01 6.735141e-01 0.5882868 0.66702184 0.60168949 0.539174786
#>  [522,] 8.065421e-01 5.377299e-01 0.5335907 0.65920153 0.59614522 0.507751898
#>  [523,] 8.065657e-01 4.922568e-01 0.5162070 0.65332434 0.59416376 0.426811727
#>  [524,] 8.062764e-01 5.862506e-01 0.5523530 0.66387584 0.59820754 0.615853357
#>  [525,] 8.055439e-01 6.084396e-01 0.5601343 0.66520696 0.57494197 0.732565288
#>  [526,] 3.089483e-01 7.879227e-02 0.3082655 0.44625407 0.22130371 0.036666667
#>  [527,] 2.350781e-02 5.994542e-03 0.6113700 0.31279261 0.07578348 0.043000000
#>  [528,] 2.133626e-01 5.440544e-02 0.7030761 0.54107555 0.11761180 0.187807018
#>  [529,]           NA           NA        NA         NA         NA          NA
#>  [530,]           NA           NA        NA         NA         NA          NA
#>  [531,]           NA           NA        NA         NA         NA          NA
#>  [532,]           NA           NA        NA         NA         NA          NA
#>  [533,]           NA           NA        NA         NA         NA          NA
#>  [534,]           NA           NA        NA         NA         NA          NA
#>  [535,]           NA           NA        NA         NA         NA          NA
#>  [536,]           NA           NA        NA         NA         NA          NA
#>  [537,]           NA           NA        NA         NA         NA          NA
#>  [538,]           NA           NA        NA         NA         NA          NA
#>  [539,]           NA           NA        NA         NA         NA          NA
#>  [540,]           NA           NA        NA         NA         NA          NA
#>  [541,]           NA           NA        NA         NA         NA          NA
#>  [542,]           NA           NA        NA         NA         NA          NA
#>  [543,]           NA           NA        NA         NA         NA          NA
#>  [544,] 7.257236e-01 2.216557e-01 0.7706567 0.77183296 0.11767904 0.144498309
#>  [545,] 8.547700e-01 8.600442e-01 0.9069812 0.91020914 0.21154264 0.725925434
#>  [546,] 8.685305e-01 8.652604e-01 0.9058889 0.91171466 0.17981420 0.718290974
#>  [547,] 8.062752e-01 7.477184e-01 0.6231671 0.66764996 0.60326543 0.542932711
#>  [548,] 8.066346e-01 7.236853e-01 0.6121505 0.66756453 0.60275500 0.539534862
#>  [549,] 8.062025e-01 7.233262e-01 0.6113048 0.66741749 0.60298300 0.539534862
#>  [550,] 8.060828e-01 6.643081e-01 0.5845990 0.66704672 0.60131046 0.539174786
#>  [551,] 8.066865e-01 5.117682e-01 0.5238351 0.65603574 0.59503697 0.434811727
#>  [552,] 8.064517e-01 4.301647e-01 0.4930518 0.64332303 0.59137544 0.666811727
#>  [553,] 8.059419e-01 5.922787e-01 0.5542131 0.66424246 0.59847217 0.615853357
#>  [554,] 8.056165e-01 6.099051e-01 0.5608617 0.66531480 0.57670772 0.589408913
#>  [555,] 8.038336e-01 5.248778e-01 0.5238103 0.65695898 0.49918442 0.465033949
#>  [556,] 5.301819e-01 1.373003e-01 0.7513492 0.68426227 0.07644989 0.097333333
#>  [557,] 2.016160e-01 5.140957e-02 0.7003698 0.53348872 0.11671280 0.187807018
#>  [558,]           NA           NA        NA         NA         NA          NA
#>  [559,]           NA           NA        NA         NA         NA          NA
#>  [560,]           NA           NA        NA         NA         NA          NA
#>  [561,]           NA           NA        NA         NA         NA          NA
#>  [562,]           NA           NA        NA         NA         NA          NA
#>  [563,]           NA           NA        NA         NA         NA          NA
#>  [564,]           NA           NA        NA         NA         NA          NA
#>  [565,]           NA           NA        NA         NA         NA          NA
#>  [566,]           NA           NA        NA         NA         NA          NA
#>  [567,]           NA           NA        NA         NA         NA          NA
#>  [568,]           NA           NA        NA         NA         NA          NA
#>  [569,]           NA           NA        NA         NA         NA          NA
#>  [570,]           NA           NA        NA         NA         NA          NA
#>  [571,]           NA           NA        NA         NA         NA          NA
#>  [572,]           NA           NA        NA         NA         NA          NA
#>  [573,]           NA           NA        NA         NA         NA          NA
#>  [574,] 2.249552e-01 5.735829e-02 0.6736847 0.55048540 0.11191163 0.105833333
#>  [575,] 8.699472e-01 8.638662e-01 0.9040094 0.91101576 0.17062983 0.646030820
#>  [576,] 8.024503e-01 8.029956e-01 0.6520589 0.66757675 0.60401770 0.717600226
#>  [577,] 8.031796e-01 7.948611e-01 0.6454615 0.66741749 0.60468961 0.509679464
#>  [578,] 8.058445e-01 7.701022e-01 0.6340700 0.66777159 0.60347697 0.480763620
#>  [579,] 8.055437e-01 7.470907e-01 0.6217497 0.66740111 0.60373418 0.542932711
#>  [580,] 8.063490e-01 6.775267e-01 0.5907986 0.66719558 0.60168049 0.531174786
#>  [581,] 8.069366e-01 5.603404e-01 0.5431620 0.66173655 0.59711982 0.532751898
#>  [582,] 8.069510e-01 4.053424e-01 0.4852429 0.63888838 0.59047572 0.602629909
#>  [583,] 8.067499e-01 4.115586e-01 0.4869134 0.63999584 0.59064824 0.602629909
#>  [584,] 8.043559e-01 6.723241e-01 0.5852703 0.66649890 0.62100907 0.539174786
#>  [585,] 8.038171e-01 6.073380e-01 0.5567546 0.66462518 0.55978095 0.589408913
#>  [586,] 8.054546e-01 2.744445e-01 0.8076628 0.80772976 0.08724443 0.156856037
#>  [587,] 2.827827e-02 7.211048e-03 0.6298348 0.32641743 0.10101844 0.102473684
#>  [588,]           NA           NA        NA         NA         NA          NA
#>  [589,]           NA           NA        NA         NA         NA          NA
#>  [590,]           NA           NA        NA         NA         NA          NA
#>  [591,]           NA           NA        NA         NA         NA          NA
#>  [592,]           NA           NA        NA         NA         NA          NA
#>  [593,]           NA           NA        NA         NA         NA          NA
#>  [594,]           NA           NA        NA         NA         NA          NA
#>  [595,]           NA           NA        NA         NA         NA          NA
#>  [596,]           NA           NA        NA         NA         NA          NA
#>  [597,]           NA           NA        NA         NA         NA          NA
#>  [598,]           NA           NA        NA         NA         NA          NA
#>  [599,]           NA           NA        NA         NA         NA          NA
#>  [600,]           NA           NA        NA         NA         NA          NA
#>  [601,]           NA           NA        NA         NA         NA          NA
#>  [602,]           NA           NA        NA         NA         NA          NA
#>  [603,]           NA           NA        NA         NA         NA          NA
#>  [604,] 2.056496e-01 5.243857e-02 0.6693308 0.53796934 0.10695340 0.204166667
#>  [605,] 8.018118e-01 7.783856e-01 0.6330759 0.66658948 0.60631335 0.478846131
#>  [606,] 7.999968e-01 8.034189e-01 0.6541461 0.66723268 0.60467316 0.784211337
#>  [607,] 8.030695e-01 8.031948e-01 0.6527562 0.66775945 0.60342934 0.695266893
#>  [608,] 8.033255e-01 7.941889e-01 0.6451510 0.66744205 0.60462003 0.509679464
#>  [609,] 8.040722e-01 7.781306e-01 0.6360219 0.66731906 0.60471371 0.487417560
#>  [610,] 8.053027e-01 7.468837e-01 0.6212838 0.66731906 0.60388071 0.542932711
#>  [611,] 8.066750e-01 5.927792e-01 0.5556866 0.66449142 0.59845754 0.615853357
#>  [612,] 8.064498e-01 5.170686e-01 0.5254391 0.65666298 0.59523551 0.434811727
#>  [613,] 7.883986e-01 3.262670e-01 0.4568262 0.62043629 0.58709642 0.271324414
#>  [614,] 8.045464e-01 6.809073e-01 0.5893631 0.66660420 0.60232663 0.531174786
#>  [615,] 8.018982e-01 7.092354e-01 0.5980572 0.66587475 0.64132252 0.539534862
#>  [616,] 3.588605e-01 9.151063e-02 0.7227378 0.61814923 0.07569185 0.093333333
#>  [617,]           NA           NA        NA         NA         NA          NA
#>  [618,]           NA           NA        NA         NA         NA          NA
#>  [619,]           NA           NA        NA         NA         NA          NA
#>  [620,]           NA           NA        NA         NA         NA          NA
#>  [621,]           NA           NA        NA         NA         NA          NA
#>  [622,]           NA           NA        NA         NA         NA          NA
#>  [623,]           NA           NA        NA         NA         NA          NA
#>  [624,]           NA           NA        NA         NA         NA          NA
#>  [625,]           NA           NA        NA         NA         NA          NA
#>  [626,]           NA           NA        NA         NA         NA          NA
#>  [627,]           NA           NA        NA         NA         NA          NA
#>  [628,]           NA           NA        NA         NA         NA          NA
#>  [629,]           NA           NA        NA         NA         NA          NA
#>  [630,]           NA           NA        NA         NA         NA          NA
#>  [631,]           NA           NA        NA         NA         NA          NA
#>  [632,] 2.522160e-02 6.431659e-03 0.6040952 0.31815506 0.08422771 0.053000000
#>  [633,] 8.791956e-01 8.008991e-01 0.8909886 0.91079235 0.14211593 0.555254140
#>  [634,] 8.004681e-01 8.033085e-01 0.6525513 0.66718733 0.60505132 0.742044671
#>  [635,] 8.040422e-01 7.996817e-01 0.6502482 0.66785643 0.60331063 0.561510373
#>  [636,] 8.047350e-01 7.883505e-01 0.6430508 0.66773515 0.60378384 0.486346131
#>  [637,] 8.040844e-01 7.859948e-01 0.6407121 0.66747476 0.60446582 0.483846131
#>  [638,] 8.044472e-01 7.527604e-01 0.6229597 0.66709642 0.60447019 0.530932711
#>  [639,] 8.080633e-01 6.075054e-01 0.5640971 0.66589977 0.59883952 0.589408913
#>  [640,] 8.063176e-01 5.460047e-01 0.5364231 0.66007022 0.59648573 0.517751898
#>  [641,] 8.041316e-01 3.827145e-01 0.4753683 0.63412518 0.58909344 0.526919653
#>  [642,] 8.066459e-01 5.669808e-01 0.5452809 0.66230128 0.55291328 0.532751898
#>  [643,] 8.047901e-01 4.299556e-01 0.4899257 0.64288512 0.44967151 0.666811727
#>  [644,] 8.126257e-04 2.073119e-04 0.2042686 0.10086544 0.28891551 0.043000000
#>  [645,]           NA           NA        NA         NA         NA          NA
#>  [646,]           NA           NA        NA         NA         NA          NA
#>  [647,]           NA           NA        NA         NA         NA          NA
#>  [648,]           NA           NA        NA         NA         NA          NA
#>  [649,]           NA           NA        NA         NA         NA          NA
#>  [650,]           NA           NA        NA         NA         NA          NA
#>  [651,]           NA           NA        NA         NA         NA          NA
#>  [652,]           NA           NA        NA         NA         NA          NA
#>  [653,]           NA           NA        NA         NA         NA          NA
#>  [654,]           NA           NA        NA         NA         NA          NA
#>  [655,]           NA           NA        NA         NA         NA          NA
#>  [656,]           NA           NA        NA         NA         NA          NA
#>  [657,]           NA           NA        NA         NA         NA          NA
#>  [658,]           NA           NA        NA         NA         NA          NA
#>  [659,]           NA           NA        NA         NA         NA          NA
#>  [660,]           NA           NA        NA         NA         NA          NA
#>  [661,]           NA           NA        NA         NA         NA          NA
#>  [662,] 8.753365e-01 8.477661e-01 0.8977346 0.90974504 0.14654774 0.487417560
#>  [663,] 7.969542e-01 8.029218e-01 0.6557455 0.66717082 0.60326254 0.807016532
#>  [664,] 7.979579e-01 8.035851e-01 0.6570271 0.66739291 0.60256316 0.807016532
#>  [665,] 8.028549e-01 8.029972e-01 0.6523536 0.66768650 0.60367653 0.695266893
#>  [666,] 8.035185e-01 7.938122e-01 0.6451201 0.66749110 0.60448199 0.509679464
#>  [667,] 8.067783e-01 7.238046e-01 0.6124320 0.66761338 0.60267648 0.539534862
#>  [668,] 8.068331e-01 6.285745e-01 0.5706776 0.66660543 0.59983418 0.549186690
#>  [669,] 8.069123e-01 4.781832e-01 0.5115559 0.65133916 0.59361597 0.460811727
#>  [670,] 7.921052e-01 3.373432e-01 0.4584842 0.62323970 0.58695674 0.278824414
#>  [671,] 8.074531e-01 4.285984e-01 0.4943456 0.64328500 0.47309209 0.666811727
#>  [672,] 7.918353e-01 7.993791e-01 0.6481837 0.66599284 0.85716642 0.635348326
#>  [673,] 8.907572e-01 8.809893e-01 0.9075095 0.91301097 0.09864103 0.324267496
#>  [674,] 4.598543e-01 1.173096e-01 0.7482194 0.65554334 0.13502100 0.162807018
#>  [675,]           NA           NA        NA         NA         NA          NA
#>  [676,]           NA           NA        NA         NA         NA          NA
#>  [677,]           NA           NA        NA         NA         NA          NA
#>  [678,]           NA           NA        NA         NA         NA          NA
#>  [679,]           NA           NA        NA         NA         NA          NA
#>  [680,]           NA           NA        NA         NA         NA          NA
#>  [681,]           NA           NA        NA         NA         NA          NA
#>  [682,]           NA           NA        NA         NA         NA          NA
#>  [683,]           NA           NA        NA         NA         NA          NA
#>  [684,]           NA           NA        NA         NA         NA          NA
#>  [685,]           NA           NA        NA         NA         NA          NA
#>  [686,]           NA           NA        NA         NA         NA          NA
#>  [687,]           NA           NA        NA         NA         NA          NA
#>  [688,]           NA           NA        NA         NA         NA          NA
#>  [689,] 8.758523e-02 2.233255e-02 0.6270350 0.43495751 0.11323808 0.055833333
#>  [690,] 8.739919e-01 8.784004e-01 0.9083425 0.91170618 0.16114295 0.834849866
#>  [691,] 7.988643e-01 8.039456e-01 0.6575092 0.66749110 0.60258978 0.834849866
#>  [692,] 8.024567e-01 8.046937e-01 0.6548351 0.66775945 0.60318611 0.735378004
#>  [693,] 8.012191e-01 8.034266e-01 0.6522468 0.66731906 0.60472772 0.717600226
#>  [694,] 8.063391e-01 7.561396e-01 0.6274920 0.66775945 0.60323280 0.530932711
#>  [695,] 8.056949e-01 7.123524e-01 0.6054006 0.66717082 0.60297419 0.539534862
#>  [696,] 8.068403e-01 4.952285e-01 0.5178280 0.65381674 0.59434270 0.426811727
#>  [697,] 6.942175e-01 2.228564e-01 0.4062639 0.57789221 0.57969782 0.166998309
#>  [698,] 6.245299e-01 1.816403e-01 0.3810430 0.54998358 0.30588395 0.194998309
#>  [699,] 8.072712e-01 5.121130e-01 0.5250245 0.65623178 0.52114196 0.434811727
#>  [700,] 7.838149e-01 7.960144e-01 0.6316078 0.66553874 0.89900239 0.513681399
#>  [701,] 8.929243e-01 7.919804e-01 0.9007559 0.90968919 0.43910602 0.426929237
#>  [702,]           NA           NA        NA         NA         NA          NA
#>  [703,]           NA           NA        NA         NA         NA          NA
#>  [704,]           NA           NA        NA         NA         NA          NA
#>  [705,]           NA           NA        NA         NA         NA          NA
#>  [706,]           NA           NA        NA         NA         NA          NA
#>  [707,]           NA           NA        NA         NA         NA          NA
#>  [708,]           NA           NA        NA         NA         NA          NA
#>  [709,]           NA           NA        NA         NA         NA          NA
#>  [710,]           NA           NA        NA         NA         NA          NA
#>  [711,]           NA           NA        NA         NA         NA          NA
#>  [712,]           NA           NA        NA         NA         NA          NA
#>  [713,]           NA           NA        NA         NA         NA          NA
#>  [714,]           NA           NA        NA         NA         NA          NA
#>  [715,]           NA           NA        NA         NA         NA          NA
#>  [716,] 1.413504e-01 3.604398e-02 0.6551735 0.48945134 0.09465962 0.083000000
#>  [717,] 8.714642e-01 8.762715e-01 0.9068558 0.91065097 0.16113195 0.834849866
#>  [718,] 7.882143e-01 8.003696e-01 0.6393022 0.66722031 0.59410073 0.513681399
#>  [719,] 7.982995e-01 8.040415e-01 0.6579766 0.66757267 0.60162399 0.807016532
#>  [720,] 8.041287e-01 8.015282e-01 0.6519792 0.66796515 0.60288185 0.618395527
#>  [721,] 8.030120e-01 7.941743e-01 0.6447568 0.66734370 0.60489287 0.509679464
#>  [722,] 8.047343e-01 7.394034e-01 0.6167390 0.66705916 0.60408608 0.557754140
#>  [723,] 8.055039e-01 6.261918e-01 0.5674283 0.66609473 0.59993448 0.559186690
#>  [724,] 7.772328e-01 3.042523e-01 0.4450284 0.61305388 0.57800850 0.163977476
#>  [725,] 7.202902e-01 2.426843e-01 0.4142026 0.58798926 0.36030417 0.144498309
#>  [726,] 8.065743e-01 7.133201e-01 0.6016457 0.66654826 0.67298305 0.448368195
#>  [727,] 7.913769e-01 8.023840e-01 0.6403085 0.66631058 0.90354051 0.472903621
#>  [728,] 8.927007e-01 8.437495e-01 0.9060555 0.91222984 0.12705936 0.309134342
#>  [729,] 1.366142e-02 3.483722e-03 0.6162218 0.27213069 0.09872617 0.102473684
#>  [730,]           NA           NA        NA         NA         NA          NA
#>  [731,]           NA           NA        NA         NA         NA          NA
#>  [732,]           NA           NA        NA         NA         NA          NA
#>  [733,]           NA           NA        NA         NA         NA          NA
#>  [734,]           NA           NA        NA         NA         NA          NA
#>  [735,]           NA           NA        NA         NA         NA          NA
#>  [736,]           NA           NA        NA         NA         NA          NA
#>  [737,]           NA           NA        NA         NA         NA          NA
#>  [738,]           NA           NA        NA         NA         NA          NA
#>  [739,]           NA           NA        NA         NA         NA          NA
#>  [740,]           NA           NA        NA         NA         NA          NA
#>  [741,]           NA           NA        NA         NA         NA          NA
#>  [742,]           NA           NA        NA         NA         NA          NA
#>  [743,]           NA           NA        NA         NA         NA          NA
#>  [744,] 8.760612e-01 4.101240e-01 0.8205346 0.86337362 0.12643839 0.526919653
#>  [745,] 7.803180e-01 7.957687e-01 0.6177292 0.66639326 0.59271779 0.438276764
#>  [746,] 7.953059e-01 8.036789e-01 0.6552727 0.66773515 0.59750915 0.543199975
#>  [747,] 8.014813e-01 8.046561e-01 0.6563293 0.66768650 0.60308286 0.784211337
#>  [748,] 8.089195e-01 8.062761e-01 0.6510600 0.66788659 0.59803027 0.552203507
#>  [749,] 8.111574e-01 7.446953e-01 0.6188362 0.66753807 0.59532109 0.446544544
#>  [750,] 8.132738e-01 5.558946e-01 0.5420506 0.66128074 0.58536790 0.379514524
#>  [751,] 8.129670e-01 4.242832e-01 0.4924404 0.64214104 0.57817655 0.520796576
#>  [752,] 7.492564e-01 2.672046e-01 0.4282589 0.59894676 0.56763788 0.160644142
#>  [753,] 5.363194e-03 1.368172e-03 0.2013724 0.16170327 0.50725919 0.058333333
#>  [754,] 6.667902e-01 2.021856e-01 0.4045128 0.56488323 0.41456362 0.186949289
#>  [755,] 8.929153e-01 8.527154e-01 0.9031525 0.91331758 0.09519710 0.299005591
#>  [756,] 2.366059e-02 6.033553e-03 0.6259667 0.31218349 0.10036604 0.102473684
#>  [757,]           NA           NA        NA         NA         NA          NA
#>  [758,]           NA           NA        NA         NA         NA          NA
#>  [759,]           NA           NA        NA         NA         NA          NA
#>  [760,]           NA           NA        NA         NA         NA          NA
#>  [761,]           NA           NA        NA         NA         NA          NA
#>  [762,]           NA           NA        NA         NA         NA          NA
#>  [763,]           NA           NA        NA         NA         NA          NA
#>  [764,]           NA           NA        NA         NA         NA          NA
#>  [765,]           NA           NA        NA         NA         NA          NA
#>  [766,]           NA           NA        NA         NA         NA          NA
#>  [767,]           NA           NA        NA         NA         NA          NA
#>  [768,]           NA           NA        NA         NA         NA          NA
#>  [769,]           NA           NA        NA         NA         NA          NA
#>  [770,] 8.756464e-01 8.495658e-01 0.8982764 0.90992528 0.14685487 0.478846131
#>  [771,] 8.591590e-01 8.747152e-01 0.8929566 0.91142993 0.18248347 0.413776764
#>  [772,] 7.971344e-01 8.088595e-01 0.6468359 0.66837761 0.58826148 0.484820288
#>  [773,] 8.063751e-01 8.117050e-01 0.6625662 0.66847484 0.59546948 0.730041885
#>  [774,] 8.086074e-01 8.100592e-01 0.6550666 0.66804705 0.59778874 0.638572449
#>  [775,] 8.110438e-01 7.555834e-01 0.6239986 0.66760476 0.59583585 0.441723115
#>  [776,] 8.127533e-01 5.644593e-01 0.5444803 0.66201214 0.58569494 0.394514524
#>  [777,] 8.126064e-01 4.624706e-01 0.5055819 0.64858815 0.58004432 0.464796576
#>  [778,] 8.112823e-01 3.906010e-01 0.4799089 0.63561732 0.57618083 0.481463242
#>  [779,] 8.078663e-01 3.749714e-01 0.4722828 0.63202573 0.47068278 0.419252986
#>  [780,] 8.069592e-01 7.959267e-01 0.6408330 0.66691431 0.78752079 0.413318353
#>  [781,] 7.902990e-01 8.027634e-01 0.6337051 0.66618898 0.91654848 0.484820288
#>  [782,] 8.957049e-01 4.711480e-01 0.8459988 0.87924709 0.08169858 0.382672619
#>  [783,]           NA           NA        NA         NA         NA          NA
#>  [784,]           NA           NA        NA         NA         NA          NA
#>  [785,]           NA           NA        NA         NA         NA          NA
#>  [786,]           NA           NA        NA         NA         NA          NA
#>  [787,]           NA           NA        NA         NA         NA          NA
#>  [788,]           NA           NA        NA         NA         NA          NA
#>  [789,]           NA           NA        NA         NA         NA          NA
#>  [790,]           NA           NA        NA         NA         NA          NA
#>  [791,]           NA           NA        NA         NA         NA          NA
#>  [792,]           NA           NA        NA         NA         NA          NA
#>  [793,] 8.737258e-01 8.766166e-01 0.9049598 0.90999495 0.15130575 0.764211337
#>  [794,] 7.903299e-01 8.038639e-01 0.6314702 0.91218201 0.59416067 0.422951601
#>  [795,] 7.897791e-01 8.047167e-01 0.6268779 0.91323475 0.58670193 0.411637875
#>  [796,] 8.028996e-01 8.110413e-01 0.6596843 0.66852334 0.59270125 0.490391995
#>  [797,] 8.067341e-01 8.109478e-01 0.6600092 0.66813311 0.59730231 0.785988754
#>  [798,] 8.109738e-01 7.651908e-01 0.6287473 0.66768792 0.59624222 0.422389782
#>  [799,] 8.128026e-01 5.452380e-01 0.5370803 0.65999654 0.58465750 0.369514524
#>  [800,] 8.123046e-01 5.181609e-01 0.5258117 0.65659848 0.58298346 0.298796576
#>  [801,] 8.120071e-01 5.179843e-01 0.5252147 0.65649839 0.58285225 0.298796576
#>  [802,] 8.117392e-01 5.313583e-01 0.5298505 0.65809829 0.58350458 0.328796576
#>  [803,] 7.995390e-01 8.059895e-01 0.6513800 0.66641671 0.86490705 0.743988754
#>  [804,] 7.790666e-01 7.976091e-01 0.5972709 0.66620856 0.94797729 0.389137875
#>  [805,] 8.956631e-01 4.962224e-01 0.8490110 0.88484193 0.08160305 0.327198935
#>  [806,]           NA           NA        NA         NA         NA          NA
#>  [807,]           NA           NA        NA         NA         NA          NA
#>  [808,]           NA           NA        NA         NA         NA          NA
#>  [809,]           NA           NA        NA         NA         NA          NA
#>  [810,]           NA           NA        NA         NA         NA          NA
#>  [811,]           NA           NA        NA         NA         NA          NA
#>  [812,]           NA           NA        NA         NA         NA          NA
#>  [813,]           NA           NA        NA         NA         NA          NA
#>  [814,]           NA           NA        NA         NA         NA          NA
#>  [815,]           NA           NA        NA         NA         NA          NA
#>  [816,]           NA           NA        NA         NA         NA          NA
#>  [817,] 7.928177e-01 2.681869e-01 0.7866022 0.85670106 0.11196304 0.152831642
#>  [818,] 8.688730e-01 8.869993e-01 0.8987279 0.96565677 0.06361829 0.195261291
#>  [819,] 9.012875e-01 9.226100e-01 0.8983232 0.97114364 0.04344145 0.483804776
#>  [820,] 8.029879e-01 8.104972e-01 0.6594524 0.66823115 0.59483016 0.545415787
#>  [821,] 8.064826e-01 8.105021e-01 0.6587841 0.66796076 0.59793392 0.752560183
#>  [822,] 8.100809e-01 7.840177e-01 0.6376004 0.66766300 0.59729053 0.394389782
#>  [823,] 8.131586e-01 6.022658e-01 0.5602139 0.66532954 0.58781523 0.500615983
#>  [824,] 8.119038e-01 6.014018e-01 0.5577095 0.66490240 0.58755471 0.500615983
#>  [825,] 8.120186e-01 4.999177e-01 0.5184066 0.65407287 0.58183767 0.290796576
#>  [826,] 8.119502e-01 5.824621e-01 0.5501951 0.66344689 0.59868663 0.462065545
#>  [827,] 8.029559e-01 8.058861e-01 0.6468106 0.66626072 0.81622762 0.656350226
#>  [828,] 7.961663e-01 8.048809e-01 0.6473501 0.66626072 0.88686553 0.504338864
#>  [829,] 3.191238e-01 8.137748e-02 0.7248736 0.59827552 0.12530748 0.162807018
#>  [830,]           NA           NA        NA         NA         NA          NA
#>  [831,]           NA           NA        NA         NA         NA          NA
#>  [832,]           NA           NA        NA         NA         NA          NA
#>  [833,]           NA           NA        NA         NA         NA          NA
#>  [834,]           NA           NA        NA         NA         NA          NA
#>  [835,]           NA           NA        NA         NA         NA          NA
#>  [836,]           NA           NA        NA         NA         NA          NA
#>  [837,]           NA           NA        NA         NA         NA          NA
#>  [838,]           NA           NA        NA         NA         NA          NA
#>  [839,]           NA           NA        NA         NA         NA          NA
#>  [840,]           NA           NA        NA         NA         NA          NA
#>  [841,] 7.526017e-01 2.355589e-01 0.7794702 0.83256908 0.09688948 0.184164976
#>  [842,] 8.184188e-01 8.392669e-01 0.8900371 0.96110828 0.10595557 0.160518679
#>  [843,] 8.637432e-01 8.799211e-01 0.8937379 0.97248549 0.17553680 0.409137875
#>  [844,] 7.998350e-01 8.089901e-01 0.6540728 0.66789896 0.59474585 0.488505530
#>  [845,] 8.022861e-01 8.100058e-01 0.6582782 0.66807167 0.59538362 0.537338864
#>  [846,] 8.087155e-01 8.054498e-01 0.6501068 0.66778742 0.59822795 0.495318353
#>  [847,] 8.121221e-01 7.026645e-01 0.6008870 0.66756310 0.59306268 0.400826301
#>  [848,] 8.113026e-01 6.530091e-01 0.5780157 0.66700599 0.59041714 0.444937412
#>  [849,] 8.131513e-01 4.481530e-01 0.5013647 0.64636298 0.57955028 0.510796576
#>  [850,] 7.843339e-01 3.112863e-01 0.4501994 0.61533346 0.57188993 0.177310809
#>  [851,] 6.661805e-01 2.026095e-01 0.3989439 0.56476482 0.38544908 0.192831642
#>  [852,] 8.149545e-01 6.776162e-01 0.5945479 0.66839221 0.69463548 0.444937412
#>  [853,] 8.801537e-01 3.774691e-01 0.8348783 0.85130850 0.20795980 0.283557426
#>  [854,]           NA           NA        NA         NA         NA          NA
#>  [855,]           NA           NA        NA         NA         NA          NA
#>  [856,]           NA           NA        NA         NA         NA          NA
#>  [857,]           NA           NA        NA         NA         NA          NA
#>  [858,]           NA           NA        NA         NA         NA          NA
#>  [859,]           NA           NA        NA         NA         NA          NA
#>  [860,]           NA           NA        NA         NA         NA          NA
#>  [861,]           NA           NA        NA         NA         NA          NA
#>  [862,]           NA           NA        NA         NA         NA          NA
#>  [863,]           NA           NA        NA         NA         NA          NA
#>  [864,]           NA           NA        NA         NA         NA          NA
#>  [865,] 8.565528e-01 8.742387e-01 0.8867280 0.97005903 0.17814542 0.389137875
#>  [866,] 8.530151e-01 8.739064e-01 0.8793652 0.97210662 0.19040902 0.361137875
#>  [867,] 8.731169e-01 8.847218e-01 0.9047151 0.91382711 0.16295203 0.472320288
#>  [868,] 8.773845e-01 8.857906e-01 0.9088271 0.91345575 0.15447214 0.488505530
#>  [869,] 8.069762e-01 8.106909e-01 0.6586804 0.66802242 0.59779432 0.751469274
#>  [870,] 8.115965e-01 7.450690e-01 0.6196799 0.66768792 0.59518779 0.446544544
#>  [871,] 8.117577e-01 6.929261e-01 0.5959833 0.66738749 0.59261301 0.410826301
#>  [872,] 8.047443e-01 3.527858e-01 0.4696566 0.62744296 0.57539763 0.287157748
#>  [873,] 5.130566e-01 1.349399e-01 0.3563979 0.51013566 0.55543283 0.136500000
#>  [874,] 8.052328e-01 3.622921e-01 0.4681954 0.62917721 0.46719991 0.397395843
#>  [875,] 7.806550e-01 7.986115e-01 0.6019645 0.66636480 0.94627701 0.399137875
#>  [876,] 8.962593e-01 5.690136e-01 0.8627564 0.89833598 0.08356865 0.180005952
#>  [877,]           NA           NA        NA         NA         NA          NA
#>  [878,]           NA           NA        NA         NA         NA          NA
#>  [879,]           NA           NA        NA         NA         NA          NA
#>  [880,]           NA           NA        NA         NA         NA          NA
#>  [881,]           NA           NA        NA         NA         NA          NA
#>  [882,]           NA           NA        NA         NA         NA          NA
#>  [883,]           NA           NA        NA         NA         NA          NA
#>  [884,]           NA           NA        NA         NA         NA          NA
#>  [885,]           NA           NA        NA         NA         NA          NA
#>  [886,]           NA           NA        NA         NA         NA          NA
#>  [887,]           NA           NA        NA         NA         NA          NA
#>  [888,] 8.695214e-01 8.799195e-01 0.9030802 0.91088790 0.15729859 0.479153621
#>  [889,] 8.623933e-01 8.782992e-01 0.8931897 0.91223439 0.17383654 0.409137875
#>  [890,] 8.749581e-01 8.853518e-01 0.9066504 0.91375984 0.15971037 0.475820288
#>  [891,] 8.804527e-01 8.873502e-01 0.9107661 0.91396132 0.15123867 0.537338864
#>  [892,] 8.099946e-01 8.110413e-01 0.6572095 0.66849102 0.59652469 0.615736691
#>  [893,] 8.104728e-01 8.006773e-01 0.6484473 0.66815765 0.59711407 0.416651687
#>  [894,] 8.142499e-01 6.983879e-01 0.6024173 0.66825561 0.59241078 0.410826301
#>  [895,] 8.033506e-01 3.496269e-01 0.4677343 0.62655645 0.57498615 0.287157748
#>  [896,] 4.839974e-01 1.255611e-01 0.3474779 0.50086693 0.55229210 0.136500000
#>  [897,] 8.073827e-01 3.714705e-01 0.4714739 0.63129746 0.47127781 0.419252986
#>  [898,] 7.942213e-01 8.047003e-01 0.6432617 0.66649443 0.90430150 0.497172197
#>  [899,] 8.942876e-01 7.934397e-01 0.8972868 0.91308282 0.09193155 0.268898886
#>  [900,]           NA           NA        NA         NA         NA          NA
#>  [901,]           NA           NA        NA         NA         NA          NA
#>  [902,]           NA           NA        NA         NA         NA          NA
#>  [903,]           NA           NA        NA         NA         NA          NA
#>  [904,]           NA           NA        NA         NA         NA          NA
#>  [905,]           NA           NA        NA         NA         NA          NA
#>  [906,]           NA           NA        NA         NA         NA          NA
#>  [907,]           NA           NA        NA         NA         NA          NA
#>  [908,]           NA           NA        NA         NA         NA          NA
#>  [909,]           NA           NA        NA         NA         NA          NA
#>  [910,]           NA           NA        NA         NA         NA          NA
#>  [911,] 8.895224e-01 8.851133e-01 0.9063871 0.91227267 0.11097580 0.454281113
#>  [912,] 8.547613e-01 8.734043e-01 0.8840308 0.91110322 0.18131161 0.369137875
#>  [913,] 8.668104e-01 8.814135e-01 0.8977431 0.91328585 0.17088529 0.411637875
#>  [914,] 8.025765e-01 8.109510e-01 0.6591509 0.66852334 0.59242352 0.490391995
#>  [915,] 8.100797e-01 8.118497e-01 0.6585300 0.66859594 0.59618955 0.615736691
#>  [916,] 8.066179e-01 8.117968e-01 0.6626820 0.66849910 0.59546334 0.757875219
#>  [917,] 8.107737e-01 8.090427e-01 0.6555325 0.66857176 0.59628266 0.529367749
#>  [918,] 8.141482e-01 4.882789e-01 0.5179170 0.65294436 0.58209989 0.324796576
#>  [919,] 5.012440e-01 1.310661e-01 0.3518395 0.50630727 0.55350370 0.136500000
#>  [920,] 4.498401e-01 1.153065e-01 0.3442405 0.49056914 0.55385584 0.132500000
#>  [921,] 8.004930e-01 8.065557e-01 0.6524668 0.66659777 0.86266380 0.753988754
#>  [922,] 8.935466e-01 8.236748e-01 0.9017943 0.91304080 0.09427807 0.304062609
#>  [923,]           NA           NA        NA         NA         NA          NA
#>  [924,]           NA           NA        NA         NA         NA          NA
#>  [925,]           NA           NA        NA         NA         NA          NA
#>  [926,]           NA           NA        NA         NA         NA          NA
#>  [927,]           NA           NA        NA         NA         NA          NA
#>  [928,]           NA           NA        NA         NA         NA          NA
#>  [929,]           NA           NA        NA         NA         NA          NA
#>  [930,]           NA           NA        NA         NA         NA          NA
#>  [931,]           NA           NA        NA         NA         NA          NA
#>  [932,]           NA           NA        NA         NA         NA          NA
#>  [933,]           NA           NA        NA         NA         NA          NA
#>  [934,] 8.764168e-01 8.816748e-01 0.9070270 0.91080690 0.14504176 0.753988754
#>  [935,] 8.645576e-01 8.782187e-01 0.8973119 0.91113900 0.16629611 0.420951601
#>  [936,] 7.941735e-01 8.071661e-01 0.6392740 0.66804705 0.58808801 0.432042510
#>  [937,] 8.049847e-01 8.115022e-01 0.6621487 0.66849910 0.59447274 0.628758295
#>  [938,] 8.068449e-01 8.125870e-01 0.6644601 0.66883663 0.59356863 0.730041885
#>  [939,] 8.107071e-01 8.030440e-01 0.6504375 0.66830447 0.59684791 0.416651687
#>  [940,] 8.141835e-01 5.790694e-01 0.5527472 0.66378079 0.58676145 0.462065545
#>  [941,] 7.866285e-01 3.165935e-01 0.4504633 0.61678662 0.57140350 0.194810809
#>  [942,] 4.493130e-01 1.151808e-01 0.3424914 0.49032991 0.55260625 0.132500000
#>  [943,] 8.078224e-01 7.798241e-01 0.6321395 0.66685466 0.76186221 0.394389782
#>  [944,] 8.942795e-01 7.987055e-01 0.8936814 0.91309096 0.09654306 0.359536313
#>  [945,] 3.989149e-02 1.017250e-02 0.6379162 0.35573254 0.10251933 0.102473684
#>  [946,]           NA           NA        NA         NA         NA          NA
#>  [947,]           NA           NA        NA         NA         NA          NA
#>  [948,]           NA           NA        NA         NA         NA          NA
#>  [949,]           NA           NA        NA         NA         NA          NA
#>  [950,]           NA           NA        NA         NA         NA          NA
#>  [951,]           NA           NA        NA         NA         NA          NA
#>  [952,]           NA           NA        NA         NA         NA          NA
#>  [953,]           NA           NA        NA         NA         NA          NA
#>  [954,]           NA           NA        NA         NA         NA          NA
#>  [955,] 1.542658e-01 3.933869e-02 0.6788255 0.53263385 0.07453378 0.100807018
#>  [956,] 8.955819e-01 5.960329e-01 0.8595975 0.96037073 0.09698377 0.358319661
#>  [957,] 7.522897e-01 7.590721e-01 0.6394101 0.90708565 0.62611899 0.289741405
#>  [958,] 7.939759e-01 8.079159e-01 0.6367251 0.66862010 0.58204066 0.407004732
#>  [959,] 8.029705e-01 8.114701e-01 0.6599186 0.66874059 0.59107749 0.490391995
#>  [960,] 8.082100e-01 8.121237e-01 0.6620800 0.66855966 0.59587303 0.728613314
#>  [961,] 8.126367e-01 7.286581e-01 0.6135187 0.66790309 0.59414267 0.429325266
#>  [962,] 8.033369e-01 3.522122e-01 0.4667624 0.62698628 0.57443201 0.287157748
#>  [963,] 3.965904e-01 1.011220e-01 0.3339746 0.47475126 0.55197805 0.132500000
#>  [964,] 8.139782e-01 6.074568e-01 0.5637261 0.66592082 0.63322122 0.500615983
#>  [965,] 8.924473e-01 8.553154e-01 0.9033860 0.91315196 0.09535696 0.299005591
#>  [966,] 5.996724e-03 1.529188e-03 0.6057351 0.22150525 0.09705944 0.102473684
#>  [967,]           NA           NA        NA         NA         NA          NA
#>  [968,]           NA           NA        NA         NA         NA          NA
#>  [969,]           NA           NA        NA         NA         NA          NA
#>  [970,]           NA           NA        NA         NA         NA          NA
#>  [971,]           NA           NA        NA         NA         NA          NA
#>  [972,]           NA           NA        NA         NA         NA          NA
#>  [973,]           NA           NA        NA         NA         NA          NA
#>  [974,]           NA           NA        NA         NA         NA          NA
#>  [975,] 2.874509e-01 7.321824e-02 0.2808734 0.63831884 0.15187849 0.054333333
#>  [976,] 5.949698e-01 6.093667e-01 0.5819428 0.64861426 0.70799866 0.212592658
#>  [977,] 8.017807e-01 8.116111e-01 0.6573617 0.66902774 0.58735979 0.483225328
#>  [978,] 8.113552e-01 8.110950e-01 0.6582331 0.66886059 0.59541312 0.593403357
#>  [979,] 8.132832e-01 7.369156e-01 0.6183814 0.66818217 0.59423480 0.419325266
#>  [980,] 7.610765e-01 2.785327e-01 0.4377202 0.60394902 0.57045042 0.157310809
#>  [981,] 4.681335e-01 1.206132e-01 0.3489428 0.49617565 0.55523428 0.136500000
#>  [982,] 8.132537e-01 4.088671e-01 0.4876531 0.63937139 0.57757354 0.471463242
#>  [983,] 8.918678e-01 8.645935e-01 0.9072859 0.91314210 0.09350665 0.274505591
#>  [984,] 8.541371e-01 8.764749e-01 0.8867412 0.90965309 0.90819044 0.870826539
#>  [985,] 8.947401e-01 4.830932e-01 0.8534142 0.87888361 0.24169762 0.445214569
#>  [986,]           NA           NA        NA         NA         NA          NA
#>  [987,]           NA           NA        NA         NA         NA          NA
#>  [988,]           NA           NA        NA         NA         NA          NA
#>  [989,]           NA           NA        NA         NA         NA          NA
#>  [990,]           NA           NA        NA         NA         NA          NA
#>  [991,] 1.603808e-04 4.089790e-05 0.5881199 0.09538361 0.09451046 0.102473684
#>  [992,] 7.964328e-01 3.842842e-01 0.4671831 0.63354923 0.37501474 0.831429678
#>  [993,] 7.064782e-01 6.744690e-01 0.5849618 0.89038152 0.52146084 0.719846154
#>  [994,] 7.123532e-01 7.211975e-01 0.6332211 0.66140404 0.62678543 0.221451693
#>  [995,] 8.065191e-01 8.126548e-01 0.6645650 0.66889649 0.59293258 0.720041885
#>  [996,] 8.087457e-01 8.122203e-01 0.6615451 0.66858385 0.59594748 0.686236691
#>  [997,] 8.118594e-01 7.728007e-01 0.6339887 0.66807577 0.59603234 0.412389782
#>  [998,] 8.133502e-01 6.162294e-01 0.5662009 0.66627264 0.58856960 0.486171539
#>  [999,] 8.136095e-01 4.042857e-01 0.4870646 0.63862848 0.57765086 0.471463242
#> [1000,] 8.128129e-01 4.652657e-01 0.5069825 0.64908668 0.53094288 0.464796576
#> [1001,] 8.916131e-01 8.751328e-01 0.9060264 0.91305499 0.10056531 0.355600829
#> [1002,] 4.352534e-01 1.109915e-01 0.7444951 0.64653060 0.13333354 0.162807018
#> [1003,]           NA           NA        NA         NA         NA          NA
#> [1004,]           NA           NA        NA         NA         NA          NA
#> [1005,]           NA           NA        NA         NA         NA          NA
#> [1006,]           NA           NA        NA         NA         NA          NA
#> [1007,]           NA           NA        NA         NA         NA          NA
#> [1008,]           NA           NA        NA         NA         NA          NA
#> [1009,]           NA           NA        NA         NA         NA          NA
#> [1010,]           NA           NA        NA         NA         NA          NA
#> [1011,] 8.379076e-01 3.076487e-01 0.8032940 0.82580260 0.09267268 0.205097631
#> [1012,] 7.992850e-01 8.049618e-01 0.6491956 0.66597281 0.84981292 0.781822088
#> [1013,] 8.141428e-01 8.185845e-01 0.6844845 0.66803359 0.86154177 0.650305027
#> [1014,] 8.108937e-01 8.185661e-01 0.6845844 0.66829566 0.52231618 0.582265811
#> [1015,] 8.154274e-01 8.210137e-01 0.6900854 0.66900789 0.51723563 0.633524825
#> [1016,] 8.185325e-01 8.214362e-01 0.6876775 0.66905638 0.50750165 0.516084099
#> [1017,] 8.207375e-01 7.850478e-01 0.6636776 0.66849383 0.48472372 0.338454070
#> [1018,] 8.227394e-01 6.915264e-01 0.6244744 0.66841967 0.46218112 0.303112812
#> [1019,] 8.220899e-01 6.451013e-01 0.6044254 0.66760816 0.45110680 0.330362812
#> [1020,] 8.112932e-01 8.158386e-01 0.6683113 0.66827047 0.88861905 0.631471017
#> [1021,] 8.773632e-01 8.820389e-01 0.9071784 0.91094183 0.14388651 0.781822088
#> [1022,] 7.136725e-01 2.121630e-01 0.7908913 0.76022577 0.16044893 0.236856037
#> [1023,]           NA           NA        NA         NA         NA          NA
#> [1024,]           NA           NA        NA         NA         NA          NA
#> [1025,]           NA           NA        NA         NA         NA          NA
#> [1026,]           NA           NA        NA         NA         NA          NA
#> [1027,]           NA           NA        NA         NA         NA          NA
#> [1028,]           NA           NA        NA         NA         NA          NA
#> [1029,]           NA           NA        NA         NA         NA          NA
#> [1030,]           NA           NA        NA         NA         NA          NA
#> [1031,]           NA           NA        NA         NA         NA          NA
#> [1032,]           NA           NA        NA         NA         NA          NA
#> [1033,] 5.337884e-01 1.384544e-01 0.7511140 0.68552397 0.07640382 0.106807018
#> [1034,] 8.067598e-01 8.154668e-01 0.6776666 0.66725960 0.88834374 0.569265811
#> [1035,] 8.115180e-01 8.178289e-01 0.6840325 0.66787024 0.51643746 0.656138360
#> [1036,] 8.092934e-01 8.176611e-01 0.6820742 0.66804612 0.52395549 0.569265811
#> [1037,] 8.113718e-01 8.183788e-01 0.6848009 0.66814618 0.51972801 0.592265811
#> [1038,] 8.122171e-01 8.195796e-01 0.6867476 0.66864161 0.52212923 0.582265811
#> [1039,] 8.197622e-01 8.072180e-01 0.6747319 0.66859243 0.49347017 0.344382642
#> [1040,] 8.226664e-01 6.742958e-01 0.6172224 0.66832050 0.45830697 0.316112812
#> [1041,] 8.207616e-01 6.843856e-01 0.6183485 0.66771868 0.45666870 0.316112812
#> [1042,] 8.191190e-01 7.132583e-01 0.6280764 0.66731094 0.74771345 0.283112812
#> [1043,] 8.891693e-01 8.921630e-01 0.9169751 0.91197543 0.30354370 0.577928404
#> [1044,] 8.948477e-01 6.069637e-01 0.8733666 0.90071949 0.29501694 0.379547902
#> [1045,]           NA           NA        NA         NA         NA          NA
#> [1046,]           NA           NA        NA         NA         NA          NA
#> [1047,]           NA           NA        NA         NA         NA          NA
#> [1048,]           NA           NA        NA         NA         NA          NA
#> [1049,]           NA           NA        NA         NA         NA          NA
#> [1050,]           NA           NA        NA         NA         NA          NA
#> [1051,]           NA           NA        NA         NA         NA          NA
#> [1052,]           NA           NA        NA         NA         NA          NA
#> [1053,]           NA           NA        NA         NA         NA          NA
#> [1054,]           NA           NA        NA         NA         NA          NA
#> [1055,]           NA           NA        NA         NA         NA          NA
#> [1056,] 8.098893e-01 8.152795e-01 0.6789316 0.66684595 0.85639389 0.650305027
#> [1057,] 8.037839e-01 8.152025e-01 0.6708729 0.66766800 0.53210986 0.613422674
#> [1058,] 8.081405e-01 8.173494e-01 0.6800915 0.66805865 0.52655628 0.555932478
#> [1059,] 8.055114e-01 8.163900e-01 0.6744584 0.66800852 0.53113386 0.573422674
#> [1060,] 8.062662e-01 8.169081e-01 0.6759936 0.66815866 0.53070707 0.573422674
#> [1061,] 8.126915e-01 8.192481e-01 0.6866440 0.66842792 0.51895673 0.632265811
#> [1062,] 8.191329e-01 7.902424e-01 0.6642041 0.66804612 0.48471928 0.330454070
#> [1063,] 8.210881e-01 6.984220e-01 0.6247599 0.66789542 0.46055352 0.293112812
#> [1064,] 8.225520e-01 4.071758e-01 0.5172753 0.63871883 0.41463875 0.335325680
#> [1065,] 8.972962e-01 8.152253e-01 0.9048012 0.91324188 0.17479451 0.354037404
#> [1066,] 8.959220e-01 6.575244e-01 0.8800399 0.90784159 0.15719277 0.389918367
#> [1067,]           NA           NA        NA         NA         NA          NA
#> [1068,]           NA           NA        NA         NA         NA          NA
#> [1069,]           NA           NA        NA         NA         NA          NA
#> [1070,]           NA           NA        NA         NA         NA          NA
#> [1071,]           NA           NA        NA         NA         NA          NA
#> [1072,]           NA           NA        NA         NA         NA          NA
#> [1073,]           NA           NA        NA         NA         NA          NA
#> [1074,]           NA           NA        NA         NA         NA          NA
#> [1075,]           NA           NA        NA         NA         NA          NA
#> [1076,] 3.362457e-02 8.574452e-03 0.6320534 0.34108056 0.08708694 0.062473684
#> [1077,] 8.164463e-01 7.284346e-01 0.6307890 0.66650597 0.45939506 0.341651459
#> [1078,] 8.057623e-01 8.155634e-01 0.6757531 0.66747722 0.52718725 0.554599145
#> [1079,] 8.048903e-01 8.162263e-01 0.6728487 0.66804612 0.53234738 0.613422674
#> [1080,] 8.015412e-01 8.148616e-01 0.6637339 0.66802106 0.53686700 0.605406801
#> [1081,] 8.023124e-01 8.150673e-01 0.6661856 0.66794574 0.53561713 0.644256007
#> [1082,] 8.021344e-01 8.152582e-01 0.6651377 0.66812120 0.53648950 0.605406801
#> [1083,] 8.135279e-01 8.189469e-01 0.6860177 0.66822101 0.51425789 0.662805027
#> [1084,] 8.164634e-01 8.114724e-01 0.6738438 0.66769335 0.49352661 0.383549308
#> [1085,] 9.009964e-01 5.095538e-01 0.8603989 0.88782649 0.11235708 0.325325680
#> [1086,] 8.647510e-01 8.833238e-01 0.8968043 0.91210015 0.77625071 0.542502167
#> [1087,] 8.892500e-01 8.914732e-01 0.9159511 0.91165310 0.28464046 0.533364301
#> [1088,]           NA           NA        NA         NA         NA          NA
#> [1089,]           NA           NA        NA         NA         NA          NA
#> [1090,]           NA           NA        NA         NA         NA          NA
#> [1091,]           NA           NA        NA         NA         NA          NA
#> [1092,]           NA           NA        NA         NA         NA          NA
#> [1093,]           NA           NA        NA         NA         NA          NA
#> [1094,]           NA           NA        NA         NA         NA          NA
#> [1095,]           NA           NA        NA         NA         NA          NA
#> [1096,] 8.183466e-01 4.233336e-01 0.5145685 0.64063006 0.61659918 0.381325680
#> [1097,] 8.057123e-01 8.149710e-01 0.6758432 0.66715668 0.52473482 0.555932478
#> [1098,] 7.978693e-01 8.129271e-01 0.6533862 0.66779455 0.54021075 0.588335500
#> [1099,] 7.986927e-01 8.136136e-01 0.6551041 0.66802106 0.53990939 0.588335500
#> [1100,] 7.948879e-01 8.117906e-01 0.6430038 0.66800852 0.54292422 0.592502167
#> [1101,] 7.945839e-01 8.114017e-01 0.6427807 0.66781980 0.54300006 0.592502167
#> [1102,] 8.079099e-01 8.171879e-01 0.6796728 0.66800852 0.52666584 0.557932478
#> [1103,] 8.128716e-01 8.177549e-01 0.6833179 0.66774399 0.51046199 0.650305027
#> [1104,] 8.832804e-01 8.907715e-01 0.9097985 0.91324546 0.12884458 0.579380530
#> [1105,] 8.610870e-01 8.813949e-01 0.8920027 0.91217127 0.80841634 0.544502167
#> [1106,] 8.857271e-01 8.915602e-01 0.9174597 0.91186824 0.38566773 0.656138360
#> [1107,] 1.450514e-01 3.698875e-02 0.6829893 0.49122906 0.11242974 0.140807018
#> [1108,]           NA           NA        NA         NA         NA          NA
#> [1109,]           NA           NA        NA         NA         NA          NA
#> [1110,]           NA           NA        NA         NA         NA          NA
#> [1111,]           NA           NA        NA         NA         NA          NA
#> [1112,]           NA           NA        NA         NA         NA          NA
#> [1113,]           NA           NA        NA         NA         NA          NA
#> [1114,]           NA           NA        NA         NA         NA          NA
#> [1115,] 5.496036e-01 1.477516e-01 0.3848145 0.52018050 0.49810441 0.137473684
#> [1116,] 8.170674e-01 7.756419e-01 0.6538762 0.66715668 0.47600808 0.338454070
#> [1117,] 7.877798e-01 8.072075e-01 0.6229646 0.66723391 0.54692698 0.542502167
#> [1118,] 5.911714e-01 6.063126e-01 0.5730212 0.64767863 0.71741042 0.212592658
#> [1119,] 7.979229e-01 8.133276e-01 0.6524949 0.66807117 0.54069284 0.595002167
#> [1120,] 7.846038e-01 8.060195e-01 0.6109356 0.66773134 0.54742433 0.544502167
#> [1121,] 7.975467e-01 8.127792e-01 0.6523729 0.66779455 0.54051952 0.588335500
#> [1122,] 8.127850e-01 8.181536e-01 0.6844543 0.66792059 0.51303850 0.662805027
#> [1123,] 5.987991e-01 6.084212e-01 0.5972464 0.64711279 0.75144424 0.264759325
#> [1124,] 8.394674e-01 8.570288e-01 0.8844502 0.90929477 0.23502427 0.376225177
#> [1125,] 8.884125e-01 8.922128e-01 0.9174796 0.91202892 0.32550867 0.628305027
#> [1126,] 3.059588e-01 7.802050e-02 0.7223019 0.59200422 0.12438641 0.162807018
#> [1127,]           NA           NA        NA         NA         NA          NA
#> [1128,]           NA           NA        NA         NA         NA          NA
#> [1129,]           NA           NA        NA         NA         NA          NA
#> [1130,]           NA           NA        NA         NA         NA          NA
#> [1131,]           NA           NA        NA         NA         NA          NA
#> [1132,]           NA           NA        NA         NA         NA          NA
#> [1133,]           NA           NA        NA         NA         NA          NA
#> [1134,]           NA           NA        NA         NA         NA          NA
#> [1135,]           NA           NA        NA         NA         NA          NA
#> [1136,]           NA           NA        NA         NA         NA          NA
#> [1137,] 8.843905e-01 8.910341e-01 0.9170080 0.91170698 0.41124880 0.592265811
#> [1138,] 7.911678e-01 8.088581e-01 0.6396412 0.66622415 0.53352286 0.872159873
#> [1139,] 8.004232e-01 8.143838e-01 0.6604154 0.66802106 0.53815061 0.594315892
#> [1140,] 7.964534e-01 8.125675e-01 0.6480075 0.66802106 0.54181732 0.592502167
#> [1141,] 7.863833e-01 8.071340e-01 0.6161216 0.66784503 0.54679498 0.544502167
#> [1142,] 7.911560e-01 8.095479e-01 0.6320156 0.66771868 0.54508953 0.572502167
#> [1143,] 8.072607e-01 8.168726e-01 0.6784334 0.66794574 0.52753158 0.554599145
#> [1144,] 5.902231e-01 6.053595e-01 0.5713728 0.64731079 0.72249076 0.212592658
#> [1145,] 3.952103e-02 1.005355e-02 0.2980128 0.26750257 0.61529709 0.053000000
#> [1146,] 8.792530e-01 8.894481e-01 0.9144467 0.91109188 0.68244263 0.643422674
#> [1147,] 8.945290e-01 6.079459e-01 0.8732773 0.90072938 0.29574665 0.379547902
#> [1148,]           NA           NA        NA         NA         NA          NA
#> [1149,]           NA           NA        NA         NA         NA          NA
#> [1150,]           NA           NA        NA         NA         NA          NA
#> [1151,]           NA           NA        NA         NA         NA          NA
#> [1152,]           NA           NA        NA         NA         NA          NA
#> [1153,]           NA           NA        NA         NA         NA          NA
#> [1154,]           NA           NA        NA         NA         NA          NA
#> [1155,]           NA           NA        NA         NA         NA          NA
#> [1156,]           NA           NA        NA         NA         NA          NA
#> [1157,] 8.931090e-01 8.213243e-01 0.9034594 0.91138275 0.18061508 0.356537404
#> [1158,] 8.641640e-01 8.830417e-01 0.8960070 0.91213573 0.78240467 0.542502167
#> [1159,] 8.754024e-01 8.895614e-01 0.9087188 0.91315511 0.66921179 0.588335500
#> [1160,] 7.995082e-01 8.139576e-01 0.6576912 0.66800433 0.53907280 0.582649225
#> [1161,] 7.924709e-01 8.105431e-01 0.6352353 0.66798342 0.54434548 0.572502167
#> [1162,] 7.989754e-01 8.137245e-01 0.6560306 0.66800852 0.53961251 0.585982559
#> [1163,] 8.013170e-01 8.147302e-01 0.6631591 0.66799597 0.53705163 0.596315892
#> [1164,] 5.996299e-01 6.096742e-01 0.5985807 0.64765424 0.69212835 0.256759325
#> [1165,] 7.521516e-01 7.748854e-01 0.5600754 0.66485947 0.94188635 0.366225177
#> [1166,] 8.783337e-01 8.890292e-01 0.9138682 0.91088773 0.72556140 0.710089341
#> [1167,]           NA           NA        NA         NA         NA          NA
#> [1168,]           NA           NA        NA         NA         NA          NA
#> [1169,]           NA           NA        NA         NA         NA          NA
#> [1170,]           NA           NA        NA         NA         NA          NA
#> [1171,]           NA           NA        NA         NA         NA          NA
#> [1172,]           NA           NA        NA         NA         NA          NA
#> [1173,]           NA           NA        NA         NA         NA          NA
#> [1174,]           NA           NA        NA         NA         NA          NA
#> [1175,]           NA           NA        NA         NA         NA          NA
#> [1176,]           NA           NA        NA         NA         NA          NA
#> [1177,] 2.201771e-01 5.614632e-02 0.7023727 0.54555548 0.09911283 0.177807018
#> [1178,] 8.577242e-01 8.791986e-01 0.8881182 0.91177872 0.82608109 0.544502167
#> [1179,] 8.664704e-01 8.846225e-01 0.8984653 0.91256041 0.76862029 0.572502167
#> [1180,] 7.983046e-01 8.132295e-01 0.6544608 0.66787024 0.53995719 0.588335500
#> [1181,] 7.931447e-01 8.109939e-01 0.6370782 0.66807117 0.54397136 0.582502167
#> [1182,] 7.938205e-01 8.115203e-01 0.6386764 0.66822101 0.54357836 0.582502167
#> [1183,] 7.924749e-01 8.106206e-01 0.6349956 0.66804612 0.54432313 0.572502167
#> [1184,] 5.960210e-01 6.084739e-01 0.5885405 0.64772733 0.73108862 0.231759325
#> [1185,] 8.141032e-01 8.171263e-01 0.6788812 0.66746446 0.84090664 0.540030968
#> [1186,] 7.276167e-01 2.198837e-01 0.7934345 0.76730813 0.14188011 0.246856037
#> [1187,]           NA           NA        NA         NA         NA          NA
#> [1188,]           NA           NA        NA         NA         NA          NA
#> [1189,]           NA           NA        NA         NA         NA          NA
#> [1190,]           NA           NA        NA         NA         NA          NA
#> [1191,]           NA           NA        NA         NA         NA          NA
#> [1192,]           NA           NA        NA         NA         NA          NA
#> [1193,]           NA           NA        NA         NA         NA          NA
#> [1194,] 3.492087e-01 8.905028e-02 0.7275184 0.61269818 0.08783174 0.112807018
#> [1195,] 8.799300e-01 8.895131e-01 0.9144445 0.91151512 0.51132363 0.554599145
#> [1196,] 8.340125e-01 8.541321e-01 0.8765124 0.90931244 0.24650315 0.356225177
#> [1197,] 7.942412e-01 8.100055e-01 0.6252478 0.66803200 0.58342266 0.468346209
#> [1198,] 7.987412e-01 8.139091e-01 0.6545009 0.66822101 0.54022891 0.588335500
#> [1199,] 7.927607e-01 8.110815e-01 0.6348787 0.66830808 0.54402700 0.572502167
#> [1200,] 7.857772e-01 8.072256e-01 0.6128072 0.66824591 0.54595129 0.544502167
#> [1201,] 7.884962e-01 8.073474e-01 0.6054032 0.66820071 0.96098743 0.445846209
#> [1202,] 8.042202e-01 8.149372e-01 0.6724355 0.66741337 0.90346670 0.573422674
#> [1203,] 8.929304e-01 8.339563e-01 0.9062879 0.91076189 0.30586709 0.377787404
#> [1204,]           NA           NA        NA         NA         NA          NA
#> [1205,]           NA           NA        NA         NA         NA          NA
#> [1206,]           NA           NA        NA         NA         NA          NA
#> [1207,]           NA           NA        NA         NA         NA          NA
#> [1208,]           NA           NA        NA         NA         NA          NA
#> [1209,]           NA           NA        NA         NA         NA          NA
#> [1210,] 8.869432e-01 3.951292e-01 0.8360286 0.85841305 0.10417122 0.288835204
#> [1211,] 6.057305e-01 6.092908e-01 0.5999627 0.64688852 0.77597019 0.678317959
#> [1212,] 8.153042e-01 8.185610e-01 0.6824201 0.66799597 0.50465739 0.568697634
#> [1213,] 5.970654e-01 6.092359e-01 0.5909949 0.64794555 0.72970825 0.231759325
#> [1214,] 5.936014e-01 6.083085e-01 0.5786113 0.64830570 0.71082778 0.212592658
#> [1215,] 7.930152e-01 8.113167e-01 0.6353615 0.66839491 0.54384113 0.572502167
#> [1216,] 7.982862e-01 8.130113e-01 0.6549719 0.66771868 0.92768234 0.585982559
#> [1217,] 6.004670e-01 6.087142e-01 0.6003993 0.64701331 0.68546606 0.281092658
#> [1218,] 8.182903e-01 4.847843e-01 0.5365706 0.65079899 0.63783256 0.218659013
#> [1219,] 5.222760e-01 1.349303e-01 0.7578038 0.67888160 0.13972150 0.172807018
#> [1220,]           NA           NA        NA         NA         NA          NA
#> [1221,]           NA           NA        NA         NA         NA          NA
#> [1222,]           NA           NA        NA         NA         NA          NA
#> [1223,]           NA           NA        NA         NA         NA          NA
#> [1224,] 3.325443e-01 8.480054e-02 0.7238299 0.60545075 0.08338884 0.122807018
#> [1225,] 8.939261e-01 7.852547e-01 0.8981639 0.91141889 0.16398812 0.293112812
#> [1226,] 7.874003e-01 7.905682e-01 0.6462205 0.66571230 0.61488499 0.734354360
#> [1227,] 6.742762e-01 6.864855e-01 0.8830053 0.88667579 0.69973255 0.219259325
#> [1228,] 7.972575e-01 8.137579e-01 0.6481398 0.66864161 0.54162187 0.592502167
#> [1229,] 7.932810e-01 8.115133e-01 0.6360294 0.66844441 0.54368378 0.572502167
#> [1230,] 7.997484e-01 8.142635e-01 0.6579136 0.66814618 0.53916357 0.585982559
#> [1231,] 6.013967e-01 6.099413e-01 0.6023351 0.64750752 0.75176212 0.278092658
#> [1232,] 7.339878e-01 6.497027e-01 0.5771507 0.66027753 0.38866699 0.647417356
#> [1233,] 8.495084e-01 3.223635e-01 0.8221680 0.83059492 0.15352447 0.243557426
#> [1234,]           NA           NA        NA         NA         NA          NA
#> [1235,]           NA           NA        NA         NA         NA          NA
#> [1236,]           NA           NA        NA         NA         NA          NA
#> [1237,]           NA           NA        NA         NA         NA          NA
#> [1238,]           NA           NA        NA         NA         NA          NA
#> [1239,]           NA           NA        NA         NA         NA          NA
#> [1240,]           NA           NA        NA         NA         NA          NA
#> [1241,] 1.017553e-01 2.594820e-02 0.6641243 0.45030051 0.07891629 0.110807018
#> [1242,] 1.070843e-01 2.731818e-02 0.2782514 0.34113201 0.30521054 0.110807018
#> [1243,] 8.098469e-01 8.166162e-01 0.6816555 0.66745595 0.51681073 0.632265811
#> [1244,] 6.661739e-01 6.824015e-01 0.8714831 0.88631454 0.71073094 0.212592658
#> [1245,] 5.935876e-01 6.084709e-01 0.5780749 0.64842477 0.70799872 0.212592658
#> [1246,] 7.990282e-01 8.143994e-01 0.6543986 0.66848560 0.54034532 0.595002167
#> [1247,] 7.954958e-01 8.121047e-01 0.6449223 0.66802106 0.54251868 0.592502167
#> [1248,] 6.062862e-01 6.111974e-01 0.6063859 0.64761763 0.76489624 0.563264037
#> [1249,] 6.121803e-01 3.275319e-01 0.4367319 0.62406773 0.53420380 0.686285912
#> [1250,] 3.329983e-02 8.491648e-03 0.6294220 0.34058406 0.07702981 0.062473684
#> [1251,]           NA           NA        NA         NA         NA          NA
#> [1252,]           NA           NA        NA         NA         NA          NA
#> [1253,]           NA           NA        NA         NA         NA          NA
#> [1254,] 6.830104e-01 2.120386e-01 0.4233073 0.56907573 0.36613382 0.166856037
#> [1255,] 7.942998e-01 8.104736e-01 0.6443467 0.66720819 0.54232183 0.592502167
#> [1256,] 5.819934e-01 6.018742e-01 0.5406799 0.64782451 0.68579661 0.207592658
#> [1257,] 6.642555e-01 6.817613e-01 0.8678834 0.88667579 0.71116313 0.202592658
#> [1258,] 7.991795e-01 8.144643e-01 0.6548913 0.66848148 0.54022314 0.595002167
#> [1259,] 7.948099e-01 8.115446e-01 0.6434114 0.66784503 0.54286042 0.592502167
#> [1260,] 6.054094e-01 6.102259e-01 0.6041791 0.64726141 0.76854573 0.563264037
#> [1261,] 6.105550e-01 5.531933e-01 0.5564091 0.64671296 0.61124021 0.888257829
#> [1262,] 8.176457e-01 5.489849e-01 0.5594354 0.65901964 0.65885202 0.265659013
#> [1263,] 1.546504e-02 3.943649e-03 0.6182264 0.28070014 0.09905047 0.102473684
#> [1264,]           NA           NA        NA         NA         NA          NA
#> [1265,]           NA           NA        NA         NA         NA          NA
#> [1266,]           NA           NA        NA         NA         NA          NA
#> [1267,] 8.127423e-01 3.719704e-01 0.4952047 0.63015154 0.59602519 0.288835204
#> [1268,] 7.858694e-01 8.060248e-01 0.6173198 0.66709650 0.94665434 0.542502167
#> [1269,] 7.603035e-01 7.807180e-01 0.5819385 0.66602467 0.57422889 0.356225177
#> [1270,] 5.883690e-01 6.057353e-01 0.5608124 0.64825793 0.69526002 0.212592658
#> [1271,] 8.065711e-01 8.180524e-01 0.6755002 0.66878866 0.53325938 0.613422674
#> [1272,] 7.984152e-01 8.133318e-01 0.6546634 0.66790801 0.53993390 0.588335500
#> [1273,] 8.006099e-01 8.136440e-01 0.6628126 0.66746446 0.53591998 0.631756007
#> [1274,] 8.117015e-01 8.118070e-01 0.6506139 0.66734805 0.84361721 0.690209353
#> [1275,] 8.145932e-01 7.745156e-01 0.6499800 0.66632145 0.77244876 0.338454070
#> [1276,]           NA           NA        NA         NA         NA          NA
#> [1277,]           NA           NA        NA         NA         NA          NA
#> [1278,]           NA           NA        NA         NA         NA          NA
#> [1279,] 6.544875e-02 1.669663e-02 0.2618591 0.30162190 0.39179846 0.110807018
#> [1280,] 7.927058e-01 8.094212e-01 0.6400893 0.66698874 0.93275426 0.592502167
#> [1281,] 5.783714e-01 5.999764e-01 0.5282711 0.64792138 0.67193440 0.197592658
#> [1282,] 7.949863e-01 8.128922e-01 0.6399196 0.66886192 0.54254095 0.572502167
#> [1283,] 8.071252e-01 8.184959e-01 0.6765992 0.66893499 0.53308409 0.613422674
#> [1284,] 8.121678e-01 8.192197e-01 0.6863304 0.66846913 0.52072178 0.592265811
#> [1285,] 7.987774e-01 8.125692e-01 0.6603504 0.66675694 0.53064475 0.689649225
#> [1286,] 8.875868e-01 8.585356e-01 0.6353662 0.91264792 0.77726734 0.441056448
#> [1287,] 8.112525e-01 8.132105e-01 0.6711665 0.66628177 0.82098759 0.506697634
#> [1288,]           NA           NA        NA         NA         NA          NA
#> [1289,]           NA           NA        NA         NA         NA          NA
#> [1290,]           NA           NA        NA         NA         NA          NA
#> [1291,] 9.092170e-02 2.319552e-02 0.2718675 0.32743949 0.39963006 0.110807018
#> [1292,] 7.932780e-01 8.094762e-01 0.6426404 0.66681992 0.54239772 0.595002167
#> [1293,] 7.844486e-01 8.059724e-01 0.6103202 0.66776928 0.54736982 0.544502167
#> [1294,] 5.787970e-01 6.006576e-01 0.5281920 0.64832955 0.66242510 0.197592658
#> [1295,] 8.037161e-01 8.171239e-01 0.6671505 0.66893499 0.53697377 0.596315892
#> [1296,] 8.129054e-01 8.189536e-01 0.6861769 0.66827080 0.51672538 0.656138360
#> [1297,] 7.931772e-01 8.098332e-01 0.6410326 0.66713090 0.54318071 0.592502167
#> [1298,] 7.996641e-01 8.117432e-01 0.6630526 0.66647967 0.53209074 0.613422674
#> [1299,] 8.017322e-01 8.122673e-01 0.6684189 0.66634787 0.52697238 0.564599145
#> [1300,] 1.757246e-01 4.481070e-02 0.6910994 0.51557645 0.10065377 0.140807018
#> [1301,]           NA           NA        NA         NA         NA          NA
#> [1302,]           NA           NA        NA         NA         NA          NA
#> [1303,]           NA           NA        NA         NA         NA          NA
#> [1304,] 8.174056e-01 6.986097e-01 0.6191628 0.66665023 0.73039419 0.293112812
#> [1305,] 7.924888e-01 8.104611e-01 0.6355987 0.66790801 0.54434898 0.582502167
#> [1306,] 7.657306e-01 7.844195e-01 0.5972679 0.66671294 0.57362093 0.356225177
#> [1307,] 7.990618e-01 8.152915e-01 0.6519391 0.66915313 0.54050026 0.568555297
#> [1308,] 8.067248e-01 8.175890e-01 0.6765458 0.66846913 0.53161245 0.573422674
#> [1309,] 9.224171e-01 9.419789e-01 0.9063738 0.97341741 0.12091808 0.481523776
#> [1310,] 8.783530e-01 8.835006e-01 0.6503873 0.97028614 0.85906013 0.800655421
#> [1311,] 8.078354e-01 8.137253e-01 0.6762669 0.91134658 0.85465931 0.657471694
#> [1312,] 3.138955e-02 8.004502e-03 0.6307237 0.33522945 0.08874663 0.092473684
#> [1313,]           NA           NA        NA         NA         NA          NA
#> [1314,] 3.414350e-02 8.710527e-03 0.2457968 0.25632548 0.37572685 0.062473684
#> [1315,] 8.116976e-01 8.173596e-01 0.6830595 0.66764263 0.51319792 0.657471694
#> [1316,] 5.980987e-01 6.113547e-01 0.5905701 0.64903608 0.70827029 0.215312456
#> [1317,] 8.080423e-01 8.202044e-01 0.6769194 0.66979782 0.53445156 0.620309138
#> [1318,] 8.043873e-01 8.176928e-01 0.6684971 0.66912897 0.53670648 0.572369023
#> [1319,] 7.880227e-01 8.052187e-01 0.8938765 0.95687581 0.59415058 0.178592658
#> [1320,] 2.547267e-01 6.554827e-02 0.6585185 0.61052941 0.40732970 0.054333333
#> [1321,] 7.617992e-01 2.532610e-01 0.3977203 0.84889310 0.14981319 0.175809806
#> [1322,]           NA           NA        NA         NA         NA          NA
#> [1323,]           NA           NA        NA         NA         NA          NA
#> [1324,]           NA           NA        NA         NA         NA          NA
#> [1325,] 9.716959e-03 2.478968e-03 0.2280031 0.18715404 0.35664472 0.062473684
#> [1326,] 8.081746e-01 8.157608e-01 0.6795760 0.66722105 0.51909189 0.582265811
#> [1327,] 7.857370e-01 7.926953e-01 0.6535821 0.66672508 0.60557560 0.592681355
#> [1328,] 8.139831e-01 8.226404e-01 0.6918993 0.66964972 0.52291005 0.551985609
#> [1329,] 8.862033e-01 8.969356e-01 0.9177238 0.91578082 0.92311966 0.589475805
#> [1330,] 9.097857e-01 9.332712e-01 0.8954352 0.97285211 0.16955319 0.439137875
#> [1331,] 8.931381e-01 8.099143e-01 0.8842945 0.96585932 0.19791338 0.644710763
#> [1332,] 8.602690e-01 3.054455e-01 0.8034859 0.86973568 0.35180943 0.149194853
#> [1333,]           NA           NA        NA         NA         NA          NA
#> [1334,]           NA           NA        NA         NA         NA          NA
#> [1335,]           NA           NA        NA         NA         NA          NA
#> [1336,] 1.868930e-02 4.765852e-03 0.6202022 0.29447567 0.08758850 0.092473684
#> [1337,] 8.108173e-01 8.144569e-01 0.6748341 0.66647967 0.49934766 0.568697634
#> [1338,] 8.112205e-01 8.175006e-01 0.6834174 0.66774399 0.51591638 0.656138360
#> [1339,] 7.905348e-01 7.954353e-01 0.6592760 0.66757477 0.60372043 0.755248050
#> [1340,] 8.097076e-01 8.206222e-01 0.6816184 0.66965581 0.53229809 0.599475805
#> [1341,] 8.744104e-01 8.901920e-01 0.9063630 0.91428650 0.93931284 0.592502167
#> [1342,] 8.727056e-01 8.881671e-01 0.9057003 0.91301591 0.93336201 0.592502167
#> [1343,] 5.094057e-01 1.310631e-01 0.7537154 0.67472119 0.09573312 0.122807018
#> [1344,]           NA           NA        NA         NA         NA          NA
#> [1345,]           NA           NA        NA         NA         NA          NA
#> [1346,]           NA           NA        NA         NA         NA          NA
#> [1347,] 1.876694e-02 4.785672e-03 0.6185171 0.29497910 0.07929946 0.062473684
#> [1348,] 8.143286e-01 7.965167e-01 0.6615261 0.66659784 0.79534069 0.331882642
#> [1349,] 8.129882e-01 8.181822e-01 0.6844035 0.66792059 0.51235701 0.650305027
#> [1350,] 8.214692e-01 8.208689e-01 0.6870341 0.66963207 0.50406798 0.472750765
#> [1351,] 8.184958e-01 8.241093e-01 0.6961096 0.67017302 0.51999351 0.632191491
#> [1352,] 8.066027e-01 8.190801e-01 0.6739061 0.66944146 0.53517253 0.607809138
#> [1353,] 8.817502e-01 8.930369e-01 0.9147836 0.91388997 0.58034326 0.646756007
#> [1354,] 8.956140e-01 4.746663e-01 0.8498645 0.87861847 0.11022163 0.381325680
#> [1355,] 6.724842e-01 1.912387e-01 0.7801036 0.74195711 0.09034152 0.246856037
#> [1356,]           NA           NA        NA         NA         NA          NA
#> [1357,]           NA           NA        NA         NA         NA          NA
#> [1358,]           NA           NA        NA         NA         NA          NA
#> [1359,] 6.953933e-01 2.201598e-01 0.4275762 0.57401915 0.53561792 0.166856037
#> [1360,] 8.102087e-01 8.152838e-01 0.6601713 0.66793882 0.58911698 0.856863754
#> [1361,] 8.217978e-01 8.061151e-01 0.6766104 0.66921343 0.49474621 0.310435773
#> [1362,] 8.207561e-01 8.239400e-01 0.6935504 0.66998605 0.51174212 0.553981535
#> [1363,] 8.090102e-01 8.203613e-01 0.6798528 0.66965581 0.53312037 0.589475805
#> [1364,] 8.759990e-01 8.909394e-01 0.9082619 0.91426958 0.93588056 0.595002167
#> [1365,] 9.019600e-01 6.793709e-01 0.8872637 0.91248466 0.13367592 0.370585034
#> [1366,] 6.455133e-01 1.791149e-01 0.7759607 0.73001703 0.08950956 0.233356037
#> [1367,] 2.577306e-01 6.572276e-02 0.7104376 0.56761800 0.09409668 0.132807018
#> [1368,]           NA           NA        NA         NA         NA          NA
#> [1369,]           NA           NA        NA         NA         NA          NA
#> [1370,] 8.157856e-01 7.963489e-01 0.6632353 0.66706636 0.48337838 0.331882642
#> [1371,] 8.193292e-01 8.173118e-01 0.6816285 0.66881310 0.50009915 0.450642796
#> [1372,] 8.204838e-01 8.235025e-01 0.6923068 0.66982142 0.51063459 0.544750765
#> [1373,] 8.141621e-01 8.227242e-01 0.6908717 0.67000949 0.52744109 0.531985609
#> [1374,] 7.934193e-01 8.119348e-01 0.6353181 0.66873973 0.54325370 0.572502167
#> [1375,] 8.882964e-01 8.942322e-01 0.9191569 0.91325921 0.39448116 0.656138360
#> [1376,] 8.910604e-01 8.854489e-01 0.9142057 0.91181455 0.24880130 0.391049308
#> [1377,] 8.956164e-01 4.657898e-01 0.8483905 0.87663889 0.10949668 0.381325680
#> [1378,]           NA           NA        NA         NA         NA          NA
#> [1379,]           NA           NA        NA         NA         NA          NA
#> [1380,] 6.471330e-02 1.650948e-02 0.2610254 0.30074912 0.38931596 0.110807018
#> [1381,] 8.185881e-01 6.012136e-01 0.5597321 0.66499745 0.55972145 0.499134298
#> [1382,] 8.244579e-01 6.795712e-01 0.6223037 0.66894715 0.46293645 0.310230459
#> [1383,] 8.212067e-01 8.133940e-01 0.6805694 0.66922548 0.49823209 0.320435773
#> [1384,] 8.162043e-01 8.226553e-01 0.6931288 0.66970323 0.52155433 0.608318942
#> [1385,] 8.022517e-01 8.170423e-01 0.6613201 0.66933767 0.53862079 0.564388631
#> [1386,] 8.605744e-01 8.816716e-01 0.8905762 0.91289374 0.95327654 0.544502167
#> [1387,] 4.921788e-01 1.260981e-01 0.7499134 0.66858889 0.08613334 0.112807018
#> [1388,] 3.107790e-01 7.925047e-02 0.7196364 0.59528655 0.08300940 0.122807018
#> [1389,]           NA           NA        NA         NA         NA          NA
#> [1390,]           NA           NA        NA         NA         NA          NA
#> [1391,] 6.778641e-01 2.088547e-01 0.4213675 0.56702771 0.36506051 0.186856037
#> [1392,] 6.118353e-01 4.890238e-01 0.5195365 0.64658302 0.80137374 0.735837194
#> [1393,] 8.235520e-01 4.704767e-01 0.5408144 0.64991822 0.42520536 0.325325680
#> [1394,] 8.253668e-01 6.898345e-01 0.6280105 0.66929765 0.46676913 0.310230459
#> [1395,] 8.224315e-01 8.134491e-01 0.6820576 0.66960832 0.49909598 0.320435773
#> [1396,] 8.183915e-01 8.240396e-01 0.6959745 0.67014972 0.52005070 0.632191491
#> [1397,] 8.636234e-01 8.839386e-01 0.8936842 0.91360442 0.81098483 0.544502167
#> [1398,] 8.815724e-01 8.898955e-01 0.9155968 0.91141889 0.46694984 0.569265811
#> [1399,] 1.361738e-01 3.472505e-02 0.6764023 0.48432834 0.07968208 0.110807018
#> [1400,]           NA           NA        NA         NA         NA          NA
#> [1401,]           NA           NA        NA         NA         NA          NA
#> [1402,] 4.417458e-01 1.126473e-01 0.7433248 0.64965320 0.09387156 0.112807018
#> [1403,] 8.195230e-01 6.474776e-01 0.6011941 0.66686760 0.44597257 0.330362812
#> [1404,] 8.227889e-01 6.235183e-01 0.5970027 0.66683566 0.44845452 0.370585034
#> [1405,] 8.245624e-01 7.442776e-01 0.6499970 0.66934567 0.47783533 0.315769106
#> [1406,] 8.219674e-01 8.145996e-01 0.6823099 0.66950116 0.49947751 0.359602439
#> [1407,] 8.227132e-01 8.236994e-01 0.6913175 0.67018466 0.50723705 0.482750765
#> [1408,] 8.170097e-01 8.233184e-01 0.6944528 0.66993912 0.52156778 0.608318942
#> [1409,] 8.158417e-01 8.203413e-01 0.6880667 0.66869071 0.51237382 0.650305027
#> [1410,] 8.969859e-01 5.633931e-01 0.8655109 0.89627505 0.11852942 0.188659013
#> [1411,] 2.072579e-01 5.285125e-02 0.6997097 0.53731441 0.10229865 0.187807018
#> [1412,] 1.778560e-01 4.535416e-02 0.6914169 0.51720689 0.09714801 0.130807018
#> [1413,] 8.180727e-01 4.564646e-01 0.5259034 0.64630121 0.40818312 0.325325680
#> [1414,] 8.225856e-01 5.151966e-01 0.5553504 0.65619119 0.42943410 0.188659013
#> [1415,] 8.247685e-01 6.002800e-01 0.5913218 0.66585668 0.44866832 0.379918367
#> [1416,] 8.243060e-01 7.490838e-01 0.6517565 0.66929765 0.47868445 0.330090535
#> [1417,] 8.219721e-01 8.041601e-01 0.6756788 0.66922548 0.49398153 0.307935773
#> [1418,] 8.214440e-01 8.234748e-01 0.6906552 0.66986856 0.50772350 0.509417432
#> [1419,] 8.186729e-01 8.228997e-01 0.6929341 0.66963207 0.51433145 0.626358158
#> [1420,] 7.612467e-01 6.993328e-01 0.5897178 0.90003563 0.40984245 0.554488290
#> [1421,] 5.666734e-01 1.491830e-01 0.7632601 0.69671465 0.10492655 0.122807018
#> [1422,]           NA           NA        NA         NA         NA          NA
#> [1423,] 2.663987e-02 6.796203e-03 0.2412302 0.24090900 0.28639324 0.062473684
#> [1424,] 8.204580e-01 4.536162e-01 0.5291310 0.64641892 0.41437830 0.371325680
#> [1425,] 8.253848e-01 4.405240e-01 0.5335688 0.64539443 0.42586516 0.381325680
#> [1426,] 8.238572e-01 7.260972e-01 0.6409291 0.66898361 0.47218892 0.305491328
#> [1427,] 8.222336e-01 8.078540e-01 0.6782186 0.66939360 0.49598045 0.310435773
#> [1428,] 8.213787e-01 8.226616e-01 0.6891902 0.66975056 0.50627604 0.482750765
#> [1429,] 7.600017e-01 7.607980e-01 0.6294038 0.90134139 0.50324098 0.491542335
#> [1430,] 8.882114e-01 8.848371e-01 0.6524823 0.91381298 0.82728262 0.598870174
#> [1431,] 9.402594e-01 4.745053e-01 0.8363819 0.93109443 0.10930995 0.428310046
#> [1432,]           NA           NA        NA         NA         NA          NA
#> [1433,]           NA           NA        NA         NA         NA          NA
#> [1434,]           NA           NA        NA         NA         NA          NA
#> [1435,] 3.987992e-01 1.017394e-01 0.3521382 0.47386803 0.33711986 0.112807018
#> [1436,] 2.989015e-01 7.623861e-02 0.3349438 0.44113685 0.33672704 0.122807018
#> [1437,] 8.254635e-01 4.953006e-01 0.5532986 0.65415794 0.43374035 0.218659013
#> [1438,] 8.256260e-01 6.890923e-01 0.6281269 0.66938162 0.46709188 0.310230459
#> [1439,] 8.269045e-01 7.269651e-01 0.6460830 0.67000949 0.47736116 0.279230459
#> [1440,] 8.239877e-01 7.859040e-01 0.6686558 0.66957264 0.48905412 0.314507201
#> [1441,] 8.259124e-01 7.755711e-01 0.6663824 0.67007969 0.48815853 0.321840535
#> [1442,] 8.221950e-01 7.938697e-01 0.6702717 0.66910480 0.48986022 0.306507201
#> [1443,] 8.114296e-01 8.128644e-01 0.6707619 0.66629500 0.81948992 0.506697634
#> [1444,]           NA           NA        NA         NA         NA          NA
#> [1445,]           NA           NA        NA         NA         NA          NA
#> [1446,] 2.316320e-01 5.909330e-02 0.3144660 0.41367150 0.32054248 0.132807018
#> [1447,] 5.850536e-01 1.616935e-01 0.3958481 0.53218535 0.35787678 0.233356037
#> [1448,] 8.247569e-01 4.890369e-01 0.5497264 0.65306158 0.43103482 0.218659013
#> [1449,] 8.283890e-01 6.364973e-01 0.6116787 0.66920852 0.46250032 0.326480459
#> [1450,] 8.293389e-01 6.460215e-01 0.6170523 0.66991382 0.46594466 0.316480459
#> [1451,] 8.288614e-01 6.668879e-01 0.6244992 0.67033124 0.46871281 0.302230459
#> [1452,] 8.281566e-01 6.804331e-01 0.6287643 0.67019630 0.46994711 0.302230459
#> [1453,] 8.186199e-01 8.039126e-01 0.6712654 0.66814618 0.81866843 0.334382642
#> [1454,] 6.309564e-01 1.828448e-01 0.4068141 0.54865993 0.51777587 0.196856037
#> [1455,]           NA           NA        NA         NA         NA          NA
#> [1456,]           NA           NA        NA         NA         NA          NA
#> [1457,]           NA           NA        NA         NA         NA          NA
#> [1458,] 1.904668e-03 4.856964e-04 0.5940794 0.16647583 0.07894511 0.062473684
#> [1459,] 6.211500e-02 1.584651e-02 0.2599808 0.29768855 0.29555168 0.110807018
#> [1460,] 8.227569e-01 4.609399e-01 0.5359339 0.64819125 0.42170686 0.325325680
#> [1461,] 8.296721e-01 6.612569e-01 0.6236356 0.67048898 0.46917530 0.310980459
#> [1462,] 8.296565e-01 6.237304e-01 0.6089254 0.66889823 0.46285418 0.356702681
#> [1463,] 8.287251e-01 6.455797e-01 0.6158212 0.66970588 0.46470901 0.316480459
#> [1464,] 8.281342e-01 5.155780e-01 0.5656178 0.65766853 0.44319227 0.182776660
#> [1465,] 8.272299e-01 6.291435e-01 0.6067990 0.66848312 0.45892154 0.364702681
#> [1466,] 8.194584e-01 7.722531e-01 0.6555038 0.66790801 0.79018115 0.338454070
#> [1467,]           NA           NA        NA         NA         NA          NA
#> [1468,]           NA           NA        NA         NA         NA          NA
#> [1469,]           NA           NA        NA         NA         NA          NA
#> [1470,]           NA           NA        NA         NA         NA          NA
#> [1471,]           NA           NA        NA         NA         NA          NA
#> [1472,] 3.511395e-03 8.954164e-04 0.5989891 0.19393152 0.08194205 0.062473684
#> [1473,] 8.072377e-01 3.375711e-01 0.4954157 0.62306156 0.41112398 0.194668537
#> [1474,] 8.273102e-01 7.114773e-01 0.6401660 0.67005631 0.47466763 0.279230459
#> [1475,] 8.296028e-01 6.507652e-01 0.6217514 0.66965782 0.45442402 0.341480459
#> [1476,] 8.277703e-01 6.224871e-01 0.6108369 0.66729307 0.43261639 0.467258236
#> [1477,] 8.297533e-01 4.461660e-01 0.5438867 0.64742806 0.43787195 0.365443327
#> [1478,] 8.238406e-01 3.837348e-01 0.5173510 0.63495516 0.42374497 0.300809994
#> [1479,] 8.266488e-01 5.833003e-01 0.5881188 0.66495763 0.45001800 0.274776660
#> [1480,] 8.214936e-01 6.531326e-01 0.6066845 0.66765716 0.72752094 0.324862812
#> [1481,] 1.137814e-01 2.901478e-02 0.6706530 0.46268821 0.08866154 0.110807018
#> [1482,]           NA           NA        NA         NA         NA          NA
#> [1483,]           NA           NA        NA         NA         NA          NA
#> [1484,]           NA           NA        NA         NA         NA          NA
#> [1485,] 1.062581e-03 2.709623e-04 0.5917043 0.14383517 0.08141304 0.062473684
#> [1486,] 5.245296e-01 1.385083e-01 0.3840531 0.51220896 0.35816187 0.120807018
#> [1487,] 8.289678e-01 5.797486e-01 0.5909235 0.66527079 0.45452348 0.266776660
#> [1488,] 8.297337e-01 6.050313e-01 0.6076053 0.66667388 0.43411770 0.473258236
#> [1489,] 8.284777e-01 5.492711e-01 0.5844514 0.66099162 0.42152799 0.355665549
#> [1490,] 8.067965e-01 3.295445e-01 0.5006686 0.62167975 0.42234861 0.168786184
#> [1491,] 8.170901e-01 3.586501e-01 0.5073803 0.62903365 0.41954325 0.213786184
#> [1492,] 8.267620e-01 4.845026e-01 0.5518089 0.65288503 0.43546819 0.249443327
#> [1493,] 8.197028e-01 3.819455e-01 0.5087713 0.63361256 0.63491580 0.306692347
#> [1494,] 1.803446e-01 4.598881e-02 0.6914898 0.51914945 0.09130229 0.110807018
#> [1495,]           NA           NA        NA         NA         NA          NA
#> [1496,]           NA           NA        NA         NA         NA          NA
#> [1497,]           NA           NA        NA         NA         NA          NA
#> [1498,]           NA           NA        NA         NA         NA          NA
#> [1499,] 7.735789e-01 2.880258e-01 0.4675195 0.60638541 0.59004518 0.174668537
#> [1500,] 8.308125e-01 5.466792e-01 0.5819790 0.66226930 0.45367048 0.227776660
#> [1501,] 8.306767e-01 5.808070e-01 0.6001743 0.66487434 0.43226185 0.494500000
#> [1502,] 8.288732e-01 5.440990e-01 0.5832692 0.66049682 0.42172148 0.331665549
#> [1503,] 8.196863e-01 3.610405e-01 0.5124264 0.63009205 0.42569087 0.213786184
#> [1504,] 7.886780e-01 3.006836e-01 0.4880252 0.61241586 0.41750982 0.168786184
#> [1505,] 8.202939e-01 3.722349e-01 0.5109144 0.63211210 0.41908237 0.282952851
#> [1506,] 7.110817e-01 2.284654e-01 0.4460226 0.57993051 0.59224806 0.156856037
#> [1507,] 1.895855e-01 4.836591e-02 0.3035512 0.39347875 0.42825645 0.157807018
#> [1508,]           NA           NA        NA         NA         NA          NA
#> [1509,]           NA           NA        NA         NA         NA          NA
#> [1510,]           NA           NA        NA         NA         NA          NA
#> [1511,] 4.522056e-01 1.158745e-01 0.3720705 0.48970712 0.50090281 0.112807018
#> [1512,] 8.283510e-01 7.070105e-01 0.6399866 0.67038184 0.47544910 0.279230459
#> [1513,] 8.284389e-01 6.636319e-01 0.6280901 0.66916246 0.44222751 0.421536014
#> [1514,] 8.280329e-01 6.452498e-01 0.6201490 0.66850392 0.43762870 0.427036014
#> [1515,] 8.293440e-01 4.799019e-01 0.5550269 0.65282526 0.44121395 0.249443327
#> [1516,] 8.121967e-01 3.437972e-01 0.5031884 0.62535377 0.41978085 0.196286184
#> [1517,] 8.132922e-01 3.480198e-01 0.5033679 0.62631888 0.65000347 0.213786184
#> [1518,] 6.899196e-01 2.154613e-01 0.4313168 0.57169045 0.55710603 0.166856037
#> [1519,] 1.007176e-01 2.569438e-02 0.2756698 0.33593079 0.40358231 0.110807018
#> [1520,]           NA           NA        NA         NA         NA          NA
#> [1521,]           NA           NA        NA         NA         NA          NA
#> [1522,]           NA           NA        NA         NA         NA          NA
#> [1523,] 4.417051e-01 1.130086e-01 0.3666510 0.48598946 0.31440365 0.162807018
#> [1524,] 8.264491e-01 7.127008e-01 0.6392963 0.66977420 0.47350058 0.277230459
#> [1525,] 8.296623e-01 7.150846e-01 0.6454797 0.67086289 0.47911406 0.464611111
#> [1526,] 8.285428e-01 6.531792e-01 0.6241359 0.66893826 0.44035244 0.427036014
#> [1527,] 8.282557e-01 4.671744e-01 0.5484294 0.65055391 0.43684687 0.319443327
#> [1528,] 8.048373e-01 3.264563e-01 0.4985880 0.62067977 0.42076149 0.168786184
#> [1529,] 8.155951e-01 3.502135e-01 0.5076190 0.62727033 0.66254885 0.213786184
#> [1530,] 7.949498e-01 3.181661e-01 0.4819946 0.61675493 0.60653886 0.174668537
#> [1531,] 1.667107e-01 4.253071e-02 0.2968067 0.38102019 0.42156655 0.110807018
#> [1532,]           NA           NA        NA         NA         NA          NA
#> [1533,]           NA           NA        NA         NA         NA          NA
#> [1534,]           NA           NA        NA         NA         NA          NA
#> [1535,] 2.163731e-01 5.519958e-02 0.3124351 0.40642262 0.42826352 0.157807018
#> [1536,] 8.164276e-01 3.705992e-01 0.5054286 0.63037622 0.39150338 0.303835204
#> [1537,] 8.246387e-01 8.165857e-01 0.6890305 0.66988162 0.49213310 0.352435773
#> [1538,] 8.270703e-01 7.541051e-01 0.6635883 0.66928184 0.46106229 0.435646090
#> [1539,] 8.306554e-01 4.162029e-01 0.5379844 0.64180734 0.42214735 0.354443327
#> [1540,] 8.057792e-01 3.269266e-01 0.5005314 0.62100270 0.42329415 0.168786184
#> [1541,] 8.068530e-01 3.320229e-01 0.4986658 0.62208284 0.41840846 0.168786184
#> [1542,] 8.107513e-01 3.535741e-01 0.4951198 0.62656629 0.40330871 0.219668537
#> [1543,] 1.866296e-01 4.761248e-02 0.3024641 0.39192228 0.42643970 0.157807018
#> [1544,] 6.546591e-03 1.669411e-03 0.6066066 0.22641543 0.09720542 0.102473684
#> [1545,]           NA           NA        NA         NA         NA          NA
#> [1546,]           NA           NA        NA         NA         NA          NA
#> [1547,]           NA           NA        NA         NA         NA          NA
#> [1548,] 3.938961e-02 1.004450e-02 0.6363901 0.35481274 0.08937235 0.092473684
#> [1549,] 8.199018e-01 5.229115e-01 0.5569577 0.65584620 0.40296272 0.272547902
#> [1550,] 8.166372e-01 8.226611e-01 0.6984185 0.66871765 0.50383595 0.753913714
#> [1551,] 8.265826e-01 8.053152e-01 0.6876352 0.66975187 0.47812235 0.536649758
#> [1552,] 8.323290e-01 5.312573e-01 0.5849996 0.65983159 0.42862484 0.418000000
#> [1553,] 8.145196e-01 3.474875e-01 0.5065457 0.62655114 0.42298695 0.196286184
#> [1554,] 8.167029e-01 3.614286e-01 0.5055850 0.62939343 0.41577176 0.219668537
#> [1555,] 8.239796e-01 3.990743e-01 0.5185273 0.63764340 0.41958482 0.335325680
#> [1556,] 6.423407e-01 1.886128e-01 0.4106557 0.55297090 0.52252516 0.186856037
#> [1557,] 3.987963e-03 1.016939e-03 0.6020754 0.20003370 0.09646891 0.102473684
#> [1558,]           NA           NA        NA         NA         NA          NA
#> [1559,]           NA           NA        NA         NA         NA          NA
#> [1560,]           NA           NA        NA         NA         NA          NA
#> [1561,] 3.032199e-04 7.732260e-05 0.5894121 0.10503620 0.09469045 0.102473684
#> [1562,] 8.087224e-01 3.545318e-01 0.4919805 0.62587602 0.38387952 0.229668537
#> [1563,] 8.197193e-01 8.180200e-01 0.6878224 0.66799392 0.48011505 0.539084816
#> [1564,] 8.299470e-01 7.826680e-01 0.6809443 0.67050704 0.47386969 0.556960317
#> [1565,] 8.317795e-01 4.814678e-01 0.5661299 0.65272149 0.42005067 0.494666667
#> [1566,] 7.993583e-01 3.177683e-01 0.4936093 0.61787879 0.41754682 0.178786184
#> [1567,] 8.134268e-01 3.508928e-01 0.5022482 0.62681999 0.41536393 0.213786184
#> [1568,] 8.099261e-01 3.444097e-01 0.4974946 0.62486058 0.41114927 0.202168537
#> [1569,] 6.334536e-01 1.836449e-01 0.4117995 0.54957878 0.36801770 0.196856037
#> [1570,]           NA           NA        NA         NA         NA          NA
#> [1571,]           NA           NA        NA         NA         NA          NA
#> [1572,]           NA           NA        NA         NA         NA          NA
#> [1573,]           NA           NA        NA         NA         NA          NA
#> [1574,]           NA           NA        NA         NA         NA          NA
#> [1575,]           NA           NA        NA         NA         NA          NA
#> [1576,]           NA           NA        NA         NA         NA          NA
#> [1577,] 8.196160e-01 7.493610e-01 0.6481395 0.66706506 0.45396879 0.441528443
#> [1578,] 8.178952e-01 8.250156e-01 0.7021561 0.66972932 0.51009463 0.730516445
#> [1579,] 8.306093e-01 7.405259e-01 0.6631553 0.67035340 0.46343853 0.569816425
#> [1580,] 8.238503e-01 3.801669e-01 0.5191639 0.63402227 0.41511793 0.310809994
#> [1581,] 7.943131e-01 3.114784e-01 0.4879472 0.61556305 0.41219902 0.178786184
#> [1582,] 8.036968e-01 3.286073e-01 0.4937687 0.62071239 0.41278022 0.168786184
#> [1583,] 5.866988e-01 1.622764e-01 0.3978776 0.53277899 0.52066490 0.233356037
#> [1584,]           NA           NA        NA         NA         NA          NA
#> [1585,]           NA           NA        NA         NA         NA          NA
#> [1586,]           NA           NA        NA         NA         NA          NA
#> [1587,]           NA           NA        NA         NA         NA          NA
#> [1588,]           NA           NA        NA         NA         NA          NA
#> [1589,] 2.793960e-03 7.124691e-04 0.5991827 0.18300537 0.09606194 0.102473684
#> [1590,] 8.225267e-01 4.794887e-01 0.5480468 0.65012322 0.39353675 0.359214569
#> [1591,] 8.107382e-01 8.201370e-01 0.6896953 0.66822133 0.51404659 0.746207831
#> [1592,] 8.266303e-01 8.261329e-01 0.7020652 0.67044131 0.49112638 0.641631418
#> [1593,] 8.301446e-01 5.086814e-01 0.5693524 0.65673891 0.43285961 0.197776660
#> [1594,] 7.782011e-01 2.890953e-01 0.4785376 0.60783023 0.40927065 0.158786184
#> [1595,] 7.676910e-01 2.778070e-01 0.4710664 0.60326793 0.40384306 0.158786184
#> [1596,] 5.358762e-01 1.425028e-01 0.3864844 0.51584486 0.35873156 0.120807018
#> [1597,] 1.584141e-02 4.041386e-03 0.2347556 0.21138048 0.35978394 0.062473684
#> [1598,]           NA           NA        NA         NA         NA          NA
#> [1599,]           NA           NA        NA         NA         NA          NA
#> [1600,]           NA           NA        NA         NA         NA          NA
#> [1601,]           NA           NA        NA         NA         NA          NA
#> [1602,]           NA           NA        NA         NA         NA          NA
#> [1603,]           NA           NA        NA         NA         NA          NA
#> [1604,] 1.994146e-02 5.085189e-03 0.6195977 0.29948849 0.07936938 0.062473684
#> [1605,] 8.205515e-01 5.736792e-01 0.5772619 0.66170497 0.41399852 0.364547902
#> [1606,] 8.109909e-01 6.645029e-01 0.5998880 0.66974689 0.60027171 0.841566434
#> [1607,] 8.185702e-01 5.832511e-01 0.5805920 0.66813771 0.59230067 0.841070707
#> [1608,] 8.321244e-01 6.506236e-01 0.6270313 0.67028053 0.45538193 0.562444444
#> [1609,] 7.811510e-01 2.911071e-01 0.4832430 0.60894085 0.41524383 0.168786184
#> [1610,] 7.297907e-01 2.418214e-01 0.4564236 0.58733447 0.40180584 0.150973684
#> [1611,] 4.646685e-01 1.194330e-01 0.3742246 0.49381114 0.35970848 0.122807018
#> [1612,] 2.290789e-02 5.844161e-03 0.2385885 0.23198467 0.28480349 0.062473684
#> [1613,]           NA           NA        NA         NA         NA          NA
#> [1614,]           NA           NA        NA         NA         NA          NA
#> [1615,]           NA           NA        NA         NA         NA          NA
#> [1616,]           NA           NA        NA         NA         NA          NA
#> [1617,]           NA           NA        NA         NA         NA          NA
#> [1618,]           NA           NA        NA         NA         NA          NA
#> [1619,] 3.302254e-01 8.424539e-02 0.3377921 0.45203195 0.33097905 0.112807018
#> [1620,] 7.332468e-01 2.519239e-01 0.4367851 0.59461468 0.59167517 0.302000000
#> [1621,] 6.202574e-01 6.115568e-01 0.6121945 0.65079182 0.75115102 0.661983613
#> [1622,] 8.320663e-01 7.462920e-01 0.6679034 0.67087623 0.46714346 0.561555556
#> [1623,] 8.305996e-01 5.495330e-01 0.5826369 0.66254346 0.45360866 0.251776660
#> [1624,] 7.254486e-01 2.375205e-01 0.4585722 0.58546455 0.40772309 0.150973684
#> [1625,] 3.578044e-01 9.121548e-02 0.3585445 0.46200313 0.36314833 0.112807018
#> [1626,] 8.891578e-02 2.268359e-02 0.2712540 0.32562537 0.30133583 0.110807018
#> [1627,]           NA           NA        NA         NA         NA          NA
#> [1628,]           NA           NA        NA         NA         NA          NA
#> [1629,]           NA           NA        NA         NA         NA          NA
#> [1630,]           NA           NA        NA         NA         NA          NA
#> [1631,]           NA           NA        NA         NA         NA          NA
#> [1632,]           NA           NA        NA         NA         NA          NA
#> [1633,] 1.307527e-03 3.334254e-04 0.5925984 0.15148976 0.08148547 0.062473684
#> [1634,] 1.390250e-01 3.546710e-02 0.2886525 0.36412182 0.30948173 0.110807018
#> [1635,] 4.231015e-01 1.090434e-01 0.3241426 0.49164636 0.65179291 0.089833333
#> [1636,] 5.466295e-01 1.741190e-01 0.4003601 0.56651640 0.76685441 0.264666667
#> [1637,] 8.279579e-01 8.026190e-01 0.6880407 0.67014337 0.47847349 0.545221187
#> [1638,] 8.310310e-01 4.874156e-01 0.5609190 0.65438821 0.44621428 0.249443327
#> [1639,] 6.653189e-01 1.989105e-01 0.4352539 0.56165861 0.39639479 0.180973684
#> [1640,] 5.608970e-01 1.513486e-01 0.4013410 0.52425789 0.37740171 0.137473684
#> [1641,] 5.467636e-01 1.464326e-01 0.3896401 0.51940072 0.36078239 0.120807018
#> [1642,] 4.034272e-03 1.028757e-03 0.6006773 0.20072083 0.08564426 0.092473684
#> [1643,]           NA           NA        NA         NA         NA          NA
#> [1644,]           NA           NA        NA         NA         NA          NA
#> [1645,]           NA           NA        NA         NA         NA          NA
#> [1646,]           NA           NA        NA         NA         NA          NA
#> [1647,]           NA           NA        NA         NA         NA          NA
#> [1648,]           NA           NA        NA         NA         NA          NA
#> [1649,]           NA           NA        NA         NA         NA          NA
#> [1650,]           NA           NA        NA         NA         NA          NA
#> [1651,] 6.825864e-01 2.478254e-01 0.4091656 0.59653479 0.65624566 0.201343897
#> [1652,] 6.226897e-01 4.747227e-01 0.5294937 0.64912195 0.78163422 0.706788174
#> [1653,] 7.973366e-01 7.982697e-01 0.6625845 0.66902739 0.59975473 0.725830136
#> [1654,] 8.282442e-01 7.105145e-01 0.6241206 0.67186111 0.57956652 0.737611111
#> [1655,] 8.066787e-01 3.358354e-01 0.4764348 0.62405863 0.56479135 0.234608728
#> [1656,] 7.535474e-01 2.636599e-01 0.4453663 0.59820076 0.51188956 0.165861520
#> [1657,] 7.924962e-01 3.177023e-01 0.4633665 0.61717128 0.48170513 0.159194853
#> [1658,] 1.499719e-02 3.826048e-03 0.2323583 0.20866841 0.36253047 0.062473684
#> [1659,]           NA           NA        NA         NA         NA          NA
#> [1660,]           NA           NA        NA         NA         NA          NA
#> [1661,]           NA           NA        NA         NA         NA          NA
#> [1662,]           NA           NA        NA         NA         NA          NA
#> [1663,]           NA           NA        NA         NA         NA          NA
#> [1664,]           NA           NA        NA         NA         NA          NA
#> [1665,]           NA           NA        NA         NA         NA          NA
#> [1666,]           NA           NA        NA         NA         NA          NA
#> [1667,] 1.125499e-01 2.871341e-02 0.2691033 0.34602048 0.41173936 0.101333333
#> [1668,] 4.805981e-03 1.224094e-03 0.1700658 0.16375317 0.82090010 0.023666667
#> [1669,] 8.178149e-01 8.224691e-01 0.6772876 0.67113992 0.58088627 0.857837712
#> [1670,] 8.245840e-01 8.141141e-01 0.6690900 0.67180636 0.58086493 0.664960317
#> [1671,] 8.264741e-01 6.715298e-01 0.6047559 0.67109212 0.57964725 0.792662393
#> [1672,] 8.182620e-01 6.104791e-01 0.5656763 0.66621107 0.57675651 0.556449317
#> [1673,] 8.140423e-01 5.525108e-01 0.5355653 0.65995209 0.57057127 0.435347858
#> [1674,]           NA           NA        NA         NA         NA          NA
#> [1675,]           NA           NA        NA         NA         NA          NA
#> [1676,]           NA           NA        NA         NA         NA          NA
#> [1677,]           NA           NA        NA         NA         NA          NA
#> [1678,]           NA           NA        NA         NA         NA          NA
#> [1679,]           NA           NA        NA         NA         NA          NA
#> [1680,]           NA           NA        NA         NA         NA          NA
#> [1681,]           NA           NA        NA         NA         NA          NA
#> [1682,]           NA           NA        NA         NA         NA          NA
#> [1683,] 1.102553e-01 2.805155e-02 0.2396308 0.35875283 0.81136608 0.071166667
#> [1684,] 7.735065e-01 7.757984e-01 0.6522536 0.66635137 0.61466594 0.448485856
#> [1685,] 8.231857e-01 8.193143e-01 0.6713274 0.67156403 0.58158282 0.713939136
#> [1686,] 8.263701e-01 7.072781e-01 0.6195818 0.67121857 0.58068666 0.739662393
#> [1687,] 7.821014e-01 2.979622e-01 0.4552880 0.61159933 0.56053307 0.174761789
#> [1688,] 8.148569e-01 5.030460e-01 0.5181203 0.65406260 0.57400245 0.351629909
#> [1689,] 1.044173e-01 2.663777e-02 0.2553939 0.33943640 0.22152339 0.075000000
#> [1690,]           NA           NA        NA         NA         NA          NA
#> [1691,]           NA           NA        NA         NA         NA          NA
#> [1692,]           NA           NA        NA         NA         NA          NA
#> [1693,]           NA           NA        NA         NA         NA          NA
#> [1694,]           NA           NA        NA         NA         NA          NA
#> [1695,]           NA           NA        NA         NA         NA          NA
#> [1696,]           NA           NA        NA         NA         NA          NA
#> [1697,]           NA           NA        NA         NA         NA          NA
#> [1698,] 5.083099e-02 1.296725e-02 0.2345996 0.28353959 0.49832918 0.000000000
#> [1699,] 7.436928e-01 5.412806e-01 0.5535211 0.66178856 0.64331245 0.457741495
#> [1700,] 8.260801e-01 8.111775e-01 0.6691572 0.67219785 0.57939677 0.654960317
#> [1701,] 8.278113e-01 7.365830e-01 0.6347287 0.67187204 0.58012646 0.736182540
#> [1702,] 8.245964e-01 5.695390e-01 0.5609120 0.66459120 0.57582217 0.418965505
#> [1703,] 2.640371e-01 6.735680e-02 0.2995985 0.42806011 0.27260238 0.094166667
#> [1704,] 2.566918e-02 6.548446e-03 0.2208850 0.23901021 0.18471578 0.000000000
#> [1705,]           NA           NA        NA         NA         NA          NA
#> [1706,]           NA           NA        NA         NA         NA          NA
#> [1707,]           NA           NA        NA         NA         NA          NA
#> [1708,]           NA           NA        NA         NA         NA          NA
#> [1709,]           NA           NA        NA         NA         NA          NA
#> [1710,]           NA           NA        NA         NA         NA          NA
#> [1711,]           NA           NA        NA         NA         NA          NA
#> [1712,]           NA           NA        NA         NA         NA          NA
#> [1713,] 5.359561e-02 1.367243e-02 0.2359784 0.28732327 0.49895403 0.075000000
#> [1714,] 6.172011e-01 5.787815e-01 0.5829705 0.64915213 0.77558296 0.773264365
#> [1715,] 8.234030e-01 7.939876e-01 0.6554807 0.67100452 0.58357001 0.671343898
#> [1716,] 8.244414e-01 8.202994e-01 0.6735732 0.67198113 0.57982303 0.703626984
#> [1717,] 8.244722e-01 6.905451e-01 0.6092578 0.67050204 0.76669999 0.481055059
#> [1718,] 1.298860e-01 3.313374e-02 0.2644037 0.35850886 0.23393927 0.075000000
#> [1719,]           NA           NA        NA         NA         NA          NA
#> [1720,]           NA           NA        NA         NA         NA          NA
#> [1721,]           NA           NA        NA         NA         NA          NA
#> [1722,]           NA           NA        NA         NA         NA          NA
#> [1723,]           NA           NA        NA         NA         NA          NA
#> [1724,]           NA           NA        NA         NA         NA          NA
#> [1725,]           NA           NA        NA         NA         NA          NA
#> [1726,]           NA           NA        NA         NA         NA          NA
#> [1727,] 5.986478e-03 1.527123e-03 0.2007376 0.16633241 0.52154706 0.003333333
#> [1728,] 6.825451e-01 5.111624e-01 0.5261785 0.65530730 0.69282270 0.413991234
#> [1729,] 7.407921e-01 6.672800e-01 0.6079597 0.66427733 0.63889080 0.556797050
#> [1730,] 8.243921e-01 8.131350e-01 0.6681793 0.67171851 0.58123246 0.675272469
#> [1731,] 8.193478e-01 8.219397e-01 0.6732927 0.67086842 0.88816329 0.746206929
#> [1732,] 8.172737e-01 6.614787e-01 0.5849253 0.66793661 0.69953748 0.497437412
#> [1733,] 2.135257e-03 5.447252e-04 0.1986288 0.12835808 0.16181863 0.000000000
#> [1734,]           NA           NA        NA         NA         NA          NA
#> [1735,]           NA           NA        NA         NA         NA          NA
#> [1736,]           NA           NA        NA         NA         NA          NA
#> [1737,]           NA           NA        NA         NA         NA          NA
#> [1738,]           NA           NA        NA         NA         NA          NA
#> [1739,]           NA           NA        NA         NA         NA          NA
#> [1740,]           NA           NA        NA         NA         NA          NA
#> [1741,]           NA           NA        NA         NA         NA          NA
#> [1742,]           NA           NA        NA         NA         NA          NA
#> [1743,] 5.810809e-01 1.574234e-01 0.3453190 0.71265883 0.16899046 0.081333333
#> [1744,] 8.260529e-01 7.124317e-01 0.6212645 0.67113992 0.58098265 0.729662393
#> [1745,] 8.234931e-01 8.095646e-01 0.6646606 0.67134169 0.58265309 0.675272469
#> [1746,] 8.136777e-01 8.213863e-01 0.6736686 0.67104973 0.57762222 0.641849778
#> [1747,] 8.084922e-01 8.167716e-01 0.6640187 0.66937253 0.91876557 0.551433661
#> [1748,] 5.319565e-01 1.413007e-01 0.3603464 0.51505319 0.40542645 0.117833333
#> [1749,]           NA           NA        NA         NA         NA          NA
#> [1750,]           NA           NA        NA         NA         NA          NA
#> [1751,]           NA           NA        NA         NA         NA          NA
#> [1752,]           NA           NA        NA         NA         NA          NA
#> [1753,]           NA           NA        NA         NA         NA          NA
#> [1754,]           NA           NA        NA         NA         NA          NA
#> [1755,]           NA           NA        NA         NA         NA          NA
#> [1756,]           NA           NA        NA         NA         NA          NA
#> [1757,] 2.615877e-01 6.673263e-02 0.2988304 0.42705247 0.51838071 0.094166667
#> [1758,] 8.178928e-01 5.049329e-01 0.5242288 0.65510207 0.56978109 0.351629909
#> [1759,] 8.252542e-01 7.813096e-01 0.6516252 0.67143086 0.58214016 0.709343898
#> [1760,] 8.058488e-01 8.174445e-01 0.6568513 0.67029373 0.57607513 0.508581752
#> [1761,] 7.933613e-01 8.099519e-01 0.6227992 0.66891274 0.95477647 0.446846209
#> [1762,] 8.139817e-01 6.000250e-01 0.5542225 0.66423459 0.63005470 0.556449317
#> [1763,]           NA           NA        NA         NA         NA          NA
#> [1764,]           NA           NA        NA         NA         NA          NA
#> [1765,]           NA           NA        NA         NA         NA          NA
#> [1766,]           NA           NA        NA         NA         NA          NA
#> [1767,]           NA           NA        NA         NA         NA          NA
#> [1768,]           NA           NA        NA         NA         NA          NA
#> [1769,]           NA           NA        NA         NA         NA          NA
#> [1770,]           NA           NA        NA         NA         NA          NA
#> [1771,]           NA           NA        NA         NA         NA          NA
#> [1772,] 6.641724e-01 2.009520e-01 0.3958987 0.56288868 0.54489398 0.196164976
#> [1773,] 8.237871e-01 5.483470e-01 0.5513390 0.66210959 0.57469416 0.419465505
#> [1774,] 8.037667e-01 8.168538e-01 0.6503268 0.67046743 0.57154781 0.446713065
#> [1775,] 7.634254e-01 7.921575e-01 0.5383195 0.66821755 0.97747547 0.454476334
#> [1776,] 7.820679e-01 3.073219e-01 0.4427910 0.61301163 0.45503607 0.190644142
#> [1777,]           NA           NA        NA         NA         NA          NA
#> [1778,]           NA           NA        NA         NA         NA          NA
#> [1779,]           NA           NA        NA         NA         NA          NA
#> [1780,]           NA           NA        NA         NA         NA          NA
#> [1781,]           NA           NA        NA         NA         NA          NA
#> [1782,]           NA           NA        NA         NA         NA          NA
#> [1783,]           NA           NA        NA         NA         NA          NA
#> [1784,] 2.415543e-03 6.161828e-04 0.1947126 0.13262659 0.52647731 0.005833333
#> [1785,] 7.172550e-01 2.336046e-01 0.4264909 0.58380873 0.55635442 0.160282623
#> [1786,] 8.239571e-01 6.929321e-01 0.6093985 0.67034016 0.58127204 0.468055059
#> [1787,] 8.207106e-01 8.244961e-01 0.6808706 0.67185017 0.57780941 0.854192227
#> [1788,] 7.050518e-01 7.493888e-01 0.4877725 0.65198339 0.98684135 0.398818884
#> [1789,] 8.123625e-01 7.596530e-01 0.6216655 0.66692263 0.75875272 0.478056448
#> [1790,]           NA           NA        NA         NA         NA          NA
#> [1791,]           NA           NA        NA         NA         NA          NA
#> [1792,]           NA           NA        NA         NA         NA          NA
#> [1793,]           NA           NA        NA         NA         NA          NA
#> [1794,]           NA           NA        NA         NA         NA          NA
#> [1795,]           NA           NA        NA         NA         NA          NA
#> [1796,]           NA           NA        NA         NA         NA          NA
#> [1797,] 2.931531e-01 7.478604e-02 0.3057600 0.43937747 0.52008887 0.084166667
#> [1798,] 8.265636e-01 4.534620e-01 0.5217789 0.64937367 0.57093337 0.556580889
#> [1799,] 8.233451e-01 8.155616e-01 0.6685447 0.67146792 0.58210726 0.706439136
#> [1800,] 7.678772e-01 7.959254e-01 0.5474770 0.66940426 0.97756495 0.438529465
#> [1801,] 7.921320e-01 7.955506e-01 0.6445284 0.66550403 0.77803748 0.909023011
#> [1802,]           NA           NA        NA         NA         NA          NA
#> [1803,]           NA           NA        NA         NA         NA          NA
#> [1804,]           NA           NA        NA         NA         NA          NA
#> [1805,]           NA           NA        NA         NA         NA          NA
#> [1806,]           NA           NA        NA         NA         NA          NA
#> [1807,]           NA           NA        NA         NA         NA          NA
#> [1808,]           NA           NA        NA         NA         NA          NA
#> [1809,]           NA           NA        NA         NA         NA          NA
#> [1810,] 8.208863e-01 5.492099e-01 0.5463551 0.66143401 0.57393382 0.425347858
#> [1811,] 8.210629e-01 8.238140e-01 0.6778187 0.67156403 0.58033925 0.841413469
#> [1812,] 7.973150e-01 8.141861e-01 0.6287000 0.67073162 0.55869515 0.432899340
#> [1813,] 6.099239e-01 5.983554e-01 0.5881251 0.64726141 0.63852128 0.699067959
#> [1814,] 1.265514e-02 3.222021e-03 0.5322235 0.27690358 0.84682541 0.023666667
#> [1815,]           NA           NA        NA         NA         NA          NA
#> [1816,]           NA           NA        NA         NA         NA          NA
#> [1817,]           NA           NA        NA         NA         NA          NA
#> [1818,]           NA           NA        NA         NA         NA          NA
#> [1819,]           NA           NA        NA         NA         NA          NA
#> [1820,]           NA           NA        NA         NA         NA          NA
#> [1821,] 1.953110e-02 4.982602e-03 0.2166605 0.22322207 0.49113049 0.000000000
#> [1822,] 8.137345e-01 4.692418e-01 0.5036185 0.64877945 0.56422180 0.438296576
#> [1823,] 8.285669e-01 7.128655e-01 0.6256677 0.67198113 0.57935797 0.727611111
#> [1824,] 8.173289e-01 8.234188e-01 0.6792474 0.67161931 0.57630077 0.738567727
#> [1825,] 8.494030e-01 8.410135e-01 0.9029110 0.90974096 0.22464857 0.406755087
#> [1826,] 1.564173e-01 3.982225e-02 0.6203145 0.51923760 0.85764766 0.127666667
#> [1827,] 9.130055e-02 2.327111e-02 0.6149024 0.44400048 0.20730783 0.032500000
#> [1828,]           NA           NA        NA         NA         NA          NA
#> [1829,]           NA           NA        NA         NA         NA          NA
#> [1830,]           NA           NA        NA         NA         NA          NA
#> [1831,]           NA           NA        NA         NA         NA          NA
#> [1832,]           NA           NA        NA         NA         NA          NA
#> [1833,]           NA           NA        NA         NA         NA          NA
#> [1834,]           NA           NA        NA         NA         NA          NA
#> [1835,] 2.054086e-01 5.240146e-02 0.2849695 0.40199655 0.51426844 0.145833333
#> [1836,] 8.238554e-01 6.546095e-01 0.5932541 0.66996546 0.57971212 0.476566964
#> [1837,] 8.250859e-01 8.201064e-01 0.6741438 0.67216546 0.57905189 0.703626984
#> [1838,] 8.329356e-01 2.862431e-01 0.8290519 0.82200993 0.10377526 0.356500000
#> [1839,] 5.816242e-01 1.817008e-01 0.7387593 0.75852671 0.87524035 0.232343897
#> [1840,] 7.859883e-03 2.001134e-03 0.5247013 0.24582069 0.84595015 0.023666667
#> [1841,]           NA           NA        NA         NA         NA          NA
#> [1842,]           NA           NA        NA         NA         NA          NA
#> [1843,]           NA           NA        NA         NA         NA          NA
#> [1844,]           NA           NA        NA         NA         NA          NA
#> [1845,]           NA           NA        NA         NA         NA          NA
#> [1846,]           NA           NA        NA         NA         NA          NA
#> [1847,]           NA           NA        NA         NA         NA          NA
#> [1848,]           NA           NA        NA         NA         NA          NA
#> [1849,] 8.295074e-03 2.116151e-03 0.2072067 0.18020551 0.48752028 0.000000000
#> [1850,] 7.217661e-01 2.366066e-01 0.4300206 0.58556793 0.55753736 0.157782623
#> [1851,] 8.193246e-01 8.237057e-01 0.6797128 0.67158616 0.57868566 0.857837712
#> [1852,] 8.264863e-01 8.052534e-01 0.6661748 0.67219785 0.57955735 0.652460317
#> [1853,] 8.154551e-01 3.878312e-01 0.8227525 0.86288829 0.28128548 0.345360946
#> [1854,] 8.080524e-02 2.057301e-02 0.5861578 0.44017649 0.85329438 0.064500000
#> [1855,]           NA           NA        NA         NA         NA          NA
#> [1856,]           NA           NA        NA         NA         NA          NA
#> [1857,]           NA           NA        NA         NA         NA          NA
#> [1858,]           NA           NA        NA         NA         NA          NA
#> [1859,]           NA           NA        NA         NA         NA          NA
#> [1860,]           NA           NA        NA         NA         NA          NA
#> [1861,]           NA           NA        NA         NA         NA          NA
#> [1862,]           NA           NA        NA         NA         NA          NA
#> [1863,]           NA           NA        NA         NA         NA          NA
#> [1864,] 2.393859e-04 6.107011e-05 0.1928331 0.07427255 0.48120552 0.000000000
#> [1865,] 7.937512e-01 3.118042e-01 0.4671956 0.61686079 0.56361311 0.182261789
#> [1866,] 8.251295e-01 8.228184e-01 0.6765967 0.67230549 0.57813361 0.754649043
#> [1867,] 8.320009e-01 7.156611e-01 0.6326334 0.67313897 0.57622954 0.727611111
#> [1868,] 8.346892e-01 4.719520e-01 0.5442916 0.65437770 0.57100928 0.742166667
#> [1869,] 6.891094e-01 4.936714e-01 0.8357713 0.87927577 0.89677025 0.816003860
#> [1870,] 4.894240e-02 1.248054e-02 0.6434122 0.37438882 0.10357589 0.102473684
#> [1871,]           NA           NA        NA         NA         NA          NA
#> [1872,]           NA           NA        NA         NA         NA          NA
#> [1873,]           NA           NA        NA         NA         NA          NA
#> [1874,]           NA           NA        NA         NA         NA          NA
#> [1875,]           NA           NA        NA         NA         NA          NA
#> [1876,]           NA           NA        NA         NA         NA          NA
#> [1877,]           NA           NA        NA         NA         NA          NA
#> [1878,] 5.506856e-01 1.481368e-01 0.3676525 0.71304690 0.44929165 0.148666667
#> [1879,] 8.186077e-01 7.427248e-01 0.6228088 0.66885171 0.58498981 0.477658599
#> [1880,] 8.392253e-01 5.473689e-01 0.5800697 0.66605028 0.56849340 0.715666667
#> [1881,] 8.387662e-01 4.711664e-01 0.5519740 0.65524557 0.56836443 0.782166667
#> [1882,] 8.410531e-01 3.400594e-01 0.8077909 0.84228524 0.15260038 0.261261195
#> [1883,] 6.417527e-03 1.636509e-03 0.6029372 0.22559986 0.07740849 0.062473684
#> [1884,]           NA           NA        NA         NA         NA          NA
#> [1885,]           NA           NA        NA         NA         NA          NA
#> [1886,]           NA           NA        NA         NA         NA          NA
#> [1887,]           NA           NA        NA         NA         NA          NA
#> [1888,]           NA           NA        NA         NA         NA          NA
#> [1889,] 6.657586e-01 2.025821e-01 0.3918029 0.77092662 0.38419088 0.196164976
#> [1890,] 8.215123e-01 7.020321e-01 0.6092201 0.66956396 0.58228258 0.450777281
#> [1891,] 7.649021e-01 2.581279e-01 0.4958934 0.60110748 0.53953107 0.397833333
#> [1892,] 8.307026e-01 5.560772e-01 0.5672105 0.66481312 0.57467345 0.657166667
#> [1893,] 8.970547e-01 5.685741e-01 0.8573168 0.89921522 0.10966761 0.359629909
#> [1894,] 7.486148e-02 1.908995e-02 0.6394505 0.41780322 0.07913858 0.101333333
#> [1895,]           NA           NA        NA         NA         NA          NA
#> [1896,]           NA           NA        NA         NA         NA          NA
#> [1897,]           NA           NA        NA         NA         NA          NA
#> [1898,]           NA           NA        NA         NA         NA          NA
#> [1899,]           NA           NA        NA         NA         NA          NA
#> [1900,]           NA           NA        NA         NA         NA          NA
#> [1901,] 7.798932e-02 1.988774e-02 0.6406968 0.44945914 0.07916497 0.101333333
#> [1902,] 8.150724e-01 8.184891e-01 0.6673436 0.66960368 0.58817653 0.789992643
#> [1903,] 5.609078e-01 1.492593e-01 0.4271698 0.52647676 0.55271226 0.197666667
#> [1904,] 7.958905e-01 2.945505e-01 0.5004256 0.61486757 0.55797305 0.397833333
#> [1905,] 8.149369e-01 6.197652e-01 0.5637998 0.66577613 0.57612398 0.538671539
#> [1906,] 1.927802e-01 4.917952e-02 0.2817976 0.39567645 0.51345553 0.145833333
#> [1907,]           NA           NA        NA         NA         NA          NA
#> [1908,]           NA           NA        NA         NA         NA          NA
#> [1909,]           NA           NA        NA         NA         NA          NA
#> [1910,]           NA           NA        NA         NA         NA          NA
#> [1911,]           NA           NA        NA         NA         NA          NA
#> [1912,]           NA           NA        NA         NA         NA          NA
#> [1913,] 2.678398e-02 6.830044e-03 0.6218127 0.34376279 0.07329700 0.052473684
#> [1914,] 8.258885e-01 8.214448e-01 0.6826802 0.67221834 0.54456287 0.485105802
#> [1915,] 8.102658e-01 3.355097e-01 0.4855986 0.62494325 0.56679679 0.374833333
#> [1916,] 3.406015e-01 8.673651e-02 0.3507368 0.45800861 0.55049808 0.111666667
#> [1917,] 8.381465e-01 4.605493e-01 0.5470564 0.65336125 0.56872969 0.798166667
#> [1918,] 7.290427e-01 2.472327e-01 0.4155976 0.58919337 0.54668515 0.166164976
#> [1919,]           NA           NA        NA         NA         NA          NA
#> [1920,]           NA           NA        NA         NA         NA          NA
#> [1921,]           NA           NA        NA         NA         NA          NA
#> [1922,]           NA           NA        NA         NA         NA          NA
#> [1923,]           NA           NA        NA         NA         NA          NA
#> [1924,]           NA           NA        NA         NA         NA          NA
#> [1925,] 1.174846e-01 2.995909e-02 0.6707394 0.49692189 0.08163202 0.110807018
#> [1926,] 8.263615e-01 6.999839e-01 0.6238168 0.91770257 0.81584848 0.297210551
#> [1927,] 8.332337e-01 5.112232e-01 0.5555223 0.65986722 0.57256228 0.604833333
#> [1928,] 6.827152e-01 2.079111e-01 0.4297000 0.56967352 0.56055050 0.321833333
#> [1929,] 8.259535e-01 5.158102e-01 0.5432170 0.65864279 0.57354744 0.343247556
#> [1930,] 7.291633e-01 2.429528e-01 0.4308440 0.58863599 0.50478820 0.160282623
#> [1931,]           NA           NA        NA         NA         NA          NA
#> [1932,]           NA           NA        NA         NA         NA          NA
#> [1933,]           NA           NA        NA         NA         NA          NA
#> [1934,]           NA           NA        NA         NA         NA          NA
#> [1935,]           NA           NA        NA         NA         NA          NA
#> [1936,]           NA           NA        NA         NA         NA          NA
#> [1937,]           NA           NA        NA         NA         NA          NA
#> [1938,]           NA           NA        NA         NA         NA          NA
#> [1939,] 5.147427e-01 1.353460e-01 0.3715988 0.69706997 0.50510532 0.112807018
#> [1940,] 8.453692e-01 5.041959e-01 0.5758144 0.66191292 0.55919704 0.723166667
#> [1941,] 4.437797e-01 1.134751e-01 0.3510068 0.48859762 0.54142042 0.074166667
#> [1942,] 3.560449e-01 9.073355e-02 0.3075695 0.62157656 0.15693690 0.053333333
#> [1943,] 7.976579e-01 3.176109e-01 0.4705435 0.61880275 0.57831322 0.199761789
#> [1944,]           NA           NA        NA         NA         NA          NA
#> [1945,]           NA           NA        NA         NA         NA          NA
#> [1946,]           NA           NA        NA         NA         NA          NA
#> [1947,]           NA           NA        NA         NA         NA          NA
#> [1948,]           NA           NA        NA         NA         NA          NA
#> [1949,]           NA           NA        NA         NA         NA          NA
#> [1950,]           NA           NA        NA         NA         NA          NA
#> [1951,] 8.183209e-01 4.114568e-01 0.5029444 0.87473724 0.64243708 0.336672619
#> [1952,] 8.337893e-01 4.988842e-01 0.5515554 0.65773710 0.54478377 0.520666667
#> [1953,] 8.374652e-01 3.803424e-01 0.5289446 0.63921629 0.56284688 0.674666667
#> [1954,] 4.103631e-01 1.044264e-01 0.3412678 0.64821725 0.22622449 0.058333333
#> [1955,] 7.967426e-01 3.464405e-01 0.4937627 0.63004570 0.60122794 0.506333333
#> [1956,] 1.795323e-02 4.578153e-03 0.6034889 0.29238446 0.07776817 0.043000000
#> [1957,]           NA           NA        NA         NA         NA          NA
#> [1958,]           NA           NA        NA         NA         NA          NA
#> [1959,]           NA           NA        NA         NA         NA          NA
#> [1960,]           NA           NA        NA         NA         NA          NA
#> [1961,]           NA           NA        NA         NA         NA          NA
#> [1962,]           NA           NA        NA         NA         NA          NA
#> [1963,]           NA           NA        NA         NA         NA          NA
#> [1964,]           NA           NA        NA         NA         NA          NA
#> [1965,]           NA           NA        NA         NA         NA          NA
#> [1966,]           NA           NA        NA         NA         NA          NA
#> [1967,] 8.186107e-01 5.131585e-01 0.5369473 0.65612583 0.48886490 0.198032268
#> [1968,] 8.698192e-01 3.692015e-01 0.4827137 0.85688987 0.47536269 0.378833333
#> [1969,] 7.103656e-01 2.151879e-01 0.4197930 0.77467851 0.35192594 0.237500000
#> [1970,] 7.985108e-01 2.883673e-01 0.4679562 0.82812257 0.40480505 0.179666667
#> [1971,] 5.740853e-02 1.476490e-02 0.6146873 0.41135908 0.06717283 0.058333333
#> [1972,]           NA           NA        NA         NA         NA          NA
#> [1973,]           NA           NA        NA         NA         NA          NA
#> [1974,]           NA           NA        NA         NA         NA          NA
#> [1975,] 1.400911e-03 3.572852e-04 0.1858300 0.11647579 0.58489095 0.000000000
#> [1976,]           NA           NA        NA         NA         NA          NA
#> [1977,]           NA           NA        NA         NA         NA          NA
#> [1978,]           NA           NA        NA         NA         NA          NA
#> [1979,] 4.824150e-01 1.247208e-01 0.3684746 0.50015811 0.44284817 0.097333333
#> [1980,] 5.583210e-01 1.464831e-01 0.3607865 0.69731282 0.32732170 0.038166667
#> [1981,] 6.546777e-01 1.972490e-01 0.3918017 0.76501250 0.23842212 0.141666667
#> [1982,] 1.828392e-01 4.659213e-02 0.2573673 0.53082191 0.10969448 0.116500000
#> [1983,] 5.433489e-01 1.430757e-01 0.4066596 0.70968175 0.38610342 0.143333333
#> [1984,] 2.871696e-03 7.322861e-04 0.5704830 0.18477215 0.09098423 0.008000000
#> [1985,]           NA           NA        NA         NA         NA          NA
#> [1986,]           NA           NA        NA         NA         NA          NA
#> [1987,] 3.179573e-02 8.107642e-03 0.6029598 0.33713178 0.09565602 0.000000000
#> [1988,]           NA           NA        NA         NA         NA          NA
#> [1989,]           NA           NA        NA         NA         NA          NA
#> [1990,]           NA           NA        NA         NA         NA          NA
#> [1991,]           NA           NA        NA         NA         NA          NA
#> [1992,] 6.087957e-03 1.552295e-03 0.6084187 0.22241424 0.09695959 0.102473684
#> [1993,] 3.270399e-02 8.339728e-03 0.2483067 0.34770215 0.40930543 0.052473684
#> [1994,]           NA           NA        NA         NA         NA          NA
#> [1995,] 2.219182e-02 5.652473e-03 0.2021422 0.31486085 0.10065217 0.000000000
#> [1996,] 3.080543e-03 7.849033e-04 0.1918113 0.19024156 0.08250679 0.000000000
#> [1997,] 1.300062e-01 3.282287e-02 0.2194675 0.49025565 0.42398235 0.215500000
#> [1998,]           NA           NA        NA         NA         NA          NA
#> [1999,]           NA           NA        NA         NA         NA          NA
#> [2000,]           NA           NA        NA         NA         NA          NA
#> [2001,]           NA           NA        NA         NA         NA          NA
#> [2002,] 9.197628e-03 2.345715e-03 0.1969494 0.18645032 0.58800724 0.000000000
#> [2003,]           NA           NA        NA         NA         NA          NA
#> [2004,]           NA           NA        NA         NA         NA          NA
#> [2005,] 1.756024e-02 4.477923e-03 0.6088251 0.29074707 0.07370016 0.043000000
#> [2006,]           NA           NA        NA         NA         NA          NA
#> [2007,] 1.699321e-02 4.332817e-03 0.2154184 0.28831843 0.18465391 0.000000000
#> [2008,] 3.455648e-02 8.801053e-03 0.2154702 0.35044753 0.10385374 0.010000000
#> [2009,] 8.625598e-02 2.188635e-02 0.2951651 0.44106552 0.34063538 0.062500000
#> [2010,] 1.819657e-01 4.619275e-02 0.3336066 0.39623563 0.57399560 0.093000000
#> [2011,]           NA           NA        NA         NA         NA          NA
#> [2012,]           NA           NA        NA         NA         NA          NA
#> [2013,]           NA           NA        NA         NA         NA          NA
#> [2014,]           NA           NA        NA         NA         NA          NA
#> [2015,] 2.079415e-03 5.303276e-04 0.1873784 0.12856464 0.58535924 0.000000000
#> [2016,]           NA           NA        NA         NA         NA          NA
#> [2017,]           NA           NA        NA         NA         NA          NA
#> [2018,]           NA           NA        NA         NA         NA          NA
#> [2019,]           NA           NA        NA         NA         NA          NA
#> [2020,]           NA           NA        NA         NA         NA          NA
#> [2021,]           NA           NA        NA         NA         NA          NA
#> [2022,] 2.944166e-01 7.489296e-02 0.3183291 0.59924234 0.20718821 0.105333333
#> [2023,] 6.575834e-01 1.875037e-01 0.4304701 0.75372166 0.42138102 0.298833333
#> [2024,] 1.308440e-02 3.337681e-03 0.2072692 0.20233682 0.12135036 0.005833333
#> [2025,]           NA           NA        NA         NA         NA          NA
#> [2026,]           NA           NA        NA         NA         NA          NA
#> [2027,]           NA           NA        NA         NA         NA          NA
#> [2028,]           NA           NA        NA         NA         NA          NA
#> [2029,]           NA           NA        NA         NA         NA          NA
#> [2030,]           NA           NA        NA         NA         NA          NA
#> [2031,]           NA           NA        NA         NA         NA          NA
#> [2032,]           NA           NA        NA         NA         NA          NA
#> [2033,]           NA           NA        NA         NA         NA          NA
#> [2034,]           NA           NA        NA         NA         NA          NA
#> [2035,] 1.145801e-01 2.915673e-02 0.2716910 0.47092258 0.17882280 0.052500000
#> [2036,] 5.873194e-01 1.572714e-01 0.4172900 0.72205298 0.44137608 0.139666667
#> [2037,] 3.907443e-02 9.957843e-03 0.2155729 0.35884441 0.08926633 0.000000000
#> [2038,]           NA           NA        NA         NA         NA          NA
#> [2039,]           NA           NA        NA         NA         NA          NA
#> [2040,]           NA           NA        NA         NA         NA          NA
#> [2041,]           NA           NA        NA         NA         NA          NA
#> [2042,]           NA           NA        NA         NA         NA          NA
#> [2043,]           NA           NA        NA         NA         NA          NA
#> [2044,]           NA           NA        NA         NA         NA          NA
#> [2045,]           NA           NA        NA         NA         NA          NA
#> [2046,]           NA           NA        NA         NA         NA          NA
#> [2047,]           NA           NA        NA         NA         NA          NA
#> [2048,] 4.195791e-02 1.067888e-02 0.2324456 0.36778291 0.13237049 0.010000000
#> [2049,] 3.972657e-01 1.008204e-01 0.3880995 0.48178488 0.56043547 0.088333333
#> [2050,] 1.730375e-02 4.411940e-03 0.2075413 0.21848295 0.59307270 0.000000000
#> [2051,]           NA           NA        NA         NA         NA          NA
#> [2052,]           NA           NA        NA         NA         NA          NA
#> [2053,]           NA           NA        NA         NA         NA          NA
#> [2054,]           NA           NA        NA         NA         NA          NA
#> [2055,]           NA           NA        NA         NA         NA          NA
#> [2056,]           NA           NA        NA         NA         NA          NA
#> [2057,]           NA           NA        NA         NA         NA          NA
#> [2058,]           NA           NA        NA         NA         NA          NA
#> [2059,]           NA           NA        NA         NA         NA          NA
#> [2060,]           NA           NA        NA         NA         NA          NA
#> [2061,] 9.183029e-02 2.338268e-02 0.2652748 0.33248667 0.60826193 0.057500000
#> [2062,] 3.463865e-01 8.795252e-02 0.3621465 0.62378193 0.36180127 0.078333333
#> [2063,] 1.001051e-02 2.550845e-03 0.1898508 0.25711310 0.08123463 0.000000000
#> [2064,]           NA           NA        NA         NA         NA          NA
#> [2065,]           NA           NA        NA         NA         NA          NA
#> [2066,]           NA           NA        NA         NA         NA          NA
#> [2067,]           NA           NA        NA         NA         NA          NA
#> [2068,]           NA           NA        NA         NA         NA          NA
#> [2069,]           NA           NA        NA         NA         NA          NA
#> [2070,]           NA           NA        NA         NA         NA          NA
#> [2071,]           NA           NA        NA         NA         NA          NA
#> [2072,]           NA           NA        NA         NA         NA          NA
#> [2073,]           NA           NA        NA         NA         NA          NA
#> [2074,] 1.115968e-02 2.841591e-03 0.2129157 0.26258594 0.11523634 0.000000000
#> [2075,] 1.725049e-01 4.378563e-02 0.3314365 0.39103531 0.57099133 0.093000000
#> [2076,]           NA           NA        NA         NA         NA          NA
#> [2077,]           NA           NA        NA         NA         NA          NA
#> [2078,]           NA           NA        NA         NA         NA          NA
#> [2079,]           NA           NA        NA         NA         NA          NA
#> [2080,]           NA           NA        NA         NA         NA          NA
#> [2081,]           NA           NA        NA         NA         NA          NA
#> [2082,]           NA           NA        NA         NA         NA          NA
#> [2083,]           NA           NA        NA         NA         NA          NA
#> [2084,]           NA           NA        NA         NA         NA          NA
#> [2085,]           NA           NA        NA         NA         NA          NA
#> [2086,]           NA           NA        NA         NA         NA          NA
#> [2087,]           NA           NA        NA         NA         NA          NA
#> [2088,]           NA           NA        NA         NA         NA          NA
#> [2089,] 6.700061e-06 1.707567e-06 0.1738244 0.04121448 0.06819601 0.010000000
#> [2090,] 6.074015e-02 1.544739e-02 0.2595180 0.40256235 0.19147824 0.032500000
#> [2091,]           NA           NA        NA         NA         NA          NA
#> [2092,]           NA           NA        NA         NA         NA          NA
#> [2093,]           NA           NA        NA         NA         NA          NA
#> [2094,]           NA           NA        NA         NA         NA          NA
#> [2095,]           NA           NA        NA         NA         NA          NA
#> [2096,]           NA           NA        NA         NA         NA          NA
#> [2097,]           NA           NA        NA         NA         NA          NA
#> [2098,]           NA           NA        NA         NA         NA          NA
#> [2099,]           NA           NA        NA         NA         NA          NA
#> [2100,]           NA           NA        NA         NA         NA          NA
#> [2101,]           NA           NA        NA         NA         NA          NA
#> [2102,]           NA           NA        NA         NA         NA          NA
#> [2103,]           NA           NA        NA         NA         NA          NA
#> [2104,]           NA           NA        NA         NA         NA          NA
#> [2105,]           NA           NA        NA         NA         NA          NA
#> [2106,] 1.026333e-02 2.614887e-03 0.1958088 0.25803826 0.08437536 0.010000000
#> [2107,]           NA           NA        NA         NA         NA          NA
#> [2108,]           NA           NA        NA         NA         NA          NA
#> [2109,]           NA           NA        NA         NA         NA          NA
#> [2110,]           NA           NA        NA         NA         NA          NA
#> [2111,]           NA           NA        NA         NA         NA          NA
#> [2112,]           NA           NA        NA         NA         NA          NA
#> [2113,]           NA           NA        NA         NA         NA          NA
#> [2114,]           NA           NA        NA         NA         NA          NA
#> [2115,]           NA           NA        NA         NA         NA          NA
#> [2116,]           NA           NA        NA         NA         NA          NA
#> [2117,]           NA           NA        NA         NA         NA          NA
#> [2118,]           NA           NA        NA         NA         NA          NA
#> [2119,]           NA           NA        NA         NA         NA          NA
#> [2120,]           NA           NA        NA         NA         NA          NA
#> [2121,]           NA           NA        NA         NA         NA          NA
#> [2122,]           NA           NA        NA         NA         NA          NA
#> [2123,]           NA           NA        NA         NA         NA          NA
#> [2124,]           NA           NA        NA         NA         NA          NA
#> [2125,]           NA           NA        NA         NA         NA          NA
#> [2126,]           NA           NA        NA         NA         NA          NA
#> [2127,]           NA           NA        NA         NA         NA          NA
#> [2128,]           NA           NA        NA         NA         NA          NA
#> [2129,]           NA           NA        NA         NA         NA          NA
#> [2130,]           NA           NA        NA         NA         NA          NA
#> [2131,]           NA           NA        NA         NA         NA          NA
#> [2132,]           NA           NA        NA         NA         NA          NA
#> [2133,]           NA           NA        NA         NA         NA          NA
#> [2134,]           NA           NA        NA         NA         NA          NA
#> [2135,]           NA           NA        NA         NA         NA          NA
#> [2136,] 1.477722e-02 3.765726e-03 0.2015902 0.28143262 0.08345308 0.000000000
#> [2137,] 2.110833e-04 5.379635e-05 0.1758635 0.09764356 0.06904795 0.010000000
#> [2138,]           NA           NA        NA         NA         NA          NA
#> [2139,]           NA           NA        NA         NA         NA          NA
#> [2140,]           NA           NA        NA         NA         NA          NA
#> [2141,]           NA           NA        NA         NA         NA          NA
#> [2142,]           NA           NA        NA         NA         NA          NA
#> [2143,]           NA           NA        NA         NA         NA          NA
#> [2144,]           NA           NA        NA         NA         NA          NA
#> [2145,]           NA           NA        NA         NA         NA          NA
#> [2146,]           NA           NA        NA         NA         NA          NA
#> [2147,]           NA           NA        NA         NA         NA          NA
#> [2148,]           NA           NA        NA         NA         NA          NA
#> [2149,]           NA           NA        NA         NA         NA          NA
#> [2150,]           NA           NA        NA         NA         NA          NA
#> [2151,] 1.003984e-02 2.559028e-03 0.1953420 0.25519410 0.07628870 0.000000000
#> [2152,]           NA           NA        NA         NA         NA          NA
#> [2153,]           NA           NA        NA         NA         NA          NA
#> [2154,]           NA           NA        NA         NA         NA          NA
#> [2155,]           NA           NA        NA         NA         NA          NA
#> [2156,]           NA           NA        NA         NA         NA          NA
#> [2157,]           NA           NA        NA         NA         NA          NA
#> [2158,]           NA           NA        NA         NA         NA          NA
#> [2159,]           NA           NA        NA         NA         NA          NA
#> [2160,]           NA           NA        NA         NA         NA          NA
#> [2161,]           NA           NA        NA         NA         NA          NA
#> [2162,]           NA           NA        NA         NA         NA          NA
#> [2163,] 5.786230e-02 1.475135e-02 0.2318484 0.29552468 0.59910196 0.037500000
#> [2164,] 2.862087e-02 7.289326e-03 0.2200376 0.33248766 0.10929151 0.000000000
#> [2165,]           NA           NA        NA         NA         NA          NA
#> [2166,]           NA           NA        NA         NA         NA          NA
#> [2167,]           NA           NA        NA         NA         NA          NA
#> [2168,]           NA           NA        NA         NA         NA          NA
#> [2169,]           NA           NA        NA         NA         NA          NA
#> [2170,]           NA           NA        NA         NA         NA          NA
#> [2171,]           NA           NA        NA         NA         NA          NA
#> [2172,]           NA           NA        NA         NA         NA          NA
#> [2173,]           NA           NA        NA         NA         NA          NA
#> [2174,]           NA           NA        NA         NA         NA          NA
#> [2175,]           NA           NA        NA         NA         NA          NA
#> [2176,] 1.047436e-03 2.669887e-04 0.1817080 0.14511756 0.06858527 0.000000000
#> [2177,] 8.549923e-03 2.179135e-03 0.1938824 0.24535454 0.07620687 0.000000000
#> [2178,] 2.412737e-04 6.153451e-05 0.1817148 0.07503276 0.58360600 0.000000000
#> [2179,]           NA           NA        NA         NA         NA          NA
#> [2180,]           NA           NA        NA         NA         NA          NA
#> [2181,]           NA           NA        NA         NA         NA          NA
#> [2182,]           NA           NA        NA         NA         NA          NA
#> [2183,]           NA           NA        NA         NA         NA          NA
#> [2184,]           NA           NA        NA         NA         NA          NA
#> [2185,]           NA           NA        NA         NA         NA          NA
#> [2186,]           NA           NA        NA         NA         NA          NA
#> [2187,]           NA           NA        NA         NA         NA          NA
#> [2188,]           NA           NA        NA         NA         NA          NA
#> [2189,] 1.812320e-03 4.617612e-04 0.1791325 0.16803108 0.08119043 0.000000000
#> [2190,]           NA           NA        NA         NA         NA          NA
#> [2191,]           NA           NA        NA         NA         NA          NA
#> [2192,]           NA           NA        NA         NA         NA          NA
#> [2193,]           NA           NA        NA         NA         NA          NA
#> [2194,]           NA           NA        NA         NA         NA          NA
#> [2195,]           NA           NA        NA         NA         NA          NA
#> [2196,]           NA           NA        NA         NA         NA          NA
#> [2197,]           NA           NA        NA         NA         NA          NA
#> [2198,]           NA           NA        NA         NA         NA          NA
#> [2199,]           NA           NA        NA         NA         NA          NA
#> [2200,]           NA           NA        NA         NA         NA          NA
#> [2201,]           NA           NA        NA         NA         NA          NA
#> [2202,] 5.654281e-03 1.442026e-03 0.1931304 0.16509977 0.58709932 0.000000000
#> [2203,]           NA           NA        NA         NA         NA          NA
#> [2204,]           NA           NA        NA         NA         NA          NA
#> [2205,]           NA           NA        NA         NA         NA          NA
#> [2206,]           NA           NA        NA         NA         NA          NA
#> [2207,]           NA           NA        NA         NA         NA          NA
#> [2208,]           NA           NA        NA         NA         NA          NA
#> [2209,]           NA           NA        NA         NA         NA          NA
#> [2210,]           NA           NA        NA         NA         NA          NA
#> [2211,]           NA           NA        NA         NA         NA          NA
#> [2212,] 2.120679e-04 5.402673e-05 0.1703871 0.09875604 0.09247874 0.000000000
#> [2213,] 1.489306e-03 3.796074e-04 0.1825872 0.15855899 0.06931771 0.000000000
#> [2214,]           NA           NA        NA         NA         NA          NA
#> [2215,]           NA           NA        NA         NA         NA          NA
#> [2216,]           NA           NA        NA         NA         NA          NA
#> [2217,]           NA           NA        NA         NA         NA          NA
#> [2218,]           NA           NA        NA         NA         NA          NA
#> [2219,]           NA           NA        NA         NA         NA          NA
#> [2220,]           NA           NA        NA         NA         NA          NA
#> [2221,]           NA           NA        NA         NA         NA          NA
#> [2222,]           NA           NA        NA         NA         NA          NA
#> [2223,]           NA           NA        NA         NA         NA          NA
#> [2224,] 3.969596e-03 1.011674e-03 0.1844903 0.20334279 0.07290098 0.010000000
#> [2225,]           NA           NA        NA         NA         NA          NA
#> [2226,]           NA           NA        NA         NA         NA          NA
#> [2227,]           NA           NA        NA         NA         NA          NA
#> [2228,]           NA           NA        NA         NA         NA          NA
#> [2229,]           NA           NA        NA         NA         NA          NA
#> [2230,]           NA           NA        NA         NA         NA          NA
#> [2231,]           NA           NA        NA         NA         NA          NA
#> [2232,]           NA           NA        NA         NA         NA          NA
#> [2233,]           NA           NA        NA         NA         NA          NA
#> [2234,]           NA           NA        NA         NA         NA          NA
#> [2235,]           NA           NA        NA         NA         NA          NA
#> [2236,]           NA           NA        NA         NA         NA          NA
#> [2237,]           NA           NA        NA         NA         NA          NA
#> [2238,]           NA           NA        NA         NA         NA          NA
#> [2239,]           NA           NA        NA         NA         NA          NA
#> [2240,]           NA           NA        NA         NA         NA          NA
#> [2241,]           NA           NA        NA         NA         NA          NA
#> [2242,]           NA           NA        NA         NA         NA          NA
#> [2243,]           NA           NA        NA         NA         NA          NA
#> [2244,]           NA           NA        NA         NA         NA          NA
#> [2245,]           NA           NA        NA         NA         NA          NA
#> [2246,] 7.958519e-03 2.028499e-03 0.1935451 0.24080346 0.07577376 0.000000000
#> [2247,] 3.234504e-03 8.241434e-04 0.1812730 0.19420194 0.29790831 0.000000000
#> [2248,]           NA           NA        NA         NA         NA          NA
#> [2249,]           NA           NA        NA         NA         NA          NA
#> [2250,]           NA           NA        NA         NA         NA          NA
#> [2251,]           NA           NA        NA         NA         NA          NA
#> [2252,]           NA           NA        NA         NA         NA          NA
#> [2253,]           NA           NA        NA         NA         NA          NA
#> [2254,]           NA           NA        NA         NA         NA          NA
#> [2255,]           NA           NA        NA         NA         NA          NA
#> [2256,]           NA           NA        NA         NA         NA          NA
#> [2257,]           NA           NA        NA         NA         NA          NA
#> [2258,]           NA           NA        NA         NA         NA          NA
#> [2259,]           NA           NA        NA         NA         NA          NA
#> [2260,]           NA           NA        NA         NA         NA          NA
#> [2261,]           NA           NA        NA         NA         NA          NA
#> [2262,]           NA           NA        NA         NA         NA          NA
#> [2263,]           NA           NA        NA         NA         NA          NA
#> [2264,]           NA           NA        NA         NA         NA          NA
#> [2265,]           NA           NA        NA         NA         NA          NA
#> [2266,]           NA           NA        NA         NA         NA          NA
#> [2267,]           NA           NA        NA         NA         NA          NA
#> [2268,]           NA           NA        NA         NA         NA          NA
#> [2269,]           NA           NA        NA         NA         NA          NA
#> [2270,]           NA           NA        NA         NA         NA          NA
#> [2271,]           NA           NA        NA         NA         NA          NA
#> [2272,]           NA           NA        NA         NA         NA          NA
#> [2273,]           NA           NA        NA         NA         NA          NA
#> [2274,]           NA           NA        NA         NA         NA          NA
#> [2275,]           NA           NA        NA         NA         NA          NA
#> [2276,]           NA           NA        NA         NA         NA          NA
#> [2277,]           NA           NA        NA         NA         NA          NA
#> [2278,]           NA           NA        NA         NA         NA          NA
#> [2279,]           NA           NA        NA         NA         NA          NA
#> [2280,]           NA           NA        NA         NA         NA          NA
#> [2281,]           NA           NA        NA         NA         NA          NA
#> [2282,]           NA           NA        NA         NA         NA          NA
#> [2283,]           NA           NA        NA         NA         NA          NA
#> [2284,]           NA           NA        NA         NA         NA          NA
#> [2285,]           NA           NA        NA         NA         NA          NA
#> [2286,]           NA           NA        NA         NA         NA          NA
#> [2287,]           NA           NA        NA         NA         NA          NA
#> [2288,]           NA           NA        NA         NA         NA          NA
#> [2289,]           NA           NA        NA         NA         NA          NA
#> [2290,]           NA           NA        NA         NA         NA          NA
#> [2291,]           NA           NA        NA         NA         NA          NA
#> [2292,]           NA           NA        NA         NA         NA          NA
#> [2293,]           NA           NA        NA         NA         NA          NA
#> [2294,]           NA           NA        NA         NA         NA          NA
#> [2295,]           NA           NA        NA         NA         NA          NA
#> [2296,]           NA           NA        NA         NA         NA          NA
#> [2297,]           NA           NA        NA         NA         NA          NA
#> [2298,]           NA           NA        NA         NA         NA          NA
#> [2299,]           NA           NA        NA         NA         NA          NA
#> [2300,]           NA           NA        NA         NA         NA          NA
#> [2301,]           NA           NA        NA         NA         NA          NA
#> [2302,]           NA           NA        NA         NA         NA          NA
#> [2303,]           NA           NA        NA         NA         NA          NA
#> [2304,]           NA           NA        NA         NA         NA          NA
#> [2305,]           NA           NA        NA         NA         NA          NA
#> [2306,]           NA           NA        NA         NA         NA          NA
#> [2307,]           NA           NA        NA         NA         NA          NA
#> [2308,]           NA           NA        NA         NA         NA          NA
#> [2309,]           NA           NA        NA         NA         NA          NA
#> [2310,]           NA           NA        NA         NA         NA          NA
#> [2311,] 2.603222e-02 6.640050e-03 0.2160872 0.24051276 0.54487533 0.012500000
#> [2312,]           NA           NA        NA         NA         NA          NA
#> [2313,]           NA           NA        NA         NA         NA          NA
#> [2314,]           NA           NA        NA         NA         NA          NA
#> [2315,]           NA           NA        NA         NA         NA          NA
#> [2316,]           NA           NA        NA         NA         NA          NA
#> [2317,]           NA           NA        NA         NA         NA          NA
#> [2318,]           NA           NA        NA         NA         NA          NA
#> [2319,]           NA           NA        NA         NA         NA          NA
#> [2320,]           NA           NA        NA         NA         NA          NA
#> [2321,]           NA           NA        NA         NA         NA          NA
#> [2322,] 1.390886e-05 3.544479e-06 0.1726387 0.04959203 0.07135093 0.000000000
#> [2323,]           NA           NA        NA         NA         NA          NA
#> [2324,]           NA           NA        NA         NA         NA          NA
#> [2325,]           NA           NA        NA         NA         NA          NA
#> [2326,]           NA           NA        NA         NA         NA          NA
#> [2327,]           NA           NA        NA         NA         NA          NA
#> [2328,]           NA           NA        NA         NA         NA          NA
#> [2329,]           NA           NA        NA         NA         NA          NA
#> [2330,]           NA           NA        NA         NA         NA          NA
#> [2331,]           NA           NA        NA         NA         NA          NA
#> [2332,]           NA           NA        NA         NA         NA          NA
#> [2333,]           NA           NA        NA         NA         NA          NA
#> [2334,]           NA           NA        NA         NA         NA          NA
#> [2335,]           NA           NA        NA         NA         NA          NA
#> [2336,]           NA           NA        NA         NA         NA          NA
#> [2337,]           NA           NA        NA         NA         NA          NA
#> [2338,]           NA           NA        NA         NA         NA          NA
#> [2339,]           NA           NA        NA         NA         NA          NA
#> [2340,]           NA           NA        NA         NA         NA          NA
#> [2341,]           NA           NA        NA         NA         NA          NA
#> [2342,]           NA           NA        NA         NA         NA          NA
#> [2343,]           NA           NA        NA         NA         NA          NA
#> [2344,]           NA           NA        NA         NA         NA          NA
#> [2345,]           NA           NA        NA         NA         NA          NA
#> [2346,]           NA           NA        NA         NA         NA          NA
#> [2347,]           NA           NA        NA         NA         NA          NA
#> [2348,]           NA           NA        NA         NA         NA          NA
#> [2349,]           NA           NA        NA         NA         NA          NA
#> [2350,]           NA           NA        NA         NA         NA          NA
#> [2351,]           NA           NA        NA         NA         NA          NA
#> [2352,]           NA           NA        NA         NA         NA          NA
#> [2353,]           NA           NA        NA         NA         NA          NA
#> [2354,]           NA           NA        NA         NA         NA          NA
#> [2355,]           NA           NA        NA         NA         NA          NA
#> [2356,]           NA           NA        NA         NA         NA          NA
#> [2357,]           NA           NA        NA         NA         NA          NA
#> [2358,]           NA           NA        NA         NA         NA          NA
#> [2359,]           NA           NA        NA         NA         NA          NA
#> [2360,]           NA           NA        NA         NA         NA          NA
#> [2361,]           NA           NA        NA         NA         NA          NA
#> [2362,]           NA           NA        NA         NA         NA          NA
#> [2363,]           NA           NA        NA         NA         NA          NA
#> [2364,]           NA           NA        NA         NA         NA          NA
#> [2365,]           NA           NA        NA         NA         NA          NA
#> [2366,]           NA           NA        NA         NA         NA          NA
#> [2367,]           NA           NA        NA         NA         NA          NA
#> [2368,]           NA           NA        NA         NA         NA          NA
#> [2369,]           NA           NA        NA         NA         NA          NA
#> [2370,]           NA           NA        NA         NA         NA          NA
#> [2371,]           NA           NA        NA         NA         NA          NA
#> [2372,]           NA           NA        NA         NA         NA          NA
#> [2373,]           NA           NA        NA         NA         NA          NA
#> [2374,]           NA           NA        NA         NA         NA          NA
#> [2375,]           NA           NA        NA         NA         NA          NA
#> [2376,]           NA           NA        NA         NA         NA          NA
#> [2377,]           NA           NA        NA         NA         NA          NA
#> [2378,]           NA           NA        NA         NA         NA          NA
#> [2379,]           NA           NA        NA         NA         NA          NA
#> [2380,]           NA           NA        NA         NA         NA          NA
#> [2381,]           NA           NA        NA         NA         NA          NA
#> [2382,]           NA           NA        NA         NA         NA          NA
#> [2383,]           NA           NA        NA         NA         NA          NA
#> [2384,] 2.025503e-02 5.167140e-03 0.2334894 0.22529897 0.33341733 0.052473684
#> [2385,] 2.886480e-06 7.353639e-07 0.1681772 0.03373161 0.09141440 0.000000000
#> [2386,]           NA           NA        NA         NA         NA          NA
#> [2387,]           NA           NA        NA         NA         NA          NA
#> [2388,]           NA           NA        NA         NA         NA          NA
#> [2389,]           NA           NA        NA         NA         NA          NA
#> [2390,]           NA           NA        NA         NA         NA          NA
#> [2391,]           NA           NA        NA         NA         NA          NA
#> [2392,]           NA           NA        NA         NA         NA          NA
#> [2393,]           NA           NA        NA         NA         NA          NA
#> [2394,]           NA           NA        NA         NA         NA          NA
#> [2395,]           NA           NA        NA         NA         NA          NA
#> [2396,]           NA           NA        NA         NA         NA          NA
#> [2397,] 6.970048e-04 1.777965e-04 0.1892661 0.09727553 0.53489940 0.012500000
#> [2398,] 9.170584e-02 2.335209e-02 0.2330407 0.45078714 0.13508579 0.042500000
#> [2399,] 1.466004e-01 3.737505e-02 0.2892400 0.49414708 0.43883970 0.100807018
#> [2400,]           NA           NA        NA         NA         NA          NA
#> [2401,]           NA           NA        NA         NA         NA          NA
#> [2402,]           NA           NA        NA         NA         NA          NA
#> [2403,]           NA           NA        NA         NA         NA          NA
#> [2404,]           NA           NA        NA         NA         NA          NA
#> [2405,]           NA           NA        NA         NA         NA          NA
#> [2406,]           NA           NA        NA         NA         NA          NA
#> [2407,]           NA           NA        NA         NA         NA          NA
#> [2408,]           NA           NA        NA         NA         NA          NA
#> [2409,] 8.492505e-02 2.164129e-02 0.2463520 0.43321019 0.14393404 0.040000000
#> [2410,] 8.243783e-01 3.781543e-01 0.4972351 0.63500287 0.55479815 0.372608728
#> [2411,] 3.950109e-01 1.008754e-01 0.3605459 0.48938104 0.65434164 0.069833333
#> [2412,] 1.669295e-01 4.257681e-02 0.2855150 0.38192744 0.46585556 0.121333333
#> [2413,]           NA           NA        NA         NA         NA          NA
#> [2414,]           NA           NA        NA         NA         NA          NA
#> [2415,]           NA           NA        NA         NA         NA          NA
#> [2416,]           NA           NA        NA         NA         NA          NA
#> [2417,]           NA           NA        NA         NA         NA          NA
#> [2418,]           NA           NA        NA         NA         NA          NA
#> [2419,]           NA           NA        NA         NA         NA          NA
#> [2420,]           NA           NA        NA         NA         NA          NA
#> [2421,]           NA           NA        NA         NA         NA          NA
#> [2422,] 8.590654e-02 2.190561e-02 0.6479927 0.46056597 0.07679290 0.101333333
#> [2423,] 9.013862e-01 5.472377e-01 0.8562823 0.95443131 0.10135987 0.326314891
#> [2424,] 1.680106e-01 4.280003e-02 0.3045581 0.38348147 0.52338752 0.131000000
#> [2425,] 1.057403e-01 2.676182e-02 0.2866508 0.35632324 0.69384638 0.055833333
#> [2426,] 1.962159e-01 5.004217e-02 0.3022151 0.39792796 0.41582794 0.148333333
#> [2427,]           NA           NA        NA         NA         NA          NA
#> [2428,]           NA           NA        NA         NA         NA          NA
#> [2429,]           NA           NA        NA         NA         NA          NA
#> [2430,]           NA           NA        NA         NA         NA          NA
#> [2431,]           NA           NA        NA         NA         NA          NA
#> [2432,]           NA           NA        NA         NA         NA          NA
#> [2433,] 1.527334e-01 3.894349e-02 0.6728472 0.53192641 0.07799008 0.101333333
#> [2434,] 7.376616e-01 2.242022e-01 0.7851801 0.82444225 0.09599497 0.194164976
#> [2435,]           NA           NA        NA         NA         NA          NA
#> [2436,] 4.010859e-02 1.015152e-02 0.2546274 0.27963021 0.70414013 0.015000000
#> [2437,] 4.119571e-02 1.050499e-02 0.2495174 0.26944923 0.39813726 0.043000000
#> [2438,]           NA           NA        NA         NA         NA          NA
#> [2439,]           NA           NA        NA         NA         NA          NA
#> [2440,]           NA           NA        NA         NA         NA          NA
#> [2441,]           NA           NA        NA         NA         NA          NA
#> [2442,]           NA           NA        NA         NA         NA          NA
#> [2443,] 1.294479e-01 3.300784e-02 0.6700143 0.51012961 0.07407390 0.110807018
#> [2444,]           NA           NA        NA         NA         NA          NA
#> [2445,]           NA           NA        NA         NA         NA          NA
#> [2446,] 1.918215e-01 4.857965e-02 0.3148397 0.41339229 0.71119208 0.103166667
#> [2447,] 1.067337e-01 2.722626e-02 0.2712608 0.34157425 0.39746456 0.101333333
#> [2448,]           NA           NA        NA         NA         NA          NA
#> [2449,]           NA           NA        NA         NA         NA          NA
#> [2450,]           NA           NA        NA         NA         NA          NA
#> [2451,]           NA           NA        NA         NA         NA          NA
#> [2452,]           NA           NA        NA         NA         NA          NA
#> [2453,]           NA           NA        NA         NA         NA          NA
#> [2454,]           NA           NA        NA         NA         NA          NA
#> [2455,]           NA           NA        NA         NA         NA          NA
#> [2456,] 1.404102e-02 3.574925e-03 0.1837328 0.21416803 0.81862590 0.023666667
#> [2457,] 1.397727e-01 3.560312e-02 0.2757645 0.36905540 0.60917028 0.075500000
#> [2458,]           NA           NA        NA         NA         NA          NA
#> [2459,]           NA           NA        NA         NA         NA          NA
#> [2460,]           NA           NA        NA         NA         NA          NA
#> [2461,]           NA           NA        NA         NA         NA          NA
#> [2462,]           NA           NA        NA         NA         NA          NA
#> [2463,]           NA           NA        NA         NA         NA          NA
#> [2464,] 1.236387e-01 3.152679e-02 0.6516811 0.50405312 0.09101864 0.083000000
#> [2465,] 3.011514e-02 7.682134e-03 0.2273913 0.24873466 0.47498148 0.008000000
#> [2466,] 2.337314e-02 5.957123e-03 0.2096867 0.23722564 0.63119710 0.000000000
#> [2467,] 2.261303e-01 5.732890e-02 0.3181211 0.43048830 0.74343191 0.093166667
#> [2468,] 1.187288e-01 3.028369e-02 0.2767946 0.35085966 0.40218036 0.101333333
#> [2469,]           NA           NA        NA         NA         NA          NA
#> [2470,]           NA           NA        NA         NA         NA          NA
#> [2471,]           NA           NA        NA         NA         NA          NA
#> [2472,]           NA           NA        NA         NA         NA          NA
#> [2473,]           NA           NA        NA         NA         NA          NA
#> [2474,]           NA           NA        NA         NA         NA          NA
#> [2475,]           NA           NA        NA         NA         NA          NA
#> [2476,]           NA           NA        NA         NA         NA          NA
#> [2477,] 1.584582e-02 4.042441e-03 0.2165536 0.28970407 0.46875015 0.008000000
#> [2478,] 3.672037e-01 9.466032e-02 0.3206169 0.48660763 0.79888500 0.092333333
#> [2479,] 5.166715e-01 1.559381e-01 0.3823387 0.55183382 0.77746716 0.269666667
#> [2480,]           NA           NA        NA         NA         NA          NA
#> [2481,]           NA           NA        NA         NA         NA          NA
#> [2482,]           NA           NA        NA         NA         NA          NA
#> [2483,]           NA           NA        NA         NA         NA          NA
#> [2484,]           NA           NA        NA         NA         NA          NA
#> [2485,]           NA           NA        NA         NA         NA          NA
#> [2486,]           NA           NA        NA         NA         NA          NA
#> [2487,]           NA           NA        NA         NA         NA          NA
#> [2488,]           NA           NA        NA         NA         NA          NA
#> [2489,]           NA           NA        NA         NA         NA          NA
#> [2490,] 3.485469e-01 8.872774e-02 0.2934162 0.63360060 0.25825824 0.054833333
#> [2491,] 6.521103e-01 2.008304e-01 0.4100847 0.56891895 0.61782416 0.204166667
#> [2492,] 3.555675e-02 9.070787e-03 0.2392599 0.25944638 0.38031071 0.043000000
#> [2493,]           NA           NA        NA         NA         NA          NA
#> [2494,]           NA           NA        NA         NA         NA          NA
#> [2495,]           NA           NA        NA         NA         NA          NA
#> [2496,]           NA           NA        NA         NA         NA          NA
#> [2497,]           NA           NA        NA         NA         NA          NA
#> [2498,]           NA           NA        NA         NA         NA          NA
#> [2499,]           NA           NA        NA         NA         NA          NA
#> [2500,]           NA           NA        NA         NA         NA          NA
#> [2501,] 6.002988e-01 2.464621e-01 0.4044490 0.60159295 0.80749075 0.277010564
#> [2502,] 6.204468e-01 1.765481e-01 0.4061102 0.54581893 0.45900313 0.231382353
#> [2503,]           NA           NA        NA         NA         NA          NA
#> [2504,]           NA           NA        NA         NA         NA          NA
#> [2505,]           NA           NA        NA         NA         NA          NA
#> [2506,]           NA           NA        NA         NA         NA          NA
#> [2507,]           NA           NA        NA         NA         NA          NA
#> [2508,]           NA           NA        NA         NA         NA          NA
#> [2509,]           NA           NA        NA         NA         NA          NA
#> [2510,]           NA           NA        NA         NA         NA          NA
#> [2511,]           NA           NA        NA         NA         NA          NA
#> [2512,]           NA           NA        NA         NA         NA          NA
#> [2513,] 1.145563e-01 2.917753e-02 0.2370755 0.47634291 0.13100423 0.042500000
#> [2514,] 3.268375e-01 8.330693e-02 0.3119041 0.45578332 0.61206495 0.053333333
#> [2515,]           NA           NA        NA         NA         NA          NA
#> [2516,]           NA           NA        NA         NA         NA          NA
#> [2517,]           NA           NA        NA         NA         NA          NA
#> [2518,]           NA           NA        NA         NA         NA          NA
#> [2519,]           NA           NA        NA         NA         NA          NA
#> [2520,]           NA           NA        NA         NA         NA          NA
#> [2521,]           NA           NA        NA         NA         NA          NA
#> [2522,]           NA           NA        NA         NA         NA          NA
#> [2523,]           NA           NA        NA         NA         NA          NA
#> [2524,]           NA           NA        NA         NA         NA          NA
#> [2525,] 2.594643e-01 6.607919e-02 0.2971407 0.43596829 0.66175655 0.054333333
#> [2526,]           NA           NA        NA         NA         NA          NA
#> [2527,]           NA           NA        NA         NA         NA          NA
#> [2528,] 5.288669e-05 1.349094e-05 0.1865907 0.05102609 0.52631205 0.012500000
#> [2529,]           NA           NA        NA         NA         NA          NA
#> [2530,]           NA           NA        NA         NA         NA          NA
#> [2531,]           NA           NA        NA         NA         NA          NA
#> [2532,]           NA           NA        NA         NA         NA          NA
#> [2533,]           NA           NA        NA         NA         NA          NA
#> [2534,]           NA           NA        NA         NA         NA          NA
#> [2535,]           NA           NA        NA         NA         NA          NA
#> [2536,]           NA           NA        NA         NA         NA          NA
#> [2537,]           NA           NA        NA         NA         NA          NA
#> [2538,] 2.875413e-02 7.321450e-03 0.1935745 0.25618433 0.81888616 0.023666667
#> [2539,]           NA           NA        NA         NA         NA          NA
#> [2540,]           NA           NA        NA         NA         NA          NA
#> [2541,]           NA           NA        NA         NA         NA          NA
#> [2542,]           NA           NA        NA         NA         NA          NA
#> [2543,]           NA           NA        NA         NA         NA          NA
#> [2544,]           NA           NA        NA         NA         NA          NA
#> [2545,]           NA           NA        NA         NA         NA          NA
#> [2546,]           NA           NA        NA         NA         NA          NA
#> [2547,]           NA           NA        NA         NA         NA          NA
#> [2548,]           NA           NA        NA         NA         NA          NA
#> [2549,]           NA           NA        NA         NA         NA          NA
#> [2550,]           NA           NA        NA         NA         NA          NA
#> [2551,]           NA           NA        NA         NA         NA          NA
#> [2552,] 4.904242e-03 1.250489e-03 0.5673289 0.21151519 0.10762258 0.003333333
#> [2553,]           NA           NA        NA         NA         NA          NA
#> [2554,]           NA           NA        NA         NA         NA          NA
#> [2555,]           NA           NA        NA         NA         NA          NA
#> [2556,]           NA           NA        NA         NA         NA          NA
#> [2557,]           NA           NA        NA         NA         NA          NA
#> [2558,]           NA           NA        NA         NA         NA          NA
#> [2559,]           NA           NA        NA         NA         NA          NA
#> [2560,]           NA           NA        NA         NA         NA          NA
#> [2561,]           NA           NA        NA         NA         NA          NA
#> [2562,]           NA           NA        NA         NA         NA          NA
#> [2563,]           NA           NA        NA         NA         NA          NA
#> [2564,]           NA           NA        NA         NA         NA          NA
#> [2565,]           NA           NA        NA         NA         NA          NA
#> [2566,]           NA           NA        NA         NA         NA          NA
#> [2567,]           NA           NA        NA         NA         NA          NA
#> [2568,]           NA           NA        NA         NA         NA          NA
#> [2569,]           NA           NA        NA         NA         NA          NA
#> [2570,]           NA           NA        NA         NA         NA          NA
#> [2571,]           NA           NA        NA         NA         NA          NA
#> [2572,]           NA           NA        NA         NA         NA          NA
#> [2573,]           NA           NA        NA         NA         NA          NA
#> [2574,]           NA           NA        NA         NA         NA          NA
#> [2575,]           NA           NA        NA         NA         NA          NA
#> [2576,]           NA           NA        NA         NA         NA          NA
#> [2577,]           NA           NA        NA         NA         NA          NA
#> [2578,]           NA           NA        NA         NA         NA          NA
#> [2579,]           NA           NA        NA         NA         NA          NA
#> [2580,]           NA           NA        NA         NA         NA          NA
#> [2581,]           NA           NA        NA         NA         NA          NA
#> [2582,]           NA           NA        NA         NA         NA          NA
#> [2583,]           NA           NA        NA         NA         NA          NA
#> [2584,]           NA           NA        NA         NA         NA          NA
#> [2585,]           NA           NA        NA         NA         NA          NA
#> [2586,]           NA           NA        NA         NA         NA          NA
#> [2587,]           NA           NA        NA         NA         NA          NA
#> [2588,]           NA           NA        NA         NA         NA          NA
#> [2589,]           NA           NA        NA         NA         NA          NA
#> [2590,]           NA           NA        NA         NA         NA          NA
#> [2591,]           NA           NA        NA         NA         NA          NA
#> [2592,]           NA           NA        NA         NA         NA          NA
#> [2593,]           NA           NA        NA         NA         NA          NA
#> [2594,]           NA           NA        NA         NA         NA          NA
#> [2595,]           NA           NA        NA         NA         NA          NA
#> [2596,]           NA           NA        NA         NA         NA          NA
#> [2597,]           NA           NA        NA         NA         NA          NA
#> [2598,]           NA           NA        NA         NA         NA          NA
#> [2599,]           NA           NA        NA         NA         NA          NA
#> [2600,]           NA           NA        NA         NA         NA          NA
#> [2601,]           NA           NA        NA         NA         NA          NA
#> [2602,]           NA           NA        NA         NA         NA          NA
#> [2603,]           NA           NA        NA         NA         NA          NA
#> [2604,]           NA           NA        NA         NA         NA          NA
#> [2605,]           NA           NA        NA         NA         NA          NA
#> [2606,]           NA           NA        NA         NA         NA          NA
#> [2607,]           NA           NA        NA         NA         NA          NA
#> [2608,]           NA           NA        NA         NA         NA          NA
#> [2609,]           NA           NA        NA         NA         NA          NA
#> [2610,]           NA           NA        NA         NA         NA          NA
#> [2611,]           NA           NA        NA         NA         NA          NA
#> [2612,]           NA           NA        NA         NA         NA          NA
#> [2613,]           NA           NA        NA         NA         NA          NA
#> [2614,]           NA           NA        NA         NA         NA          NA
#> [2615,]           NA           NA        NA         NA         NA          NA
#> [2616,]           NA           NA        NA         NA         NA          NA
#> [2617,]           NA           NA        NA         NA         NA          NA
#> [2618,]           NA           NA        NA         NA         NA          NA
#> [2619,]           NA           NA        NA         NA         NA          NA
#> [2620,]           NA           NA        NA         NA         NA          NA
#> [2621,]           NA           NA        NA         NA         NA          NA
#> [2622,] 1.187475e-01 3.024348e-02 0.2296444 0.36511120 0.81989276 0.071166667
#> [2623,]           NA           NA        NA         NA         NA          NA
#> [2624,]           NA           NA        NA         NA         NA          NA
#> [2625,]           NA           NA        NA         NA         NA          NA
#> [2626,]           NA           NA        NA         NA         NA          NA
#> [2627,]           NA           NA        NA         NA         NA          NA
#> [2628,]           NA           NA        NA         NA         NA          NA
#> [2629,]           NA           NA        NA         NA         NA          NA
#> [2630,]           NA           NA        NA         NA         NA          NA
#> [2631,]           NA           NA        NA         NA         NA          NA
#> [2632,]           NA           NA        NA         NA         NA          NA
#> [2633,]           NA           NA        NA         NA         NA          NA
#> [2634,] 1.457382e-02 3.714950e-03 0.2017927 0.27937848 0.08339241 0.000000000
#> [2635,]           NA           NA        NA         NA         NA          NA
#> [2636,]           NA           NA        NA         NA         NA          NA
#> [2637,]           NA           NA        NA         NA         NA          NA
#> [2638,]           NA           NA        NA         NA         NA          NA
#> [2639,]           NA           NA        NA         NA         NA          NA
#> [2640,]           NA           NA        NA         NA         NA          NA
#> [2641,]           NA           NA        NA         NA         NA          NA
#> [2642,]           NA           NA        NA         NA         NA          NA
#> [2643,]           NA           NA        NA         NA         NA          NA
#> [2644,]           NA           NA        NA         NA         NA          NA
#> [2645,]           NA           NA        NA         NA         NA          NA
#> [2646,]           NA           NA        NA         NA         NA          NA
#> [2647,] 6.146120e-01 1.709219e-01 0.4410167 0.54399329 0.51320763 0.374666667
#> [2648,] 1.955833e-02 4.989147e-03 0.2278201 0.22346111 0.40282642 0.043000000
#> [2649,]           NA           NA        NA         NA         NA          NA
#> [2650,]           NA           NA        NA         NA         NA          NA
#> [2651,]           NA           NA        NA         NA         NA          NA
#> [2652,]           NA           NA        NA         NA         NA          NA
#> [2653,]           NA           NA        NA         NA         NA          NA
#> [2654,]           NA           NA        NA         NA         NA          NA
#> [2655,]           NA           NA        NA         NA         NA          NA
#> [2656,]           NA           NA        NA         NA         NA          NA
#> [2657,]           NA           NA        NA         NA         NA          NA
#> [2658,]           NA           NA        NA         NA         NA          NA
#> [2659,]           NA           NA        NA         NA         NA          NA
#> [2660,] 1.805032e-01 4.580429e-02 0.3618957 0.39310373 0.49838808 0.219333333
#> [2661,] 4.224749e-01 1.076385e-01 0.3727355 0.48322658 0.48493260 0.123333333
#> [2662,] 7.536647e-02 1.920891e-02 0.2680593 0.31361341 0.47650483 0.121333333
#> [2663,]           NA           NA        NA         NA         NA          NA
#> [2664,]           NA           NA        NA         NA         NA          NA
#> [2665,]           NA           NA        NA         NA         NA          NA
#> [2666,]           NA           NA        NA         NA         NA          NA
#> [2667,]           NA           NA        NA         NA         NA          NA
#> [2668,]           NA           NA        NA         NA         NA          NA
#> [2669,]           NA           NA        NA         NA         NA          NA
#> [2670,]           NA           NA        NA         NA         NA          NA
#> [2671,]           NA           NA        NA         NA         NA          NA
#> [2672,] 4.017865e-01 1.024292e-01 0.3545111 0.47645034 0.46653332 0.093333333
#> [2673,] 3.232749e-01 8.212185e-02 0.3954607 0.45418090 0.50928612 0.171333333
#> [2674,] 2.505080e-01 6.385583e-02 0.3145695 0.42316966 0.51687186 0.102166667
#> [2675,]           NA           NA        NA         NA         NA          NA
#> [2676,]           NA           NA        NA         NA         NA          NA
#> [2677,]           NA           NA        NA         NA         NA          NA
#> [2678,]           NA           NA        NA         NA         NA          NA
#> [2679,]           NA           NA        NA         NA         NA          NA
#> [2680,]           NA           NA        NA         NA         NA          NA
#> [2681,]           NA           NA        NA         NA         NA          NA
#> [2682,]           NA           NA        NA         NA         NA          NA
#> [2683,]           NA           NA        NA         NA         NA          NA
#> [2684,] 2.197702e-01 5.597456e-02 0.2593853 0.42584064 0.81944133 0.091000000
#> [2685,] 6.718983e-03 1.711339e-03 0.1725042 0.17806153 0.82089772 0.023666667
#> [2686,] 5.224492e-01 1.362901e-01 0.4135436 0.51387728 0.52942977 0.163333333
#> [2687,] 1.077828e-01 2.748998e-02 0.2792405 0.34230615 0.35374680 0.100807018
#> [2688,]           NA           NA        NA         NA         NA          NA
#> [2689,]           NA           NA        NA         NA         NA          NA
#> [2690,]           NA           NA        NA         NA         NA          NA
#> [2691,]           NA           NA        NA         NA         NA          NA
#> [2692,]           NA           NA        NA         NA         NA          NA
#> [2693,]           NA           NA        NA         NA         NA          NA
#> [2694,]           NA           NA        NA         NA         NA          NA
#> [2695,]           NA           NA        NA         NA         NA          NA
#> [2696,]           NA           NA        NA         NA         NA          NA
#> [2697,] 7.166660e-03 1.826231e-03 0.1866780 0.23648999 0.07932363 0.000000000
#> [2698,] 4.577594e-01 1.204372e-01 0.3292208 0.68571050 0.35422341 0.092833333
#> [2699,] 8.260521e-01 5.652205e-01 0.6083898 0.66071889 0.37731591 0.490500000
#> [2700,] 4.392968e-01 1.123698e-01 0.3392626 0.48638762 0.51030165 0.082166667
#> [2701,]           NA           NA        NA         NA         NA          NA
#> [2702,]           NA           NA        NA         NA         NA          NA
#> [2703,]           NA           NA        NA         NA         NA          NA
#> [2704,]           NA           NA        NA         NA         NA          NA
#> [2705,]           NA           NA        NA         NA         NA          NA
#> [2706,]           NA           NA        NA         NA         NA          NA
#> [2707,]           NA           NA        NA         NA         NA          NA
#> [2708,]           NA           NA        NA         NA         NA          NA
#> [2709,]           NA           NA        NA         NA         NA          NA
#> [2710,]           NA           NA        NA         NA         NA          NA
#> [2711,] 6.299761e-01 3.442123e-01 0.4772718 0.63144465 0.77496201 0.621150585
#> [2712,] 8.229238e-01 3.928157e-01 0.5445229 0.63408184 0.34378092 0.560666667
#> [2713,] 5.784388e-02 1.475654e-02 0.2402468 0.29277092 0.47826769 0.083000000
#> [2714,]           NA           NA        NA         NA         NA          NA
#> [2715,]           NA           NA        NA         NA         NA          NA
#> [2716,]           NA           NA        NA         NA         NA          NA
#> [2717,]           NA           NA        NA         NA         NA          NA
#> [2718,]           NA           NA        NA         NA         NA          NA
#> [2719,]           NA           NA        NA         NA         NA          NA
#> [2720,]           NA           NA        NA         NA         NA          NA
#> [2721,]           NA           NA        NA         NA         NA          NA
#> [2722,]           NA           NA        NA         NA         NA          NA
#> [2723,]           NA           NA        NA         NA         NA          NA
#> [2724,] 1.305265e-01 3.323785e-02 0.2317243 0.52804301 0.25747946 0.055000000
#> [2725,] 6.176623e-01 5.814474e-01 0.5854755 0.88815146 0.77362549 0.736597698
#> [2726,] 7.610847e-01 2.669551e-01 0.4735490 0.60060784 0.45025548 0.239500000
#> [2727,] 5.717940e-07 1.458739e-07 0.1923330 0.01641517 0.45735483 0.008000000
#> [2728,]           NA           NA        NA         NA         NA          NA
#> [2729,]           NA           NA        NA         NA         NA          NA
#> [2730,]           NA           NA        NA         NA         NA          NA
#> [2731,]           NA           NA        NA         NA         NA          NA
#> [2732,]           NA           NA        NA         NA         NA          NA
#> [2733,]           NA           NA        NA         NA         NA          NA
#> [2734,]           NA           NA        NA         NA         NA          NA
#> [2735,]           NA           NA        NA         NA         NA          NA
#> [2736,]           NA           NA        NA         NA         NA          NA
#> [2737,] 7.406264e-02 1.905866e-02 0.5952217 0.44830540 0.37475726 0.042500000
#> [2738,] 6.208203e-01 6.075013e-01 0.6093453 0.65083531 0.75281142 0.658233613
#> [2739,] 2.311476e-01 5.890420e-02 0.2854723 0.42079540 0.64046405 0.058333333
#> [2740,]           NA           NA        NA         NA         NA          NA
#> [2741,]           NA           NA        NA         NA         NA          NA
#> [2742,]           NA           NA        NA         NA         NA          NA
#> [2743,]           NA           NA        NA         NA         NA          NA
#> [2744,]           NA           NA        NA         NA         NA          NA
#> [2745,]           NA           NA        NA         NA         NA          NA
#> [2746,]           NA           NA        NA         NA         NA          NA
#> [2747,]           NA           NA        NA         NA         NA          NA
#> [2748,]           NA           NA        NA         NA         NA          NA
#> [2749,]           NA           NA        NA         NA         NA          NA
#> [2750,]           NA           NA        NA         NA         NA          NA
#> [2751,]           NA           NA        NA         NA         NA          NA
#> [2752,] 8.297130e-01 3.722006e-01 0.5608908 0.63224032 0.38271882 0.521166667
#> [2753,]           NA           NA        NA         NA         NA          NA
#> [2754,]           NA           NA        NA         NA         NA          NA
#> [2755,]           NA           NA        NA         NA         NA          NA
#> [2756,]           NA           NA        NA         NA         NA          NA
#> [2757,]           NA           NA        NA         NA         NA          NA
#> [2758,]           NA           NA        NA         NA         NA          NA
#> [2759,]           NA           NA        NA         NA         NA          NA
#> [2760,]           NA           NA        NA         NA         NA          NA
#> [2761,]           NA           NA        NA         NA         NA          NA
#> [2762,] 2.647114e-01 6.740342e-02 0.2744189 0.44622977 0.81700739 0.091000000
#> [2763,] 6.510463e-01 2.297635e-01 0.4101325 0.59180064 0.67414141 0.120961544
#> [2764,]           NA           NA        NA         NA         NA          NA
#> [2765,] 1.120716e-04 2.859129e-05 0.1941358 0.06141995 0.45821325 0.008000000
#> [2766,] 8.325574e-03 2.123989e-03 0.2094048 0.18031802 0.46515320 0.008000000
#> [2767,]           NA           NA        NA         NA         NA          NA
#> [2768,]           NA           NA        NA         NA         NA          NA
#> [2769,]           NA           NA        NA         NA         NA          NA
#> [2770,]           NA           NA        NA         NA         NA          NA
#> [2771,]           NA           NA        NA         NA         NA          NA
#> [2772,]           NA           NA        NA         NA         NA          NA
#> [2773,]           NA           NA        NA         NA         NA          NA
#> [2774,]           NA           NA        NA         NA         NA          NA
#> [2775,] 4.901372e-01 1.280345e-01 0.3457585 0.50481791 0.58512884 0.038333333
#> [2776,]           NA           NA        NA         NA         NA          NA
#> [2777,]           NA           NA        NA         NA         NA          NA
#> [2778,] 2.592387e-03 6.613600e-04 0.2016646 0.13469781 0.46170637 0.008000000
#> [2779,] 3.351174e-02 8.548959e-03 0.2286257 0.25544108 0.47439523 0.008000000
#> [2780,]           NA           NA        NA         NA         NA          NA
#> [2781,]           NA           NA        NA         NA         NA          NA
#> [2782,]           NA           NA        NA         NA         NA          NA
#> [2783,]           NA           NA        NA         NA         NA          NA
#> [2784,] 2.118862e-03 5.402043e-04 0.5518470 0.17208394 0.13631003 0.000000000
#> [2785,] 1.134287e-02 2.892591e-03 0.1977332 0.19689046 0.60129831 0.000000000
#> [2786,]           NA           NA        NA         NA         NA          NA
#> [2787,]           NA           NA        NA         NA         NA          NA
#> [2788,]           NA           NA        NA         NA         NA          NA
#> [2789,] 2.096195e-02 5.347229e-03 0.2215290 0.22719462 0.47263739 0.008000000
#> [2790,] 3.528595e-04 9.001853e-05 0.1934415 0.08183784 0.48147474 0.000000000
#> [2791,]           NA           NA        NA         NA         NA          NA
#> [2792,]           NA           NA        NA         NA         NA          NA
#> [2793,]           NA           NA        NA         NA         NA          NA
#> [2794,]           NA           NA        NA         NA         NA          NA
#> [2795,] 4.566022e-02 1.163971e-02 0.6091290 0.39401270 0.11696116 0.012500000
#> [2796,] 2.938845e-02 7.493330e-03 0.2152531 0.24940643 0.59460320 0.000000000
#> [2797,]           NA           NA        NA         NA         NA          NA
#> [2798,]           NA           NA        NA         NA         NA          NA
#> [2799,] 1.831893e-02 4.672308e-03 0.2220749 0.21975030 0.47651567 0.008000000
#> [2800,]           NA           NA        NA         NA         NA          NA
#> [2801,]           NA           NA        NA         NA         NA          NA
#> [2802,]           NA           NA        NA         NA         NA          NA
#> [2803,]           NA           NA        NA         NA         NA          NA
#> [2804,]           NA           NA        NA         NA         NA          NA
#> [2805,]           NA           NA        NA         NA         NA          NA
#> [2806,] 1.443857e-02 3.679138e-03 0.5743771 0.29781012 0.18256168 0.000000000
#> [2807,] 7.625081e-02 1.941210e-02 0.2554273 0.31889580 0.62886438 0.052500000
#> [2808,] 2.769057e-02 7.061802e-03 0.2148300 0.24502535 0.57473410 0.000000000
#> [2809,]           NA           NA        NA         NA         NA          NA
#> [2810,]           NA           NA        NA         NA         NA          NA
#> [2811,] 1.057247e-03 2.697209e-04 0.1982031 0.10764149 0.46011835 0.008000000
#> [2812,]           NA           NA        NA         NA         NA          NA
#> [2813,]           NA           NA        NA         NA         NA          NA
#> [2814,]           NA           NA        NA         NA         NA          NA
#> [2815,]           NA           NA        NA         NA         NA          NA
#> [2816,]           NA           NA        NA         NA         NA          NA
#> [2817,]           NA           NA        NA         NA         NA          NA
#> [2818,]           NA           NA        NA         NA         NA          NA
#> [2819,] 2.464604e-02 6.285546e-03 0.2125157 0.23797835 0.57380961 0.000000000
#> [2820,] 4.924037e-03 1.255960e-03 0.2083184 0.15820746 0.46956279 0.008000000
#> [2821,] 8.877909e-02 2.262891e-02 0.2680246 0.32654781 0.50547062 0.083000000
#> [2822,] 4.501644e-02 1.147123e-02 0.2535208 0.27572008 0.50590337 0.008000000
#> [2823,] 2.685239e-01 6.842884e-02 0.3211353 0.43094667 0.53939071 0.091666667
#> [2824,] 2.069676e-01 5.278201e-02 0.2802619 0.40459520 0.15737048 0.085000000
#> [2825,]           NA           NA        NA         NA         NA          NA
#> [2826,]           NA           NA        NA         NA         NA          NA
#> [2827,]           NA           NA        NA         NA         NA          NA
#> [2828,]           NA           NA        NA         NA         NA          NA
#> [2829,] 2.094530e-01 5.338472e-02 0.2743707 0.41150323 0.65065963 0.089833333
#> [2830,] 3.874360e-02 9.875805e-03 0.2190177 0.26862878 0.62335478 0.000000000
#> [2831,] 1.447999e-01 3.688062e-02 0.3007728 0.36962783 0.52476905 0.103000000
#> [2832,]           NA           NA        NA         NA         NA          NA
#> [2833,]           NA           NA        NA         NA         NA          NA
#> [2834,] 3.890635e-01 9.908014e-02 0.3604244 0.47347344 0.55178211 0.111666667
#> [2835,] 5.901343e-03 1.505101e-03 0.2036765 0.16581951 0.13301287 0.003333333
#> [2836,]           NA           NA        NA         NA         NA          NA
#> [2837,]           NA           NA        NA         NA         NA          NA
#> [2838,]           NA           NA        NA         NA         NA          NA
#> [2839,]           NA           NA        NA         NA         NA          NA
#> [2840,]           NA           NA        NA         NA         NA          NA
#> [2841,] 2.322748e-02 5.921528e-03 0.2019199 0.23770394 0.64770177 0.010000000
#> [2842,] 7.250416e-01 2.519548e-01 0.4637335 0.59967917 0.60121080 0.183000000
#> [2843,] 1.610713e-01 4.104681e-02 0.2959063 0.37916692 0.51641476 0.101000000
#> [2844,] 8.354589e-02 2.130174e-02 0.2603592 0.32138828 0.49718142 0.083000000
#> [2845,] 2.288319e-01 5.818263e-02 0.3593909 0.41596949 0.51812666 0.206333333
#> [2846,] 1.819189e-01 4.639984e-02 0.2897816 0.39022981 0.36919909 0.121333333
#> [2847,]           NA           NA        NA         NA         NA          NA
#> [2848,]           NA           NA        NA         NA         NA          NA
#> [2849,]           NA           NA        NA         NA         NA          NA
#> [2850,]           NA           NA        NA         NA         NA          NA
#> [2851,] 2.032194e-04 5.181789e-05 0.1770473 0.07237685 0.06769111 0.000000000
#> [2852,] 7.479360e-01 2.863712e-01 0.4788734 0.61451615 0.60618281 0.183000000
#> [2853,] 5.997335e-02 1.528312e-02 0.2601643 0.29619821 0.50722384 0.083000000
#> [2854,] 9.456201e-04 2.412431e-04 0.1978735 0.10468025 0.45996557 0.008000000
#> [2855,] 7.056523e-01 2.229924e-01 0.4422792 0.57862987 0.47839919 0.145500000
#> [2856,] 7.658137e-01 3.388765e-01 0.4539296 0.62491137 0.28861000 0.329336135
#> [2857,] 9.768423e-03 2.490278e-03 0.1902254 0.19171609 0.08085916 0.000000000
#> [2858,]           NA           NA        NA         NA         NA          NA
#> [2859,]           NA           NA        NA         NA         NA          NA
#> [2860,] 7.949447e-01 4.532114e-01 0.5375334 0.65278385 0.60442807 0.547853632
#> [2861,] 3.633059e-01 9.239466e-02 0.3631958 0.46881202 0.59464385 0.073333333
#> [2862,]           NA           NA        NA         NA         NA          NA
#> [2863,] 2.483015e-02 6.332979e-03 0.2267062 0.23711338 0.47847348 0.008000000
#> [2864,] 8.183810e-01 5.281847e-01 0.5338431 0.65828288 0.61908000 0.389629909
#> [2865,] 1.104504e-02 2.815579e-03 0.1903814 0.19810496 0.08454608 0.000000000
#> [2866,]           NA           NA        NA         NA         NA          NA
#> [2867,]           NA           NA        NA         NA         NA          NA
#> [2868,]           NA           NA        NA         NA         NA          NA
#> [2869,] 7.323348e-01 2.504554e-01 0.4549345 0.59636543 0.59690266 0.289666667
#> [2870,] 1.379590e-01 3.498221e-02 0.3278972 0.36831645 0.51805254 0.248500000
#> [2871,] 1.120962e-02 2.858783e-03 0.2176775 0.19440306 0.47701016 0.008000000
#> [2872,] 3.021767e-02 7.706496e-03 0.2313122 0.24909057 0.48197185 0.008000000
#> [2873,] 8.216325e-01 6.063405e-01 0.5708797 0.66645240 0.53919768 0.412509570
#> [2874,] 1.212631e-01 3.093623e-02 0.2651953 0.35228855 0.29241913 0.131333333
#> [2875,]           NA           NA        NA         NA         NA          NA
#> [2876,]           NA           NA        NA         NA         NA          NA
#> [2877,]           NA           NA        NA         NA         NA          NA
#> [2878,] 6.312744e-01 1.853631e-01 0.3932772 0.55450287 0.59362156 0.199086544
#> [2879,] 7.000732e-01 2.221709e-01 0.4622134 0.58384140 0.57478999 0.309250000
#> [2880,] 1.897500e-01 4.828208e-02 0.3224382 0.39670385 0.56837187 0.183333333
#> [2881,]           NA           NA        NA         NA         NA          NA
#> [2882,] 4.458969e-06 1.137065e-06 0.5624673 0.03669096 0.08208320 0.053000000
#> [2883,] 8.971001e-01 5.242097e-01 0.8498618 0.89063813 0.09171292 0.319865601
#> [2884,]           NA           NA        NA         NA         NA          NA
#> [2885,]           NA           NA        NA         NA         NA          NA
#> [2886,]           NA           NA        NA         NA         NA          NA
#> [2887,]           NA           NA        NA         NA         NA          NA
#> [2888,] 2.267128e-01 5.778301e-02 0.2711606 0.55715148 0.20643289 0.090000000
#> [2889,] 8.542852e-01 4.547291e-01 0.4919609 0.87842313 0.19336403 0.550561942
#> [2890,] 8.302556e-01 4.358000e-01 0.5514603 0.65159374 0.56653664 0.927071429
#> [2891,] 7.065596e-03 1.802430e-03 0.2064537 0.17313826 0.48812125 0.000000000
#> [2892,] 1.368903e-01 3.491774e-02 0.2620891 0.36387705 0.17197561 0.055833333
#> [2893,] 3.470334e-03 8.846869e-04 0.5519754 0.19511115 0.15536492 0.000000000
#> [2894,]           NA           NA        NA         NA         NA          NA
#> [2895,]           NA           NA        NA         NA         NA          NA
#> [2896,]           NA           NA        NA         NA         NA          NA
#> [2897,] 5.925482e-02 1.510120e-02 0.2184778 0.39984144 0.24336013 0.050000000
#> [2898,] 8.216911e-01 3.407307e-01 0.4352035 0.84296555 0.19403804 0.201613913
#> [2899,] 8.019979e-01 7.452130e-01 0.6481316 0.67120889 0.59202215 0.724128968
#> [2900,] 7.792984e-01 3.111235e-01 0.4523797 0.61621808 0.59113093 0.293065711
#> [2901,]           NA           NA        NA         NA         NA          NA
#> [2902,]           NA           NA        NA         NA         NA          NA
#> [2903,]           NA           NA        NA         NA         NA          NA
#> [2904,]           NA           NA        NA         NA         NA          NA
#> [2905,]           NA           NA        NA         NA         NA          NA
#> [2906,]           NA           NA        NA         NA         NA          NA
#> [2907,] 7.831718e-01 4.863717e-01 0.5046295 0.65166339 0.61742999 0.661771849
#> [2908,] 7.936846e-01 7.893460e-01 0.6620810 0.66937863 0.59843883 0.666521465
#> [2909,] 7.924886e-01 6.293984e-01 0.5796174 0.66717644 0.61571181 0.737431126
#> [2910,] 5.093498e-02 1.299216e-02 0.2311333 0.28420160 0.14646439 0.055833333
#> [2911,]           NA           NA        NA         NA         NA          NA
#> [2912,]           NA           NA        NA         NA         NA          NA
#> [2913,]           NA           NA        NA         NA         NA          NA
#> [2914,]           NA           NA        NA         NA         NA          NA
#> [2915,]           NA           NA        NA         NA         NA          NA
#> [2916,] 1.980476e-01 5.050338e-02 0.6892064 0.53266229 0.07450943 0.110807018
#> [2917,] 7.912076e-01 7.327978e-01 0.6250198 0.66755226 0.61391913 0.696374536
#> [2918,] 7.895218e-01 7.823878e-01 0.6513908 0.66785347 0.60890256 0.629244305
#> [2919,] 1.493107e-01 3.808744e-02 0.2679029 0.37149334 0.53020981 0.151333333
#> [2920,]           NA           NA        NA         NA         NA          NA
#> [2921,]           NA           NA        NA         NA         NA          NA
#> [2922,]           NA           NA        NA         NA         NA          NA
#> [2923,]           NA           NA        NA         NA         NA          NA
#> [2924,]           NA           NA        NA         NA         NA          NA
#> [2925,] 8.781045e-01 8.817920e-01 0.9091283 0.91241600 0.15385979 0.827516532
#> [2926,] 7.740052e-01 7.851955e-01 0.6438391 0.66708235 0.59058894 0.413219013
#> [2927,] 7.861151e-01 6.351936e-01 0.5712540 0.66522084 0.62048428 0.754384908
#> [2928,] 6.726572e-03 1.716024e-03 0.2053543 0.17100307 0.16838543 0.000000000
#> [2929,]           NA           NA        NA         NA         NA          NA
#> [2930,]           NA           NA        NA         NA         NA          NA
#> [2931,]           NA           NA        NA         NA         NA          NA
#> [2932,]           NA           NA        NA         NA         NA          NA
#> [2933,] 8.919708e-01 8.957740e-01 0.9170122 0.97490422 0.10229795 0.607542445
#> [2934,] 8.457496e-01 8.587674e-01 0.8991447 0.97067551 0.24451308 0.399628104
#> [2935,] 8.523444e-01 8.616397e-01 0.9060485 0.97093610 0.22920830 0.454987589
#> [2936,] 7.879375e-01 4.594797e-01 0.5028061 0.64880550 0.61608201 0.732438516
#> [2937,] 6.833697e-02 1.742870e-02 0.2343095 0.30693678 0.57525785 0.040000000
#> [2938,]           NA           NA        NA         NA         NA          NA
#> [2939,]           NA           NA        NA         NA         NA          NA
#> [2940,]           NA           NA        NA         NA         NA          NA
#> [2941,]           NA           NA        NA         NA         NA          NA
#> [2942,]           NA           NA        NA         NA         NA          NA
#> [2943,] 8.887351e-01 8.933838e-01 0.9132176 0.97345415 0.10511266 0.647368453
#> [2944,] 8.567653e-01 8.630361e-01 0.9090245 0.97101396 0.21755476 0.562635940
#> [2945,] 7.880447e-01 7.897218e-01 0.6578476 0.66786560 0.60631356 0.727788800
#> [2946,] 6.758443e-01 2.176363e-01 0.3929649 0.57608934 0.60560680 0.175809806
#> [2947,]           NA           NA        NA         NA         NA          NA
#> [2948,]           NA           NA        NA         NA         NA          NA
#> [2949,]           NA           NA        NA         NA         NA          NA
#> [2950,]           NA           NA        NA         NA         NA          NA
#> [2951,] 8.962884e-01 7.586292e-01 0.8976283 0.97007856 0.40012482 0.418668367
#> [2952,] 7.895715e-01 7.672806e-01 0.6301518 0.66574304 0.61678808 0.613496729
#> [2953,] 8.183779e-01 4.690655e-01 0.5434339 0.65466327 0.59154843 0.810126984
#> [2954,] 3.335268e-01 8.504519e-02 0.3155928 0.45531460 0.57071208 0.050833333
#> [2955,]           NA           NA        NA         NA         NA          NA
#> [2956,]           NA           NA        NA         NA         NA          NA
#> [2957,]           NA           NA        NA         NA         NA          NA
#> [2958,]           NA           NA        NA         NA         NA          NA
#> [2959,]           NA           NA        NA         NA         NA          NA
#> [2960,]           NA           NA        NA         NA         NA          NA
#> [2961,] 5.390575e-04 1.374624e-04 0.5909898 0.12128535 0.09491196 0.102473684
#> [2962,] 6.262111e-02 1.610436e-02 0.6214244 0.42030175 0.06358686 0.075000000
#> [2963,] 5.388332e-01 1.426641e-01 0.3425340 0.69857548 0.17043637 0.046333333
#> [2964,] 4.649646e-01 1.187645e-01 0.4057664 0.49902949 0.55778491 0.100833333
#> [2965,]           NA           NA        NA         NA         NA          NA
#> [2966,]           NA           NA        NA         NA         NA          NA
#> [2967,]           NA           NA        NA         NA         NA          NA
#> [2968,]           NA           NA        NA         NA         NA          NA
#> [2969,]           NA           NA        NA         NA         NA          NA
#> [2970,]           NA           NA        NA         NA         NA          NA
#> [2971,]           NA           NA        NA         NA         NA          NA
#> [2972,]           NA           NA        NA         NA         NA          NA
#> [2973,]           NA           NA        NA         NA         NA          NA
#> [2974,] 9.978292e-02 2.542540e-02 0.2496427 0.45181804 0.13265275 0.045000000
#> [2975,] 1.434293e-01 3.639542e-02 0.3307118 0.37174311 0.54171066 0.092500000
#> [2976,]           NA           NA        NA         NA         NA          NA
#> [2977,]           NA           NA        NA         NA         NA          NA
#> [2978,]           NA           NA        NA         NA         NA          NA
#> [2979,]           NA           NA        NA         NA         NA          NA
#> [2980,]           NA           NA        NA         NA         NA          NA
#> [2981,]           NA           NA        NA         NA         NA          NA
#> [2982,]           NA           NA        NA         NA         NA          NA
#> [2983,]           NA           NA        NA         NA         NA          NA
#> [2984,]           NA           NA        NA         NA         NA          NA
#> [2985,]           NA           NA        NA         NA         NA          NA
#> [2986,]           NA           NA        NA         NA         NA          NA
#> [2987,]           NA           NA        NA         NA         NA          NA
#> [2988,] 7.769710e-02 1.975279e-02 0.2831137 0.42617579 0.31646924 0.060000000
#> [2989,] 1.062679e-01 2.710139e-02 0.2535446 0.34200177 0.55743588 0.052500000
#> [2990,]           NA           NA        NA         NA         NA          NA
#> [2991,]           NA           NA        NA         NA         NA          NA
#> [2992,]           NA           NA        NA         NA         NA          NA
#> [2993,]           NA           NA        NA         NA         NA          NA
#> [2994,]           NA           NA        NA         NA         NA          NA
#> [2995,]           NA           NA        NA         NA         NA          NA
#> [2996,]           NA           NA        NA         NA         NA          NA
#> [2997,]           NA           NA        NA         NA         NA          NA
#> [2998,]           NA           NA        NA         NA         NA          NA
#> [2999,]           NA           NA        NA         NA         NA          NA
#> [3000,]           NA           NA        NA         NA         NA          NA
#> [3001,]           NA           NA        NA         NA         NA          NA
#> [3002,] 1.696506e-03 4.324403e-04 0.1877258 0.16319719 0.07677466 0.000000000
#> [3003,] 2.344171e-01 5.966596e-02 0.3079619 0.56088905 0.23655318 0.150000000
#> [3004,] 1.514099e-02 3.861411e-03 0.2072051 0.21052770 0.56563878 0.000000000
#> [3005,]           NA           NA        NA         NA         NA          NA
#> [3006,]           NA           NA        NA         NA         NA          NA
#> [3007,]           NA           NA        NA         NA         NA          NA
#> [3008,]           NA           NA        NA         NA         NA          NA
#> [3009,]           NA           NA        NA         NA         NA          NA
#> [3010,]           NA           NA        NA         NA         NA          NA
#> [3011,]           NA           NA        NA         NA         NA          NA
#> [3012,]           NA           NA        NA         NA         NA          NA
#> [3013,]           NA           NA        NA         NA         NA          NA
#> [3014,]           NA           NA        NA         NA         NA          NA
#> [3015,]           NA           NA        NA         NA         NA          NA
#> [3016,]           NA           NA        NA         NA         NA          NA
#> [3017,]           NA           NA        NA         NA         NA          NA
#> [3018,]           NA           NA        NA         NA         NA          NA
#> [3019,]           NA           NA        NA         NA         NA          NA
#> [3020,]           NA           NA        NA         NA         NA          NA
#> [3021,]           NA           NA        NA         NA         NA          NA
#> [3022,]           NA           NA        NA         NA         NA          NA
#> [3023,]           NA           NA        NA         NA         NA          NA
#> [3024,]           NA           NA        NA         NA         NA          NA
#> [3025,]           NA           NA        NA         NA         NA          NA
#> [3026,]           NA           NA        NA         NA         NA          NA
#> [3027,]           NA           NA        NA         NA         NA          NA
#> [3028,]           NA           NA        NA         NA         NA          NA
#> [3029,]           NA           NA        NA         NA         NA          NA
#> [3030,]           NA           NA        NA         NA         NA          NA
#> [3031,]           NA           NA        NA         NA         NA          NA
#> [3032,]           NA           NA        NA         NA         NA          NA
#> [3033,]           NA           NA        NA         NA         NA          NA
#> [3034,]           NA           NA        NA         NA         NA          NA
#> [3035,]           NA           NA        NA         NA         NA          NA
#> [3036,]           NA           NA        NA         NA         NA          NA
#> [3037,]           NA           NA        NA         NA         NA          NA
#> [3038,]           NA           NA        NA         NA         NA          NA
#> [3039,]           NA           NA        NA         NA         NA          NA
#> [3040,]           NA           NA        NA         NA         NA          NA
#> [3041,]           NA           NA        NA         NA         NA          NA
#> [3042,]           NA           NA        NA         NA         NA          NA
#> [3043,]           NA           NA        NA         NA         NA          NA
#> [3044,]           NA           NA        NA         NA         NA          NA
#> [3045,]           NA           NA        NA         NA         NA          NA
#> [3046,]           NA           NA        NA         NA         NA          NA
#> [3047,]           NA           NA        NA         NA         NA          NA
#> [3048,]           NA           NA        NA         NA         NA          NA
#> [3049,]           NA           NA        NA         NA         NA          NA
#> [3050,]           NA           NA        NA         NA         NA          NA
#> [3051,]           NA           NA        NA         NA         NA          NA
#> [3052,]           NA           NA        NA         NA         NA          NA
#> [3053,]           NA           NA        NA         NA         NA          NA
#> [3054,]           NA           NA        NA         NA         NA          NA
#> [3055,]           NA           NA        NA         NA         NA          NA
#> [3056,]           NA           NA        NA         NA         NA          NA
#> [3057,]           NA           NA        NA         NA         NA          NA
#> [3058,]           NA           NA        NA         NA         NA          NA
#> [3059,]           NA           NA        NA         NA         NA          NA
#> [3060,]           NA           NA        NA         NA         NA          NA
#> [3061,]           NA           NA        NA         NA         NA          NA
#> [3062,]           NA           NA        NA         NA         NA          NA
#> [3063,]           NA           NA        NA         NA         NA          NA
#> [3064,]           NA           NA        NA         NA         NA          NA
#> [3065,]           NA           NA        NA         NA         NA          NA
#> [3066,]           NA           NA        NA         NA         NA          NA
#> [3067,]           NA           NA        NA         NA         NA          NA
#> [3068,]           NA           NA        NA         NA         NA          NA
#> [3069,]           NA           NA        NA         NA         NA          NA
#> [3070,]           NA           NA        NA         NA         NA          NA
#> [3071,]           NA           NA        NA         NA         NA          NA
#> [3072,]           NA           NA        NA         NA         NA          NA
#> [3073,]           NA           NA        NA         NA         NA          NA
#> [3074,]           NA           NA        NA         NA         NA          NA
#> [3075,]           NA           NA        NA         NA         NA          NA
#> [3076,]           NA           NA        NA         NA         NA          NA
#> [3077,]           NA           NA        NA         NA         NA          NA
#> [3078,]           NA           NA        NA         NA         NA          NA
#> [3079,]           NA           NA        NA         NA         NA          NA
#> [3080,]           NA           NA        NA         NA         NA          NA
#> [3081,]           NA           NA        NA         NA         NA          NA
#> [3082,]           NA           NA        NA         NA         NA          NA
#> [3083,]           NA           NA        NA         NA         NA          NA
#> [3084,]           NA           NA        NA         NA         NA          NA
#> [3085,]           NA           NA        NA         NA         NA          NA
#> [3086,]           NA           NA        NA         NA         NA          NA
#> [3087,]           NA           NA        NA         NA         NA          NA
#> [3088,]           NA           NA        NA         NA         NA          NA
#> [3089,]           NA           NA        NA         NA         NA          NA
#> [3090,]           NA           NA        NA         NA         NA          NA
#> [3091,]           NA           NA        NA         NA         NA          NA
#> [3092,]           NA           NA        NA         NA         NA          NA
#> [3093,]           NA           NA        NA         NA         NA          NA
#> [3094,]           NA           NA        NA         NA         NA          NA
#> [3095,]           NA           NA        NA         NA         NA          NA
#> [3096,]           NA           NA        NA         NA         NA          NA
#> [3097,]           NA           NA        NA         NA         NA          NA
#> [3098,]           NA           NA        NA         NA         NA          NA
#> [3099,]           NA           NA        NA         NA         NA          NA
#> [3100,]           NA           NA        NA         NA         NA          NA
#> [3101,]           NA           NA        NA         NA         NA          NA
#> [3102,]           NA           NA        NA         NA         NA          NA
#> [3103,]           NA           NA        NA         NA         NA          NA
#> [3104,]           NA           NA        NA         NA         NA          NA
#> [3105,]           NA           NA        NA         NA         NA          NA
#> [3106,]           NA           NA        NA         NA         NA          NA
#> [3107,]           NA           NA        NA         NA         NA          NA
#> [3108,]           NA           NA        NA         NA         NA          NA
#> [3109,]           NA           NA        NA         NA         NA          NA
#> [3110,]           NA           NA        NA         NA         NA          NA
#> [3111,]           NA           NA        NA         NA         NA          NA
#> [3112,]           NA           NA        NA         NA         NA          NA
#> [3113,]           NA           NA        NA         NA         NA          NA
#> [3114,]           NA           NA        NA         NA         NA          NA
#> [3115,]           NA           NA        NA         NA         NA          NA
#> [3116,]           NA           NA        NA         NA         NA          NA
#> [3117,]           NA           NA        NA         NA         NA          NA
#> [3118,]           NA           NA        NA         NA         NA          NA
#> [3119,]           NA           NA        NA         NA         NA          NA
#> [3120,]           NA           NA        NA         NA         NA          NA
#> [3121,]           NA           NA        NA         NA         NA          NA
#> [3122,]           NA           NA        NA         NA         NA          NA
#> [3123,]           NA           NA        NA         NA         NA          NA
#> [3124,]           NA           NA        NA         NA         NA          NA
#> [3125,]           NA           NA        NA         NA         NA          NA
#> [3126,]           NA           NA        NA         NA         NA          NA
#> [3127,]           NA           NA        NA         NA         NA          NA
#> [3128,]           NA           NA        NA         NA         NA          NA
#> [3129,]           NA           NA        NA         NA         NA          NA
#> [3130,]           NA           NA        NA         NA         NA          NA
#> [3131,]           NA           NA        NA         NA         NA          NA
#> [3132,]           NA           NA        NA         NA         NA          NA
#> [3133,] 3.754045e-04 9.572489e-05 0.1884545 0.08363415 0.56916655 0.000000000
#> [3134,]           NA           NA        NA         NA         NA          NA
#> [3135,]           NA           NA        NA         NA         NA          NA
#> [3136,]           NA           NA        NA         NA         NA          NA
#> [3137,]           NA           NA        NA         NA         NA          NA
#> [3138,]           NA           NA        NA         NA         NA          NA
#> [3139,]           NA           NA        NA         NA         NA          NA
#> [3140,]           NA           NA        NA         NA         NA          NA
#> [3141,]           NA           NA        NA         NA         NA          NA
#> [3142,]           NA           NA        NA         NA         NA          NA
#> [3143,]           NA           NA        NA         NA         NA          NA
#> [3144,]           NA           NA        NA         NA         NA          NA
#> [3145,]           NA           NA        NA         NA         NA          NA
#> [3146,]           NA           NA        NA         NA         NA          NA
#> [3147,] 4.174262e-02 1.054367e-02 0.2172791 0.27442359 0.33125629 0.000000000
#> [3148,] 9.161303e-02 2.333229e-02 0.6658571 0.46929943 0.09295557 0.103000000
#> [3149,]           NA           NA        NA         NA         NA          NA
#> [3150,]           NA           NA        NA         NA         NA          NA
#> [3151,]           NA           NA        NA         NA         NA          NA
#> [3152,]           NA           NA        NA         NA         NA          NA
#> [3153,]           NA           NA        NA         NA         NA          NA
#> [3154,]           NA           NA        NA         NA         NA          NA
#> [3155,]           NA           NA        NA         NA         NA          NA
#> [3156,]           NA           NA        NA         NA         NA          NA
#> [3157,]           NA           NA        NA         NA         NA          NA
#> [3158,]           NA           NA        NA         NA         NA          NA
#> [3159,]           NA           NA        NA         NA         NA          NA
#> [3160,]           NA           NA        NA         NA         NA          NA
#> [3161,]           NA           NA        NA         NA         NA          NA
#> [3162,]           NA           NA        NA         NA         NA          NA
#> [3163,]           NA           NA        NA         NA         NA          NA
#> [3164,]           NA           NA        NA         NA         NA          NA
#> [3165,]           NA           NA        NA         NA         NA          NA
#> [3166,]           NA           NA        NA         NA         NA          NA
#> [3167,]           NA           NA        NA         NA         NA          NA
#> [3168,]           NA           NA        NA         NA         NA          NA
#> [3169,]           NA           NA        NA         NA         NA          NA
#> [3170,]           NA           NA        NA         NA         NA          NA
#>         ABCNR
#>    [1,]    NA
#>    [2,]    NA
#>    [3,]    NA
#>    [4,]    NA
#>    [5,]    NA
#>    [6,]    NA
#>    [7,]    NA
#>    [8,]    NA
#>    [9,]    NA
#>   [10,]    NA
#>   [11,]    NA
#>   [12,]    NA
#>   [13,]    NA
#>   [14,]    NA
#>   [15,]    NA
#>   [16,]    NA
#>   [17,]    NA
#>   [18,]    NA
#>   [19,]    NA
#>   [20,]    NA
#>   [21,]   0.0
#>   [22,]   0.0
#>   [23,]   0.2
#>   [24,]   0.1
#>   [25,]   0.0
#>   [26,]   0.0
#>   [27,]   0.0
#>   [28,]   0.0
#>   [29,]   0.0
#>   [30,]    NA
#>   [31,]   0.0
#>   [32,]    NA
#>   [33,]    NA
#>   [34,]    NA
#>   [35,]    NA
#>   [36,]    NA
#>   [37,]    NA
#>   [38,]    NA
#>   [39,]    NA
#>   [40,]    NA
#>   [41,]    NA
#>   [42,]    NA
#>   [43,]    NA
#>   [44,]    NA
#>   [45,]    NA
#>   [46,]    NA
#>   [47,]    NA
#>   [48,]    NA
#>   [49,]    NA
#>   [50,]    NA
#>   [51,]    NA
#>   [52,]    NA
#>   [53,]    NA
#>   [54,]    NA
#>   [55,]    NA
#>   [56,]    NA
#>   [57,]    NA
#>   [58,]    NA
#>   [59,]    NA
#>   [60,]    NA
#>   [61,]   0.0
#>   [62,]   0.0
#>   [63,]   0.2
#>   [64,]   0.1
#>   [65,]   0.0
#>   [66,]   0.1
#>   [67,]   0.0
#>   [68,]   0.0
#>   [69,]   0.0
#>   [70,]   0.0
#>   [71,]    NA
#>   [72,]    NA
#>   [73,]    NA
#>   [74,]    NA
#>   [75,]    NA
#>   [76,]    NA
#>   [77,]    NA
#>   [78,]    NA
#>   [79,]    NA
#>   [80,]    NA
#>   [81,]    NA
#>   [82,]    NA
#>   [83,]    NA
#>   [84,]    NA
#>   [85,]    NA
#>   [86,]    NA
#>   [87,]    NA
#>   [88,]    NA
#>   [89,]    NA
#>   [90,]    NA
#>   [91,]    NA
#>   [92,]    NA
#>   [93,]    NA
#>   [94,]    NA
#>   [95,]    NA
#>   [96,]    NA
#>   [97,]    NA
#>   [98,]   0.0
#>   [99,]   0.0
#>  [100,]   0.0
#>  [101,]   0.3
#>  [102,]   0.1
#>  [103,]   0.0
#>  [104,]   0.1
#>  [105,]   0.0
#>  [106,]   0.0
#>  [107,]   0.0
#>  [108,]    NA
#>  [109,]    NA
#>  [110,]    NA
#>  [111,]    NA
#>  [112,]    NA
#>  [113,]    NA
#>  [114,]    NA
#>  [115,]    NA
#>  [116,]    NA
#>  [117,]    NA
#>  [118,]    NA
#>  [119,]    NA
#>  [120,]    NA
#>  [121,]    NA
#>  [122,]    NA
#>  [123,]    NA
#>  [124,]    NA
#>  [125,]   0.0
#>  [126,]    NA
#>  [127,]    NA
#>  [128,]    NA
#>  [129,]    NA
#>  [130,]    NA
#>  [131,]    NA
#>  [132,]    NA
#>  [133,]    NA
#>  [134,]   0.0
#>  [135,]   0.0
#>  [136,]   0.3
#>  [137,]   0.3
#>  [138,]   0.3
#>  [139,]   0.0
#>  [140,]   0.0
#>  [141,]   0.0
#>  [142,]   0.0
#>  [143,]   0.0
#>  [144,]    NA
#>  [145,]    NA
#>  [146,]   0.0
#>  [147,]    NA
#>  [148,]    NA
#>  [149,]    NA
#>  [150,]    NA
#>  [151,]    NA
#>  [152,]    NA
#>  [153,]    NA
#>  [154,]    NA
#>  [155,]    NA
#>  [156,]    NA
#>  [157,]    NA
#>  [158,]    NA
#>  [159,]    NA
#>  [160,]    NA
#>  [161,]    NA
#>  [162,]    NA
#>  [163,]    NA
#>  [164,]    NA
#>  [165,]    NA
#>  [166,]    NA
#>  [167,]    NA
#>  [168,]   0.0
#>  [169,]   0.0
#>  [170,]   0.3
#>  [171,]   0.6
#>  [172,]   0.3
#>  [173,]   0.0
#>  [174,]   0.0
#>  [175,]   0.0
#>  [176,]   0.0
#>  [177,]   0.0
#>  [178,]   0.0
#>  [179,]    NA
#>  [180,]    NA
#>  [181,]    NA
#>  [182,]    NA
#>  [183,]    NA
#>  [184,]    NA
#>  [185,]    NA
#>  [186,]    NA
#>  [187,]    NA
#>  [188,]    NA
#>  [189,]    NA
#>  [190,]    NA
#>  [191,]    NA
#>  [192,]    NA
#>  [193,]    NA
#>  [194,]    NA
#>  [195,]    NA
#>  [196,]    NA
#>  [197,]    NA
#>  [198,]    NA
#>  [199,]    NA
#>  [200,]    NA
#>  [201,]    NA
#>  [202,]    NA
#>  [203,]   0.0
#>  [204,]   0.0
#>  [205,]   0.5
#>  [206,]   0.8
#>  [207,]   0.4
#>  [208,]   0.2
#>  [209,]   0.1
#>  [210,]   0.0
#>  [211,]   0.0
#>  [212,]   0.0
#>  [213,]   0.0
#>  [214,]   0.0
#>  [215,]    NA
#>  [216,]    NA
#>  [217,]    NA
#>  [218,]    NA
#>  [219,]    NA
#>  [220,]    NA
#>  [221,]    NA
#>  [222,]    NA
#>  [223,]    NA
#>  [224,]    NA
#>  [225,]    NA
#>  [226,]    NA
#>  [227,]    NA
#>  [228,]    NA
#>  [229,]    NA
#>  [230,]    NA
#>  [231,]    NA
#>  [232,]    NA
#>  [233,]    NA
#>  [234,]    NA
#>  [235,]    NA
#>  [236,]    NA
#>  [237,]   0.0
#>  [238,]   0.8
#>  [239,]   0.7
#>  [240,]   0.4
#>  [241,]   0.5
#>  [242,]   0.3
#>  [243,]   0.0
#>  [244,]   0.1
#>  [245,]   0.0
#>  [246,]   0.0
#>  [247,]   0.0
#>  [248,]   0.0
#>  [249,]    NA
#>  [250,]    NA
#>  [251,]    NA
#>  [252,]    NA
#>  [253,]    NA
#>  [254,]    NA
#>  [255,]    NA
#>  [256,]    NA
#>  [257,]    NA
#>  [258,]    NA
#>  [259,]    NA
#>  [260,]    NA
#>  [261,]    NA
#>  [262,]    NA
#>  [263,]    NA
#>  [264,]    NA
#>  [265,]    NA
#>  [266,]    NA
#>  [267,]    NA
#>  [268,]    NA
#>  [269,]   0.0
#>  [270,]   0.0
#>  [271,]   0.7
#>  [272,]   0.6
#>  [273,]   0.7
#>  [274,]   0.6
#>  [275,]   0.6
#>  [276,]   0.6
#>  [277,]   0.1
#>  [278,]   0.0
#>  [279,]   0.0
#>  [280,]   0.0
#>  [281,]   0.0
#>  [282,]    NA
#>  [283,]    NA
#>  [284,]    NA
#>  [285,]    NA
#>  [286,]    NA
#>  [287,]    NA
#>  [288,]    NA
#>  [289,]    NA
#>  [290,]    NA
#>  [291,]    NA
#>  [292,]    NA
#>  [293,]    NA
#>  [294,]    NA
#>  [295,]    NA
#>  [296,]    NA
#>  [297,]    NA
#>  [298,]    NA
#>  [299,]    NA
#>  [300,]   0.0
#>  [301,]   0.9
#>  [302,]   1.0
#>  [303,]   1.0
#>  [304,]   1.0
#>  [305,]   1.0
#>  [306,]   1.0
#>  [307,]   0.8
#>  [308,]   0.6
#>  [309,]   0.4
#>  [310,]   0.0
#>  [311,]   0.0
#>  [312,]   0.0
#>  [313,]    NA
#>  [314,]    NA
#>  [315,]    NA
#>  [316,]    NA
#>  [317,]    NA
#>  [318,]    NA
#>  [319,]    NA
#>  [320,]    NA
#>  [321,]    NA
#>  [322,]    NA
#>  [323,]    NA
#>  [324,]    NA
#>  [325,]    NA
#>  [326,]    NA
#>  [327,]    NA
#>  [328,]    NA
#>  [329,]    NA
#>  [330,]    NA
#>  [331,]    NA
#>  [332,]    NA
#>  [333,]   0.0
#>  [334,]   0.8
#>  [335,]   1.0
#>  [336,]   1.0
#>  [337,]   1.0
#>  [338,]   1.0
#>  [339,]   1.0
#>  [340,]   0.1
#>  [341,]   0.2
#>  [342,]   0.8
#>  [343,]   0.8
#>  [344,]   0.0
#>  [345,]   0.0
#>  [346,]    NA
#>  [347,]    NA
#>  [348,]    NA
#>  [349,]    NA
#>  [350,]    NA
#>  [351,]    NA
#>  [352,]    NA
#>  [353,]    NA
#>  [354,]    NA
#>  [355,]    NA
#>  [356,]    NA
#>  [357,]    NA
#>  [358,]    NA
#>  [359,]    NA
#>  [360,]    NA
#>  [361,]    NA
#>  [362,]    NA
#>  [363,]    NA
#>  [364,]    NA
#>  [365,]    NA
#>  [366,]   0.8
#>  [367,]   1.0
#>  [368,]   1.0
#>  [369,]   1.0
#>  [370,]   1.0
#>  [371,]   1.0
#>  [372,]   0.4
#>  [373,]   0.1
#>  [374,]   0.1
#>  [375,]   0.6
#>  [376,]   0.0
#>  [377,]   0.0
#>  [378,]   0.0
#>  [379,]    NA
#>  [380,]    NA
#>  [381,]    NA
#>  [382,]    NA
#>  [383,]    NA
#>  [384,]    NA
#>  [385,]    NA
#>  [386,]    NA
#>  [387,]    NA
#>  [388,]    NA
#>  [389,]    NA
#>  [390,]    NA
#>  [391,]    NA
#>  [392,]    NA
#>  [393,]    NA
#>  [394,]    NA
#>  [395,]    NA
#>  [396,]    NA
#>  [397,]   0.0
#>  [398,]   1.0
#>  [399,]   1.0
#>  [400,]   1.0
#>  [401,]   1.0
#>  [402,]   1.0
#>  [403,]   0.8
#>  [404,]   0.6
#>  [405,]   0.8
#>  [406,]   0.9
#>  [407,]   0.8
#>  [408,]   0.0
#>  [409,]   0.0
#>  [410,]    NA
#>  [411,]   0.0
#>  [412,]    NA
#>  [413,]    NA
#>  [414,]    NA
#>  [415,]    NA
#>  [416,]    NA
#>  [417,]    NA
#>  [418,]    NA
#>  [419,]    NA
#>  [420,]    NA
#>  [421,]    NA
#>  [422,]    NA
#>  [423,]    NA
#>  [424,]    NA
#>  [425,]    NA
#>  [426,]    NA
#>  [427,]    NA
#>  [428,]   0.0
#>  [429,]   1.0
#>  [430,]   1.0
#>  [431,]   1.0
#>  [432,]   1.0
#>  [433,]   1.0
#>  [434,]   1.0
#>  [435,]   0.9
#>  [436,]   0.9
#>  [437,]   1.0
#>  [438,]   0.0
#>  [439,]   0.0
#>  [440,]   0.0
#>  [441,]   0.0
#>  [442,]    NA
#>  [443,]    NA
#>  [444,]    NA
#>  [445,]    NA
#>  [446,]    NA
#>  [447,]    NA
#>  [448,]    NA
#>  [449,]    NA
#>  [450,]    NA
#>  [451,]    NA
#>  [452,]    NA
#>  [453,]    NA
#>  [454,]    NA
#>  [455,]    NA
#>  [456,]    NA
#>  [457,]   0.0
#>  [458,]   1.0
#>  [459,]   1.0
#>  [460,]   1.0
#>  [461,]   1.0
#>  [462,]   1.0
#>  [463,]   1.0
#>  [464,]   1.0
#>  [465,]   0.8
#>  [466,]   1.0
#>  [467,]   0.0
#>  [468,]   0.0
#>  [469,]   0.0
#>  [470,]   0.0
#>  [471,]    NA
#>  [472,]    NA
#>  [473,]    NA
#>  [474,]    NA
#>  [475,]    NA
#>  [476,]    NA
#>  [477,]    NA
#>  [478,]    NA
#>  [479,]    NA
#>  [480,]    NA
#>  [481,]    NA
#>  [482,]    NA
#>  [483,]    NA
#>  [484,]    NA
#>  [485,]    NA
#>  [486,]   0.8
#>  [487,]   1.0
#>  [488,]   1.0
#>  [489,]   1.0
#>  [490,]   1.0
#>  [491,]   1.0
#>  [492,]   1.0
#>  [493,]   1.0
#>  [494,]   1.0
#>  [495,]   1.0
#>  [496,]   0.0
#>  [497,]   0.0
#>  [498,]   0.0
#>  [499,]   0.0
#>  [500,]   0.0
#>  [501,]    NA
#>  [502,]    NA
#>  [503,]    NA
#>  [504,]    NA
#>  [505,]    NA
#>  [506,]    NA
#>  [507,]    NA
#>  [508,]    NA
#>  [509,]    NA
#>  [510,]    NA
#>  [511,]    NA
#>  [512,]    NA
#>  [513,]    NA
#>  [514,]    NA
#>  [515,]   1.0
#>  [516,]   1.0
#>  [517,]   1.0
#>  [518,]   1.0
#>  [519,]   1.0
#>  [520,]   1.0
#>  [521,]   1.0
#>  [522,]   1.0
#>  [523,]   1.0
#>  [524,]   1.0
#>  [525,]   0.0
#>  [526,]   0.0
#>  [527,]   0.0
#>  [528,]   0.0
#>  [529,]    NA
#>  [530,]    NA
#>  [531,]    NA
#>  [532,]    NA
#>  [533,]    NA
#>  [534,]    NA
#>  [535,]    NA
#>  [536,]    NA
#>  [537,]    NA
#>  [538,]    NA
#>  [539,]    NA
#>  [540,]    NA
#>  [541,]    NA
#>  [542,]    NA
#>  [543,]    NA
#>  [544,]   0.0
#>  [545,]   1.0
#>  [546,]   1.0
#>  [547,]   1.0
#>  [548,]   1.0
#>  [549,]   1.0
#>  [550,]   1.0
#>  [551,]   1.0
#>  [552,]   1.0
#>  [553,]   1.0
#>  [554,]   1.0
#>  [555,]   1.0
#>  [556,]   0.0
#>  [557,]   0.0
#>  [558,]    NA
#>  [559,]    NA
#>  [560,]    NA
#>  [561,]    NA
#>  [562,]    NA
#>  [563,]    NA
#>  [564,]    NA
#>  [565,]    NA
#>  [566,]    NA
#>  [567,]    NA
#>  [568,]    NA
#>  [569,]    NA
#>  [570,]    NA
#>  [571,]    NA
#>  [572,]    NA
#>  [573,]    NA
#>  [574,]   0.0
#>  [575,]   1.0
#>  [576,]   1.0
#>  [577,]   1.0
#>  [578,]   1.0
#>  [579,]   1.0
#>  [580,]   1.0
#>  [581,]   1.0
#>  [582,]   1.0
#>  [583,]   1.0
#>  [584,]   1.0
#>  [585,]   1.0
#>  [586,]   0.0
#>  [587,]   0.0
#>  [588,]    NA
#>  [589,]    NA
#>  [590,]    NA
#>  [591,]    NA
#>  [592,]    NA
#>  [593,]    NA
#>  [594,]    NA
#>  [595,]    NA
#>  [596,]    NA
#>  [597,]    NA
#>  [598,]    NA
#>  [599,]    NA
#>  [600,]    NA
#>  [601,]    NA
#>  [602,]    NA
#>  [603,]    NA
#>  [604,]   0.0
#>  [605,]   1.0
#>  [606,]   1.0
#>  [607,]   1.0
#>  [608,]   1.0
#>  [609,]   1.0
#>  [610,]   1.0
#>  [611,]   1.0
#>  [612,]   1.0
#>  [613,]   0.7
#>  [614,]   1.0
#>  [615,]   1.0
#>  [616,]   0.0
#>  [617,]    NA
#>  [618,]    NA
#>  [619,]    NA
#>  [620,]    NA
#>  [621,]    NA
#>  [622,]    NA
#>  [623,]    NA
#>  [624,]    NA
#>  [625,]    NA
#>  [626,]    NA
#>  [627,]    NA
#>  [628,]    NA
#>  [629,]    NA
#>  [630,]    NA
#>  [631,]    NA
#>  [632,]   0.0
#>  [633,]   1.0
#>  [634,]   1.0
#>  [635,]   1.0
#>  [636,]   1.0
#>  [637,]   1.0
#>  [638,]   1.0
#>  [639,]   1.0
#>  [640,]   1.0
#>  [641,]   0.9
#>  [642,]   1.0
#>  [643,]   1.0
#>  [644,]   0.0
#>  [645,]    NA
#>  [646,]    NA
#>  [647,]    NA
#>  [648,]    NA
#>  [649,]    NA
#>  [650,]    NA
#>  [651,]    NA
#>  [652,]    NA
#>  [653,]    NA
#>  [654,]    NA
#>  [655,]    NA
#>  [656,]    NA
#>  [657,]    NA
#>  [658,]    NA
#>  [659,]    NA
#>  [660,]    NA
#>  [661,]    NA
#>  [662,]   1.0
#>  [663,]   1.0
#>  [664,]   1.0
#>  [665,]   1.0
#>  [666,]   1.0
#>  [667,]   1.0
#>  [668,]   1.0
#>  [669,]   1.0
#>  [670,]   0.7
#>  [671,]   1.0
#>  [672,]   1.0
#>  [673,]   1.0
#>  [674,]   0.0
#>  [675,]    NA
#>  [676,]    NA
#>  [677,]    NA
#>  [678,]    NA
#>  [679,]    NA
#>  [680,]    NA
#>  [681,]    NA
#>  [682,]    NA
#>  [683,]    NA
#>  [684,]    NA
#>  [685,]    NA
#>  [686,]    NA
#>  [687,]    NA
#>  [688,]    NA
#>  [689,]   0.0
#>  [690,]   1.0
#>  [691,]   1.0
#>  [692,]   1.0
#>  [693,]   1.0
#>  [694,]   1.0
#>  [695,]   1.0
#>  [696,]   1.0
#>  [697,]   0.0
#>  [698,]   0.0
#>  [699,]   1.0
#>  [700,]   1.0
#>  [701,]   0.5
#>  [702,]    NA
#>  [703,]    NA
#>  [704,]    NA
#>  [705,]    NA
#>  [706,]    NA
#>  [707,]    NA
#>  [708,]    NA
#>  [709,]    NA
#>  [710,]    NA
#>  [711,]    NA
#>  [712,]    NA
#>  [713,]    NA
#>  [714,]    NA
#>  [715,]    NA
#>  [716,]   0.0
#>  [717,]   1.0
#>  [718,]   1.0
#>  [719,]   1.0
#>  [720,]   1.0
#>  [721,]   1.0
#>  [722,]   1.0
#>  [723,]   1.0
#>  [724,]   0.6
#>  [725,]   0.1
#>  [726,]   1.0
#>  [727,]   1.0
#>  [728,]   0.9
#>  [729,]   0.0
#>  [730,]    NA
#>  [731,]    NA
#>  [732,]    NA
#>  [733,]    NA
#>  [734,]    NA
#>  [735,]    NA
#>  [736,]    NA
#>  [737,]    NA
#>  [738,]    NA
#>  [739,]    NA
#>  [740,]    NA
#>  [741,]    NA
#>  [742,]    NA
#>  [743,]    NA
#>  [744,]   0.7
#>  [745,]   1.0
#>  [746,]   1.0
#>  [747,]   1.0
#>  [748,]   1.0
#>  [749,]   1.0
#>  [750,]   1.0
#>  [751,]   0.9
#>  [752,]   0.2
#>  [753,]   0.0
#>  [754,]   0.0
#>  [755,]   1.0
#>  [756,]   0.0
#>  [757,]    NA
#>  [758,]    NA
#>  [759,]    NA
#>  [760,]    NA
#>  [761,]    NA
#>  [762,]    NA
#>  [763,]    NA
#>  [764,]    NA
#>  [765,]    NA
#>  [766,]    NA
#>  [767,]    NA
#>  [768,]    NA
#>  [769,]    NA
#>  [770,]   1.0
#>  [771,]   1.0
#>  [772,]   1.0
#>  [773,]   1.0
#>  [774,]   1.0
#>  [775,]   1.0
#>  [776,]   1.0
#>  [777,]   1.0
#>  [778,]   0.7
#>  [779,]   0.7
#>  [780,]   1.0
#>  [781,]   1.0
#>  [782,]   0.2
#>  [783,]    NA
#>  [784,]    NA
#>  [785,]    NA
#>  [786,]    NA
#>  [787,]    NA
#>  [788,]    NA
#>  [789,]    NA
#>  [790,]    NA
#>  [791,]    NA
#>  [792,]    NA
#>  [793,]   1.0
#>  [794,]   1.0
#>  [795,]   1.0
#>  [796,]   1.0
#>  [797,]   1.0
#>  [798,]   1.0
#>  [799,]   1.0
#>  [800,]   1.0
#>  [801,]   1.0
#>  [802,]   1.0
#>  [803,]   1.0
#>  [804,]   1.0
#>  [805,]   0.2
#>  [806,]    NA
#>  [807,]    NA
#>  [808,]    NA
#>  [809,]    NA
#>  [810,]    NA
#>  [811,]    NA
#>  [812,]    NA
#>  [813,]    NA
#>  [814,]    NA
#>  [815,]    NA
#>  [816,]    NA
#>  [817,]   0.0
#>  [818,]   0.0
#>  [819,]   0.0
#>  [820,]   1.0
#>  [821,]   1.0
#>  [822,]   1.0
#>  [823,]   1.0
#>  [824,]   1.0
#>  [825,]   1.0
#>  [826,]   1.0
#>  [827,]   1.0
#>  [828,]   1.0
#>  [829,]   0.0
#>  [830,]    NA
#>  [831,]    NA
#>  [832,]    NA
#>  [833,]    NA
#>  [834,]    NA
#>  [835,]    NA
#>  [836,]    NA
#>  [837,]    NA
#>  [838,]    NA
#>  [839,]    NA
#>  [840,]    NA
#>  [841,]   0.0
#>  [842,]   0.0
#>  [843,]   1.0
#>  [844,]   1.0
#>  [845,]   1.0
#>  [846,]   1.0
#>  [847,]   1.0
#>  [848,]   1.0
#>  [849,]   1.0
#>  [850,]   0.6
#>  [851,]   0.0
#>  [852,]   1.0
#>  [853,]   0.1
#>  [854,]    NA
#>  [855,]    NA
#>  [856,]    NA
#>  [857,]    NA
#>  [858,]    NA
#>  [859,]    NA
#>  [860,]    NA
#>  [861,]    NA
#>  [862,]    NA
#>  [863,]    NA
#>  [864,]    NA
#>  [865,]   1.0
#>  [866,]   1.0
#>  [867,]   1.0
#>  [868,]   1.0
#>  [869,]   1.0
#>  [870,]   1.0
#>  [871,]   1.0
#>  [872,]   0.7
#>  [873,]   0.0
#>  [874,]   0.7
#>  [875,]   1.0
#>  [876,]   0.2
#>  [877,]    NA
#>  [878,]    NA
#>  [879,]    NA
#>  [880,]    NA
#>  [881,]    NA
#>  [882,]    NA
#>  [883,]    NA
#>  [884,]    NA
#>  [885,]    NA
#>  [886,]    NA
#>  [887,]    NA
#>  [888,]   1.0
#>  [889,]   1.0
#>  [890,]   1.0
#>  [891,]   1.0
#>  [892,]   1.0
#>  [893,]   1.0
#>  [894,]   1.0
#>  [895,]   0.7
#>  [896,]   0.0
#>  [897,]   0.7
#>  [898,]   1.0
#>  [899,]   0.9
#>  [900,]    NA
#>  [901,]    NA
#>  [902,]    NA
#>  [903,]    NA
#>  [904,]    NA
#>  [905,]    NA
#>  [906,]    NA
#>  [907,]    NA
#>  [908,]    NA
#>  [909,]    NA
#>  [910,]    NA
#>  [911,]   1.0
#>  [912,]   1.0
#>  [913,]   1.0
#>  [914,]   1.0
#>  [915,]   1.0
#>  [916,]   1.0
#>  [917,]   1.0
#>  [918,]   1.0
#>  [919,]   0.0
#>  [920,]   0.0
#>  [921,]   1.0
#>  [922,]   0.9
#>  [923,]    NA
#>  [924,]    NA
#>  [925,]    NA
#>  [926,]    NA
#>  [927,]    NA
#>  [928,]    NA
#>  [929,]    NA
#>  [930,]    NA
#>  [931,]    NA
#>  [932,]    NA
#>  [933,]    NA
#>  [934,]   1.0
#>  [935,]   1.0
#>  [936,]   1.0
#>  [937,]   1.0
#>  [938,]   1.0
#>  [939,]   1.0
#>  [940,]   1.0
#>  [941,]   0.6
#>  [942,]   0.0
#>  [943,]   1.0
#>  [944,]   0.9
#>  [945,]   0.0
#>  [946,]    NA
#>  [947,]    NA
#>  [948,]    NA
#>  [949,]    NA
#>  [950,]    NA
#>  [951,]    NA
#>  [952,]    NA
#>  [953,]    NA
#>  [954,]    NA
#>  [955,]   0.0
#>  [956,]   0.9
#>  [957,]   1.0
#>  [958,]   1.0
#>  [959,]   1.0
#>  [960,]   1.0
#>  [961,]   1.0
#>  [962,]   0.7
#>  [963,]   0.0
#>  [964,]   1.0
#>  [965,]   1.0
#>  [966,]   0.0
#>  [967,]    NA
#>  [968,]    NA
#>  [969,]    NA
#>  [970,]    NA
#>  [971,]    NA
#>  [972,]    NA
#>  [973,]    NA
#>  [974,]    NA
#>  [975,]   0.0
#>  [976,]   1.0
#>  [977,]   1.0
#>  [978,]   1.0
#>  [979,]   1.0
#>  [980,]   0.4
#>  [981,]   0.0
#>  [982,]   0.9
#>  [983,]   0.9
#>  [984,]   1.0
#>  [985,]   0.2
#>  [986,]    NA
#>  [987,]    NA
#>  [988,]    NA
#>  [989,]    NA
#>  [990,]    NA
#>  [991,]   0.0
#>  [992,]   0.7
#>  [993,]   0.3
#>  [994,]   1.0
#>  [995,]   1.0
#>  [996,]   1.0
#>  [997,]   1.0
#>  [998,]   1.0
#>  [999,]   0.9
#> [1000,]   1.0
#> [1001,]   1.0
#> [1002,]   0.0
#> [1003,]    NA
#> [1004,]    NA
#> [1005,]    NA
#> [1006,]    NA
#> [1007,]    NA
#> [1008,]    NA
#> [1009,]    NA
#> [1010,]    NA
#> [1011,]   0.1
#> [1012,]   1.0
#> [1013,]   1.0
#> [1014,]   1.0
#> [1015,]   1.0
#> [1016,]   1.0
#> [1017,]   0.9
#> [1018,]   0.8
#> [1019,]   0.5
#> [1020,]   1.0
#> [1021,]   1.0
#> [1022,]   0.0
#> [1023,]    NA
#> [1024,]    NA
#> [1025,]    NA
#> [1026,]    NA
#> [1027,]    NA
#> [1028,]    NA
#> [1029,]    NA
#> [1030,]    NA
#> [1031,]    NA
#> [1032,]    NA
#> [1033,]   0.0
#> [1034,]   1.0
#> [1035,]   1.0
#> [1036,]   1.0
#> [1037,]   1.0
#> [1038,]   1.0
#> [1039,]   0.9
#> [1040,]   0.8
#> [1041,]   0.8
#> [1042,]   0.8
#> [1043,]   0.9
#> [1044,]   0.2
#> [1045,]    NA
#> [1046,]    NA
#> [1047,]    NA
#> [1048,]    NA
#> [1049,]    NA
#> [1050,]    NA
#> [1051,]    NA
#> [1052,]    NA
#> [1053,]    NA
#> [1054,]    NA
#> [1055,]    NA
#> [1056,]   0.9
#> [1057,]   1.0
#> [1058,]   1.0
#> [1059,]   1.0
#> [1060,]   1.0
#> [1061,]   1.0
#> [1062,]   0.9
#> [1063,]   0.8
#> [1064,]   0.1
#> [1065,]   0.8
#> [1066,]   0.2
#> [1067,]    NA
#> [1068,]    NA
#> [1069,]    NA
#> [1070,]    NA
#> [1071,]    NA
#> [1072,]    NA
#> [1073,]    NA
#> [1074,]    NA
#> [1075,]    NA
#> [1076,]   0.0
#> [1077,]   0.8
#> [1078,]   1.0
#> [1079,]   1.0
#> [1080,]   1.0
#> [1081,]   1.0
#> [1082,]   1.0
#> [1083,]   1.0
#> [1084,]   0.9
#> [1085,]   0.2
#> [1086,]   1.0
#> [1087,]   0.9
#> [1088,]    NA
#> [1089,]    NA
#> [1090,]    NA
#> [1091,]    NA
#> [1092,]    NA
#> [1093,]    NA
#> [1094,]    NA
#> [1095,]    NA
#> [1096,]   0.2
#> [1097,]   1.0
#> [1098,]   1.0
#> [1099,]   1.0
#> [1100,]   1.0
#> [1101,]   1.0
#> [1102,]   1.0
#> [1103,]   1.0
#> [1104,]   1.0
#> [1105,]   1.0
#> [1106,]   0.9
#> [1107,]   0.0
#> [1108,]    NA
#> [1109,]    NA
#> [1110,]    NA
#> [1111,]    NA
#> [1112,]    NA
#> [1113,]    NA
#> [1114,]    NA
#> [1115,]   0.0
#> [1116,]   0.9
#> [1117,]   1.0
#> [1118,]   1.0
#> [1119,]   1.0
#> [1120,]   1.0
#> [1121,]   1.0
#> [1122,]   1.0
#> [1123,]   1.0
#> [1124,]   1.0
#> [1125,]   0.9
#> [1126,]   0.0
#> [1127,]    NA
#> [1128,]    NA
#> [1129,]    NA
#> [1130,]    NA
#> [1131,]    NA
#> [1132,]    NA
#> [1133,]    NA
#> [1134,]    NA
#> [1135,]    NA
#> [1136,]    NA
#> [1137,]   1.0
#> [1138,]   1.0
#> [1139,]   1.0
#> [1140,]   1.0
#> [1141,]   1.0
#> [1142,]   1.0
#> [1143,]   1.0
#> [1144,]   1.0
#> [1145,]   0.0
#> [1146,]   1.0
#> [1147,]   0.2
#> [1148,]    NA
#> [1149,]    NA
#> [1150,]    NA
#> [1151,]    NA
#> [1152,]    NA
#> [1153,]    NA
#> [1154,]    NA
#> [1155,]    NA
#> [1156,]    NA
#> [1157,]   0.8
#> [1158,]   1.0
#> [1159,]   1.0
#> [1160,]   1.0
#> [1161,]   1.0
#> [1162,]   1.0
#> [1163,]   1.0
#> [1164,]   1.0
#> [1165,]   1.0
#> [1166,]   1.0
#> [1167,]    NA
#> [1168,]    NA
#> [1169,]    NA
#> [1170,]    NA
#> [1171,]    NA
#> [1172,]    NA
#> [1173,]    NA
#> [1174,]    NA
#> [1175,]    NA
#> [1176,]    NA
#> [1177,]   0.0
#> [1178,]   1.0
#> [1179,]   1.0
#> [1180,]   1.0
#> [1181,]   1.0
#> [1182,]   1.0
#> [1183,]   1.0
#> [1184,]   1.0
#> [1185,]   0.9
#> [1186,]   0.0
#> [1187,]    NA
#> [1188,]    NA
#> [1189,]    NA
#> [1190,]    NA
#> [1191,]    NA
#> [1192,]    NA
#> [1193,]    NA
#> [1194,]   0.0
#> [1195,]   1.0
#> [1196,]   1.0
#> [1197,]   1.0
#> [1198,]   1.0
#> [1199,]   1.0
#> [1200,]   1.0
#> [1201,]   1.0
#> [1202,]   1.0
#> [1203,]   0.8
#> [1204,]    NA
#> [1205,]    NA
#> [1206,]    NA
#> [1207,]    NA
#> [1208,]    NA
#> [1209,]    NA
#> [1210,]   0.1
#> [1211,]   1.0
#> [1212,]   0.9
#> [1213,]   1.0
#> [1214,]   1.0
#> [1215,]   1.0
#> [1216,]   1.0
#> [1217,]   1.0
#> [1218,]   0.2
#> [1219,]   0.0
#> [1220,]    NA
#> [1221,]    NA
#> [1222,]    NA
#> [1223,]    NA
#> [1224,]   0.0
#> [1225,]   0.8
#> [1226,]   1.0
#> [1227,]   1.0
#> [1228,]   1.0
#> [1229,]   1.0
#> [1230,]   1.0
#> [1231,]   1.0
#> [1232,]   1.0
#> [1233,]   0.0
#> [1234,]    NA
#> [1235,]    NA
#> [1236,]    NA
#> [1237,]    NA
#> [1238,]    NA
#> [1239,]    NA
#> [1240,]    NA
#> [1241,]   0.0
#> [1242,]   0.0
#> [1243,]   1.0
#> [1244,]   1.0
#> [1245,]   1.0
#> [1246,]   1.0
#> [1247,]   1.0
#> [1248,]   1.0
#> [1249,]   0.7
#> [1250,]   0.0
#> [1251,]    NA
#> [1252,]    NA
#> [1253,]    NA
#> [1254,]   0.0
#> [1255,]   1.0
#> [1256,]   1.0
#> [1257,]   1.0
#> [1258,]   1.0
#> [1259,]   1.0
#> [1260,]   1.0
#> [1261,]   1.0
#> [1262,]   0.2
#> [1263,]   0.0
#> [1264,]    NA
#> [1265,]    NA
#> [1266,]    NA
#> [1267,]   0.1
#> [1268,]   1.0
#> [1269,]   1.0
#> [1270,]   1.0
#> [1271,]   1.0
#> [1272,]   1.0
#> [1273,]   1.0
#> [1274,]   1.0
#> [1275,]   0.8
#> [1276,]    NA
#> [1277,]    NA
#> [1278,]    NA
#> [1279,]   0.0
#> [1280,]   1.0
#> [1281,]   1.0
#> [1282,]   1.0
#> [1283,]   1.0
#> [1284,]   1.0
#> [1285,]   1.0
#> [1286,]   0.0
#> [1287,]   0.9
#> [1288,]    NA
#> [1289,]    NA
#> [1290,]    NA
#> [1291,]   0.0
#> [1292,]   1.0
#> [1293,]   1.0
#> [1294,]   1.0
#> [1295,]   1.0
#> [1296,]   1.0
#> [1297,]   1.0
#> [1298,]   1.0
#> [1299,]   1.0
#> [1300,]   0.0
#> [1301,]    NA
#> [1302,]    NA
#> [1303,]    NA
#> [1304,]   0.8
#> [1305,]   1.0
#> [1306,]   1.0
#> [1307,]   1.0
#> [1308,]   1.0
#> [1309,]   0.0
#> [1310,]   0.0
#> [1311,]   0.9
#> [1312,]   0.0
#> [1313,]    NA
#> [1314,]   0.0
#> [1315,]   1.0
#> [1316,]   1.0
#> [1317,]   1.0
#> [1318,]   1.0
#> [1319,]   0.0
#> [1320,]   0.0
#> [1321,]   0.0
#> [1322,]    NA
#> [1323,]    NA
#> [1324,]    NA
#> [1325,]   0.0
#> [1326,]   1.0
#> [1327,]   1.0
#> [1328,]   1.0
#> [1329,]   1.0
#> [1330,]   0.0
#> [1331,]   0.0
#> [1332,]   0.0
#> [1333,]    NA
#> [1334,]    NA
#> [1335,]    NA
#> [1336,]   0.0
#> [1337,]   0.9
#> [1338,]   1.0
#> [1339,]   1.0
#> [1340,]   1.0
#> [1341,]   1.0
#> [1342,]   1.0
#> [1343,]   0.0
#> [1344,]    NA
#> [1345,]    NA
#> [1346,]    NA
#> [1347,]   0.0
#> [1348,]   0.9
#> [1349,]   1.0
#> [1350,]   1.0
#> [1351,]   1.0
#> [1352,]   1.0
#> [1353,]   1.0
#> [1354,]   0.2
#> [1355,]   0.0
#> [1356,]    NA
#> [1357,]    NA
#> [1358,]    NA
#> [1359,]   0.0
#> [1360,]   1.0
#> [1361,]   0.9
#> [1362,]   1.0
#> [1363,]   1.0
#> [1364,]   1.0
#> [1365,]   0.4
#> [1366,]   0.0
#> [1367,]   0.0
#> [1368,]    NA
#> [1369,]    NA
#> [1370,]   0.9
#> [1371,]   0.9
#> [1372,]   1.0
#> [1373,]   1.0
#> [1374,]   1.0
#> [1375,]   1.0
#> [1376,]   0.9
#> [1377,]   0.2
#> [1378,]    NA
#> [1379,]    NA
#> [1380,]   0.0
#> [1381,]   0.9
#> [1382,]   0.8
#> [1383,]   0.9
#> [1384,]   1.0
#> [1385,]   1.0
#> [1386,]   1.0
#> [1387,]   0.0
#> [1388,]   0.0
#> [1389,]    NA
#> [1390,]    NA
#> [1391,]   0.0
#> [1392,]   1.0
#> [1393,]   0.2
#> [1394,]   0.8
#> [1395,]   0.9
#> [1396,]   1.0
#> [1397,]   1.0
#> [1398,]   1.0
#> [1399,]   0.0
#> [1400,]    NA
#> [1401,]    NA
#> [1402,]   0.0
#> [1403,]   0.5
#> [1404,]   0.5
#> [1405,]   0.8
#> [1406,]   0.9
#> [1407,]   1.0
#> [1408,]   1.0
#> [1409,]   1.0
#> [1410,]   0.2
#> [1411,]   0.0
#> [1412,]   0.0
#> [1413,]   0.2
#> [1414,]   0.2
#> [1415,]   0.4
#> [1416,]   0.8
#> [1417,]   0.9
#> [1418,]   1.0
#> [1419,]   1.0
#> [1420,]   0.0
#> [1421,]   0.0
#> [1422,]    NA
#> [1423,]   0.0
#> [1424,]   0.2
#> [1425,]   0.1
#> [1426,]   0.8
#> [1427,]   0.9
#> [1428,]   1.0
#> [1429,]   0.0
#> [1430,]   0.0
#> [1431,]   0.0
#> [1432,]    NA
#> [1433,]    NA
#> [1434,]    NA
#> [1435,]   0.0
#> [1436,]   0.0
#> [1437,]   0.3
#> [1438,]   0.8
#> [1439,]   0.8
#> [1440,]   0.9
#> [1441,]   0.9
#> [1442,]   0.9
#> [1443,]   0.9
#> [1444,]    NA
#> [1445,]    NA
#> [1446,]   0.0
#> [1447,]   0.0
#> [1448,]   0.2
#> [1449,]   0.7
#> [1450,]   0.8
#> [1451,]   0.8
#> [1452,]   0.8
#> [1453,]   0.9
#> [1454,]   0.0
#> [1455,]    NA
#> [1456,]    NA
#> [1457,]    NA
#> [1458,]   0.0
#> [1459,]   0.0
#> [1460,]   0.2
#> [1461,]   0.8
#> [1462,]   0.5
#> [1463,]   0.8
#> [1464,]   0.3
#> [1465,]   0.4
#> [1466,]   0.9
#> [1467,]    NA
#> [1468,]    NA
#> [1469,]    NA
#> [1470,]    NA
#> [1471,]    NA
#> [1472,]   0.0
#> [1473,]   0.1
#> [1474,]   0.8
#> [1475,]   0.6
#> [1476,]   0.4
#> [1477,]   0.2
#> [1478,]   0.1
#> [1479,]   0.4
#> [1480,]   0.5
#> [1481,]   0.0
#> [1482,]    NA
#> [1483,]    NA
#> [1484,]    NA
#> [1485,]   0.0
#> [1486,]   0.0
#> [1487,]   0.4
#> [1488,]   0.4
#> [1489,]   0.3
#> [1490,]   0.1
#> [1491,]   0.1
#> [1492,]   0.3
#> [1493,]   0.1
#> [1494,]   0.0
#> [1495,]    NA
#> [1496,]    NA
#> [1497,]    NA
#> [1498,]    NA
#> [1499,]   0.0
#> [1500,]   0.4
#> [1501,]   0.4
#> [1502,]   0.3
#> [1503,]   0.1
#> [1504,]   0.1
#> [1505,]   0.1
#> [1506,]   0.0
#> [1507,]   0.0
#> [1508,]    NA
#> [1509,]    NA
#> [1510,]    NA
#> [1511,]   0.0
#> [1512,]   0.8
#> [1513,]   0.4
#> [1514,]   0.4
#> [1515,]   0.3
#> [1516,]   0.1
#> [1517,]   0.1
#> [1518,]   0.0
#> [1519,]   0.0
#> [1520,]    NA
#> [1521,]    NA
#> [1522,]    NA
#> [1523,]   0.0
#> [1524,]   0.8
#> [1525,]   0.8
#> [1526,]   0.4
#> [1527,]   0.3
#> [1528,]   0.1
#> [1529,]   0.1
#> [1530,]   0.1
#> [1531,]   0.0
#> [1532,]    NA
#> [1533,]    NA
#> [1534,]    NA
#> [1535,]   0.0
#> [1536,]   0.1
#> [1537,]   1.0
#> [1538,]   0.8
#> [1539,]   0.2
#> [1540,]   0.1
#> [1541,]   0.1
#> [1542,]   0.1
#> [1543,]   0.0
#> [1544,]   0.0
#> [1545,]    NA
#> [1546,]    NA
#> [1547,]    NA
#> [1548,]   0.0
#> [1549,]   0.2
#> [1550,]   1.0
#> [1551,]   0.9
#> [1552,]   0.3
#> [1553,]   0.1
#> [1554,]   0.1
#> [1555,]   0.1
#> [1556,]   0.0
#> [1557,]   0.0
#> [1558,]    NA
#> [1559,]    NA
#> [1560,]    NA
#> [1561,]   0.0
#> [1562,]   0.1
#> [1563,]   0.9
#> [1564,]   0.9
#> [1565,]   0.2
#> [1566,]   0.1
#> [1567,]   0.1
#> [1568,]   0.1
#> [1569,]   0.0
#> [1570,]    NA
#> [1571,]    NA
#> [1572,]    NA
#> [1573,]    NA
#> [1574,]    NA
#> [1575,]    NA
#> [1576,]    NA
#> [1577,]   0.8
#> [1578,]   1.0
#> [1579,]   0.8
#> [1580,]   0.1
#> [1581,]   0.1
#> [1582,]   0.1
#> [1583,]   0.0
#> [1584,]    NA
#> [1585,]    NA
#> [1586,]    NA
#> [1587,]    NA
#> [1588,]    NA
#> [1589,]   0.0
#> [1590,]   0.2
#> [1591,]   1.0
#> [1592,]   1.0
#> [1593,]   0.3
#> [1594,]   0.1
#> [1595,]   0.0
#> [1596,]   0.0
#> [1597,]   0.0
#> [1598,]    NA
#> [1599,]    NA
#> [1600,]    NA
#> [1601,]    NA
#> [1602,]    NA
#> [1603,]    NA
#> [1604,]   0.0
#> [1605,]   0.2
#> [1606,]   1.0
#> [1607,]   1.0
#> [1608,]   0.6
#> [1609,]   0.1
#> [1610,]   0.0
#> [1611,]   0.0
#> [1612,]   0.0
#> [1613,]    NA
#> [1614,]    NA
#> [1615,]    NA
#> [1616,]    NA
#> [1617,]    NA
#> [1618,]    NA
#> [1619,]   0.0
#> [1620,]   0.6
#> [1621,]   1.0
#> [1622,]   0.8
#> [1623,]   0.4
#> [1624,]   0.0
#> [1625,]   0.0
#> [1626,]   0.0
#> [1627,]    NA
#> [1628,]    NA
#> [1629,]    NA
#> [1630,]    NA
#> [1631,]    NA
#> [1632,]    NA
#> [1633,]   0.0
#> [1634,]   0.0
#> [1635,]   0.1
#> [1636,]   0.6
#> [1637,]   0.9
#> [1638,]   0.3
#> [1639,]   0.0
#> [1640,]   0.0
#> [1641,]   0.0
#> [1642,]   0.0
#> [1643,]    NA
#> [1644,]    NA
#> [1645,]    NA
#> [1646,]    NA
#> [1647,]    NA
#> [1648,]    NA
#> [1649,]    NA
#> [1650,]    NA
#> [1651,]   0.8
#> [1652,]   1.0
#> [1653,]   1.0
#> [1654,]   1.0
#> [1655,]   0.5
#> [1656,]   0.0
#> [1657,]   0.1
#> [1658,]   0.0
#> [1659,]    NA
#> [1660,]    NA
#> [1661,]    NA
#> [1662,]    NA
#> [1663,]    NA
#> [1664,]    NA
#> [1665,]    NA
#> [1666,]    NA
#> [1667,]   0.0
#> [1668,]   0.1
#> [1669,]   1.0
#> [1670,]   1.0
#> [1671,]   1.0
#> [1672,]   1.0
#> [1673,]   0.9
#> [1674,]    NA
#> [1675,]    NA
#> [1676,]    NA
#> [1677,]    NA
#> [1678,]    NA
#> [1679,]    NA
#> [1680,]    NA
#> [1681,]    NA
#> [1682,]    NA
#> [1683,]   0.1
#> [1684,]   1.0
#> [1685,]   1.0
#> [1686,]   1.0
#> [1687,]   0.4
#> [1688,]   0.9
#> [1689,]   0.0
#> [1690,]    NA
#> [1691,]    NA
#> [1692,]    NA
#> [1693,]    NA
#> [1694,]    NA
#> [1695,]    NA
#> [1696,]    NA
#> [1697,]    NA
#> [1698,]   0.0
#> [1699,]   1.0
#> [1700,]   1.0
#> [1701,]   1.0
#> [1702,]   1.0
#> [1703,]   0.0
#> [1704,]   0.0
#> [1705,]    NA
#> [1706,]    NA
#> [1707,]    NA
#> [1708,]    NA
#> [1709,]    NA
#> [1710,]    NA
#> [1711,]    NA
#> [1712,]    NA
#> [1713,]   0.0
#> [1714,]   1.0
#> [1715,]   1.0
#> [1716,]   1.0
#> [1717,]   1.0
#> [1718,]   0.0
#> [1719,]    NA
#> [1720,]    NA
#> [1721,]    NA
#> [1722,]    NA
#> [1723,]    NA
#> [1724,]    NA
#> [1725,]    NA
#> [1726,]    NA
#> [1727,]   0.0
#> [1728,]   1.0
#> [1729,]   1.0
#> [1730,]   1.0
#> [1731,]   1.0
#> [1732,]   1.0
#> [1733,]   0.0
#> [1734,]    NA
#> [1735,]    NA
#> [1736,]    NA
#> [1737,]    NA
#> [1738,]    NA
#> [1739,]    NA
#> [1740,]    NA
#> [1741,]    NA
#> [1742,]    NA
#> [1743,]   0.0
#> [1744,]   1.0
#> [1745,]   1.0
#> [1746,]   1.0
#> [1747,]   1.0
#> [1748,]   0.0
#> [1749,]    NA
#> [1750,]    NA
#> [1751,]    NA
#> [1752,]    NA
#> [1753,]    NA
#> [1754,]    NA
#> [1755,]    NA
#> [1756,]    NA
#> [1757,]   0.0
#> [1758,]   0.9
#> [1759,]   1.0
#> [1760,]   1.0
#> [1761,]   1.0
#> [1762,]   1.0
#> [1763,]    NA
#> [1764,]    NA
#> [1765,]    NA
#> [1766,]    NA
#> [1767,]    NA
#> [1768,]    NA
#> [1769,]    NA
#> [1770,]    NA
#> [1771,]    NA
#> [1772,]   0.0
#> [1773,]   1.0
#> [1774,]   1.0
#> [1775,]   1.0
#> [1776,]   0.3
#> [1777,]    NA
#> [1778,]    NA
#> [1779,]    NA
#> [1780,]    NA
#> [1781,]    NA
#> [1782,]    NA
#> [1783,]    NA
#> [1784,]   0.0
#> [1785,]   0.0
#> [1786,]   1.0
#> [1787,]   1.0
#> [1788,]   0.8
#> [1789,]   1.0
#> [1790,]    NA
#> [1791,]    NA
#> [1792,]    NA
#> [1793,]    NA
#> [1794,]    NA
#> [1795,]    NA
#> [1796,]    NA
#> [1797,]   0.0
#> [1798,]   1.0
#> [1799,]   1.0
#> [1800,]   1.0
#> [1801,]   1.0
#> [1802,]    NA
#> [1803,]    NA
#> [1804,]    NA
#> [1805,]    NA
#> [1806,]    NA
#> [1807,]    NA
#> [1808,]    NA
#> [1809,]    NA
#> [1810,]   1.0
#> [1811,]   1.0
#> [1812,]   1.0
#> [1813,]   1.0
#> [1814,]   0.1
#> [1815,]    NA
#> [1816,]    NA
#> [1817,]    NA
#> [1818,]    NA
#> [1819,]    NA
#> [1820,]    NA
#> [1821,]   0.0
#> [1822,]   0.9
#> [1823,]   1.0
#> [1824,]   1.0
#> [1825,]   1.0
#> [1826,]   0.2
#> [1827,]   0.0
#> [1828,]    NA
#> [1829,]    NA
#> [1830,]    NA
#> [1831,]    NA
#> [1832,]    NA
#> [1833,]    NA
#> [1834,]    NA
#> [1835,]   0.0
#> [1836,]   1.0
#> [1837,]   1.0
#> [1838,]   0.8
#> [1839,]   0.7
#> [1840,]   0.1
#> [1841,]    NA
#> [1842,]    NA
#> [1843,]    NA
#> [1844,]    NA
#> [1845,]    NA
#> [1846,]    NA
#> [1847,]    NA
#> [1848,]    NA
#> [1849,]   0.0
#> [1850,]   0.0
#> [1851,]   1.0
#> [1852,]   1.0
#> [1853,]   1.0
#> [1854,]   0.1
#> [1855,]    NA
#> [1856,]    NA
#> [1857,]    NA
#> [1858,]    NA
#> [1859,]    NA
#> [1860,]    NA
#> [1861,]    NA
#> [1862,]    NA
#> [1863,]    NA
#> [1864,]   0.0
#> [1865,]   0.5
#> [1866,]   1.0
#> [1867,]   1.0
#> [1868,]   1.0
#> [1869,]   1.0
#> [1870,]   0.0
#> [1871,]    NA
#> [1872,]    NA
#> [1873,]    NA
#> [1874,]    NA
#> [1875,]    NA
#> [1876,]    NA
#> [1877,]    NA
#> [1878,]   0.0
#> [1879,]   1.0
#> [1880,]   1.0
#> [1881,]   1.0
#> [1882,]   0.8
#> [1883,]   0.0
#> [1884,]    NA
#> [1885,]    NA
#> [1886,]    NA
#> [1887,]    NA
#> [1888,]    NA
#> [1889,]   0.0
#> [1890,]   1.0
#> [1891,]   0.8
#> [1892,]   1.0
#> [1893,]   1.0
#> [1894,]   0.0
#> [1895,]    NA
#> [1896,]    NA
#> [1897,]    NA
#> [1898,]    NA
#> [1899,]    NA
#> [1900,]    NA
#> [1901,]   0.0
#> [1902,]   1.0
#> [1903,]   0.5
#> [1904,]   0.8
#> [1905,]   1.0
#> [1906,]   0.0
#> [1907,]    NA
#> [1908,]    NA
#> [1909,]    NA
#> [1910,]    NA
#> [1911,]    NA
#> [1912,]    NA
#> [1913,]   0.0
#> [1914,]   1.0
#> [1915,]   0.7
#> [1916,]   0.0
#> [1917,]   1.0
#> [1918,]   0.0
#> [1919,]    NA
#> [1920,]    NA
#> [1921,]    NA
#> [1922,]    NA
#> [1923,]    NA
#> [1924,]    NA
#> [1925,]   0.0
#> [1926,]   0.9
#> [1927,]   1.0
#> [1928,]   0.2
#> [1929,]   1.0
#> [1930,]   0.0
#> [1931,]    NA
#> [1932,]    NA
#> [1933,]    NA
#> [1934,]    NA
#> [1935,]    NA
#> [1936,]    NA
#> [1937,]    NA
#> [1938,]    NA
#> [1939,]   0.0
#> [1940,]   0.9
#> [1941,]   0.0
#> [1942,]   0.0
#> [1943,]   0.5
#> [1944,]    NA
#> [1945,]    NA
#> [1946,]    NA
#> [1947,]    NA
#> [1948,]    NA
#> [1949,]    NA
#> [1950,]    NA
#> [1951,]   0.2
#> [1952,]   1.0
#> [1953,]   0.8
#> [1954,]   0.0
#> [1955,]   0.9
#> [1956,]   0.0
#> [1957,]    NA
#> [1958,]    NA
#> [1959,]    NA
#> [1960,]    NA
#> [1961,]    NA
#> [1962,]    NA
#> [1963,]    NA
#> [1964,]    NA
#> [1965,]    NA
#> [1966,]    NA
#> [1967,]   0.5
#> [1968,]   0.0
#> [1969,]   0.0
#> [1970,]   0.0
#> [1971,]   0.0
#> [1972,]    NA
#> [1973,]    NA
#> [1974,]    NA
#> [1975,]   0.0
#> [1976,]    NA
#> [1977,]    NA
#> [1978,]    NA
#> [1979,]   0.0
#> [1980,]   0.0
#> [1981,]   0.0
#> [1982,]   0.0
#> [1983,]   0.0
#> [1984,]   0.0
#> [1985,]    NA
#> [1986,]    NA
#> [1987,]   0.0
#> [1988,]    NA
#> [1989,]    NA
#> [1990,]    NA
#> [1991,]    NA
#> [1992,]   0.0
#> [1993,]   0.0
#> [1994,]    NA
#> [1995,]   0.0
#> [1996,]   0.0
#> [1997,]   0.0
#> [1998,]    NA
#> [1999,]    NA
#> [2000,]    NA
#> [2001,]    NA
#> [2002,]   0.0
#> [2003,]    NA
#> [2004,]    NA
#> [2005,]   0.0
#> [2006,]    NA
#> [2007,]   0.0
#> [2008,]   0.0
#> [2009,]   0.0
#> [2010,]   0.1
#> [2011,]    NA
#> [2012,]    NA
#> [2013,]    NA
#> [2014,]    NA
#> [2015,]   0.0
#> [2016,]    NA
#> [2017,]    NA
#> [2018,]    NA
#> [2019,]    NA
#> [2020,]    NA
#> [2021,]    NA
#> [2022,]   0.0
#> [2023,]   0.0
#> [2024,]   0.0
#> [2025,]    NA
#> [2026,]    NA
#> [2027,]    NA
#> [2028,]    NA
#> [2029,]    NA
#> [2030,]    NA
#> [2031,]    NA
#> [2032,]    NA
#> [2033,]    NA
#> [2034,]    NA
#> [2035,]   0.0
#> [2036,]   0.0
#> [2037,]   0.0
#> [2038,]    NA
#> [2039,]    NA
#> [2040,]    NA
#> [2041,]    NA
#> [2042,]    NA
#> [2043,]    NA
#> [2044,]    NA
#> [2045,]    NA
#> [2046,]    NA
#> [2047,]    NA
#> [2048,]   0.0
#> [2049,]   0.3
#> [2050,]   0.0
#> [2051,]    NA
#> [2052,]    NA
#> [2053,]    NA
#> [2054,]    NA
#> [2055,]    NA
#> [2056,]    NA
#> [2057,]    NA
#> [2058,]    NA
#> [2059,]    NA
#> [2060,]    NA
#> [2061,]   0.0
#> [2062,]   0.0
#> [2063,]   0.0
#> [2064,]    NA
#> [2065,]    NA
#> [2066,]    NA
#> [2067,]    NA
#> [2068,]    NA
#> [2069,]    NA
#> [2070,]    NA
#> [2071,]    NA
#> [2072,]    NA
#> [2073,]    NA
#> [2074,]   0.0
#> [2075,]   0.1
#> [2076,]    NA
#> [2077,]    NA
#> [2078,]    NA
#> [2079,]    NA
#> [2080,]    NA
#> [2081,]    NA
#> [2082,]    NA
#> [2083,]    NA
#> [2084,]    NA
#> [2085,]    NA
#> [2086,]    NA
#> [2087,]    NA
#> [2088,]    NA
#> [2089,]   0.0
#> [2090,]   0.0
#> [2091,]    NA
#> [2092,]    NA
#> [2093,]    NA
#> [2094,]    NA
#> [2095,]    NA
#> [2096,]    NA
#> [2097,]    NA
#> [2098,]    NA
#> [2099,]    NA
#> [2100,]    NA
#> [2101,]    NA
#> [2102,]    NA
#> [2103,]    NA
#> [2104,]    NA
#> [2105,]    NA
#> [2106,]   0.0
#> [2107,]    NA
#> [2108,]    NA
#> [2109,]    NA
#> [2110,]    NA
#> [2111,]    NA
#> [2112,]    NA
#> [2113,]    NA
#> [2114,]    NA
#> [2115,]    NA
#> [2116,]    NA
#> [2117,]    NA
#> [2118,]    NA
#> [2119,]    NA
#> [2120,]    NA
#> [2121,]    NA
#> [2122,]    NA
#> [2123,]    NA
#> [2124,]    NA
#> [2125,]    NA
#> [2126,]    NA
#> [2127,]    NA
#> [2128,]    NA
#> [2129,]    NA
#> [2130,]    NA
#> [2131,]    NA
#> [2132,]    NA
#> [2133,]    NA
#> [2134,]    NA
#> [2135,]    NA
#> [2136,]   0.0
#> [2137,]   0.0
#> [2138,]    NA
#> [2139,]    NA
#> [2140,]    NA
#> [2141,]    NA
#> [2142,]    NA
#> [2143,]    NA
#> [2144,]    NA
#> [2145,]    NA
#> [2146,]    NA
#> [2147,]    NA
#> [2148,]    NA
#> [2149,]    NA
#> [2150,]    NA
#> [2151,]   0.0
#> [2152,]    NA
#> [2153,]    NA
#> [2154,]    NA
#> [2155,]    NA
#> [2156,]    NA
#> [2157,]    NA
#> [2158,]    NA
#> [2159,]    NA
#> [2160,]    NA
#> [2161,]    NA
#> [2162,]    NA
#> [2163,]   0.0
#> [2164,]   0.0
#> [2165,]    NA
#> [2166,]    NA
#> [2167,]    NA
#> [2168,]    NA
#> [2169,]    NA
#> [2170,]    NA
#> [2171,]    NA
#> [2172,]    NA
#> [2173,]    NA
#> [2174,]    NA
#> [2175,]    NA
#> [2176,]   0.0
#> [2177,]   0.0
#> [2178,]   0.0
#> [2179,]    NA
#> [2180,]    NA
#> [2181,]    NA
#> [2182,]    NA
#> [2183,]    NA
#> [2184,]    NA
#> [2185,]    NA
#> [2186,]    NA
#> [2187,]    NA
#> [2188,]    NA
#> [2189,]   0.0
#> [2190,]    NA
#> [2191,]    NA
#> [2192,]    NA
#> [2193,]    NA
#> [2194,]    NA
#> [2195,]    NA
#> [2196,]    NA
#> [2197,]    NA
#> [2198,]    NA
#> [2199,]    NA
#> [2200,]    NA
#> [2201,]    NA
#> [2202,]   0.0
#> [2203,]    NA
#> [2204,]    NA
#> [2205,]    NA
#> [2206,]    NA
#> [2207,]    NA
#> [2208,]    NA
#> [2209,]    NA
#> [2210,]    NA
#> [2211,]    NA
#> [2212,]   0.0
#> [2213,]   0.0
#> [2214,]    NA
#> [2215,]    NA
#> [2216,]    NA
#> [2217,]    NA
#> [2218,]    NA
#> [2219,]    NA
#> [2220,]    NA
#> [2221,]    NA
#> [2222,]    NA
#> [2223,]    NA
#> [2224,]   0.0
#> [2225,]    NA
#> [2226,]    NA
#> [2227,]    NA
#> [2228,]    NA
#> [2229,]    NA
#> [2230,]    NA
#> [2231,]    NA
#> [2232,]    NA
#> [2233,]    NA
#> [2234,]    NA
#> [2235,]    NA
#> [2236,]    NA
#> [2237,]    NA
#> [2238,]    NA
#> [2239,]    NA
#> [2240,]    NA
#> [2241,]    NA
#> [2242,]    NA
#> [2243,]    NA
#> [2244,]    NA
#> [2245,]    NA
#> [2246,]   0.0
#> [2247,]   0.0
#> [2248,]    NA
#> [2249,]    NA
#> [2250,]    NA
#> [2251,]    NA
#> [2252,]    NA
#> [2253,]    NA
#> [2254,]    NA
#> [2255,]    NA
#> [2256,]    NA
#> [2257,]    NA
#> [2258,]    NA
#> [2259,]    NA
#> [2260,]    NA
#> [2261,]    NA
#> [2262,]    NA
#> [2263,]    NA
#> [2264,]    NA
#> [2265,]    NA
#> [2266,]    NA
#> [2267,]    NA
#> [2268,]    NA
#> [2269,]    NA
#> [2270,]    NA
#> [2271,]    NA
#> [2272,]    NA
#> [2273,]    NA
#> [2274,]    NA
#> [2275,]    NA
#> [2276,]    NA
#> [2277,]    NA
#> [2278,]    NA
#> [2279,]    NA
#> [2280,]    NA
#> [2281,]    NA
#> [2282,]    NA
#> [2283,]    NA
#> [2284,]    NA
#> [2285,]    NA
#> [2286,]    NA
#> [2287,]    NA
#> [2288,]    NA
#> [2289,]    NA
#> [2290,]    NA
#> [2291,]    NA
#> [2292,]    NA
#> [2293,]    NA
#> [2294,]    NA
#> [2295,]    NA
#> [2296,]    NA
#> [2297,]    NA
#> [2298,]    NA
#> [2299,]    NA
#> [2300,]    NA
#> [2301,]    NA
#> [2302,]    NA
#> [2303,]    NA
#> [2304,]    NA
#> [2305,]    NA
#> [2306,]    NA
#> [2307,]    NA
#> [2308,]    NA
#> [2309,]    NA
#> [2310,]    NA
#> [2311,]   0.0
#> [2312,]    NA
#> [2313,]    NA
#> [2314,]    NA
#> [2315,]    NA
#> [2316,]    NA
#> [2317,]    NA
#> [2318,]    NA
#> [2319,]    NA
#> [2320,]    NA
#> [2321,]    NA
#> [2322,]   0.0
#> [2323,]    NA
#> [2324,]    NA
#> [2325,]    NA
#> [2326,]    NA
#> [2327,]    NA
#> [2328,]    NA
#> [2329,]    NA
#> [2330,]    NA
#> [2331,]    NA
#> [2332,]    NA
#> [2333,]    NA
#> [2334,]    NA
#> [2335,]    NA
#> [2336,]    NA
#> [2337,]    NA
#> [2338,]    NA
#> [2339,]    NA
#> [2340,]    NA
#> [2341,]    NA
#> [2342,]    NA
#> [2343,]    NA
#> [2344,]    NA
#> [2345,]    NA
#> [2346,]    NA
#> [2347,]    NA
#> [2348,]    NA
#> [2349,]    NA
#> [2350,]    NA
#> [2351,]    NA
#> [2352,]    NA
#> [2353,]    NA
#> [2354,]    NA
#> [2355,]    NA
#> [2356,]    NA
#> [2357,]    NA
#> [2358,]    NA
#> [2359,]    NA
#> [2360,]    NA
#> [2361,]    NA
#> [2362,]    NA
#> [2363,]    NA
#> [2364,]    NA
#> [2365,]    NA
#> [2366,]    NA
#> [2367,]    NA
#> [2368,]    NA
#> [2369,]    NA
#> [2370,]    NA
#> [2371,]    NA
#> [2372,]    NA
#> [2373,]    NA
#> [2374,]    NA
#> [2375,]    NA
#> [2376,]    NA
#> [2377,]    NA
#> [2378,]    NA
#> [2379,]    NA
#> [2380,]    NA
#> [2381,]    NA
#> [2382,]    NA
#> [2383,]    NA
#> [2384,]   0.0
#> [2385,]   0.0
#> [2386,]    NA
#> [2387,]    NA
#> [2388,]    NA
#> [2389,]    NA
#> [2390,]    NA
#> [2391,]    NA
#> [2392,]    NA
#> [2393,]    NA
#> [2394,]    NA
#> [2395,]    NA
#> [2396,]    NA
#> [2397,]   0.0
#> [2398,]   0.0
#> [2399,]   0.0
#> [2400,]    NA
#> [2401,]    NA
#> [2402,]    NA
#> [2403,]    NA
#> [2404,]    NA
#> [2405,]    NA
#> [2406,]    NA
#> [2407,]    NA
#> [2408,]    NA
#> [2409,]   0.0
#> [2410,]   0.6
#> [2411,]   0.2
#> [2412,]   0.0
#> [2413,]    NA
#> [2414,]    NA
#> [2415,]    NA
#> [2416,]    NA
#> [2417,]    NA
#> [2418,]    NA
#> [2419,]    NA
#> [2420,]    NA
#> [2421,]    NA
#> [2422,]   0.0
#> [2423,]   0.9
#> [2424,]   0.0
#> [2425,]   0.0
#> [2426,]   0.0
#> [2427,]    NA
#> [2428,]    NA
#> [2429,]    NA
#> [2430,]    NA
#> [2431,]    NA
#> [2432,]    NA
#> [2433,]   0.0
#> [2434,]   0.0
#> [2435,]    NA
#> [2436,]   0.0
#> [2437,]   0.0
#> [2438,]    NA
#> [2439,]    NA
#> [2440,]    NA
#> [2441,]    NA
#> [2442,]    NA
#> [2443,]   0.0
#> [2444,]    NA
#> [2445,]    NA
#> [2446,]   0.0
#> [2447,]   0.0
#> [2448,]    NA
#> [2449,]    NA
#> [2450,]    NA
#> [2451,]    NA
#> [2452,]    NA
#> [2453,]    NA
#> [2454,]    NA
#> [2455,]    NA
#> [2456,]   0.1
#> [2457,]   0.0
#> [2458,]    NA
#> [2459,]    NA
#> [2460,]    NA
#> [2461,]    NA
#> [2462,]    NA
#> [2463,]    NA
#> [2464,]   0.0
#> [2465,]   0.0
#> [2466,]   0.0
#> [2467,]   0.0
#> [2468,]   0.0
#> [2469,]    NA
#> [2470,]    NA
#> [2471,]    NA
#> [2472,]    NA
#> [2473,]    NA
#> [2474,]    NA
#> [2475,]    NA
#> [2476,]    NA
#> [2477,]   0.0
#> [2478,]   0.2
#> [2479,]   0.6
#> [2480,]    NA
#> [2481,]    NA
#> [2482,]    NA
#> [2483,]    NA
#> [2484,]    NA
#> [2485,]    NA
#> [2486,]    NA
#> [2487,]    NA
#> [2488,]    NA
#> [2489,]    NA
#> [2490,]   0.1
#> [2491,]   0.4
#> [2492,]   0.0
#> [2493,]    NA
#> [2494,]    NA
#> [2495,]    NA
#> [2496,]    NA
#> [2497,]    NA
#> [2498,]    NA
#> [2499,]    NA
#> [2500,]    NA
#> [2501,]   0.7
#> [2502,]   0.0
#> [2503,]    NA
#> [2504,]    NA
#> [2505,]    NA
#> [2506,]    NA
#> [2507,]    NA
#> [2508,]    NA
#> [2509,]    NA
#> [2510,]    NA
#> [2511,]    NA
#> [2512,]    NA
#> [2513,]   0.0
#> [2514,]   0.0
#> [2515,]    NA
#> [2516,]    NA
#> [2517,]    NA
#> [2518,]    NA
#> [2519,]    NA
#> [2520,]    NA
#> [2521,]    NA
#> [2522,]    NA
#> [2523,]    NA
#> [2524,]    NA
#> [2525,]   0.1
#> [2526,]    NA
#> [2527,]    NA
#> [2528,]   0.0
#> [2529,]    NA
#> [2530,]    NA
#> [2531,]    NA
#> [2532,]    NA
#> [2533,]    NA
#> [2534,]    NA
#> [2535,]    NA
#> [2536,]    NA
#> [2537,]    NA
#> [2538,]   0.1
#> [2539,]    NA
#> [2540,]    NA
#> [2541,]    NA
#> [2542,]    NA
#> [2543,]    NA
#> [2544,]    NA
#> [2545,]    NA
#> [2546,]    NA
#> [2547,]    NA
#> [2548,]    NA
#> [2549,]    NA
#> [2550,]    NA
#> [2551,]    NA
#> [2552,]   0.0
#> [2553,]    NA
#> [2554,]    NA
#> [2555,]    NA
#> [2556,]    NA
#> [2557,]    NA
#> [2558,]    NA
#> [2559,]    NA
#> [2560,]    NA
#> [2561,]    NA
#> [2562,]    NA
#> [2563,]    NA
#> [2564,]    NA
#> [2565,]    NA
#> [2566,]    NA
#> [2567,]    NA
#> [2568,]    NA
#> [2569,]    NA
#> [2570,]    NA
#> [2571,]    NA
#> [2572,]    NA
#> [2573,]    NA
#> [2574,]    NA
#> [2575,]    NA
#> [2576,]    NA
#> [2577,]    NA
#> [2578,]    NA
#> [2579,]    NA
#> [2580,]    NA
#> [2581,]    NA
#> [2582,]    NA
#> [2583,]    NA
#> [2584,]    NA
#> [2585,]    NA
#> [2586,]    NA
#> [2587,]    NA
#> [2588,]    NA
#> [2589,]    NA
#> [2590,]    NA
#> [2591,]    NA
#> [2592,]    NA
#> [2593,]    NA
#> [2594,]    NA
#> [2595,]    NA
#> [2596,]    NA
#> [2597,]    NA
#> [2598,]    NA
#> [2599,]    NA
#> [2600,]    NA
#> [2601,]    NA
#> [2602,]    NA
#> [2603,]    NA
#> [2604,]    NA
#> [2605,]    NA
#> [2606,]    NA
#> [2607,]    NA
#> [2608,]    NA
#> [2609,]    NA
#> [2610,]    NA
#> [2611,]    NA
#> [2612,]    NA
#> [2613,]    NA
#> [2614,]    NA
#> [2615,]    NA
#> [2616,]    NA
#> [2617,]    NA
#> [2618,]    NA
#> [2619,]    NA
#> [2620,]    NA
#> [2621,]    NA
#> [2622,]   0.2
#> [2623,]    NA
#> [2624,]    NA
#> [2625,]    NA
#> [2626,]    NA
#> [2627,]    NA
#> [2628,]    NA
#> [2629,]    NA
#> [2630,]    NA
#> [2631,]    NA
#> [2632,]    NA
#> [2633,]    NA
#> [2634,]   0.0
#> [2635,]    NA
#> [2636,]    NA
#> [2637,]    NA
#> [2638,]    NA
#> [2639,]    NA
#> [2640,]    NA
#> [2641,]    NA
#> [2642,]    NA
#> [2643,]    NA
#> [2644,]    NA
#> [2645,]    NA
#> [2646,]    NA
#> [2647,]   0.1
#> [2648,]   0.0
#> [2649,]    NA
#> [2650,]    NA
#> [2651,]    NA
#> [2652,]    NA
#> [2653,]    NA
#> [2654,]    NA
#> [2655,]    NA
#> [2656,]    NA
#> [2657,]    NA
#> [2658,]    NA
#> [2659,]    NA
#> [2660,]   0.3
#> [2661,]   0.0
#> [2662,]   0.0
#> [2663,]    NA
#> [2664,]    NA
#> [2665,]    NA
#> [2666,]    NA
#> [2667,]    NA
#> [2668,]    NA
#> [2669,]    NA
#> [2670,]    NA
#> [2671,]    NA
#> [2672,]   0.0
#> [2673,]   0.2
#> [2674,]   0.0
#> [2675,]    NA
#> [2676,]    NA
#> [2677,]    NA
#> [2678,]    NA
#> [2679,]    NA
#> [2680,]    NA
#> [2681,]    NA
#> [2682,]    NA
#> [2683,]    NA
#> [2684,]   0.2
#> [2685,]   0.1
#> [2686,]   0.1
#> [2687,]   0.0
#> [2688,]    NA
#> [2689,]    NA
#> [2690,]    NA
#> [2691,]    NA
#> [2692,]    NA
#> [2693,]    NA
#> [2694,]    NA
#> [2695,]    NA
#> [2696,]    NA
#> [2697,]   0.0
#> [2698,]   0.1
#> [2699,]   0.3
#> [2700,]   0.0
#> [2701,]    NA
#> [2702,]    NA
#> [2703,]    NA
#> [2704,]    NA
#> [2705,]    NA
#> [2706,]    NA
#> [2707,]    NA
#> [2708,]    NA
#> [2709,]    NA
#> [2710,]    NA
#> [2711,]   0.7
#> [2712,]   0.1
#> [2713,]   0.0
#> [2714,]    NA
#> [2715,]    NA
#> [2716,]    NA
#> [2717,]    NA
#> [2718,]    NA
#> [2719,]    NA
#> [2720,]    NA
#> [2721,]    NA
#> [2722,]    NA
#> [2723,]    NA
#> [2724,]   0.1
#> [2725,]   1.0
#> [2726,]   0.0
#> [2727,]   0.0
#> [2728,]    NA
#> [2729,]    NA
#> [2730,]    NA
#> [2731,]    NA
#> [2732,]    NA
#> [2733,]    NA
#> [2734,]    NA
#> [2735,]    NA
#> [2736,]    NA
#> [2737,]   0.0
#> [2738,]   1.0
#> [2739,]   0.0
#> [2740,]    NA
#> [2741,]    NA
#> [2742,]    NA
#> [2743,]    NA
#> [2744,]    NA
#> [2745,]    NA
#> [2746,]    NA
#> [2747,]    NA
#> [2748,]    NA
#> [2749,]    NA
#> [2750,]    NA
#> [2751,]    NA
#> [2752,]   0.2
#> [2753,]    NA
#> [2754,]    NA
#> [2755,]    NA
#> [2756,]    NA
#> [2757,]    NA
#> [2758,]    NA
#> [2759,]    NA
#> [2760,]    NA
#> [2761,]    NA
#> [2762,]   0.2
#> [2763,]   0.8
#> [2764,]    NA
#> [2765,]   0.0
#> [2766,]   0.0
#> [2767,]    NA
#> [2768,]    NA
#> [2769,]    NA
#> [2770,]    NA
#> [2771,]    NA
#> [2772,]    NA
#> [2773,]    NA
#> [2774,]    NA
#> [2775,]   0.0
#> [2776,]    NA
#> [2777,]    NA
#> [2778,]   0.0
#> [2779,]   0.0
#> [2780,]    NA
#> [2781,]    NA
#> [2782,]    NA
#> [2783,]    NA
#> [2784,]   0.0
#> [2785,]   0.0
#> [2786,]    NA
#> [2787,]    NA
#> [2788,]    NA
#> [2789,]   0.0
#> [2790,]   0.0
#> [2791,]    NA
#> [2792,]    NA
#> [2793,]    NA
#> [2794,]    NA
#> [2795,]   0.0
#> [2796,]   0.0
#> [2797,]    NA
#> [2798,]    NA
#> [2799,]   0.0
#> [2800,]    NA
#> [2801,]    NA
#> [2802,]    NA
#> [2803,]    NA
#> [2804,]    NA
#> [2805,]    NA
#> [2806,]   0.0
#> [2807,]   0.0
#> [2808,]   0.0
#> [2809,]    NA
#> [2810,]    NA
#> [2811,]   0.0
#> [2812,]    NA
#> [2813,]    NA
#> [2814,]    NA
#> [2815,]    NA
#> [2816,]    NA
#> [2817,]    NA
#> [2818,]    NA
#> [2819,]   0.0
#> [2820,]   0.0
#> [2821,]   0.0
#> [2822,]   0.0
#> [2823,]   0.0
#> [2824,]   0.0
#> [2825,]    NA
#> [2826,]    NA
#> [2827,]    NA
#> [2828,]    NA
#> [2829,]   0.0
#> [2830,]   0.0
#> [2831,]   0.0
#> [2832,]    NA
#> [2833,]    NA
#> [2834,]   0.0
#> [2835,]   0.0
#> [2836,]    NA
#> [2837,]    NA
#> [2838,]    NA
#> [2839,]    NA
#> [2840,]    NA
#> [2841,]   0.0
#> [2842,]   0.8
#> [2843,]   0.0
#> [2844,]   0.0
#> [2845,]   0.0
#> [2846,]   0.0
#> [2847,]    NA
#> [2848,]    NA
#> [2849,]    NA
#> [2850,]    NA
#> [2851,]   0.0
#> [2852,]   0.8
#> [2853,]   0.0
#> [2854,]   0.0
#> [2855,]   0.0
#> [2856,]   1.0
#> [2857,]   0.0
#> [2858,]    NA
#> [2859,]    NA
#> [2860,]   1.0
#> [2861,]   0.2
#> [2862,]    NA
#> [2863,]   0.0
#> [2864,]   1.0
#> [2865,]   0.0
#> [2866,]    NA
#> [2867,]    NA
#> [2868,]    NA
#> [2869,]   0.8
#> [2870,]   0.2
#> [2871,]   0.0
#> [2872,]   0.0
#> [2873,]   0.9
#> [2874,]   0.0
#> [2875,]    NA
#> [2876,]    NA
#> [2877,]    NA
#> [2878,]   0.1
#> [2879,]   0.7
#> [2880,]   0.0
#> [2881,]    NA
#> [2882,]   0.0
#> [2883,]   0.6
#> [2884,]    NA
#> [2885,]    NA
#> [2886,]    NA
#> [2887,]    NA
#> [2888,]   0.0
#> [2889,]   0.0
#> [2890,]   0.8
#> [2891,]   0.0
#> [2892,]   0.0
#> [2893,]   0.0
#> [2894,]    NA
#> [2895,]    NA
#> [2896,]    NA
#> [2897,]   0.0
#> [2898,]   0.0
#> [2899,]   1.0
#> [2900,]   0.8
#> [2901,]    NA
#> [2902,]    NA
#> [2903,]    NA
#> [2904,]    NA
#> [2905,]    NA
#> [2906,]    NA
#> [2907,]   1.0
#> [2908,]   1.0
#> [2909,]   1.0
#> [2910,]   0.0
#> [2911,]    NA
#> [2912,]    NA
#> [2913,]    NA
#> [2914,]    NA
#> [2915,]    NA
#> [2916,]   0.0
#> [2917,]   1.0
#> [2918,]   1.0
#> [2919,]   0.0
#> [2920,]    NA
#> [2921,]    NA
#> [2922,]    NA
#> [2923,]    NA
#> [2924,]    NA
#> [2925,]   1.0
#> [2926,]   1.0
#> [2927,]   1.0
#> [2928,]   0.0
#> [2929,]    NA
#> [2930,]    NA
#> [2931,]    NA
#> [2932,]    NA
#> [2933,]   1.0
#> [2934,]   1.0
#> [2935,]   1.0
#> [2936,]   1.0
#> [2937,]   0.0
#> [2938,]    NA
#> [2939,]    NA
#> [2940,]    NA
#> [2941,]    NA
#> [2942,]    NA
#> [2943,]   1.0
#> [2944,]   1.0
#> [2945,]   1.0
#> [2946,]   0.2
#> [2947,]    NA
#> [2948,]    NA
#> [2949,]    NA
#> [2950,]    NA
#> [2951,]   0.5
#> [2952,]   1.0
#> [2953,]   1.0
#> [2954,]   0.0
#> [2955,]    NA
#> [2956,]    NA
#> [2957,]    NA
#> [2958,]    NA
#> [2959,]    NA
#> [2960,]    NA
#> [2961,]   0.0
#> [2962,]   0.0
#> [2963,]   0.0
#> [2964,]   0.5
#> [2965,]    NA
#> [2966,]    NA
#> [2967,]    NA
#> [2968,]    NA
#> [2969,]    NA
#> [2970,]    NA
#> [2971,]    NA
#> [2972,]    NA
#> [2973,]    NA
#> [2974,]   0.0
#> [2975,]   0.1
#> [2976,]    NA
#> [2977,]    NA
#> [2978,]    NA
#> [2979,]    NA
#> [2980,]    NA
#> [2981,]    NA
#> [2982,]    NA
#> [2983,]    NA
#> [2984,]    NA
#> [2985,]    NA
#> [2986,]    NA
#> [2987,]    NA
#> [2988,]   0.0
#> [2989,]   0.0
#> [2990,]    NA
#> [2991,]    NA
#> [2992,]    NA
#> [2993,]    NA
#> [2994,]    NA
#> [2995,]    NA
#> [2996,]    NA
#> [2997,]    NA
#> [2998,]    NA
#> [2999,]    NA
#> [3000,]    NA
#> [3001,]    NA
#> [3002,]   0.0
#> [3003,]   0.0
#> [3004,]   0.0
#> [3005,]    NA
#> [3006,]    NA
#> [3007,]    NA
#> [3008,]    NA
#> [3009,]    NA
#> [3010,]    NA
#> [3011,]    NA
#> [3012,]    NA
#> [3013,]    NA
#> [3014,]    NA
#> [3015,]    NA
#> [3016,]    NA
#> [3017,]    NA
#> [3018,]    NA
#> [3019,]    NA
#> [3020,]    NA
#> [3021,]    NA
#> [3022,]    NA
#> [3023,]    NA
#> [3024,]    NA
#> [3025,]    NA
#> [3026,]    NA
#> [3027,]    NA
#> [3028,]    NA
#> [3029,]    NA
#> [3030,]    NA
#> [3031,]    NA
#> [3032,]    NA
#> [3033,]    NA
#> [3034,]    NA
#> [3035,]    NA
#> [3036,]    NA
#> [3037,]    NA
#> [3038,]    NA
#> [3039,]    NA
#> [3040,]    NA
#> [3041,]    NA
#> [3042,]    NA
#> [3043,]    NA
#> [3044,]    NA
#> [3045,]    NA
#> [3046,]    NA
#> [3047,]    NA
#> [3048,]    NA
#> [3049,]    NA
#> [3050,]    NA
#> [3051,]    NA
#> [3052,]    NA
#> [3053,]    NA
#> [3054,]    NA
#> [3055,]    NA
#> [3056,]    NA
#> [3057,]    NA
#> [3058,]    NA
#> [3059,]    NA
#> [3060,]    NA
#> [3061,]    NA
#> [3062,]    NA
#> [3063,]    NA
#> [3064,]    NA
#> [3065,]    NA
#> [3066,]    NA
#> [3067,]    NA
#> [3068,]    NA
#> [3069,]    NA
#> [3070,]    NA
#> [3071,]    NA
#> [3072,]    NA
#> [3073,]    NA
#> [3074,]    NA
#> [3075,]    NA
#> [3076,]    NA
#> [3077,]    NA
#> [3078,]    NA
#> [3079,]    NA
#> [3080,]    NA
#> [3081,]    NA
#> [3082,]    NA
#> [3083,]    NA
#> [3084,]    NA
#> [3085,]    NA
#> [3086,]    NA
#> [3087,]    NA
#> [3088,]    NA
#> [3089,]    NA
#> [3090,]    NA
#> [3091,]    NA
#> [3092,]    NA
#> [3093,]    NA
#> [3094,]    NA
#> [3095,]    NA
#> [3096,]    NA
#> [3097,]    NA
#> [3098,]    NA
#> [3099,]    NA
#> [3100,]    NA
#> [3101,]    NA
#> [3102,]    NA
#> [3103,]    NA
#> [3104,]    NA
#> [3105,]    NA
#> [3106,]    NA
#> [3107,]    NA
#> [3108,]    NA
#> [3109,]    NA
#> [3110,]    NA
#> [3111,]    NA
#> [3112,]    NA
#> [3113,]    NA
#> [3114,]    NA
#> [3115,]    NA
#> [3116,]    NA
#> [3117,]    NA
#> [3118,]    NA
#> [3119,]    NA
#> [3120,]    NA
#> [3121,]    NA
#> [3122,]    NA
#> [3123,]    NA
#> [3124,]    NA
#> [3125,]    NA
#> [3126,]    NA
#> [3127,]    NA
#> [3128,]    NA
#> [3129,]    NA
#> [3130,]    NA
#> [3131,]    NA
#> [3132,]    NA
#> [3133,]   0.0
#> [3134,]    NA
#> [3135,]    NA
#> [3136,]    NA
#> [3137,]    NA
#> [3138,]    NA
#> [3139,]    NA
#> [3140,]    NA
#> [3141,]    NA
#> [3142,]    NA
#> [3143,]    NA
#> [3144,]    NA
#> [3145,]    NA
#> [3146,]    NA
#> [3147,]   0.1
#> [3148,]   0.0
#> [3149,]    NA
#> [3150,]    NA
#> [3151,]    NA
#> [3152,]    NA
#> [3153,]    NA
#> [3154,]    NA
#> [3155,]    NA
#> [3156,]    NA
#> [3157,]    NA
#> [3158,]    NA
#> [3159,]    NA
#> [3160,]    NA
#> [3161,]    NA
#> [3162,]    NA
#> [3163,]    NA
#> [3164,]    NA
#> [3165,]    NA
#> [3166,]    NA
#> [3167,]    NA
#> [3168,]    NA
#> [3169,]    NA
#> [3170,]    NA

library(sf)
#> Warning: package 'sf' was built under R version 4.1.3
#> Linking to GEOS 3.10.2, GDAL 3.4.1, PROJ 7.2.1; sf_use_s2() is TRUE

Coordinates <- st_as_sf(Velocity.example.df[,c("x", "y")], coords = c("x", "y"))

Colors.suitability <- colorRampPalette(c("red2", "darkorange", "gold", "green2", "dodgerblue"))(100)

# sf_points <- st_as_sf(data.frame(Example.hydrulic.simulation.depth[,c("x", "y")], Predictions), coords = c("x", "y"), crs = 32630)

Model.names <- sapply(colnames(Predictions), function(x){
  x <- gsub(x = x, pattern = paste0(gsub(Selected.species, pattern = " ", replacement = "."), "."), replacement = "")
  x <- gsub(x = x, pattern = paste0(Selected.size, "."), replacement = "")
  x
})

op <- par(mfrow = c(ceiling(length(Selected.models$Models)^0.5), ceiling(length(Selected.models$Models)^0.5)), oma = c(0.5,0.5,2.5,0.5), mar = c(4,4,2,0.5))

for(i in 1:ncol(Predictions))
{
  plot(st_geometry(Coordinates), pch = 15, cex = 0.5, bty = "n", 
     col = Colors.suitability[cut(Predictions[,i], breaks = seq(0, 1, length = 101), labels = 1:100, include.lowest = T)], 
     xlab = "X", ylab = "Y")
  Axis(side = 1, cex.axis = 0.5)
  Axis(side = 2, cex.axis = 0.5) 
  title(Model.names[i], font.main = 1, cex.main = 0.9)
}

par(op)

Species <- Selected.species
Size <- paste0(" - ", Selected.size)
title(substitute(expr = paste(italic(Species), Size, sep =" "), env = list(Species = Species, Size = Size)), outer = T, adj = 0.05, cex.main = 2)
```

<img src="man/figures/README-plot anc compare predicted microhabitat suitability-2.png" width="100%" />

``` r

par(op)
```

<br/>

## Bibliography

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-Eugster2014" class="csl-entry">

Eugster, Manuel J. A., Friedrich Leisch, and Carolin Strobl. 2014.
“<span class="nocase">(Psycho-)analysis of benchmark experiments: a
formal framework for investigating the relationship between data sets
and learning algorithms</span>.” *Computational Statistics & Data
Analysis* 71 (March): 986–1000.
<https://doi.org/10.1016/j.csda.2013.08.007>.

</div>

<div id="ref-Munoz-Mas2017" class="csl-entry">

Muñoz-Mas, R, Rui Manuel Soares Costa, Francisco Martínez-Capel, and
Juan Diego Alcaraz-Hernández. 2017. “<span class="nocase">Microhabitat
competition between Iberian fish species and the endangered
J<span class="nocase">ú</span>car nase (Parachondrostoma arrigonis
Steindachner, 1866)</span>.” *Journal of Ecohydraulics* 0 (0): 1–23.
<https://doi.org/10.1080/24705357.2016.1276417>.

</div>

<div id="ref-Munoz-Mas2018" class="csl-entry">

Muñoz-Mas, R, P Marcos-Garcia, A Lopez-Nicolas, F J Martínez-García, M
Pulido-Velazquez, and F Martínez-Capel. 2018.
“<span class="nocase">Combining literature-based and data-driven fuzzy
models to predict brown trout (\<i\>Salmo trutta\</i\> L.) spawning
habitat degradation induced by climate change</span>.” *Ecological
Modelling* 386: 98–114.
<https://doi.org/10.1016/j.ecolmodel.2018.08.012>.

</div>

</div>
