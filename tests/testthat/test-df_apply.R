library(tibble)
n <- 7L
TestData <-
  tibble::tibble( double = rnorm(n, 100, 10),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n) )

TestData2 <-
  tibble::tibble(test = c(1, 2, 3, 4, 5, 6, 7))

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("is_numeric works", {
  expect_equal(mode(df_apply(TestData, .f = sqrt, .condition = is.numeric)), "list")
})

test_that("correct error", {
  expect_error(df_apply(TestData, .f = sqrt, .condition = mean), ".condition must return a logical type")
})
