
library(tidyverse)
library(dbr)
library(testthat)

context("NA BEING HANDLED CORRECTLY")

test_that("US IS NULL LATER YEARS", {

  w <- wicher::wiche_enrollments

  d <- w %>% filter(grade == "1",
                    year == 2022,
                    race == "all",
                    sector == "all",
                    location == "us")

  expect_true(is.na(d$n))

})

