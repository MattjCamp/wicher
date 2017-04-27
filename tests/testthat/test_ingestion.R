
library(tidyverse)
library(dbr)
library(testthat)

context("DATA INGESTION")

test_that("ROUNDING - DATAFRAME", {

  w <- wicher::wiche_ingest_enrollments("./code/All-Enrollment-and-Graduate-Projections-neh9.xlsx")

  d <- w %>% filter(location == "wi", year == 2004,
                    sector == "p", grade == "g",
                    race == "all")

  expect_equal(d$n, 63251)

})
