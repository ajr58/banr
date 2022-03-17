#' Apply a function to columns of a data frame satisfying a condition
#'
#' @param .data a data frame.
#' @param .f a function to apply to columns of the data frame.
#' @param .condition a function returning boolean values.
#' @param .else a function to apply when .condition evaluates to false.
#' @param ... additional arguments to be passed to .f.
#'
#' @return A tibble with updated columns.
#'
#' @examples
#'
#' @importFrom tibble as_tibble

df_apply <- function(.data, .f, .condition = is.numeric, .else = identity, ...) {
    .data |>
    lapply(function(x) if (.condition(x)) .f(x, ...) else .else(x)) |>
    as_tibble()
}
