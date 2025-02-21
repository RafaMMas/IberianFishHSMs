#' Title
#'
#' @param Selected.models
#' @param data
#' @param HSC.aggregation
#'
#' @returns
#' @export
#'
#' @examples
PredictHabitatSuitability <- function(Selected.models = NULL, data = NULL, HSC.aggregation = "geometric"){ # , probability = TRUE

Habitat.assessment <- sapply(Selected.models$Models, function(current.model){

  c.model <- readRDS(paste0("./Models/", current.model, ".rds")) ## açò haurà de canviar

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

    as.vector(predict(object = c.model$Model, newdata = microhabitat.characteristics, type = "raw"))

  } else if(c.model$Model.type == "RF"){

    Predictions <- rep(NA,nrow(microhabitat.characteristics)) ## This allows predicting datasets with NAs and returning NAs
    Predictions[complete.cases(microhabitat.characteristics)] <- predict(object = c.model$Model, data = microhabitat.characteristics[complete.cases(microhabitat.characteristics),])$predictions[,2]
    Predictions

  } else {

    Predictions <- rep(NA, nrow(microhabitat.characteristics)) ## This allows predicting datasets with NAs and returning NAs
    Predictions[complete.cases(microhabitat.characteristics)] <- PredictSVMensemble.mean.votes(object = c.model$Model, newdata = microhabitat.characteristics[complete.cases(microhabitat.characteristics),]) # PredictSVMensemble(object = c.model$Model, newdata = microhabitat.characteristics[complete.cases(microhabitat.characteristics),], probability = FALSE)
    Predictions

  }
})

Habitat.assessment

}

PredictSuitabilityPlot <- function(Selected.model = NULL, data = NULL, HSC.aggregation = "geometric"){

  Habitat.assessment <- sapply(Selected.model, function(current.model){

    c.model <- readRDS(paste0("./Models/", current.model, ".rds")) ## açò haurà de canviar

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

      as.vector(predict(object = c.model$Model, newdata = microhabitat.characteristics, type = "raw"))

    } else if(c.model$Model.type == "RF"){

      Predictions <- rep(NA,nrow(microhabitat.characteristics)) ## This allows predicting datasets with NAs and returning NAs
      Predictions[complete.cases(microhabitat.characteristics)] <- predict(object = c.model$Model, data = microhabitat.characteristics[complete.cases(microhabitat.characteristics),])$predictions[,2]
      Predictions

    } else {

      Predictions <- rep(NA, nrow(microhabitat.characteristics)) ## This allows predicting datasets with NAs and returning NAs
      Predictions[complete.cases(microhabitat.characteristics)] <- PredictSVMensemble.mean.votes(object = c.model$Model, newdata = microhabitat.characteristics[complete.cases(microhabitat.characteristics),]) # PredictSVMensemble(object = c.model$Model, newdata = microhabitat.characteristics[complete.cases(microhabitat.characteristics),], probability = FALSE)
      Predictions

    }
  })

  Habitat.assessment

}

