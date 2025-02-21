#' Title
#'
#' @param Species
#' @param Size
#' @param River
#' @param Model.type
#' @param Sampled.season
#' @param Valid.season
#' @param Data.origin
#' @param Default
#' @param verbose
#' @param Only.models
#'
#' @returns
#' @export
#'
#' @examples
ListSelectedCoverTypes <- function(Species = NULL,	Size = NULL,	River = NULL,	Model.type = NULL,	Sampled.season = NULL,	Valid.season = NULL,	Data.origin = NULL, Default = TRUE, verbose = TRUE, Only.models = FALSE)
{
  # Initialize an empty list to store conditions
  conditions <- list()

  # Dynamically add conditions based on provided arguments
  if (!is.null(Species)) conditions <- c(conditions, list(Models.summary.table$Species == Species))
  if (!is.null(Size)) conditions <- c(conditions, list(Models.summary.table$Size == Size))
  if (!is.null(River)) conditions <- c(conditions, list(Models.summary.table$River == River))
  if (!is.null(Model.type)) conditions <- c(conditions, list(Models.summary.table$Model.type == Model.type))
  if (!is.null(Sampled.season)) conditions <- c(conditions, list(Models.summary.table$Sampled.season == Sampled.season))
  if (!is.null(Valid.season)) conditions <- c(conditions, list(Models.summary.table$Valid.season == Valid.season))
  if (!is.null(Data.origin)) conditions <- c(conditions, list(Models.summary.table$Data.origin == Data.origin))
  if (!is.null(Default)) conditions <- c(conditions, list(Models.summary.table$Default == Default))

  # Apply all conditions dynamically
  if (length(conditions) > 0) {
    Current.summary.table <- Models.summary.table[Reduce(`&`, conditions), ]
  }

  if(nrow(Current.summary.table) == 0)
    stop("There are no models with the selected characteristics.")

  Codes <- Current.summary.table$Code

  sapply(Codes, function(current.model){

    file_path <- system.file("extradata", current.model, package = "IberianFishHSMs")

    c.model <- readRDS(paste0(file_path, ".rds"))

    c.model$Selected.cover.types
  })
}

