#' List available models and their key characteristics.
#'
#' The queries can be categorized by Species, Size, River, Model.type, Sampled.season, Valid.season, and/or Data.origin.
#'
#' @param Species A string specifying the selected species (e.g., "Salmo trutta").
#' @param Size A string specifying the selected size class (e.g., "Very small", "Small", "Medium", "Large", "Spawning").
#' @param River A string specifying the selected river. Since rivers vary, it is recommended to first filter by species before selecting a specific river.
#' @param Model.type A string specifying the selected model type (i.e., "FRBS", "GAM", "HSC", "NNET", "RF", "SVM").
#' - **FRBS**: Fuzzy Rule-Based System
#' - **GAM**: Generalized Additive Model
#' - **HSC**: Habitat Suitability Curve/Criteria
#' - **NNET**: Artificial Neural Network (Multilayer Perceptron)
#' - **RF**: Random Forest
#' - **SVM**: Support Vector Machine
#' @param Sampled.season The sampling period during which data was collected on one or multiple occasions.
#' @param Valid.season The time period during which the developed models remain applicable before requiring new models.
#' @param Data.origin The source of the data used to develop the habitat suitability model.
#' @param Default Logical (`TRUE`/`FALSE`). If `TRUE`, only the recommended models are listed.
#' @param verbose Logical. If `TRUE`, the table of available models is printed.
#' @param Only.models Logical. If `TRUE`, the output is limited to the model codes, which are internally used to call the corresponding habitat suitability model.
#'
#' @return A list containing the characteristics of the selected models. The structure of the list depends on the value of `Only.models`:
#' - **If `Only.models = FALSE`** (default): The function returns a list with three elements:
#'   - `$Current.summary.table`: A data frame containing the available models and their characteristics.
#'   - `$Models`: A character vector containing the names of the models along with a summary of their main characteristics.
#'   - `$Codes`: A character vector of model codes, which are internally used to call the corresponding habitat suitability model.
#' - **If `Only.models = TRUE`**: The function returns a list with a single element:
#'   - `$Codes`: A character vector of model codes, which are internally used to call the corresponding habitat suitability model.
#' @export
#'
#' @examples
#'
#' ListModels(Species = "Salmo trutta")
#' ListModels(Species = "Salmo trutta", Only.models = TRUE)
#'
ListModels <- function(Species = NULL,	Size = NULL,	River = NULL,	Model.type = NULL,	Sampled.season = NULL,	Valid.season = NULL,	Data.origin = NULL, Default = TRUE, verbose = TRUE, Only.models = FALSE)
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

    if(verbose) print(Current.summary.table)

    if(Only.models){
      return(list(Code = Current.summary.table$Code))
    }else{
      return(list(Current.summary.table = Current.summary.table, Models = Current.summary.table$Model, Code = Current.summary.table$Code))
    }
  }

