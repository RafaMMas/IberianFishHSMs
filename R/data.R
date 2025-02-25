#' Hydraulic Simulation Velocity Dataset
#'
#' This dataset contains siulated velocity from a hydraulic model. The data was obtained from a study on the Serpis River Basin (Spain),
#' assessing adaptation measures to global change.
#'
#' @format A data frame with 41 columns:
#' \describe{
#'   \item{x}{X coordinate in the hydraulic simulation}
#'   \item{y}{Y coordinate in the hydraulic simulation}
#'   \item{Velocity.0.05}{Simulation with 0.05 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), velocity values in meters (m/s)}
#'   \item{Velocity.0.1}{Simulation with 0.1 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), velocity values in meters (m/s)}
#'   \item{Velocity.0.2}{Simulation with 0.2 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), velocity values in meters (m/s)}
#'   \item{...}{Additional velocity columns for increasing flow scenarios up to 21 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s)}
#'   \item{Velocity.21}{Simulation with 21 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), velocity values in meters (m/s)}
#' }
#'
#' @references
#' Mu\ifelse{html}{\out{&ntilde;}}{\enc{UTF-8}{ñ}}oz-Mas, R., Macian-Sorribes, H., Oliva-Paterna, F. J.,
#' Sangelantoni, L., Peano, D., Pulido-Velazquez, M., & Mart\ifelse{html}{\out{&iacute;}}{\enc{UTF-8}{í}}nez-Capel, F. (2024).
#' Adaptation measures to global change in the Serpis River Basin (Spain): An evaluation considering agricultural benefits,
#' environmental flows, and invasive fishes. \emph{Ecological Indicators}, 161, 111979.
#' DOI: 10.1016/j.ecolind.2024.111979
#'
#' @examples
#' data(Velocity.example.df)
#' summary(Velocity.example.df)
"Velocity.example.df"

#' Hydraulic Simulation Depth Dataset
#'
#' This dataset contains simulated depth from a hydraulic model. The data was obtained from a study on the Serpis River Basin (Spain),
#' assessing adaptation measures to global change.
#'
#' @format A data frame with 41 columns:
#' \describe{
#'   \item{x}{X coordinate in the hydraulic simulation}
#'   \item{y}{Y coordinate in the hydraulic simulation}
#'   \item{Depth.0.05}{Simulation with 0.05 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), depth values in meters (m)}
#'   \item{Depth.0.1}{Simulation with 0.1 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), depth values in meters (m)}
#'   \item{Depth.0.2}{Simulation with 0.2 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), depth values in meters (m)}
#'   \item{...}{Additional depth columns for increasing flow scenarios up to 21 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s)}
#'   \item{Depth.21}{Simulation with 21 cubic meters per second (\ifelse{html}{\out{m<sup>3</sup>}}{\eqn{m^3}}/s), depth values in meters (m)}
#' }
#'
#' @references
#' Mu\ifelse{html}{\out{&ntilde;}}{\enc{UTF-8}{ñ}}oz-Mas, R., Macian-Sorribes, H., Oliva-Paterna, F. J.,
#' Sangelantoni, L., Peano, D., Pulido-Velazquez, M., & Mart\ifelse{html}{\out{&iacute;}}{\enc{UTF-8}{í}}nez-Capel, F. (2024).
#' Adaptation measures to global change in the Serpis River Basin (Spain): An evaluation considering agricultural benefits,
#' environmental flows, and invasive fishes. \emph{Ecological Indicators}, 161, 111979.
#' DOI: 10.1016/j.ecolind.2024.111979
#'
#' @examples
#' data(Depth.example.df)
#' summary(Depth.example.df)
"Depth.example.df"

#' Substrate Index Dataset
#'
#' This dataset contains granulometry data from the study site where the hydraulic simulation was carried out in the Serpis River Basin (Spain).
#' The columns represent the percentage of various substrate types, including different types of sediments and bedrock.
#'
#' @format A data frame with nine columns:
#' \describe{
#'   \item{x}{X coordinate of the study site}
#'   \item{y}{Y coordinate of the study site}
#'   \item{\emph{Vegetation}}{Percentage of vegetation in each pixel/microhabitat (%)}
#'   \item{\emph{Silt}}{Percentage of silt  in each pixel/microhabitat (%)}
#'   \item{\emph{Sand}}{Percentage of sand  in each pixel/microhabitat (%)}
#'   \item{\emph{Fine.gravel}}{Percentage of fine gravel  in each pixel/microhabitat (%)}
#'   \item{\emph{Gravel}}{Percentage of gravel  in each pixel/microhabitat (%)}
#'   \item{\emph{Cobbles}}{Percentage of cobbles  in each pixel/microhabitat (%)}
#'   \item{\emph{Boulders}}{Percentage of boulders  in each pixel/microhabitat (%)}
#'   \item{\emph{Bed.rock}}{Percentage of bedrock  in each pixel/microhabitat (%)}
#' }
#'
#' @references
#' Mu\ifelse{html}{\out{&ntilde;}}{\enc{UTF-8}{ñ}}oz-Mas, R., Macian-Sorribes, H., Oliva-Paterna, F. J.,
#' Sangelantoni, L., Peano, D., Pulido-Velazquez, M., & Mart\ifelse{html}{\out{&iacute;}}{\enc{UTF-8}{í}}nez-Capel, F. (2024).
#' Adaptation measures to global change in the Serpis River Basin (Spain): An evaluation considering agricultural benefits,
#' environmental flows, and invasive fishes. \emph{Ecological Indicators}, 161, 111979.
#' DOI: 10.1016/j.ecolind.2024.111979
#'
#' @examples
#' data(Substrate.index.example.df)
#' summary(Substrate.index.example.df)
"Substrate.index.example.df"

#' Cover Dataset
#'
#' This dataset contains the presence (1) or absence (0) of various types of cover/shelter in every pixel/microhabitat within the study site in the Serpis River Basin (Spain),
#' where the hydraulic simulation was carried out.
#'
#' @format A data frame with 10 columns:
#' \describe{
#'   \item{x}{X coordinate of the study site}
#'   \item{y}{Y coordinate of the study site}
#'   \item{\emph{Leaves}}{Presence (1) or absence (0) of leaves as cover in each pixel/microhabitat }
#'   \item{\emph{Algae}}{Presence (1) or absence (0) of algae as cover in each pixel/microhabitat }
#'   \item{\emph{Root}}{Presence (1) or absence (0) of roots as cover in each pixel/microhabitat }
#'   \item{\emph{Aquatic.vegetation}}{Presence (1) or absence (0) of aquatic vegetation in each pixel/microhabitat }
#'   \item{\emph{Reed}}{Presence (1) or absence (0) of reeds and emergent vegetation in each pixel/microhabitat }
#'   \item{\emph{Wood}}{Presence (1) or absence (0) of woody debris and logs as cover in each pixel/microhabitat }
#'   \item{\emph{Sand}}{Presence (1) or absence (0) of sand in each pixel/microhabitat }
#'   \item{\emph{Rock}}{Presence (1) or absence (0) of rocks in each pixel/microhabitat }
#'   \item{\emph{Cave}}{Presence (1) or absence (0) of caves cover in each pixel/microhabitat }
#'   \item{\emph{Shade}}{Presence (1) or absence (0) of shade in each pixel/microhabitat }
#' }
#'
#' @references
#' Mu\ifelse{html}{\out{&ntilde;}}{\enc{UTF-8}{ñ}}oz-Mas, R., Macian-Sorribes, H., Oliva-Paterna, F. J.,
#' Sangelantoni, L., Peano, D., Pulido-Velazquez, M., & Mart\ifelse{html}{\out{&iacute;}}{\enc{UTF-8}{í}}nez-Capel, F. (2024).
#' Adaptation measures to global change in the Serpis River Basin (Spain): An evaluation considering agricultural benefits,
#' environmental flows, and invasive fishes. \emph{Ecological Indicators}, 161, 111979.
#' DOI: 10.1016/j.ecolind.2024.111979
#'
#' @examples
#' data(Cover.example.df)
#' summary(Cover.example.df)
"Cover.example.df"
