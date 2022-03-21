#' Statuses of Formula 1 races
#'
#' A dataset containing attributes of Formula 1 races over the years.
#'
#' @format A data frame with 139 rows and 3 variables:
#' \describe{
#'   \item{status}{finished or accident/mechanical failure status of the race}
#'   \item{status_sum}{count of the statuses for a given year}
#'   \item{year}{year the race took place}
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
#'
#' @example
#'
#' library(ggplot2)
#' library(patchwork)
#' plot1 <- ggplot(food_consumption_total, aes(x = total_consumption, y = food_category, fill = food_type)) +
#'  geom_bar(stat="identity") +
#'  scale_y_discrete(limits = positions) +
#'  theme(legend.position = "top")
#' plot2 <- plot2 <- ggplot(food_consumption_total, aes(x = total_emission, y = food_category, fill = food_type)) +
#' geom_bar(stat="identity") +
#' scale_y_discrete(limits = positions) +
#' theme(legend.position = "none", axis.text.y = element_blank())
#' plot1 / plot2
"food_consumption_total"

#' Annual GDP data for the USA.
#'
#' A dataset containing the annual nominal GDP for the USA, divided up into
#' many categories (1929-2020).
#'
#' @format A data frame with 92 rows and 31 variables:
#' \describe{
#'   \item{Year}{year}
#'   \item{GDP}{total nominal GDP, in millions of dollars}
#'   \item{Consumption}{total spent on goods/services, in millions of dollars}
#'   \item{Investment}{total spent on investment, in millions of dollars}
#'   \item{Government.Spending}{total spent by government, in millions of dollars}
#'   \item{Net.Exports}{total exports minus total imports, in millions of dollars}
#'   \item{Consumption.prop}{Consumption / GDP}
#'   \item{Investment.prop}{Investment / GDP}
#'   \item{Government.Spending.prop}{Government.Spending / GDP}
#'   \item{Net.Exports.prop}{Net.Exports / GDP}
#'   ...
#' }
#' @source \url{https://apps.bea.gov/iTable/iTable.cfm?reqid=19&step=2}
#'
#' @example
#'
#' library(plotly)
#' my_viz1 <- USA_Annual_GDP %>%
#' plot_ly() %>%
#'   add_trace(x = ~Year, y = ~GDP, type = "scatter", mode = "lines", name = "Nominal GDP\nBy Year",
#'             fill = "tozeroy", fillcolor = "rgba(168, 216, 234, 0.5)",
#'             hovertemplate = '<b>Year</b>: %{x}<br><b>NGDP</b>: $%{y}<br><i>(value in millions of USD)</i>') %>%
#'   layout(title = list(text = "Nominal GDP by Year", font = list(size = 22), y = 0.99),
#'          yaxis = list(title = "Nominal GDP (millions of USD)"),
#'          xaxis = list(rangeslider = list(type = "date")))
#'
#' my_viz1
"USA_Annual_GDP"
