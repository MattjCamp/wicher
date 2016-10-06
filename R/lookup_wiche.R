
#' Lookup WICHE Projections
#'
#' Quick lookup function for the WICHE table
#' @keywords WICHE, projections, high school cohort
#' @param location state abbreviation in lowercase or 'us' for the entire united states
#' @param sector identifies all, public or non-public schools
#' @param race identifies all or particular races/ethnicity
#' @param grade grade level number or 'graduates'
#' @param year academic year ending, so 2015-2016 would be expresses as 2016
#' @param n the estimate of the number of students enrolled
#' @return A data frame with:
#' @export
#' @examples
#'
#' lookup_wiche(year = 2012:2016)
#'
#'   location sector  race     grade year n
#' 1       us public  all          8 2012 3053230
#' 2       us public  all          9 2013 3022879
#' 3       us public  all         10 2014 3022879
#' 4       us public  all         11 2015 2973914
#' 5       us public  all         12 2016 3000793

lookup_wiche <- function(location = "us",
                         sector = "public",
                         race = "all",
                         gender = "all",
                         grade = "graduates",
                         year = NULL){

  library(stringr)
  library(coderr)
  library(sqldf)

  if (is.null(year))
    year <- as.numeric(str_match(Sys.Date(), "[0-9]{4}"))

  location <- sprintf("location IN %s",
                      code_vector_to_csv_list(location, add.quotes = TRUE, enclose.in.parenthesis = TRUE))
  sector <- sprintf("sector IN %s",
                    code_vector_to_csv_list(sector, add.quotes = TRUE, enclose.in.parenthesis = TRUE))
  gender <- sprintf("gender IN %s",
                    code_vector_to_csv_list(gender, add.quotes = TRUE, enclose.in.parenthesis = TRUE))
  race <- sprintf("race IN %s",
                  code_vector_to_csv_list(race, add.quotes = TRUE, enclose.in.parenthesis = TRUE))
  grade <- sprintf("grade IN %s",
                   code_vector_to_csv_list(grade, add.quotes = TRUE, enclose.in.parenthesis = TRUE))
  year <- sprintf("year IN %s",
                   code_vector_to_csv_list(year, add.quotes = FALSE, enclose.in.parenthesis = TRUE))

  sql <- code_sql_select(table_or_sql = "wiche_2013",
                         select.cols = "*",
                         filters = c(location,sector,race,gender,grade,year))

  sql %>% sqldf()

}
