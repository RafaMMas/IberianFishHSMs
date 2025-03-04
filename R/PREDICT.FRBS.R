#' Pi membership functions
#'
#' @param pattern the values of the input variable for whom the membership is calculated
#' @param parameters the parameters of the membership function
#'
#' @return membership of the evaluated values
#' @importFrom stats approx
#' @export
#'
#' @examples
#' plot(PIMF(pattern = seq(0, 100, by = 1), parameters = c(10, 60, 75, 90)),
#' type = "l", xlab = "Value", ylab = "Membership", bty = "n", las = 1, col = "orangered")
#'
#' plot(PIMF(pattern = seq(0, 100, by = 1), parameters = c(10, 40, 50, 80)),
#' type = "l", xlab = "Value", ylab = "Membership", bty = "n", las = 1, col = "orangered")
#'
PIMF.NA <- function (pattern, parameters)
{
  Membership <- c()

  for (z in 1:length(pattern)) {
    if (is.na(pattern[z])){

        Membership <- c(Membership, NA)

      } else {
        if (pattern[z] >= parameters[2] & pattern[z] <= parameters[3]) {
          y <- 1
        }
        if (pattern[z] >= mean(parameters[1:2]) & pattern[z] <
            parameters[2]) {
          y <- 1 - 2 * ((pattern[z] - parameters[2])/(diff(parameters[1:2])))^2
        }
        if (pattern[z] > parameters[3] & pattern[z] <= mean(parameters[3:4])) {
          y <- 1 - 2 * ((pattern[z] - parameters[3])/(diff(parameters[3:4])))^2
        }
        if (pattern[z] >= parameters[1] & pattern[z] < mean(parameters[1:2])) {
          y <- 2 * ((pattern[z] - parameters[1])/(diff(parameters[1:2])))^2
        }
        if (pattern[z] > mean(parameters[3:4]) & pattern[z] <=
            parameters[4]) {
          y <- 2 * ((pattern[z] - parameters[4])/(parameters[4] -
                                                    parameters[3]))^2
        }
        if (pattern[z] < parameters[1] | pattern[z] > parameters[4]) {
          y <- 0
        }

        Membership <- c(Membership, y)
    }
  }
  return(Membership)
}

#' Function to carry out predictions with zero-order Takagi–Sugeno–Kang fuzzy rule-based systems for fish habitat evaluation.
#'
#' @param Data the evaluated dataset in data.frame format
#' @param FRBS the list compiling the elements describing a zero-order Takagi–Sugeno–Kang fuzzy rule-based system
#'
#' @return matrix with the membership of each datum to each fuzzy rule obtained using the function FUZZIFY.FRBS.Fast and the predicted habitat suitability in the last column
#' @export
#'
#' @examples
#'
PREDICT.FRBS <- function (Data, FRBS)
{
  Data <- sapply(colnames(FRBS$Range), function(i) {
      pmax(pmin(Data[,i], FRBS$Range[2,i]), FRBS$Range[1,i])
  })

  apply(Data, 1, function(x) {
    if(any(is.na(x))){
      NA
      } else {
      ExpandList <- NULL
      for (ImpVariables in FRBS$ImpVariables) {
        ExpandList[[length(ExpandList) + 1]] <- apply(FRBS$MFparameters[,
                                                                        stringr::str_detect(string = colnames(FRBS$MFparameters),
                                                                                            pattern = ImpVariables)], 2, function(parameters) {
                                                                                              FRBS$MFfunction(pattern = x[ImpVariables], parameters = parameters)
                                                                                            })
      }
      Memb. <- sum(apply(expand.grid(ExpandList), 1, prod),
                   na.rm = T)
      sum(apply(expand.grid(ExpandList), 1, prod) *
                     FRBS$Consequents, na.rm = T)
    }

  })
}
