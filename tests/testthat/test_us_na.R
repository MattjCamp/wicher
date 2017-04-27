
library(tidyverse)
library(dbr)
library(testthat)

context("TEST AGGRAGTED US SHOWS NA AND NOT 0 WHEN NULL")

test_that("Aggragated values when NULL for US", {

  w <- wicher::wiche_graduate_projections

  d <- w %>% filter(grade == "1",
                    year == 2022,
                    race == "all",
                    sector == "all",
                    location == "us")

  expect_true(is.na(d$n))

})

