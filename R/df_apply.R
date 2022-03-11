df_apply <- function(.data, .fun, .condition, .else,...) {
    .data |>
    lapply(function(x) if (.condition(x)) .fun(x,...) else x) |>
    as_tibble()
}
