#' WICHE Grade Projections (2016)
#'
#' Grade forecasts from The Western Interstate Commission for Higher Education (WICHE)
#'
#' @format A data frame with 188,552 rows and 6 variables:
#' \describe{
#'   \item{location}{region, us or state abbreviation in lowercase}
#'   \item{sector}{identifies all, public or non-public schools}
#'   \item{race}{identifies all or particular races}
#'   \item{sector}{all schools, public schools or private schools}
#'   \item{grade}{grade level number or 'graduates'}
#'   \item{year}{academic year ending, so 2015-2016 would be expressed as 2016}
#'   \item{flag_p_g}{actual or projected enrollments for all grades except graduates (diplomas)}
#'   \item{flag_p_dpl}{actual or projected enrollments for graduates (diplomas)}
#'   \item{n}{the number of students enrolled}
#' }
#' @source {http://knocking.wiche.edu/data}
#' @examples
#'
#' library(wicher)
#' head(wiche_graduate_projections)
#'# A tibble: 6 × 8
#'  location sector     race grade  year flag_p_g flag_p_dpl       n
#'     <chr>  <chr>    <chr> <chr> <int>    <chr>      <chr>   <int>
#'1       us    all      all     1  2001        a          a 4112926
#'2       us      p    asian     1  2001        a          a  145272
#'3       us      p    black     1  2001        a          a  653734
#'4       us      p hispanic     1  2001        a          a  689669
#'5       us      p   native     1  2001        a          a   42576
#'6       us     np      all     1  2001        a          a  477261
"wiche_graduate_projections"
