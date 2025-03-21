
<!-- README.md is generated from README.Rmd. Please edit that file -->

<div style="text-align: left;">

<img src="man/figures/logo_tragsatec_SEPI_MITECO.2.png" alt="Banner" style="max-height: 75px;"/>

</div>

<br/>

<br/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# IberianFishHSMs

<div style="text-align: justify;">

**IberianFishHSMs**: A comprehensive compilation of models and tools
designed to assess the habitat suitability at the microhabitat scale for
Iberian freshwater fish species. The modelling approaches include a
variety of techniques, such as Habitat Suitability Curves (HSCs) (Waters
1976), Artificial Neural Networks (Multilayer Perceptron ensembles,
ANN-MLPs) (Hansen and Salamon 1990), Random Forests (RFs) (Breiman
2001), Generalised Additive Models (GAMs) (Hastie and Tibshirani 1990),
and Support Vector Machines (SVMs) (Vapnik 1995; Cortes and Vapnik
1995), all based on empirical data gathered from several river basins
across the Iberian Peninsula. The HSCs have been validated by an expert
panel, who contributed to the development of the package. Additionally,
the package includes further sets of HSCs and Fuzzy Rule-Based Systems
(FRBSs) (Zadeh 1965; Takagi and Sugeno 1985), which were developed from
both the literature and expert knowledge collected through online
surveys. The authors express their gratitude to the respondents for
their valuable contributions. The package also provides functions for
evaluating the microhabitat suitability based on hydraulic simulations,
as well as tools for visualizing the modelled microhabitat preferences
and suitability. A detailed example showcasing the package’s
capabilities is included in the following manual. In total, the package
comprises 797 microhabitat suitability models, covering 41 species
across up to 4 size classes (Large, Medium, Small, Very Small) and
spawning/nesting suitability (available for brown trout *Salmo trutta*
and Atlantic salmon *Salmo salar*). The package also includes several
generic models for fry (Cyprinidae). The development of these
microhabitat suitability models leverage the functions and features of
the following packages:

</div>

- Habitat Suitability Curves (HSCs): `FuzzyFishHS` [github
  link](https://github.com/RafaMMas/FuzzyFishHS)
- Artificial Neural Networks (Multilayer Perceptron ensembles,
  ANN-MLPs): `nnet` [CRAN
  link](https://cran.r-project.org/web/packages/nnet/index.html)
- Random Forests (RFs): `ranger` [CRAN
  link](https://cran.r-project.org/web/packages/ranger/index.html)
- Generalised Additive Models (GAMs): `mgcv` [CRAN
  link](https://cran.r-project.org/web/packages/mgcv/index.html)
- Support Vector Machines (SVMs): `e1071` [CRAN
  link](https://cran.r-project.org/web/packages/e1071/index.html)
- Fuzzy Rule-Based Systems (FRBSs): `FuzzyFishHS` [github
  link](https://github.com/RafaMMas/FuzzyFishHS)

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

<div style="text-align: justify;">

<sup>1</sup> Tragsatec, Carrer Ramon Gordillo 7 - 46010 València,
Valencian Country, Spain. <sup>2</sup> ETS Ingenieros de Montes,
Universidad Politécnica de Madrid, Madrid, Spain. <sup>3</sup> GRECO,
Institute of Aquatic Ecology, University of Girona, E-17071 Girona.
<sup>4</sup> Laboratorio de Hidrobiologia, Departamento de Zoología,
Genetica y Antropología Física. Facultad de Biología. Universidad de
Santiago de Compostela, 15782 Santiago de Compostela, Spain.
<sup>5</sup> Icthios Gestión Ambiental SL. <info@icthios.es>.
<sup>6</sup> ECOHIDRÁULICA, S.L. C/ Villamanín 16, Madrid 28011.
<sup>7</sup> Institut d’Investigació per a la Gestió Integrada de Zones
Costaneres (IGIC), Universitat Politècnica de València, C/Paranimf, 1,
46730 Gandia, València, Valencian Country, Spain. <sup>8</sup>
Departamento de Zoología y Antropología Física. 30100. Universidad de
Murcia. Murcia. <sup>9</sup> Dpto. de Ciencias Integradas. Universidad
de Huelva. <sup>10</sup> Forest Research Centre, Associate Laboratory
TERRA, School of Agriculture, University of Lisbon, Portugal.
<sup>11</sup> Universidad de Navarra, Instituto de Biodiversidad y
Medioambiente (BIOMA), 31008 Pamplona, Navarra, Spain.

</div>

<br/>

## Acknowledgements

<div style="text-align: justify;">

`IberianFishHSMs` was funded and commissioned to TRAGSATEC - SEPI by the
Ministry for the Ecological Transition and the Demographic Challenge
(MITECO) (Spanish Government). The data collection and development of
the package were carried out as part of the project titled
*Actualización y/o creación de curvas de idoneidad del hábitat físico
para diversas especies acuáticas y ribereñas*, which was conducted under
the framework of the *Servicio técnico para el desarrollo de modelos
numéricos integrados e impulso a la restauración fluvial en las
distintas demarcaciones hidrográficas intercomunitarias*
(21.804-0047/0411).

</div>

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

<div style="text-align: justify;">

The following example illustrates the capabilities of IberianFishHSMs
and the general workflow for predicting microhabitat suitability using
outputs from hydraulic simulations and field data. Field data includes
the substrate and cover (shelter) distribution across the study site, by
patch, pixel or cell. The data used in this example is available from
the package and has been adapted from the data published in Muñoz-Mas et
al. (2024).

</div>

``` r
library(IberianFishHSMs)
#> To cite IberianFishHSMs: Muñoz-Mas, R., Alonso, C., Aparicio Manau, E., Cobo Gradín, F., González Fernández, G.,Gortázar, J., Martínez-Capel, F., Oliva-Paterna, F.J., Prenda, J., Santos, J.M., & Miranda Ferreiro, R. (2025). IberianFishHSMs: Compilation of models and tools to evaluate the habitat suitability at the microhabitat scale for Iberian freshwater fish species in environmental flow assessment studies. Available at: https://github.com/RafaMMas/IberianFishHSMs
#> 
#> IberianFishHSMs was funded and commissioned to TRAGSATEC - SEPI by the Ministry for the Ecological Transition and the Demographic Challenge (MITECO, Spanish Government). The data collection and package development were carried out under the project titled 'Actualización y/o creación de curvas de idoneidad del hábitat físico para diversas especies acuáticas y ribereñas', conducted within the framework of the Servicio técnico para el desarrollo de modelos numéricos integrados e impulso a la restauración fluvial en las distintas demarcaciones hidrográficas intercomunitarias (21.804-0047/0411).
```

<br/>

### ListModels - List available models and their key characteristics

<div style="text-align: justify;">

`ListModels` allows inspecting the available models. The queries can be
categorized by *Species*, *Size*, *River*, *Model.type*,
*Sampled.season*, *Valid.season*, and/or *Data.origin*. This function
also provides the *Codes* to internally call the microhabitat
suitability models during the habitat evaluation to obtain the
suitability associated to each microhabitat (i.e., patch, pixel or
cell). The output of this function also renders a summary of their main
characteristics, including sample sizes, and several performance
criteria for those models optimised through cross-validation. The
argument *Default* = *TRUE* provides those models recommended by the
expert panel who co-authored the package. These models are,
consequently, the best option among the available models, but the
additional models have been included to allow site-specific studies. The
following example shows the default output for brown trout (*Salmo
trutta*). From columns \#1 to \#15 the general characteristics are
described. Columns \#16 to \#23 include the aforementioned performance
indices. The output of this function is a three-elements list. The last
two elements are the models’ names and codes. These names summarise the
characteristics of each model in the table and, as indicated above,
codes are used to internally call the models compiled in the package.

</div>

``` r
Selected.models <- ListModels(Species = "Salmo trutta", verbose = F)

## General characteristics
Selected.models$Current.summary.table[,1:15]
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
#>     N.absences N.interviews.or.studies
#> 603        896                      NA
#> 604        896                      NA
#> 605        896                      NA
#> 606        896                      NA
#> 607        896                      NA
#> 608        839                      NA
#> 609        839                      NA
#> 610        839                      NA
#> 611        839                      NA
#> 612        839                      NA
#> 613        535                      NA
#> 614        535                      NA
#> 615        535                      NA
#> 616        535                      NA
#> 617        535                      NA

## Performance

Selected.models$Current.summary.table[,16:23]
#>     True.positive False.positive True.negative False.negative Sensitivity
#> 603            24            215           681              0       1.000
#> 604            NA             NA            NA             NA          NA
#> 605            24            142           754              0       1.000
#> 606            24            106           790              0       1.000
#> 607            22            157           739              2       0.917
#> 608            70            218           621             11       0.864
#> 609            NA             NA            NA             NA          NA
#> 610            75            209           630              6       0.926
#> 611            75            197           642              6       0.926
#> 612            68            200           639             13       0.840
#> 613           275            210           325            110       0.714
#> 614            NA             NA            NA             NA          NA
#> 615           328            262           273             57       0.852
#> 616           286            211           324             99       0.743
#> 617           262            179           356            123       0.681
#>     Specificity   TSS Balanced.accuracy
#> 603       0.760 0.760             0.880
#> 604          NA    NA                NA
#> 605       0.842 0.842             0.921
#> 606       0.882 0.882             0.941
#> 607       0.825 0.741             0.871
#> 608       0.740 0.604             0.802
#> 609          NA    NA                NA
#> 610       0.751 0.677             0.838
#> 611       0.765 0.691             0.846
#> 612       0.762 0.601             0.801
#> 613       0.607 0.322             0.661
#> 614          NA    NA                NA
#> 615       0.510 0.362             0.681
#> 616       0.606 0.348             0.674
#> 617       0.665 0.346             0.673

## Models and Codes

Selected.models[2:3]
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

<div style="text-align: justify;">

`ListModels` output values can be used directly within
`PredictHabitatSuitability` to carry out habitat evaluations. In
particular, `$Codes` contains the names used to store and internally
call the available microhabitat suitability models.

</div>

<br/>

### ListSelectedCoverTypes - List selected cover types in each microhabitat suitability model

<div style="text-align: justify;">

An interaction exists between the training data and the selected
modeling technique, which can influence the effect and/or importance of
predictor variables (Eugster, Leisch, and Strobl 2014). Through
cross-validation, we performed a variable selection process during the
development of microhabitat suitability models, discarding those cover
types that did not improve model performance. This approach was applied
to both Machine Learning models (i.e., ANN-MLPs, RFs, SVMs) and
statistical methods (i.e., GAMs). A similar procedure was followed in
the development of the Habitat Suitability Curves/Criteria (HSCs) and
Fuzzy Rule-Based Systems (FRBSs). This approach leads to different sets
of relevant cover types in each model, although a core group of
important cover types is expected to be shared across models. The
function `ListSelectedCoverTypes` allows inspecting the selected cover
types for each model. This will enable practitioners to discard some
models when they are deemed inadequate. Likewise, the queries can be
categorized by *Species*, *Size*, *River*, *Model.type*,
*Sampled.season*, *Valid.season*, and/or *Data.origin*. When evaluating
the microhabitat suitability, `PredictHabitatSuitability` selects and
aggregates the appropriate cover types internally. Therefore, this
function does not need to be called explicitly.

</div>

``` r

ListSelectedCoverTypes(Species = "Salmo trutta")
#>      Code                                Model Leaves Algae  Root
#> 603 ABELZ   Salmo.trutta.GAM.Large.Curueno.All  FALSE FALSE  TRUE
#> 604 ABEMQ   Salmo.trutta.HSC.Large.Curueno.All  FALSE FALSE  TRUE
#> 605 ABEMV  Salmo.trutta.NNET.Large.Curueno.All   TRUE  TRUE  TRUE
#> 606 ABEMZ    Salmo.trutta.RF.Large.Curueno.All  FALSE FALSE  TRUE
#> 607 ABENR   Salmo.trutta.SVM.Large.Curueno.All   TRUE FALSE  TRUE
#> 608 ABEMN  Salmo.trutta.GAM.Medium.Curueno.All   TRUE FALSE FALSE
#> 609 ABEMR  Salmo.trutta.HSC.Medium.Curueno.All  FALSE FALSE  TRUE
#> 610 ABEMW Salmo.trutta.NNET.Medium.Curueno.All   TRUE FALSE FALSE
#> 611 ABENO   Salmo.trutta.RF.Medium.Curueno.All  FALSE FALSE FALSE
#> 612 ABENS  Salmo.trutta.SVM.Medium.Curueno.All  FALSE  TRUE FALSE
#> 613 ABEMO   Salmo.trutta.GAM.Small.Curueno.All  FALSE FALSE FALSE
#> 614 ABEMS   Salmo.trutta.HSC.Small.Curueno.All  FALSE FALSE  TRUE
#> 615 ABEMX  Salmo.trutta.NNET.Small.Curueno.All   TRUE FALSE FALSE
#> 616 ABENP    Salmo.trutta.RF.Small.Curueno.All   TRUE FALSE  TRUE
#> 617 ABENT   Salmo.trutta.SVM.Small.Curueno.All   TRUE  TRUE FALSE
#>     Aquatic.vegetation  Reed  Wood  Sand  Rock  Cave Shade
#> 603              FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
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
#> 615              FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
#> 616               TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
#> 617              FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
```

<br/>

### PlotHabitatSuitabilityModels - Carry out sensitivity analyses

<div style="text-align: justify;">

The package includes a number of models (797) and species (41) across
various size classes and activities. Among other factors, the available
models differ in modelling technique, sampling site, and the aggregation
of data from different locations and rivers. The ARGUMENT `Default`, in
`ListModels`, indicates which models are recommended based on their
performance, generalization ability, and/or development using data that
cover a broad range of microhabitat variables. However, users can select
alternative models when preferred—for example, when evaluating
microhabitat suitability in a basin where data for a different model
were collected. In addition to `ListSelectedCoverTypes`, users can
conduct sensitivity analyses to compare the predictions of different
models and choose the one that best aligns with their needs and
expertise. This process allows users to assess model performance before
selecting an alternative model or a set of models. Sensitivity analysis
can be performed using the `PlotHabitatSuitabilityModels` function as
follows:

</div>

``` r

## Pseudochondrostoma.polylepis, large, FRBS for Spring, Summer, and Autumn

(Selected.model <- ListModels(Species = "Pseudochondrostoma polylepis", verbose = FALSE)$Codes[1])
#> [1] "ABEIO"

PlotHabitatSuitabilityModels(Selected.model = Selected.model, Quantiles = TRUE)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

**Figure 1** - Sensitivity analysis (i.e., partial dependence-like
plots) for *Pseudochondrostoma polylepis* large. The figure shows the
results for the Fuzzy Rule-Based System (FRBS) to evaluate the
microhabitat suitability during Spring, Summer, and Autumn (warm
period). The different coloured lines depict the quantiles of the
predictions along the range of the studied variable.

<br/>

<div style="text-align: justify;">

This function generates partial dependence-like plots for microhabitat
suitability models based on the provided data and selected model
(Friedman 2001). Partial dependence plots are created by varying one
variable over its range of values while averaging the model’s
predictions over all the other features. In this case, the quantiles of
these predictions are plotted. This method isolates the effect of that
single variable on the outcome and thus determining the overall effect.
The function allows employing a user defined dataset to test specific
combinations of variable values. The function allows plotting the mean
effect by setting `Quantiles` to `FALSE`.

</div>

<br/>

### LoadAndPrintModel - Load and/or print a specific model

`LoadAndPrintModel` allows selecting any specific model and assigning it
to an *R* object, as well as printing this model.

``` r
(Selected.model <- ListModels(Species = "Salmo trutta", Model.type = "GAM", verbose = FALSE))
#> $Current.summary.table
#>      Code                               Model           River River.short
#> 603 ABELZ  Salmo.trutta.GAM.Large.Curueno.All Curueño (Douro)     Curueno
#> 608 ABEMN Salmo.trutta.GAM.Medium.Curueno.All Curueño (Douro)     Curueno
#> 613 ABEMO  Salmo.trutta.GAM.Small.Curueno.All Curueño (Douro)     Curueno
#>     Model.type Default      Species   Size Sampled.season
#> 603        GAM    TRUE Salmo trutta  Large         Summer
#> 608        GAM    TRUE Salmo trutta Medium         Summer
#> 613        GAM    TRUE Salmo trutta  Small         Summer
#>                       Valid.season Valid.seasons.short  Data.origin N.presences
#> 603 Winter; Spring; Summer; Autumn                 All Field survey          24
#> 608 Winter; Spring; Summer; Autumn                 All Field survey          81
#> 613 Winter; Spring; Summer; Autumn                 All Field survey         385
#>     N.absences N.interviews.or.studies True.positive False.positive
#> 603        896                      NA            24            215
#> 608        839                      NA            70            218
#> 613        535                      NA           275            210
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 603           681              0       1.000       0.760 0.760
#> 608           621             11       0.864       0.740 0.604
#> 613           325            110       0.714       0.607 0.322
#>     Balanced.accuracy
#> 603             0.880
#> 608             0.802
#> 613             0.661
#> 
#> $Models
#> [1] "Salmo.trutta.GAM.Large.Curueno.All"  "Salmo.trutta.GAM.Medium.Curueno.All"
#> [3] "Salmo.trutta.GAM.Small.Curueno.All" 
#> 
#> $Codes
#> [1] "ABELZ" "ABEMN" "ABEMO"

(Selected.model <- LoadAndPrintModel(Selected.model = Selected.model$Codes[1]))
#> $Selected.cover.types
#>             Leaves              Algae               Root Aquatic.vegetation 
#>              FALSE              FALSE               TRUE              FALSE 
#>               Reed               Wood               Sand               Rock 
#>               TRUE              FALSE              FALSE              FALSE 
#>               Cave              Shade 
#>              FALSE               TRUE 
#> 
#> $Model.type
#> [1] "GAM"
#> 
#> $Model
#> 
#> Call:  mgcv:::bam(formula = as.formula(paste(Selected.species, "~", 
#>     C.terms)), family = binomial(), data = C.sample.dataset, 
#>     weights = ifelse(C.sample.dataset[, Selected.species] == 
#>         1, Chromosome[-c(1:length(Cover.types.complete.list))][1], 
#>         100 - Chromosome[-c(1:length(Cover.types.complete.list))][1]), 
#>     method = "fREML", gamma = 1.2, discrete = TRUE)
#> 
#> Coefficients:
#>          (Intercept)            s(Depth).1            s(Depth).2  
#>              2.31520               1.96298               9.60726  
#>           s(Depth).3         s(Velocity).1         s(Velocity).2  
#>              7.68611              -1.00821               1.19962  
#>        s(Velocity).3  s(Substrate.index).1  s(Substrate.index).2  
#>             -1.42586              -0.98002              -1.18741  
#> s(Substrate.index).3            s(Cover).1            s(Cover).2  
#>             -3.28058               2.30230               3.68337  
#>           s(Cover).3  
#>              0.09132  
#> 
#> Degrees of Freedom: 969 Total (i.e. Null);  957.1045 Residual
#> Null Deviance:       4149 
#> Residual Deviance: 1731  AIC: 1667
#> $Selected.cover.types
#>             Leaves              Algae               Root Aquatic.vegetation 
#>              FALSE              FALSE               TRUE              FALSE 
#>               Reed               Wood               Sand               Rock 
#>               TRUE              FALSE              FALSE              FALSE 
#>               Cave              Shade 
#>              FALSE               TRUE 
#> 
#> $Model.type
#> [1] "GAM"
#> 
#> $Model
#> 
#> Call:  mgcv:::bam(formula = as.formula(paste(Selected.species, "~", 
#>     C.terms)), family = binomial(), data = C.sample.dataset, 
#>     weights = ifelse(C.sample.dataset[, Selected.species] == 
#>         1, Chromosome[-c(1:length(Cover.types.complete.list))][1], 
#>         100 - Chromosome[-c(1:length(Cover.types.complete.list))][1]), 
#>     method = "fREML", gamma = 1.2, discrete = TRUE)
#> 
#> Coefficients:
#>          (Intercept)            s(Depth).1            s(Depth).2  
#>              2.31520               1.96298               9.60726  
#>           s(Depth).3         s(Velocity).1         s(Velocity).2  
#>              7.68611              -1.00821               1.19962  
#>        s(Velocity).3  s(Substrate.index).1  s(Substrate.index).2  
#>             -1.42586              -0.98002              -1.18741  
#> s(Substrate.index).3            s(Cover).1            s(Cover).2  
#>             -3.28058               2.30230               3.68337  
#>           s(Cover).3  
#>              0.09132  
#> 
#> Degrees of Freedom: 969 Total (i.e. Null);  957.1045 Residual
#> Null Deviance:       4149 
#> Residual Deviance: 1731  AIC: 1667
```

<br/>

As indicated at the beginning of this manual, each group of models was
developed employing specific *R* packages:

- Habitat Suitability Curves (HSCs): `FuzzyFishHS` [github
  link](https://github.com/RafaMMas/FuzzyFishHS)
- Artificial Neural Networks (Multilayer Perceptron ensembles,
  ANN-MLPs): `nnet` [CRAN
  link](https://cran.r-project.org/web/packages/nnet/index.html)
- Random Forests (RFs): `ranger` [CRAN
  link](https://cran.r-project.org/web/packages/ranger/index.html)
- Generalised Additive Models (GAMs): `mgcv` [CRAN
  link](https://cran.r-project.org/web/packages/mgcv/index.html)
- Support Vector Machines (SVMs): `e1071` [CRAN
  link](https://cran.r-project.org/web/packages/e1071/index.html)
- Fuzzy Rule-Based Systems (FRBSs): `FuzzyFishHS` [github
  link](https://github.com/RafaMMas/FuzzyFishHS)

<div style="text-align: justify;">

Therefore, once a specific model has been loaded, it is possible to
harness the capabilities of each specific package to, for example, plot
directly the selected model. The following code shows an example using
the function `plot` from `mgcv` to visualise the effects of the smooth
spline functions of a Generalised Additive Model (GAM) for brown trout
(*Salmo trutta*) large obtained with data collected in the Curueño River
(Douro) and valid all year round.

</div>

``` r
library(mgcv)
#> Warning: package 'mgcv' was built under R version 4.1.3
#> Loading required package: nlme
#> This is mgcv 1.8-42. For overview type 'help("mgcv-package")'.
par(mar = c(4, 4, 1, 1), bty = "n")
plot.gam(Selected.model$Model, pages = 1, shade=TRUE, shade.col = "dodgerblue")
```

<img src="man/figures/README-GAMplot-1.png" width="100%" height="80%" />

**Figure 2** - Plot of the Generalised Additive Model for *Salmo trutta*
Large obtained with data collected in the Curueño River (Douro) and
valid all year round. ${\textsf{\color{blue}Blue}}$ bands represents the
95% confidence intervals of each smooth term.

<div style="text-align: justify;">

The different options to, for example, plot each model depends on each
specific package and in some cases, such as the SVMs obtained with
`e1071`, it will require indirect approaches for plotting. For example,
using the *R* package `pdp` (Greenwell 2017).

</div>

<br/>

### PredictHabitatSuitability - Microhabitat suitability predictions

<div style="text-align: justify;">

Microhabitat suitability predictions are carried out employing the
function `PredictHabitatSuitability`. They are based on mean flow
velocity (m/s), water depth (m) substrate index (-) and the sum of the
number of relevant types of cover in the evaluated microhabitats (i.e.,
pixels or cells from the hydraulic simulation). The package includes
functions to prepare the input data (i.e., `SubstrateIndex`).
Additionally, the package includes data on a typical output from a
hydraulic simulation and the data on substrate and cover distribution
and availability from the field survey carried out in concert of the
bathymetry. In particular, it includes data on velocity and depth for 40
simulated flows and the substrate composition and cover availability in
the 400-m reach of the Serpis River (Eastern Iberian Peninsula) studied
by Muñoz-Mas et al. (2024). The data and subsequent analyses are
intended to show the capabilities of the package and do not imply the
species are present in this reach of the Serpis River or along its water
course. For simplicity the data are stored in four separated files that
can be accessed and loaded to the workspace using the function `data` as
follows:

</div>

<br/>

``` r
data("Velocity.example.df")
data("Depth.example.df")
data("Cover.example.df")
data("Substrate.index.example.df")

summary(Velocity.example.df[,1:6])
#>        x                y           Velocity.0.05      Velocity.0.1     
#>  Min.   :732536   Min.   :4302306   Min.   :0.00000   Min.   :0.000000  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0.00000   1st Qu.:0.000000  
#>  Median :732614   Median :4302560   Median :0.00000   Median :0.000000  
#>  Mean   :732615   Mean   :4302545   Mean   :0.00439   Mean   :0.009547  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0.00480   3rd Qu.:0.010900  
#>  Max.   :732686   Max.   :4302710   Max.   :0.15973   Max.   :0.235300  
#>   Velocity.0.2      Velocity.0.3    
#>  Min.   :0.00000   Min.   :0.00000  
#>  1st Qu.:0.00000   1st Qu.:0.00000  
#>  Median :0.00000   Median :0.00020  
#>  Mean   :0.02132   Mean   :0.03182  
#>  3rd Qu.:0.02330   3rd Qu.:0.03495  
#>  Max.   :0.46400   Max.   :1.10900
summary(Depth.example.df[,1:6])
#>        x                y             Depth.0.05       Depth.0.1     
#>  Min.   :732536   Min.   :4302306   Min.   :0.0001   Min.   :0.0001  
#>  1st Qu.:732596   1st Qu.:4302440   1st Qu.:0.1022   1st Qu.:0.0986  
#>  Median :732614   Median :4302560   Median :0.2598   Median :0.2629  
#>  Mean   :732615   Mean   :4302545   Mean   :0.3001   Mean   :0.3008  
#>  3rd Qu.:732638   3rd Qu.:4302660   3rd Qu.:0.4631   3rd Qu.:0.4587  
#>  Max.   :732686   Max.   :4302710   Max.   :1.2471   Max.   :1.2837  
#>                                     NA's   :1917     NA's   :1712    
#>    Depth.0.2        Depth.0.3     
#>  Min.   :0.0002   Min.   :0.0002  
#>  1st Qu.:0.1005   1st Qu.:0.1087  
#>  Median :0.2808   Median :0.2960  
#>  Mean   :0.3147   Mean   :0.3321  
#>  3rd Qu.:0.4729   3rd Qu.:0.4987  
#>  Max.   :1.3332   Max.   :1.3676  
#>  NA's   :1548     NA's   :1482
summary(Cover.example.df[,-c(1:2)])
#>      Leaves      Algae        Root   Aquatic.vegetation      Reed        
#>  Min.   :0   Min.   :0   Min.   :0   Min.   :0.00000    Min.   :0.00000  
#>  1st Qu.:0   1st Qu.:0   1st Qu.:0   1st Qu.:0.00000    1st Qu.:0.00000  
#>  Median :0   Median :0   Median :0   Median :0.00000    Median :0.00000  
#>  Mean   :0   Mean   :0   Mean   :0   Mean   :0.01703    Mean   :0.01136  
#>  3rd Qu.:0   3rd Qu.:0   3rd Qu.:0   3rd Qu.:0.00000    3rd Qu.:0.00000  
#>  Max.   :0   Max.   :0   Max.   :0   Max.   :1.00000    Max.   :1.00000  
#>       Wood             Sand        Rock             Cave             Shade     
#>  Min.   :0.0000   Min.   :0   Min.   :0.0000   Min.   :0.00000   Min.   :0.00  
#>  1st Qu.:0.0000   1st Qu.:0   1st Qu.:0.0000   1st Qu.:0.00000   1st Qu.:0.00  
#>  Median :0.0000   Median :0   Median :0.0000   Median :0.00000   Median :1.00  
#>  Mean   :0.4767   Mean   :0   Mean   :0.1612   Mean   :0.02177   Mean   :0.53  
#>  3rd Qu.:1.0000   3rd Qu.:0   3rd Qu.:0.0000   3rd Qu.:0.00000   3rd Qu.:1.00  
#>  Max.   :1.0000   Max.   :0   Max.   :1.0000   Max.   :1.00000   Max.   :1.00
summary(Substrate.index.example.df[,-c(1:2)])
#>    Vegetation      Silt             Sand    Fine.gravel         Gravel      
#>  Min.   :0    Min.   :  0.00   Min.   :0   Min.   :  0.00   Min.   :  0.00  
#>  1st Qu.:0    1st Qu.:  0.00   1st Qu.:0   1st Qu.:  0.00   1st Qu.:  0.00  
#>  Median :0    Median : 15.00   Median :0   Median :  0.00   Median :  0.00  
#>  Mean   :0    Mean   : 20.59   Mean   :0   Mean   : 10.49   Mean   : 15.61  
#>  3rd Qu.:0    3rd Qu.: 50.00   3rd Qu.:0   3rd Qu.:  0.00   3rd Qu.: 20.00  
#>  Max.   :0    Max.   :100.00   Max.   :0   Max.   :100.00   Max.   :100.00  
#>     Cobbles          Boulders         Bed.rock      
#>  Min.   :  0.00   Min.   :  0.00   Min.   :  0.000  
#>  1st Qu.:  0.00   1st Qu.:  0.00   1st Qu.:  0.000  
#>  Median : 50.00   Median :  0.00   Median :  0.000  
#>  Mean   : 38.49   Mean   : 10.25   Mean   :  4.571  
#>  3rd Qu.: 50.00   3rd Qu.:  0.00   3rd Qu.:  0.000  
#>  Max.   :100.00   Max.   :100.00   Max.   :100.000
```

<br/>

In this reach of the Serpis River the water flows northward (upwards).
The reach presents a series of small and relatively shallow pools
connected through rapid waters (i.e., rapid/runs). The largest pool is
located at the downstream part of the reach. The following figure shows
the distribution of the velocity (m/s) and depth (m) for four simulated
flows: Q = 0.5, 2.2, 2.7, and 21 m<sup>3</sup>/s. The maximum simulated
velocity was 1.8 m/s and the maximum depth of 2.4 m.

<br/>

<img src="man/figures/README-depth and velocity figure-1.png" width="100%" height="100%" />

**Figure 3** - Velocity (m/s) and depth (m) distribution in the Serpis
River (Jucar River Basin District) for four different modelled flow
rates (m<sup>3</sup>/s) included in the `Velocity.example.df` and
`Depth.example.df` respectively.

<br/>

<div style="text-align: justify;">

Among the ten types of cover recorded and used to develop the
microhabitat suitability models, in this river reach leaves, algae,
roots, and sand were absent. The most abundant cover types were logs and
woody debris (wood) and shade which covered most of the margins. Rock
was the most abundant instream cover, especially in the transition zone
between pools, whereas the remaining cover types were only present in
small patches.

</div>

<img src="man/figures/README-plot cover-1.png" width="100%" height="100%" />

**Figure 4** - Distribution of each cover type along the reach of the
Serpis River (Jucar River Basin District). The models were developed
considering ten types of cover (refuge/shelter): Leaves, Algae, Roots,
Aquatic vegetation, Reeds (emerging vegetation/helophytes), Woody debris
and logs, Sand, Rocks, Caves, and Shade, which are included (but no
necessarily present) in the `Cover.example.df`.

<br/>

<div style="text-align: justify;">

The function `SubstrateIndex` computes the substrate index as a weighted
aggregation of the percentage of different granulometry classes (%). The
substrate classes originally used corresponded to a simplification of
the American Geophysical Union size scale, namely silt (Ø ≤ 62 µm), sand
(62 µm \> Ø ≤ 2 mm), fine gravel (2 \> Ø ≤ 8 mm), gravel (8 \> Ø ≤ 64
mm), cobbles (64 \> Ø ≤ 256 mm), boulders (Ø \> 256 mm) and bedrock (see
e.g., Muñoz-Mas et al. 2017 or Muñoz-Mas et al. 2018). The package
includes some examples to illustrate the structure of the input files.

</div>

<br/>

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

<br/>

<div style="text-align: justify;">

The substrate index ranges from 0, fines/silt, to 8, bedrock. In the
example site of the Serpis River the upstream pools and rapids (bottom
part of the figure) present coarse substrates, cobble (6), boulders (7)
and even parts were bedrock (8) dominated. The finer substrates were
located at the beginning of the big pool and the lateral margins of the
reach.

</div>

<br/>

<img src="man/figures/README-substrate index map-1.png" width="100%" height="110%" />

**Figure 5** - Substrate composition (substrate index) along the reach
of the Serpis River (Jucar River Basin District). The substrate index
ranges from 0, fines/silt, to 8, bedrock. The percentages (%) of the
different substrate types are stored in `Substrate.index.example.df`.

<br/>

<div style="text-align: justify;">

In the example, we selected the default available models for Southern
Iberian spined-loach (*Cobitis paludica*) large. For this species and
size class there are seven models obtained from expert-knowledge and
empirical data collected in the Estena (Guadiana) and Yeguas
(Guadalquivir) rivers. The default available models include two Fuzzy
Rule-Based Systems (FRBSs) obtained from expert-knowledge and literature
(EKorL), one for Summer (warm period) and Winter (cold period). The set
also includes a Generalised Additive Model (GAM), a set of Habitat
Suitability Curves (HSCs), an Artificial Neural Network (NNET), Random
forests (RF) and Support Vector Machine (SVM). All these models were
trained using data collected from the Estena and Yeguas rivers during
the spring and summer. Currently, these models represent the best option
for evaluating microhabitat suitability across any season. To select the
models, we employed the function `ListModels` setting the arguments
`Selected.species` to `"Cobitis paludica"` and the `Selected.size` to
`"Large"`.

</div>

<br/>

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
#> 163          43       1950                      NA            40            831
#> 164          43       1950                      NA            38            959
#> 165          43       1950                      NA            36            678
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 138            NA             NA          NA          NA    NA
#> 139            NA             NA          NA          NA    NA
#> 161           750              4       0.907       0.385 0.292
#> 162            NA             NA          NA          NA    NA
#> 163          1119              3       0.930       0.574 0.504
#> 164           991              5       0.884       0.508 0.392
#> 165          1272              7       0.837       0.652 0.490
#>     Balanced.accuracy
#> 138                NA
#> 139                NA
#> 161             0.646
#> 162                NA
#> 163             0.752
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
#> 163          43       1950                      NA            40            831
#> 164          43       1950                      NA            38            959
#> 165          43       1950                      NA            36            678
#>     True.negative False.negative Sensitivity Specificity   TSS
#> 138            NA             NA          NA          NA    NA
#> 139            NA             NA          NA          NA    NA
#> 161           750              4       0.907       0.385 0.292
#> 162            NA             NA          NA          NA    NA
#> 163          1119              3       0.930       0.574 0.504
#> 164           991              5       0.884       0.508 0.392
#> 165          1272              7       0.837       0.652 0.490
#>     Balanced.accuracy
#> 138                NA
#> 139                NA
#> 161             0.646
#> 162                NA
#> 163             0.752
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

<div style="text-align: justify;">

`PredictHabitatSuitability` allows evaluating the microhabitat
suitability of every patch, pixel or cell from field surveys and/or
hydraulic simulations. The main arguments of the function are the
selected models from `ListModels` and data on Velocity, Depth, Substrate
index and Cover availability. `PredictHabitatSuitability` expects data
to be a *R* `data.frame` with the following columns, which must be named
as follows to ensure each model finds the necessary info to aggregate
the relevant cover types and carry out the evaluation:

1.  “Velocity”
2.  “Depth”
3.  “Leaves”
4.  “Algae”
5.  “Root”
6.  “Aquatic.vegetation”
7.  “Reed”
8.  “Wood”
9.  “Sand”
10. “Rock”
11. “Cave”
12. “Shade”

**If any cover type is absent the entire column should be set to zero,
but it must be present in the dataset**. Once the dataset is prepared,
and the models are selected using `ListModels`, the microhabitat
suitability can be predicted with `PredictHabitatSuitability`.

</div>

<br/>

``` r
Hydraulics <- data.frame(Velocity = Velocity.example.df$Velocity.0.5,
                         Depth = Depth.example.df$Depth.0.5,
                         Substrate.index = Substrate.index,
                         Cover.example.df[,-c(1:2)])

Predictions <- PredictHabitatSuitability(Selected.models = Selected.models, 
                                         data = Hydraulics, HSC.aggregation = "geometric")
```

<br/>

<div style="text-align: justify;">

The summary of the predictions show that most of the models predicted
suitability values along the entire feasible range from 0 to 1, but the
statistics indicate differences among models. For example, the Fuzzy
Rule-Based Systems (FRBSs) for summer indicates a mean suitability
around 0.62 and an inferior value for winter (0.49). The higher value is
similar to that obtained with the Habitat Suitability Curves (HSCs). The
mean suitability obtained with the Artificial Neural Network (NNET) is
markedly lower as it only achieved 0.18, whereas the mean suitability
from Random forests (RF) was of 0.35. By contrast, the mean suitability
obtained with the remaining models is close to 0.50.

</div>

<br/>

``` r

summary(Predictions)
#>  Cobitis.paludica.FRBS.Large.EKorL.Spring.Summer.Autumn
#>  Min.   :0.0000                                        
#>  1st Qu.:0.4267                                        
#>  Median :0.8084                                        
#>  Mean   :0.6277                                        
#>  3rd Qu.:0.8393                                        
#>  Max.   :0.9661                                        
#>  NA's   :1407                                          
#>  Cobitis.paludica.FRBS.Large.EKorL.Autumn.Winter.Spring
#>  Min.   :0.0000                                        
#>  1st Qu.:0.1114                                        
#>  Median :0.6042                                        
#>  Mean   :0.4913                                        
#>  3rd Qu.:0.8210                                        
#>  Max.   :0.9518                                        
#>  NA's   :1407                                          
#>  Cobitis.paludica.GAM.Large.Estena.and.Yeguas.All
#>  Min.   :0.0000                                  
#>  1st Qu.:0.3664                                  
#>  Median :0.6294                                  
#>  Mean   :0.5358                                  
#>  3rd Qu.:0.6976                                  
#>  Max.   :0.9327                                  
#>  NA's   :1407                                    
#>  Cobitis.paludica.HSC.Large.Estena.and.Yeguas.All
#>  Min.   :0.0216                                  
#>  1st Qu.:0.5712                                  
#>  Median :0.6740                                  
#>  Mean   :0.6323                                  
#>  3rd Qu.:0.6819                                  
#>  Max.   :0.9939                                  
#>  NA's   :1407                                    
#>  Cobitis.paludica.NNET.Large.Estena.and.Yeguas.All
#>  Min.   :0.0021                                   
#>  1st Qu.:0.0566                                   
#>  Median :0.1082                                   
#>  Mean   :0.1820                                   
#>  3rd Qu.:0.2464                                   
#>  Max.   :0.9719                                   
#>  NA's   :1407                                     
#>  Cobitis.paludica.RF.Large.Estena.and.Yeguas.All
#>  Min.   :0.0000                                 
#>  1st Qu.:0.1097                                 
#>  Median :0.3420                                 
#>  Mean   :0.3500                                 
#>  3rd Qu.:0.5733                                 
#>  Max.   :0.9598                                 
#>  NA's   :1407                                   
#>  Cobitis.paludica.SVM.Large.Estena.and.Yeguas.All
#>  Min.   :0.0000                                  
#>  1st Qu.:0.0000                                  
#>  Median :0.6000                                  
#>  Mean   :0.5174                                  
#>  3rd Qu.:1.0000                                  
#>  Max.   :1.0000                                  
#>  NA's   :1407
```

<br/>

<div style="text-align: justify;">

By using the `pairs` it is possible to see the differences between each
pair of predictions, the variable interactions, dependencies (The Fuzzy
Rule-Based Systems, FRBSs, are based on the Expert-Knowledge-based
Habitat Suitability Curves/Criteria, HSCs) and the compensatory nature
of the different models. Colour code in the following figure ranges from
${\textsf{\color{red}red}}$, ${\textsf{\color{orange}orange}}$ and
${\textsf{\color{gold}gold}}$ to ${\textsf{\color{green}green}}$ and
${\textsf{\color{blue}blue}}$ following the typical colour palette to
assess the ecological status. The associated suitability is based on the
mean/ensemble prediction across models.

</div>

``` r

pairs(Predictions, col = Colors.pair.plot, oma = c(2.5, 2.5, 7, 2.5), cex.labels = 0.6, lwd = 0.5, cex = 0.35, cex.axis = 0.65, mgp = c(0,0.25,0), gap = 0 , tck = -0.05, xlim = c(0, 1), ylim = c(0, 1), las = 2)

title(substitute(expr = paste(italic(Species), Size, sep =" "), env = list(Species = Species, Size = Size)), outer = T, line = -3, adj = 0.5, cex.main = 1.5)
```

<img src="man/figures/README-pairplot-1.png" width="100%" />

**Figure 6** - Paired plots comparing the predicted suitability for
*Cobitis paludica* large employing the default available models. The
comparison includes, Fuzzy Rule-Based Systems (FRBSs) obtained from
expert-knowledge and literature (EKorL) and valid during Summer (warm
period) and Winter (cold period). In addition, it also compares the
results obtained with the Generalised Additive Model (GAM), Habitat
Suitability Curves (HSCs), Artificial Neural Network (NNET), Random
forests (RF) and Support Vector Machine (SVM). All these models were
developed pooling data from the Estena (Guadiana) and Yeguas
(Guadalquivir) rivers. Currently, these models are valid for every
season (*All*). The names and main characteristics of the models appear
in the diagonal of the figure. Dot colours correspond to the
mean/ensemble prediction across models.

<br/>

<div style="text-align: justify;">

The coordinates in the data included in `IberianFishHSMs` allows mapping
the microhabitat suitability predicted with each selected model
employing functions from the *R* package `sf`. First, it is necessary to
create a point object with the coordinates and the desired colour
sequence. In this case also ranging from ${\textsf{\color{red}red}}$,
${\textsf{\color{orange}orange}}$ and ${\textsf{\color{gold}gold}}$ to
${\textsf{\color{green}green}}$ and ${\textsf{\color{blue}blue}}$. Then,
a loop plotting iteratively the different maps is carried out and the
figure title is added.

</div>

<br/>

``` r

library(sf)

Coordinates <- st_as_sf(Velocity.example.df[,c("x", "y")], coords = c("x", "y"))

Colors.suitability <- colorRampPalette(c("red2", "darkorange", "gold", "green2", "dodgerblue"))(100)

op <- par(mfrow = c(2, 4),
          oma = c(0.25, 0.25, 4, 0.25),
          mar = c(4, 4, 1, 0.25))

for(i in 1:ncol(Predictions))
{
  plot(st_geometry(Coordinates), pch = 15, cex = 0.5, bty = "n", 
     col = Colors.suitability[cut(Predictions[,i],
                                  breaks = seq(0, 1, length = 101), labels = 1:100, include.lowest = T)], 
     xlab = "X", ylab = "Y")
  Axis(side = 1, cex.axis = 0.5)
  Axis(side = 2, cex.axis = 0.5) 
  title(colnames(Predictions)[i], font.main = 1, line = -0.5, cex.main = 1, adj = 0.7)
}

par(op)

Species <- Selected.species
Size <- paste0(" - ", Selected.size)
title(substitute(expr = paste(italic(Species), Size, sep =" "), 
                 env = list(Species = Species, Size = Size)), outer = T, line = -1, adj = 0.5, cex.main = 2)

par(op)
```

<br/>

<div style="text-align: justify;">

The different models assign the highest suitability to the downstream
pool (upper part of the map). However, the maps developed employing the
preceding code reveal the differences among the microhabitat suitability
models. The Fuzzy Rule-Based Systems (FRBSs) assign large suitability to
the deeper areas and the shores of the pools comprised within the
hydraulic model. Both of them predicted as unsuitable the rapids
connecting them but the FRBSs for Winter is more restrictive than the
one for Summer and predicts as suitable only the deeper parts of these
pools. The Generalised Additive Model (GAM) and the Habitat Suitability
Curves (HSCs) predicted high suitability in the deeper part of the
upstream pool and particularly to the shores, but the upstream smaller
pools were unsuitable with the GAM and largely suitable with the HSCs.
The latter highlights the compensatory nature of the geometric mean used
to aggregate the suitability obtained from each independent microhabitat
suitability curve. The Artificial Neural Network (NNET) only considered
suitable very specific areas of the study site. The Random forest model
(RF) only predicted as suitable the deeper parts of this pool but, based
on this model predictions, both margins would be unsuitable. The
predictions of the Support Vector Machine (SVM) were similar but this
technique evaluated the deeper parts of the pool with the highest
suitability (i.e., 1). These models are based on the ensemble prediction
of ten SVMs and it indicates the ten models predict these microhabitat
as *present*.

</div>

<br/>

<img src="man/figures/README-compareplot figure-1.png" width="100%" height="100%" />

**Figure 7** - Maps depicting the predicted microhabitat suitability for
*Cobitis paludica* large in a reach of the Serpis River (Jucar River
Basin District - JRBD). The maps show the predictions for 0.5
m<sup>3</sup>/s employing seven different microhabitat suitability
models. The Fuzzy Rule-Based Systems (FRBSs) were obtained from
expert-knowledge and literature (EKorL) and they are valid for Summer
(warm period) and Winter (cold period) respectively. The figure also
depicts the predictions carried out with the Generalised Additive Model
(GAM), Habitat Suitability Curves (HSCs), Artificial Neural Network
(NNET), Random forest (RF) and Support Vector Machine (SVM). All these
models were developed by pooling data from the Estena (Guadiana) and
Yeguas (Guadalquivir) rivers. Currently, these models are valid for
every season (*All*).

<br/>

## Bibliography

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-Breiman2001" class="csl-entry">

Breiman, L. 2001. “<span class="nocase">Random forests</span>.” *Machine
Learning* 45 (1): 5–32. <https://doi.org/10.1023/A:1010933404324>.

</div>

<div id="ref-Cortes1995" class="csl-entry">

Cortes, C, and V Vapnik. 1995. “<span class="nocase">Support-vector
networks</span>.” *Machine Learning* 20 (3): 273–97.
<https://doi.org/10.1007/BF00994018>.

</div>

<div id="ref-Eugster2014" class="csl-entry">

Eugster, M J A, F Leisch, and C Strobl. 2014.
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

<div id="ref-RJ-2017-016" class="csl-entry">

Greenwell, B M. 2017. “<span class="nocase">pdp: An R Package for
Constructing Partial Dependence Plots</span>.” *The R Journal* 9 (1):
421–36. <https://doi.org/10.32614/RJ-2017-016>.

</div>

<div id="ref-Hansen1990" class="csl-entry">

Hansen, L K, and P Salamon. 1990. “<span class="nocase">Neural network
ensembles</span>.” *IEEE Transactions on Pattern Analysis and Machine
Intelligence* 12 (10): 993–1001. <https://doi.org/10.1109/34.58871>.

</div>

<div id="ref-Hastie1990" class="csl-entry">

Hastie, T J, and R J Tibshirani. 1990. *Generalized Additive Models*.
Edited by Chapman and Hall/CRC. London, (UK): Chapman & Hall/CRC.

</div>

<div id="ref-Munoz-Mas2017" class="csl-entry">

Muñoz-Mas, R, R M S Costa, F Martínez-Capel, and J D Alcaraz-Hernández.
2017. “<span class="nocase">Microhabitat competition between Iberian
fish species and the endangered J<span class="nocase">ú</span>car nase
(Parachondrostoma arrigonis Steindachner, 1866)</span>.” *Journal of
Ecohydraulics* 0 (0): 1–23.
<https://doi.org/10.1080/24705357.2016.1276417>.

</div>

<div id="ref-Munoz-Mas2024" class="csl-entry">

Muñoz-Mas, R, H Macian-Sorribes, F J Oliva-Paterna, L Sangelantoni, D
Peano, M Pulido-Velazquez, and F Martínez-Capel. 2024.
“<span class="nocase">Adaptation measures to global change in the Serpis
River Basin (Spain): An evaluation considering agricultural benefits,
environmental flows, and invasive fishes</span>.” *Ecological
Indicators* 161: 111979.
<https://doi.org/10.1016/j.ecolind.2024.111979>.

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

<div id="ref-Takagi1985" class="csl-entry">

Takagi, T, and M Sugeno. 1985. “<span class="nocase">Fuzzy
identification of systems and its applications to modeling and
control</span>.” *IEEE Transactions on Systems, Man and Cybernetics* 15
(1): 116–32. <https://doi.org/10.1109/TSMC.1985.6313399>.

</div>

<div id="ref-Vapnik1995" class="csl-entry">

Vapnik, V. 1995. *<span class="nocase">The nature of statistical
learning theory</span>*. New York, NY (USA): Springer-Verlag New York.
<https://doi.org/10.1007/978-1-4757-3264-1>.

</div>

<div id="ref-Waters1976" class="csl-entry">

Waters, B F. 1976. “<span class="nocase">A methodology for evaluating
the effects of different streamflows on salmonid habitat</span>.” In
*Proceedings of the Symposium and Specialty Conference on Instream Flow
Needs*, 13. Bethesda, MD (USA): American Fisheries Society.

</div>

<div id="ref-Zadeh1965" class="csl-entry">

Zadeh, L A. 1965. “<span class="nocase">Fuzzy sets</span>.” *Information
and Control* 8 (3): 338–53.
<https://doi.org/10.1016/S0019-9958(65)90241-X>.

</div>

</div>
