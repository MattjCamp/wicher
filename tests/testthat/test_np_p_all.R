
library(tidyverse)
library(dbr)
library(testthat)

context("SECTOR ROLLUP PROBLEMS")

test_that("Rounding Works: Dataframe", {

  w <- wicher::wiche_graduate_projections

  d <- w %>% filter(location == "al", year == 2012,
               sector %in% c("all","p","np"),
               race == "all", grade == "g")

  expect_equal(d$n, c(50263,45394,4869))

})

test_that("Rounding Works: SQLite Database", {

  db_file <- system.file("wicher",
                         "wiche_graduate_projections.db",
                         package = "wicher")
  conn <- init_sqlite(db_file)

  w <-
    "select * from wiche_graduate_projections" %>%
    pull_data(conn)

  d <- w %>% filter(location == "al", year == 2012,
               sector %in% c("all","p","np"),
               race == "all", grade == "g")

  expect_equal(d$n, c(50263,45394,4869))

})
