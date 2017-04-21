
library(tidyverse)
library(dbr)
library(testthat)

context("INPUT DATA ISSUES")

test_that("Rounding Works: Dataframe", {

  w <- wicher::wiche_graduate_projections

  d <- w %>% filter(location == "wi", year == 2004,
                    sector == "p", grade == "g",
                    race == "all")

  expect_equal(d$n, 63251)

})

test_that("Rounding Works: SQLite Database", {

  db_file <- system.file("wicher",
                         "wiche_graduate_projections.db",
                         package = "wicher")
  conn <- init_sqlite(db_file)

  w <-
    "select * from wiche_graduate_projections" %>%
    pull_data(conn)

  d <- w %>% filter(location == "wi", year == 2004,
                    sector == "p", grade == "g",
                    race == "all")

  expect_equal(d$n, 63251)

})
