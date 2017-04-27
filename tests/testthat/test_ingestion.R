
library(tidyverse)
library(dbr)
library(testthat)
library(wicher)

context("DATA INGESTION")

test_that("INGESTION - FUNCTION(ROUNDING)", {

  # Rounding issues when working from the downloadable Excel file from the WICHE website.
  #   - Some cells (but not many) in the WICHE downloadable file are decimal values. It looks like in these
  #   - This difference is likely because the Wisconsin public value in the Excel downloadable file is
  #   63,250.5. Perhaps, this is getting truncated to 63,250 in your file instead of 63,251?


  # # DEBUGGING
  #
  # # RAW
  #
  # wb %>%
  #   filter(SURVYEAR == 2003,
  #          STABR == "WI",
  #          TYPE == "G") %>%
  #   select(STABR, SURVYEAR, TYPE, DPL) %>%
  #   as.data.frame()
  #
  # # STEP ONE
  #
  # w1 %>%
  #   filter(location == "wi",
  #          year == 2004,
  #          grade == "g")

  # w <- wiche_ingest_2016_enrollments("/code/All-Enrollment-and-Graduate-Projections-neh9.xlsx")
  #
  # d <- w %>% filter(location == "wi",
  #                   year == 2004,
  #                   sector == "p",
  #                   grade == "g",
  #                   race == "all")
  #
  # expect_equal(d$n, 63251)

})
