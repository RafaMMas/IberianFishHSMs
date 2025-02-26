#' Function to determine the microhabitat suitability with the selected models
#'
#'This function uses the output of \code{ListModels} to load the selected models and evaluate a dataset with the
#'
#' @param Selected.models output of \code{ListModels}
#' @param data A data frame with the velocity, depth, substrate and cover to be evaluated. \code{data} must contain the following colums to work properly:
#' \describe{
#'   \item{\code{Depth}}{A numeric vector representing water depth (i.e., in meters).}
#'   \item{\code{Velocity}}{A numeric vector representing mean flow velocity (i.e., in m/s).}
#'   \item{\code{Substrate.index}}{A numeric vector obtained from \code{SubstrateIndex} sumarising the microhabitat granulometry. See \code{SubstrateIndex} for further details.}
#'   \item{\code{Leaves}}{A dichotomous indicator (0 for absence, 1 for presence) of leaf cover availability.}
#'   \item{\code{Algae}}{A dichotomous indicator (0 for absence, 1 for presence) of algae cover availability.}
#'   \item{\code{Root}}{A dichotomous indicator (0 for absence, 1 for presence) of root cover availability.}
#'   \item{\code{Aquatic.vegetation}}{A dichotomous indicator (0 for absence, 1 for presence) of aquatic vegetation cover availability.}
#'   \item{\code{Reed}}{A dichotomous indicator (0 for absence, 1 for presence) of reed cover availability.}
#'   \item{\code{Wood}}{A dichotomous indicator (0 for absence, 1 for presence) of woody debris cover availability.}
#'   \item{\code{Sand}}{A dichotomous indicator (0 for absence, 1 for presence) of sandy substrate cover availability.}
#'   \item{\code{Rock}}{A dichotomous indicator (0 for absence, 1 for presence) of rocky substrate cover availability.}
#'   \item{\code{Cave}}{A dichotomous indicator (0 for absence, 1 for presence) of cave features availability.}
#'   \item{\code{Shade}}{A dichotomous indicator (0 for absence, 1 for presence) of shade availability.}
#' }
#' @param HSC.aggregation for HSCs the aggregation method between the partial suitability obtained from each independent curve/criteria (i.e., "prod", "min", "geometric", "arithmetic"). The default is \code{"geometric"}.
#'
#' @returns data frame with the habitat assessment. It contained one column per selected model
#'
#' @export
#'
#' @examples
#'
PredictHabitatSuitability <- function(Selected.models = NULL, data = NULL, HSC.aggregation = "geometric"){ # , probability = TRUE

Habitat.assessment <- sapply(Selected.models$Codes, function(current.model){

  file_path <- system.file("extradata", paste0(current.model, ".rds"), package = "IberianFishHSMs")

  c.model <- readRDS(file_path)

  Cover <- rowSums(data[,names(c.model$Selected.cover.types)][,c.model$Selected.cover.types, drop=F])

  microhabitat.characteristics <- data.frame(data[,c("Velocity", "Depth", "Substrate.index")], Cover)

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

#' Title
#'
#' @param Selected.model
#' @param data
#' @param HSC.aggregation
#'
#' @returns
#' @export
#'
#' @examples
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

#' Load and prints the selected model
#'
#' @param Selected.model A character string or object representing the selected habitat suitability model. It should be among the `Codes` obtained with `ListModels` Default is `NULL`.
#'
#' @returns List containing the selected cover types (`Selected.cover.types`), the model type (`Model.type`) and the model itself (`Model`).
#' @export
#'
#' @examples
#'
#' (Selected.model <- ListModels(Species = "Salmo trutta", verbose = FALSE)$Codes[1])
#'
#' Load.and.print.model(Selected.model = Selected.model)
#'
Load.and.print.model <- function(Selected.model = NULL){
      file_path <- system.file("extradata", paste0(Selected.model, ".rds"), package = "IberianFishHSMs")
      c.model <- readRDS(file_path)
      print(c.model)
      c.model
}








