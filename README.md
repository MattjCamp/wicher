# WICHE Enrollment Projections

`wicher` is a package used to make working with the WICHE enrollment
projections easier in R. We generally use WICHE enrollments to figure
out the percentage of students who participate in our assessments.

We also use WICHE to visualize demographics in our Excel dashboards so I'm
putting some examples of visualizing in R below. I think this might make it
easier to prototype the graphics before trying to work them into the dashboard.

## Installing WICHE R Package

You can install `wicher` from my github repository like
this:

``` r

# MAKE SURE YOU HAVE DEVTOOLS INSTALLED AND REFERENCED

install.packages("devtools")
library(devtools)

# USE DEVTOOLS TO INSTALL THE WICHE PACKAGE 

install_github('mattjcamp/wicher','mattjcamp')
library(wicher)

```

You will need to install the packages above if you want to reproduce 
these examples.

## What's In WICHER?

### Projections Dataframe

`wiche_graduate_projections` is the built in dataframe that comes with
this package. It looks like this:

``` r

library(wicher)
library(tidyverse)

head(wiche_graduate_projections)

```

    # A tibble: 6 × 8
      location sector     race grade  year flag_p_g flag_p_dpl       n
         <chr>  <chr>    <chr> <chr> <int>    <chr>      <chr>   <int>
    1       us    all      all     1  2001        a          a 4112926
    2       us      p    asian     1  2001        a          a  145272
    3       us      p    black     1  2001        a          a  653734
    4       us      p hispanic     1  2001        a          a  689669
    5       us      p   native     1  2001        a          a   42576
    6       us     np      all     1  2001        a          a  477261

### SQLite Database

I also saved this dataframe in a local SQLite database. If you would like
to use the database, you could do with with `dbr` like this:

``` r

library(dbr)

db_file <- system.file("wicher",
                       "wiche_graduate_projections.db",
                       package = "wicher")
conn <- init_sqlite(db_file)

"select * from wiche_graduate_projections limit 10" %>% 
  pull_data(conn)

close_connection(conn)

```

    # A tibble: 10 × 8
       location sector     race grade  year flag_p_g flag_p_dpl       n
          <chr>  <chr>    <chr> <chr> <int>    <chr>      <chr>   <int>
    1        us    all      all     1  2001        a          a 4112926
    2        us      p    asian     1  2001        a          a  145272
    3        us      p    black     1  2001        a          a  653734
    4        us      p hispanic     1  2001        a          a  689669
    5        us      p   native     1  2001        a          a   42576
    6        us     np      all     1  2001        a          a  477261
    7        us      p      all     1  2001        a          a 3635665
    8        us      p    white     1  2001        a          a 2099255
    9        us    all      all    10  2001        a          a 3818375
    10       us      p    asian    10  2001        a          a  154097
