#' Apply a function to columns of a data frame satisfying a condition
#'
#' @param .data a data frame.
#' @param .f a function to apply to columns of the data frame.
#' @param .condition a function returning boolean values.
#' @param .else a function to apply when .condition evaluates to false.
#' @param ... additional arguments to be passed to .f.
#'
#' @return A tibble with updated columns.
#' @export
#'
#' @examples
#'
#' n <- 7L
#' TestData <-
#'    tibble::tibble(double = c(1.4, 2.4, 3.4, 4.4, 5.4, 6.4, 7.4),
#'                x = 123400 / 10^(1L:n),
#'                integer = (1L:n) * (1L:n),
#'                character = LETTERS[1L:n],
#'                factor = factor(letters[1L:n]),
#'                logical = rep(c(TRUE, FALSE), length.out = n) )
#' df_apply(TestData, .f = sqrt, .condition = is.numeric)
#' df_apply(TestData, .f = mean, .condition = is.numeric, .else = pracma::Mode)
#' df_apply(USA_Annual_GDP, .f = round, .condition = is.numeric, .else = pracma::Mode, 3)
#' df_apply(F1racing, .f = mean, .condition = is.numeric)
#'
#' @importFrom tibble as_tibble

df_apply <- function(.data, .f, .condition = is.numeric, .else = identity, ...) {
    if(mode(.condition(3)) != "logical") stop('.condition must return a logical type')
    .data |>
    lapply(function(x) if (.condition(x)) .f(x, ...) else .else(x)) |>
    as_tibble()
}
