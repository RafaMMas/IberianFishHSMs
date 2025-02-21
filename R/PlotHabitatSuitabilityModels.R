#' Title
#'
#' @param Selected.model
#' @param data
#' @param n.points
#' @param Quantiles
#' @param Layout
#' @param HSC.aggregation
#'
#' @returns
#' @export
#'
#' @examples
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
      PDP.predictions <- rbind(PDP.predictions, c(mean(c.prediction), quantile(c.prediction, prob = seq(0, 1, by=0.05))))
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







