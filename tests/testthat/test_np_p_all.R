
library(tidyverse)
library(dbr)
library(testthat)

context("SECTOR ROLLUP PROBLEMS")

test_that("SECTOR ROLLED UP CORRECTLY", {

  w <- wicher::wiche_enrollments

  d <- w %>% filter(location == "al", year == 2012,
               sector %in% c("all","p","np"),
               race == "all", grade == "g")

  expect_equal(d$n, c(50263,45394,4869))

})
