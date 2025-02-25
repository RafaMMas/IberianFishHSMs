
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
#>      Code                                Model
#> 603 ABELZ   Salmo.trutta.GAM.Large.Curueno.All
#> 604 ABEMQ   Salmo.trutta.HSC.Large.Curueno.All
#> 605 ABEMV  Salmo.trutta.NNET.Large.Curueno.All
#> 606 ABEMZ    Salmo.trutta.RF.Large.Curueno.All
#> 607 ABENR   Salmo.trutta.SVM.Large.Curueno.All
#> 608 ABEMN  Salmo.trutta.GAM.Medium.Curueno.All
#> 609 ABEMR  Salmo.trutta.HSC.Medium.Curueno.All
#> 610 ABEMW Salmo.trutta.NNET.Medium.Curueno.All
#> 611 ABENO   Salmo.trutta.RF.Medium.Curueno.All
#> 612 ABENS  Salmo.trutta.SVM.Medium.Curueno.All
#> 613 ABEMO   Salmo.trutta.GAM.Small.Curueno.All
#> 614 ABEMS   Salmo.trutta.HSC.Small.Curueno.All
#> 615 ABEMX  Salmo.trutta.NNET.Small.Curueno.All
#> 616 ABENP    Salmo.trutta.RF.Small.Curueno.All
#> 617 ABENT   Salmo.trutta.SVM.Small.Curueno.All
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
for the Fuzzy Rule-Based Systme to evaluate the microhabitat suitability
during Spring, Summer, and Autumn.

<br/>

### Habitat ruitability prediction

Habitat suitability predictions are carried out based on mean flow
velocity (m/s), water depth (m) substrate index (-) and the sum of the
number of relevant types of cover in the evaluate microhabitats
(i.e. pixels or cells from the hydraulic simulation). The package
includes function to prepare the input data.

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
```

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
