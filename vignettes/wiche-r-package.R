## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

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


## ------------------------------------------------------------------------

wiche_us <- lookup_wiche(year = 2006, gender = c("f", "m"))
ggplot(data = wiche_us, aes(gender, n)) + 
  geom_bar(stat = "identity", position = "dodge")

wiche_us <- lookup_wiche(year = 2006,
                         race = c("white", "asian", "hispanic", "native", "black"))
ggplot(data = wiche_us, aes(race, n)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  xlab("Race/Ethnicty") + 
  ylab("Projection") +
  ggtitle("Wiche Projections")


