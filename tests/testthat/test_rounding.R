
library(tidyverse)
library(dbr)
library(testthat)

context("INPUT DATA PROBLEMS")

test_that("ROUNDING - DATAFRAME", {

  w <- wicher::wiche_enrollments

  d <- w %>% filter(location == "wi",
                    year == 2004,
                    sector == "p",
                    grade == "g",
                    race == "all")

  expect_equal(d$n, 63251)

})

test_that("ROUNDING - SQLITE", {

  db_file <- system.file("wicher",
                         "wiche.db",
                         package = "wicher")
  conn <- init_sqlite(db_file)

  w <-
    "select * from enrollments" %>%
    pull_data(conn)

  close_connection(conn)

  d <- w %>% filter(location == "wi",
                    year == 2004,
                    sector == "p",
                    grade == "g",
                    race == "all")

  expect_equal(d$n, 63251)

})
