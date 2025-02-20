ListModels <- function(Species = NULL,	Size = NULL,	River = NULL,	Model.type = NULL,	Sampled.season = NULL,	Valid.season = NULL,	Data.origin = NULL, Default = TRUE, verbose = TRUE, Only.models = FALSE)
{
    data <- read.table("./Models/Models.summary.table.txt", header = T, sep = "\t") ## Açò hauria de ser Complete.model.list

    # Initialize an empty list to store conditions
    conditions <- list()
    
    # Dynamically add conditions based on provided arguments
    if (!is.null(Species)) conditions <- c(conditions, list(data$Species == Species))
    if (!is.null(Size)) conditions <- c(conditions, list(data$Size == Size))
    if (!is.null(River)) conditions <- c(conditions, list(data$River == River))
    if (!is.null(Model.type)) conditions <- c(conditions, list(data$Model.type == Model.type))
    if (!is.null(Sampled.season)) conditions <- c(conditions, list(data$Sampled.season == Sampled.season))
    if (!is.null(Valid.season)) conditions <- c(conditions, list(data$Valid.season == Valid.season))
    if (!is.null(Data.origin)) conditions <- c(conditions, list(data$Data.origin == Data.origin))
    if (!is.null(Default)) conditions <- c(conditions, list(data$Default == Default))
    
    # Apply all conditions dynamically
    if (length(conditions) > 0) {
      data <- data[Reduce(`&`, conditions), ]
    }
    
    if(nrow(data) == 0)
      stop("There are no models with the selected characteristics.")
    
    if(verbose) print(data)
    
    if(Only.models){
      return(list(Models = data$Model)) 
    }else{
      return(list(Models.summary.table = data, Models = data$Model)) 
    }
  }
  
ListModels(Species = "Salmo trutta")

