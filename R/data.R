#' Statuses of Formula 1 races
#'
#' A dataset containing attributes of Formula 1 races over the years.
#'
#' @format A data frame with 139 rows and 3 variables:
#' \describe{
#'   \item{status}{finished or accident/mechanical failure}
#'   \item{status_sum}{count of the statuses for a given year}
#'   ...
#' }
#' @source \url{http://ergast.com/mrd/db/#csv/}
"F1racing"

#' Food Data of Animal and non-Animal Products
#'
#' A dataset containing the global consumption and carbon emissions of Animal
#' and non-Animal products.
#'
#' @format A data frame with 2 rows and 6 variables:
#' \describe{
#'   \item{food_type}{Animal Product or non-Animal Product}
#'   \item{total_consumption}{global consumption, in kg/person/year}
#'   \item{total_emission}{global CO2 emission, in kg/person/year}
#'   \item{perc_consumption}{percentage of total global food consumption}
#'   \item{perc_emission}{percentage of total global food CO2 emission}
#'   \item{% of Total}{placeholder for graph label}
#'   ...
#' }
#' @source \url{https://www.nu3.de/blogs/nutrition/food-carbon-footprint-index-2018}
#'
#' @example
#'
#' library(ggplot2)
#' library(patchwork)
#' plot1 <- ggplot(food_consumption_grouped, aes(fill=food_type, y=perc_consumption, x=`% of Total`)) +
#'     geom_bar(position="fill", stat="identity") + coord_flip()
#' plot2 <- ggplot(food_consumption_grouped, aes(fill=food_type, y=perc_emission, x=`% of Total`)) +
#'     geom_bar(position="fill", stat="identity") + coord_flip()
#' plot1 / plot2
"food_consumption_grouped"

#' Food Data of All Food Groups
#'
#' A dataset containing the global consumption and carbon emissions of
#' different Food Groups
#'
#' @format A data frame with 11 rows and 4 variables:
#' \describe{
#'   \item{food_category}{food group}
#'   \item{food_type}{Animal Product or non-Animal Product}
#'   \item{total_consumption}{global consumption, in kg/person/year}
#'   \item{total_emission}{global CO2 emission, in kg/person/year}
#'   ...
#' }
#' @source \url{https://www.nu3.de/blogs/nutrition/food-carbon-footprint-index-2018}
"food_consumption_total"

#' Prices of 50,000 round cut diamonds.
#'
#' A dataset containing the prices and other attributes of almost 54,000
#' diamonds.
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{http://www.diamondse.info/}
"USA_Annual_GDP"
