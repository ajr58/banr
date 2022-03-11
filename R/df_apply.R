df_apply <- function(.data, .f, .condition, .else, ...) {
    .data |>
    lapply(function(x) if (.condition(x)) .f(x, ...) else .else(x)) |>
    as_tibble()
}
