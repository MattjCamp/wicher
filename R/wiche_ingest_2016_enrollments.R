
#' Ingest 2016 Enrollment Projections
#'
#' Code reads in enrollments in the WICHE spreadsheet and puts them into
#' wicher format. This was used to create the `wiche_graduate_projects`
#' dataframe
#' The raw data can be located on the WICHE
#' Knocking at the College Door(http://knocking.wiche.edu/data)
#'
#' @param file_location where the workbook is located
#' @export
#'

wiche_ingest_2016_enrollments <- function(file_location){

  library(tidyverse)
  library(stringr)
  library(datapointsr)
  library(cohortr)
  library(readxl)

  wb <- read_excel(path = file_location,
                   sheet = "Projections")

  # Clean Dataset
  #
  # Increment the year by 1 to make it *year ending*.  Adapt the
  # **TYPE** field and then normalize the whole thing.

  w1 <- wb[, 1:18]

  w1 <-
    w1 %>%
    mutate(STABR = str_to_lower(STABR),
           TYPE = ifelse(TYPE == "G", "p", TYPE),
           TYPE = ifelse(TYPE == "NP", "np", TYPE),
           TYPE = ifelse(TYPE == "AM", "native", TYPE),
           TYPE = ifelse(TYPE == "AS", "asian", TYPE),
           TYPE = ifelse(TYPE == "BL", "black", TYPE),
           TYPE = ifelse(TYPE == "WH", "white", TYPE),
           TYPE = ifelse(TYPE == "HI", "hispanic", TYPE),
           TYPE = ifelse(TYPE == "HP", "pacific", TYPE),
           TYPE = ifelse(TYPE == "TR", "two_more", TYPE),
           STABR = ifelse(STABR == "_m", "m", STABR),
           STABR = ifelse(STABR == "_w", "w", STABR),
           STABR = ifelse(STABR == "_s", "s", STABR),
           STABR = ifelse(STABR == "_n", "n", STABR),
           STABR = ifelse(STABR == "_u", "u", STABR),
           SURVYEAR = SURVYEAR + 1) %>%
    filter(STABR != "u") %>%
    long(c(1,2,3,17,18)) %>%
    mutate(variable = ifelse(variable == "G01", "1", variable),
           variable = ifelse(variable == "G02", "2", variable),
           variable = ifelse(variable == "G03", "3", variable),
           variable = ifelse(variable == "G04", "4", variable),
           variable = ifelse(variable == "G05", "5", variable),
           variable = ifelse(variable == "G06", "6", variable),
           variable = ifelse(variable == "G07", "7", variable),
           variable = ifelse(variable == "G08", "8", variable),
           variable = ifelse(variable == "G09", "9", variable),
           variable = ifelse(variable == "G10", "10", variable),
           variable = ifelse(variable == "G11", "11", variable),
           variable = ifelse(variable == "G12", "12", variable),
           variable = ifelse(variable == "DPL", "g", variable)) %>%
    mutate(SURVYEAR = as.integer(SURVYEAR),
           value = as.integer(round(value)),
           actual = NA,
           actual = ifelse(variable == "g" & FLAG_P_DPL == "P",
                           FALSE, actual),
           actual = ifelse(variable == "g" & FLAG_P_DPL == "A",
                           TRUE, actual),
           actual = ifelse(variable != "g" & FLAG_P_G == "P",
                           FALSE, actual),
           actual = ifelse(variable != "g" & FLAG_P_G == "A",
                           TRUE, actual)) %>%
    select(location = STABR,
           year = SURVYEAR,
           grade = variable,
           TYPE,
           actual,
           n = value)

  names(w1) <- str_to_lower(names(w1))

  # Calculate Total Group
  # Calculate the sum of private and public schools

  w2 <-
    w1 %>%
    filter(type %in% c("p","np")) %>%
    group_by(location, year, grade) %>%
    summarise(n = sum(n, na.rm = FALSE),
              actual = min(actual)) %>%
    mutate(type = "all",
           actual = ifelse(actual == 0, FALSE, TRUE)) %>%
    select(location, year, grade, type, actual,n) %>%
    bind_rows(w1)

  # Calculate United States Totals

  # We sum these up because we do not use the **Nation* tab that WICHE
  # provides to us. We do something similar
  # to the last step except that now we roll up location.

  w3 <-
    w2 %>%
    filter(!location %in% c("n","s","w","m")) %>%
    group_by(year, grade, type, actual) %>%
    # summarise(n = sum(n, na.rm = FALSE)) %>%
    summarise(all_na = all(is.na(n)),
              n = sum(n, na.rm = TRUE)) %>%
    mutate(n = ifelse(all_na, NA, n)) %>%
    mutate(location = "us") %>%
    select(location, year, grade, type, actual,n) %>%
    bind_rows(w2)

  # Pull Out Race/Sector

  w4 <-
    w3 %>%
    ungroup() %>%
    mutate(race = ifelse(!type %in% c("all", "p", "np"), type, "all"),
           sector = ifelse(type %in% c("all", "p", "np"), type, "p")) %>%
    select(location, sector, race, grade, year, actual, n) %>%
    ungroup()

  w4

}
