#' Predict suitability from SVM ensembles employing mean votes
#'
#' @param object Ensemble of Artificial Neural Networks - Multilayer Perceptrons (NNets) as a list
#' @param newdata data frame with four columns: Velocity, Depth, Substrate.index and Cover
#' @param type string "raw" or "class" determining the kind of output suitability between 0 and 1 or present ("0") or absent ("1")
#'
#' @returns predicted suitability or class
#' @export
#'
#' @import nnet
PredictNNETensemble <- function(object, newdata, type = "raw")
{
  out <- apply(sapply(object, function(c.object){predict(object = c.object, newdata = newdata, type = "raw")}), 1, mean)
  if(type == "class"){
    out <- factor(cut(out, breaks = c(0, 0.5, 1),labels = c(0, 1), include.lowest = T), levels = c(0, 1))
  }
  return(out)
}
