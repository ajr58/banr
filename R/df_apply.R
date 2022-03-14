#' @importFrom tibble as_tibble

df_apply <- function(.data, .f, .condition, .else, ...) {
    .data |>
    lapply(function(x) if (.condition(x)) .f(x, ...) else .else(x)) |>
    tibble::as_tibble()
}
