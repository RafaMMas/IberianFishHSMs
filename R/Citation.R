.onAttach <- function(libname, pkgname) {
  citation_text <- paste(
    "To cite IberianFishHSMs: ",
    "Muñoz-Mas, R., Alonso, C., Aparicio Manau, E., Cobo Gradín, F., González Fernández, G.,",
    "Gortázar, J., Martínez-Capel, F., Oliva-Paterna, F.J., Prenda, J., Santos, J.M., & Miranda Ferreiro, R. (2025). ",
    "IberianFishHSMs: Compilation of models and tools to evaluate the habitat suitability at the microhabitat scale for ",
    "Iberian freshwater fish species in environmental flow assessment studies. ",
    "Available at: https://github.com/RafaMMas/IberianFishHSMs",
    "\n\n",
    "IberianFishHSMs was funded and commissioned to TRAGSATEC - SEPI by the Ministry for the Ecological Transition and the Demographic Challenge (MITECO, Spanish Government). ",
    "The data collection and package development were carried out under the project titled 'Actualización y/o creación de curvas de idoneidad del hábitat físico para diversas especies acuáticas y ribereñas', ",
    "conducted within the framework of the Servicio técnico para el desarrollo de modelos numéricos integrados e impulso a la restauración fluvial en las distintas demarcaciones hidrográficas intercomunitarias (21.804-0047/0411).",
    sep = "")
  packageStartupMessage(citation_text)
}
