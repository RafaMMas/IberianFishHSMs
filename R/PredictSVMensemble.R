#' Predict suitability from SVM ensembles employing mean votes
#'
#' @param object Ensemble of Support Vector Machines (SVMs) as a list
#' @param newdata data frame with four columns: Velocity, Depth, Substrate.index and Cover
#'
#' @returns predicted suitability
#' @export
#'
#' @import e1071
PredictSVMensemble.mean.votes <- function(object, newdata)
{
  Predictions <- sapply(object, function(c.svm){
    return(as.numeric(predict(c.svm, newdata, probability = FALSE))-1)
  })
  rowMeans(Predictions)
}

#' Predict suitability from SVM ensembles employing
#'
#' @param object Ensemble of Support Vector Machines (SVMs) as a list
#' @param newdata data frame with four columns: Velocity, Depth, Substrate.index and Cover
#' @param probability Logical. If `TRUE`, the SVM probability is used. Defaul = FALSE.
#'
#' @returns predicted presence/absence or predicted suitability when probability = FALSE
#'
#' @export
#'
#' @import e1071
PredictSVMensemble <- function(object, newdata, probability = FALSE)
{
  if(probability){
    Predictions <- sapply(object, function(c.svm){
      return(attr(predict(c.svm, newdata, probability = probability), "probabilities")[,2])
    })
    rowMeans(Predictions)
  } else {
    Predictions <- sapply(object, function(c.svm){
      return(factor(predict(c.svm, newdata, probability = probability)))
    })
    # factor(apply(Predictions, 1, function(x){c(0, 1)[which.max(table(factor(x, levels = c(0, 1))))]}), levels = c(0, 1))
    apply(Predictions, 1, function(x){c(0, 1)[which.max(table(factor(x, levels = c(0, 1))))]})
  }
}

#' Predict suitability from SVM ensembles employing the SVM probability
#'
#' @param object Ensemble of Support Vector Machines (SVMs) as a list
#' @param newdata data frame with four columns: Velocity, Depth, Substrate.index and Cover
#'
#' @returns predicted suitability
#'
#' @export
#'
#' @import e1071
PredictSVMensemble.probability <- function(object, newdata)
{
  Predictions <- sapply(object, function(c.svm){
    return(attr(predict(c.svm, newdata, probability = TRUE),"probabilities")[,2])
  })
  rowMeans(Predictions)
}

