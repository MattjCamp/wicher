#' WICHE Enrollments (2016)
#'
#' Grade forecasts from The Western Interstate Commission for Higher Education (WICHE)
#'
#' @format A data frame with 186,368 rows and 7 variables:
#' \describe{
#'   \item{location}{region, us or state abbreviation in lowercase}
#'   \item{sector}{identifies all, public or non-public schools}
#'   \item{race}{identifies all or particular races}
#'   \item{sector}{all schools, public schools or private schools}
#'   \item{grade}{grade level number or 'graduates'}
#'   \item{year}{academic year ending, so 2015-2016 would be expressed as 2016}
#'   \item{actual}{are these actual or projected enrollments}
#'   \item{n}{the number of students enrolled}
#' }
#' @source {http://knocking.wiche.edu/data}
#' @examples
#'
#' library(wicher)
#' wiche_enrollments
#'
#` A tibble: 6 × 7
#`   location sector     race grade  year actual       n
#`      <chr>  <chr>    <chr> <chr> <int>  <lgl>   <int>
#` 1       us    all      all     1  2001   TRUE 4112926
#` 2       us      p    asian     1  2001   TRUE  145272
#` 3       us      p    black     1  2001   TRUE  653734
#` 4       us      p hispanic     1  2001   TRUE  689669
#` 5       us      p   native     1  2001   TRUE   42576
#` 6       us     np      all     1  2001   TRUE  477261
"wiche_enrollments"
