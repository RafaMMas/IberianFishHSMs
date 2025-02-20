\name{Models.summary.table}
\alias{Models.summary.table}
\docType{data}
\title{Habitat Suitability Models for Iberian Freshwater Fish Species}
\description{
  A data frame listing the compiled habitat suitability models for Iberian freshwater fish species.
  This dataset also summarises the characteristics of the available models including target species and size class, sample sizes or performance, when available.
}
\format{
  A data frame with 20 columns listing the 797 available models. The columns are as follows:
  \describe{
    \item{Code}{Alphanumeric code of the model. Used internally for calling the selected model(s).}
    \item{Model}{The name of the model. It combined the main charactristics of the model.}
    \item{Species}{Scientific name of the target freswater fish species}
    \item{Size}{The size of the fish species (i.e., Very small, Small, Medium, Large and Spawning).}
    \item{River}{The river or waterbody where the species was studied.}
    \item{Model.type}{The type of model used (e.g., ANN, GAM, RF).}
    \item{Default}{Whether the models is considered the default choice to carry out miocrohabitat suitability asessemnts.}
    \item{Sampled.season}{The season during which the data was collected.}
    \item{Valid.season}{The season during which the model validity is considered adequate before specific models are developed.}
    \item{Data.origin}{The origin of the data (e.g., field data, expert-knowledge).}
    \item{N.presences}{The number of presences recorded for the species.}
    \item{N.absences}{The number of absences recorded for the species.}
    \item{N.interviews.or.studies}{The number of interviews or studies used for expert-knowledge-based models.}
    \item{True.positive}{The number of true positive predictions (correctly predicted presence).}
    \item{False.positive}{The number of false positive predictions (incorrectly predicted presence).}
    \item{True.negative}{The number of true negative predictions (correctly predicted absence).}
    \item{False.negative}{The number of false negative predictions (incorrectly predicted absence).}
    \item{Sensitivity}{The sensitivity score, calculated as true positives / (true positives + false negatives).}
    \item{Specificity}{The specificity score, calculated as true negatives / (true negatives + false positives).}
    \item{TSS}{The True Skill Statistic (TSS), a measure of model accuracy.}
    \item{Balanced.accuracy}{The balanced accuracy, calculated as the average of sensitivity and specificity.}
  }
}
\source{
  Data compiled based on expert knowledge, field studies, and empirical data collected from various river basins across the Iberian Peninsula.
}
\usage{
  data(Models.summary.table)
}
\keywords{datasets}

