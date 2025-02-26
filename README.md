
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# IberianFishHSMs

IberianFishHSMs: Compilation of models and tools to evaluate the habitat
suitability at the microhabitat scale for Iberian freshwater fish
species. The modelling approaches include sets of Habitat Suitability
Curves (HSCs), Artificial Neural Networks (Multilayer Perceptrons,
ANN-MLPs), Random Forests (RFs), Generalised Additive Models (GAMs), and
Support Vector Machines (SVMs), all based on empirical data collected
across several river basins in the Iberian Peninsula. The HSCs have been
reviewed by an expert panel, which co-authored the package. The package
also compiles sets of HSCs and Fuzzy Rule-Based Systems (FRBSs) based on
expert knowledge, which was gathered through on-line forms. Functions
for evaluating the habitat suitability from hydraulic simulations and
for plotting the modelled suitability are also included. A thorough
example of the capabilities of the packages appears below. The package
includes 797 microhabitat suitability models for 43 species and up to 4
size classes (Large, Medium, Small, Very small) and spawning suitability
(only for *Salmo trutta* and *Salmo salar*).

<br/>

## Authors

This package was developed by:

- **Rafael Muñoz-Mas**<sup>1</sup> (Author, Creator and Maintainer) -
  <rafa.m.mas@gmail.com>
- **Carlos Alonso**<sup>2</sup> (Contributor)
- **Enric Aparicio Manau**<sup>3</sup> (Contributor)
- **Fernando Cobo Gradín**<sup>4</sup> (Contributor)
- **Gustavo González Fernández**<sup>5</sup> (Contributor)
- **Javier Gortázar**<sup>6</sup> (Contributor)
- **Francisco Martínez-Capel**<sup>7</sup> (Contributor)
- **Francisco J. Oliva-Paterna**<sup>8</sup> (Contributor)
- **Jose Prenda**<sup>9</sup> (Contributor)
- **Jose Maria Santos**<sup>10</sup> (Contributor)
- **Rafael Miranda Ferreiro**<sup>11</sup> (Contributor)

<sup>1</sup> Tragsatec, Carrer Ramon Gordillo 7 - 46010 València, Spain.
<sup>2</sup> <sup>3</sup> GRECO, Institute of Aquatic Ecology,
University of Girona, E-17071 Girona. <sup>4</sup> Laboratorio de
Hidrobiologia, Departamento de Zoología, Genetica y Antropología Física.
Facultad de Biología. Universidad de Santiago de Compostela, 15782
Santiago de Compostela, Spain. <sup>5</sup> Icthios Gestión Ambiental
SL. <info@icthios.es>. <sup>6</sup> ECOHIDRÁULICA, S.L. C/ Villamanín
16, Madrid 28011. <sup>7</sup> Institut d’Investigació per a la Gestió
Integrada de Zones Costaneres (IGIC), Universitat Politècnica de
València, C/Paranimf, 1, 46730 Gandia, València, Spain. <sup>8</sup>
Departamento de Zoología y Antropología Física. 30100. Universidad de
Murcia. Murcia. <sup>9</sup> Dpto. de Ciencias Integradas. Universidad
de Huelva. <sup>10</sup> Forest Research Centre, Associate Laboratory
TERRA, School of Agriculture, University of Lisbon. <sup>11</sup>
Universidad de Navarra, Instituto de Biodiversidad y Medioambiente
(BIOMA), 31008 Pamplona, Navarra, Spain.

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

The following example illustrates the capabilities of IberianFishHSMs
and the general workflow for predicting microhabitat suitability using
outputs from hydraulic simulations and field data. Field data includes
the substrate and cover (shelter) distribution across the study site, by
patch, pixel or cell. The data used in this example is available from
the package.

``` r
library(IberianFishHSMs)
```

<br/>

### ListModels - List available models and their key characteristics.

`ListModels` allows inspecting the available models. The queries can be
categorized by Species, Size, River, Model.type, Sampled.season,
Valid.season, and/or Data.origin. This function also provides de Codes
to internally call the microhabitat suitability models during the
habitat evaluation. The output of this function also renders a summary
of their main characteristics, including sample sizes, and several
performance criteria for those models optimised through
cross-validation.

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

`ListModels` output values can be use directly within to carry out
habitat evaluations. In particula, `$Codes` are the names used to store
internally the available microhabitat suitability models.

<br/>

### ListSelectedCoverTypes - List selected cover types in each microhabitat suitability model.

There exist an interaction between the training data and the modelling
technique, which can vary variable effects and importance (Eugster,
Leisch, and Strobl 2014). By means of cross-validation, during the
development of the microhabitat suitability models we carried out a
variable selection approach discarding those cover types that not
improved model performance. This approach lead to different sets of
relevant cover types in each model. The function
`ListSelectedCoverTypes` allows inspecting the selected cover types for
each model. The queries can be categorized by Species, Size, River,
Model.type, Sampled.season, Valid.season, and/or Data.origin. When
evaluating the microhabitat suitability, `PredictHabitatSuitability`
selects and aggregates the appropriate cover types internally. This
function does not need to be called explicitly.

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
43) of several size classes and activities. Among other things, the
available models vary by modelling technique, sampling site and the
aggregation of data from different sites. The variable `Default`
obtained with `ListModels` indicates which models are recommended
because it was considered they generalised better. Nevertheless, users
can select other models when they consider it preferable. For example,
when they are going to evaluate the microhabitat suitability in the
basin where data for an alternative model was collected. In addition to
`ListSelectedCoverTypes`, users can carry out sensitivity analyses to
compare the predictions of the different available models to inspect
their performance before selecting any alternative model or set of
models. The sensitivity analysis can be carried out employing the
function `Plot Habitat Suitability Models` as follows:

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

This function generates partial dependence-like plots for microhabitat
suitability models based on the provided data and selected model
(Friedman 2001). Partial dependence plots are created by varying one
variable over a range of values while averaging the model’s predictions
over all the other features. This method isolates the effect of that
single variable on the outcome, helping you see its overall effect.

<br/>

### Habitat suitability prediction

Habitat suitability predictions are carried out based on mean flow
velocity (m/s), water depth (m) substrate index (-) and the sum of the
number of relevant types of cover in the evaluated microhabitats
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
Muñoz-Mas et al. (2017). The package includes some examples to
illustrate the structure of the input files.

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

<img src="man/figures/README-plot and compare predicted microhabitat suitability-1.png" width="100%" />

``` r

head(Predictions)
#>      ABCKQ ABCKP ABCKU ABCLQ ABCMN ABCMV ABCNR
#> [1,]    NA    NA    NA    NA    NA    NA    NA
#> [2,]    NA    NA    NA    NA    NA    NA    NA
#> [3,]    NA    NA    NA    NA    NA    NA    NA
#> [4,]    NA    NA    NA    NA    NA    NA    NA
#> [5,]    NA    NA    NA    NA    NA    NA    NA
#> [6,]    NA    NA    NA    NA    NA    NA    NA

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

<img src="man/figures/README-plot and compare predicted microhabitat suitability-2.png" width="100%" />

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

<div id="ref-Friedman2001" class="csl-entry">

Friedman, J H. 2001. “<span class="nocase">Greedy function
approximation: A gradient boosting machine</span>.” *Annals of
Statistics* 29 (5): 1189–1232. <https://doi.org/10.1214/aos/1013203451>.

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
