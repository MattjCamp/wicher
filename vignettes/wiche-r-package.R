## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

library(wicher)

enrollments <- lookup_wiche(year = 2012:2016, gender = c("f", "m"))


## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

library(ggplot2)

enrollments <- lookup_wiche(year = 2006:2026, gender = c("f", "m"))

qplot(year, n, data = enrollments, 
      color = gender, 
      geom = c("point", "smooth"),
      main = "WICHE Projections",
      xlab = "Academic Year", 
      ylab = "Projection")


