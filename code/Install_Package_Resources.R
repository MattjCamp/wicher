
library(devtools)
library(tidyverse)

# download.file(url = "http://knocking.wiche.edu/s/All-Enrollment-and-Graduate-Projections-neh9.xlsx",
#               destfile = "All-Enrollment-and-Graduate-Projections-neh9.xlsx",
#               mode = "wb")

wiche_enrollments <- wiche_ingest_2016_enrollments("All-Enrollment-and-Graduate-Projections-neh9.xlsx")

use_data(wiche_enrollments,
         overwrite = TRUE)

library(dbr)

db_file <- system.file("wicher",
                       "wiche.db",
                       package = "wicher")
# conn <- init_sqlite(db_file)

conn <- init_sqlite()

post_data(df = wiche_enrollments,
          table_name = "enrollments",
          conn = conn)

close_connection(conn)

devtools::use_vignette("wiche-r-package")
