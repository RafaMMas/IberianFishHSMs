.onAttach <- function(libname, pkgname) {
  citation_text <- paste(
    "To cite IberianFishHSMs:",
    "Muñoz-Mas, R., Alonso, C., Aparicio Manau, E., Cobo Gradín, F., González Fernández, G.,",
    "Gortázar, J., Martínez-Capel, F., Oliva-Paterna, F.J., Prenda, J., Santos, J.M., & Miranda Ferreiro, R. (2025).",
    "IberianFishHSMs: Compilation of models and tools to evaluate the habitat suitability at the microhabitat scale for",
    "Iberian freshwater fish species in environmental flow assessment studies.",
    "Available at: https://github.com/RafaMMas/IberianFishHSMs"
  )
  packageStartupMessage(citation_text)
}
