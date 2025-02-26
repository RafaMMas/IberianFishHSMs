#' Title
#'
#' @param object
#' @param newdata
#'
#' @returns
#' @export
#'
#' @examples
PredictSVMensemble.mean.votes <- function(object, newdata)
{
  Predictions <- sapply(object, function(c.svm){
    return(as.numeric(predict(c.svm, newdata, probability = FALSE))-1)
  })
  rowMeans(Predictions)
}

#' Title
#'
#' @param object
#' @param newdata
#' @param probability
#'
#' @returns
#' @export
#'
#' @examples
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

#' Title
#'
#' @param object
#' @param newdata
#'
#' @returns
#' @export
#'
#' @examples
PredictSVMensemble.probability <- function(object, newdata)
{
  Predictions <- sapply(object, function(c.svm){
    return(attr(predict(c.svm, newdata, probability = probability),"probabilities")[,2])
  })
  rowMeans(Predictions)
}

