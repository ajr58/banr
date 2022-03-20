library(tibble)
library(dplyr)
library(pracma)

n <- 7L
TestData <-
  tibble::tibble(double = c(1.4, 2.4, 3.4, 4.4, 5.4, 6.4, 7.4),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n) )

Test1_expected <- TestData |>
  dplyr::mutate(double = sqrt(double),
         x = sqrt(x),
         integer = sqrt(integer))

TestData2 <-
  tibble::tibble(num = c(1, 2, 3, 4, 5),
                 doub = c(1.1, 1.1, 1.1, 1.1, 1.1),
                 factor = factor(c('a', 'b', 'c', 'd', 'd')))

Test2_expected <-
  tibble::tibble(num = c(3),
                 doub = c(1.1),
                 factor = c('d'))

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("is_numeric works", {
  expect_equal(mode(df_apply(TestData, .f = sqrt, .condition = is.numeric)), "list")
})

test_that("correct error", {
  expect_error(df_apply(TestData, .f = sqrt, .condition = mean), ".condition must return a logical type")
})

test_that("correct return", {
  expect_equal(df_apply(TestData, .f = sqrt, .condition = is.numeric), Test1_expected)
})

test_that("correct return", {
  expect_equal(df_apply(TestData2, .f = mean, .condition = is.numeric, .else = pracma::Mode), Test2_expected)
})
