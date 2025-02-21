#' Title
#'
#' @param Substrate
#' @param Vegetation
#' @param Silt
#' @param Sand
#' @param Fine.gravel
#' @param Gravel
#' @param Cobbles
#' @param Boulders
#' @param Bed.rock
#' @param check.completeness
#'
#' @returns
#' @export
#'
#' @examples
SubstrateIndex <- function(Substrate = NULL,
                           Vegetation = NULL,
                           Silt = NULL,
                           Sand = NULL,
                           Fine.gravel = NULL,
                           Gravel = NULL,
                           Cobbles = NULL,
                           Boulders = NULL,
                           Bed.rock = NULL, check.completeness = TRUE) {
  if (!is.null(Substrate) &
    any(
      !is.null(Vegetation),
      !is.null(Silt),
      !is.null(Sand),
      !is.null(Fine.gravel),
      !is.null(Gravel),
      !is.null(Cobbles),
      !is.null(Boulders),
      !is.null(Bed.rock)
    )) {
    stop("Data may be duplicated")
  }

  if (!is.null(Substrate)) {
    if(check.completeness)
    {
      if(any(apply(Substrate,1,function(x){sum(x, na.rm=T)})!=100))
        stop("Some records do not sum up to 100")
    }

    Substrate.index <- apply(Substrate[, c("Sand", "Fine.gravel", "Gravel", "Cobbles", "Boulders", "Bed.rock")], 1, function(x) {
      sum((x / 100) * c(3:8), NULL.rm = T)
    })

  } else {
    Substrate <- data.frame(ifelse(is.null(Sand), NA, Sand),
                            ifelse(is.null(Fine.gravel), NA, Fine.gravel),
                            ifelse(is.null(Gravel), NA, Gravel),
                            ifelse(is.null(Cobbles), NA, Cobbles),
                            ifelse(is.null(Boulders), NA, Boulders),
                            ifelse(is.null(Bed.rock), NA, Bed.rock))

    if(check.completeness)
    {
      if(any(apply(Substrate, 1, function(x){sum(x, na.rm=T)})!=100))
        stop("Some records do not sum up to 100")
    }

    Substrate.index <- apply(Substrate, 1, function(x) {
      sum((x / 100) * c(3:8), na.rm = T)
    })
  }
  return(data.frame(Substrate.index = Substrate.index))
}
