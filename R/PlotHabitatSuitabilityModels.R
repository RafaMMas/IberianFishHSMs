#' Plot Habitat Suitability Models
#'
#' This function generates partial dependence-like plots for microhabitat suitability models based on the provided data and selected model.
#'
#' @param Selected.model A character string or object representing the selected habitat suitability model. It should be among the `Codes` obtained with `ListModels` Default is `NULL`.
#' @param data A data frame containing the data to be used for plotting the habitat suitability models. Default is `NULL`. This dataset must contain: "Velocity", "Depth", "Substrate.index" and "Cover".
#' @param n.points Integer specifying the grid resolution used to evaluate the suitability model (e.g., for a range of conditions). Default is 50.
#' @param Quantiles Logical value indicating whether quantiles should be used for the plot. Default is `TRUE`.
#' @param Layout A numeric vector of length 2 indicating the layout of the plots (e.g., `c(2, 2)` for 2 rows and 2 columns). Default is `c(2, 2)`.
#' @param HSC.aggregation A string specifying the aggregation method for habitat suitability model data. Options are `"prod"`, `"min"`, `"geometric"`, `"arithmetic"`. Default is `"geometric"`.
#'
#' @details
#' This function is designed to carry out sensitivity analyses of the available habitat suitability models.
#'
#' `data` allows specifiying the studied variable ranges and combinations of elements, although in this case Cover is provided aggregated into one single variable because the developed models do not make disctinction among cover/shelter types once they are aggregated.
#'
#' @examples
#'
#' (Selected.model <- ListModels(Species = "Salariopsis fluviatilis", verbose = FALSE)$Codes[1])
#'
#' PlotHabitatSuitabilityModels(Selected.model = Selected.model)
#'
#' PlotHabitatSuitabilityModels(Selected.model = Selected.model, Quantiles = FALSE)
#'
#' @export
#'
PlotHabitatSuitabilityModels <- function(Selected.model = NULL, data = NULL, n.points = 50, Quantiles = TRUE, Layout = c(2, 2), HSC.aggregation = "geometric"){

  if(is.null(data))
  {
    set.seed(99999)
    data <- data.frame(Velocity = runif(99, 0, 2), Depth = runif(99, 0, 3), Substrate.index = runif(99, 0, 8) , Cover = round(runif(99, 0, 6)))
  }

  Labels <- setNames(c("Velocity (m/s)", "Depth (m)", "Substrate index (-)", "# of selected cover types"), c("Velocity", "Depth", "Substrate.index", "Cover"))

  op <- par(mfrow = Layout, oma = c(0.5,0.5,2,0.5), mar = c(4,4.5,1,1), cex.lab = 1.5)

  for(c.variable in c("Velocity", "Depth", "Substrate.index", "Cover"))
  {
    Sequence <- seq(min(data[,c.variable]), max(data[,c.variable]), length = min(n.points, length(unique(data[,c.variable]))))
    c.data <- data

    PDP.predictions <- NULL

    for(c.value in Sequence)
    {
      c.data[,c.variable] <- c.value
      c.prediction <- PredictSuitabilityPlot(Selected.model = Selected.model, data = c.data, HSC.aggregation = HSC.aggregation)
      PDP.predictions <- rbind(PDP.predictions, c(mean(c.prediction), quantile(c.prediction, prob = seq(0, 1, by = 0.05))))
    }

    PDP.predictions <- setNames(data.frame(Sequence, PDP.predictions), c(c.variable, "mean", paste0("q.", seq(0, 1, by=0.05))))

    if(Quantiles)
    {
      matplot(x = PDP.predictions[,c.variable], PDP.predictions[,-c(1:2)],
              type = "l", col = colorRampPalette(c("red2", "darkorange", "gold", "green2", "dodgerblue"))(21), ylim = c(0, 1), las = 1, lty = 1, bty = "n", xlab = Labels[c.variable], ylab = "Suitability")
    } else {
      matplot(x = PDP.predictions[,c.variable], PDP.predictions[,"mean"],
              type = "l", col = "black", ylim = c(0, 1), las = 1, lty = 1, bty = "n", xlab = Labels[c.variable], ylab = "Suitability")

    }
  }

  par(op)
}

#' Function to determine the microhabitat suitability within PlotHabitatSuitabilityModels
#'
#' @param Selected.model A character string or object representing the selected habitat suitability model. It should be among the `Codes` obtained with `ListModels` Default is `NULL`.
#' @param data A data frame containing the data to be used for plotting the habitat suitability models. Default is `NULL`. This dataset must contain: "Velocity", "Depth", "Substrate.index" and "Cover".
#' @param HSC.aggregation A string specifying the aggregation method for habitat suitability model data. Options are `"prod"`, `"min"`, `"geometric"`, `"arithmetic"`. Default is `"geometric"`.
#'
#' @details
#' This function is internally called.
#'
#' @returns suitability betwen 0 and 1.
#'
#' @export
PredictSuitabilityPlot <- function(Selected.model = NULL, data = NULL, HSC.aggregation = "geometric"){

  Habitat.assessment <- sapply(Selected.model, function(current.model){

    file_path <- system.file("extradata", paste0(current.model, ".rds"), package = "IberianFishHSMs")

    c.model <- readRDS(file_path)

    microhabitat.characteristics <- data.frame(data[,c("Velocity", "Depth", "Substrate.index", "Cover")])

    if(c.model$Model.type == "FRBS"){

      PREDICT.FRBS(FRBS = c.model$Model, Data = microhabitat.characteristics)

    } else if(c.model$Model.type == "GAM"){

      mgcv::predict.gam(object = c.model$Model, newdata = microhabitat.characteristics, type = "response")

    } else if(c.model$Model.type == "HSC"){

      Partial.suitabilities <- sapply(1:4, function(i){
        PIMF.NA(pattern = microhabitat.characteristics[,c.model$Model$Variable][,i], parameters = unlist(c.model$Model[i,letters[1:4]]))
      })

      apply(Partial.suitabilities, 1, function(x){
        if(HSC.aggregation == "geometric"){
          prod(x)^(1/4) ## default
        } else if(HSC.aggregation == "prod"){
          prod(x)
        } else if(HSC.aggregation == "min"){
          min(x)
        } else if(HSC.aggregation == "arithmetic"){
          mean(x)
        }
      })

    } else if(c.model$Model.type == "NNET"){

      as.vector(nnet:::predict.nnet(object = c.model$Model, newdata = microhabitat.characteristics, type = "raw"))

    } else if(c.model$Model.type == "RF"){

      Predictions <- rep(NA,nrow(microhabitat.characteristics)) ## This allows predicting datasets with NAs and returning NAs
      Predictions[complete.cases(microhabitat.characteristics)] <- ranger:::predict.ranger(object = c.model$Model, data = microhabitat.characteristics[complete.cases(microhabitat.characteristics),])$predictions[,2]
      Predictions

    } else {

      Predictions <- rep(NA, nrow(microhabitat.characteristics)) ## This allows predicting datasets with NAs and returning NAs
      Predictions[complete.cases(microhabitat.characteristics)] <- PredictSVMensemble.mean.votes(object = c.model$Model, newdata = microhabitat.characteristics[complete.cases(microhabitat.characteristics),]) # PredictSVMensemble(object = c.model$Model, newdata = microhabitat.characteristics[complete.cases(microhabitat.characteristics),], probability = FALSE)
      Predictions

    }
  })

  Habitat.assessment

}






