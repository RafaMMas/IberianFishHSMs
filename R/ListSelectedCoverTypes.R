#' List selected model types in each habitat suitability model.
#'
#' The queries can be categorized by Species, Size, River, Model.type, Sampled.season, Valid.season, and/or Data.origin.
#'
#' @param Species A string specifying the selected species (e.g., "Salmo trutta").
#' @param Size A string specifying the selected size class (e.g., "Very small", "Small", "Medium", "Large", "Spawning").
#' @param River A string specifying the selected river. Since rivers vary, it is recommended to first filter by species before selecting a specific river.
#' @param Model.type A string specifying the selected model type (i.e., "FRBS", "GAM", "HSC", "NNET", "RF", "SVM").
#' \describe{
#'   \item{FRBS: Fuzzy Rule-Based System.}
#'   \item{GAM: Generalized Additive Model.}
#'   \item{HSC: Habitat Suitability Curve/Criteria.}
#'   \item{NNET: Artificial Neural Network (Multilayer Perceptron).}
#'   \item{RF: Random Forest.}
#'   \item{SVM: Support Vector Machine.}
#' }
#' @param Sampled.season The sampling period during which data was collected on one or multiple occasions.
#' @param Valid.season The time period during which the developed models remain applicable before requiring new models.
#' @param Data.origin The source of the data used to develop the habitat suitability model.
#' @param Default Logical (`TRUE`/`FALSE`). If `TRUE`, only the recommended models are listed.
#'
#' @returns data frame with Codes, Models and the selected cover types for each model.
#' @export
#'
#' @examples
#'
#' ListSelectedCoverTypes(Species = "Salmo trutta")
#' ListSelectedCoverTypes(Species = "Squalius alburnoides")
#'
ListSelectedCoverTypes <- function(Species = NULL,	Size = NULL,	River = NULL,	Model.type = NULL,	Sampled.season = NULL,	Valid.season = NULL,	Data.origin = NULL, Default = TRUE)
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

  data.frame(Current.summary.table[,1:2, drop = FALSE], t(sapply(Codes, function(current.model){

    file_path <- system.file("extradata", paste0(current.model, ".rds"), package = "IberianFishHSMs")

    c.model <- readRDS(file_path)

    c.model$Selected.cover.types
  })))
}

