
library(tidyverse)
library(dbr)
library(testthat)

context("TEST NATIVE ERROR FIXED")

test_that("SHOULD NOT BE NULL for US", {

# Getting closer but still not matching. It looks like the only differences are
#   for United States, Public, American Indian/Alaska Native. You are having the
#   following values be a dash (-) while I am having them populated with values. I
#   summarized these instances below.
#
# Grade 5	2004_2005
# Grade 6	2002_2003, 2004_2005
# Grade 7	2004_2005
# Grade 8	2000_2001
# Grade 9	2005_2006
# Grade 11	2008_2009
# Grade 12	2005_2006, 2009_2010, 2014_2015 to 2031_2032
# Graduates	2005_2006, 2013_2014 to 2031_2032

  # # DEBUG
  #
  # file_location <- "All-Enrollment-and-Graduate-Projections-neh9.xlsx"
  #
  # d <-
  #   wb %>%
  #   filter(TYPE == "AM",
  #          SURVYEAR == 2004)
  #
  # d <-
  #   w1 %>%
  #   filter(type == "native",
  #          year == 2005,
  #          grade == "5")
  #
  # d <-
  #   w2 %>%
  #   filter(type == "native",
  #          year == 2005,
  #          grade == "5")
  #
  # d <-
  #   w3 %>%
  #   filter(type == "native",
  #          year == 2005,
  #          grade == "5",
  #          location == "us")
  #
  # d <-
  #   w4 %>%
  #   filter(grade == "5",
  #          year == 2005,
  #          race == "native",
  #          sector == "p",
  #          location == "us")

  # TEST STARTS HERE

  w <- wicher::wiche_enrollments

  d <- w %>% filter(grade == "5",
                    year == 2005,
                    race == "native",
                    sector == "p",
                    location == "us")

  expect_true(!is.na(d$n))

})

