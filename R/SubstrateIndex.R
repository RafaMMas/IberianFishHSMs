#' Calculate Substrate Index
#'
#' Computes the substrate index as a weighted aggregation of the percentage of different granulometry classes (%).
#'
#' @param Substrate A data frame containing at least the following columns:
#'   "Sand", "Fine.gravel", "Gravel", "Cobbles", "Boulders", and "Bed.rock". Column names must coincide.
#'   Values should be between 0 and 100, representing the percentage of each class.
#' @param check.completeness Logical, if TRUE (default), checks whether the percentages in each pixel/microhabitat sum up to 100.
#'
#' @return A numeric index ranging from 0 (fine substrate, e.g., silt) to 8 (bedrock).
#'
#' @details The function aggregates the substrate cover percentages using a weighted formula
#'   to derive an index representing substrate composition, where higher values correspond
#'   to coarser substrates.
#'
#' @examples
#' data(Substrate.index.example.df)
#' summary(Substrate.index.example.df)
#' \dontrun{
#' SubstrateIndex(Substrate.index.example.df)
#' }
#' SubstrateIndex(Substrate.index.example.df, check.completeness = FALSE)
#'
#' @export
SubstrateIndex <- function(Substrate, check.completeness = TRUE) {
  if (any(!c("Sand", "Fine.gravel", "Gravel", "Cobbles", "Boulders", "Bed.rock") %in% colnames(Substrate))) {
    stop("Substrate does not contain the expected columns and/or names are misspelled")
  }

  if (check.completeness) {
    Substrate.index <- apply(Substrate[, c("Sand", "Fine.gravel", "Gravel", "Cobbles", "Boulders", "Bed.rock")], 1, function(x) {
      sum(x)
    })

    if (any(Substrate.index != 100) | any(is.na(Substrate.index))) {
      stop("Please, check data. There could be errors.")
    }
  }

  Substrate.index <- apply(Substrate[, c("Sand", "Fine.gravel", "Gravel", "Cobbles", "Boulders", "Bed.rock")], 1, function(x) {
    sum(x * c(3:8))
  }) / 100

  return(data.frame(Substrate.index = Substrate.index))
}
