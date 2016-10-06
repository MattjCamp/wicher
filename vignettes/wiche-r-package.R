## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

library(wicher)

head(wiche_2013)


## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

lookup_wiche(year = 2012:2016,
             gender = c("f", "m"))


## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

lookup_wiche(location = c("pa","ny"),
             year = 2012:2016,
             gender = c("f", "m"))


## ----fig.width = 7, fig.height = 4, echo = TRUE--------------------------

library(ggplot2)

enrollments <- lookup_wiche(year = 2000:2010,
                            location = "ca",
                            race = c("white", "hispanic"))

qplot(year, n, data = enrollments, 
      color = race, 
      geom = c("point", "smooth"),
      main = "California Enrollment",
      xlab = "Academic Year", 
      ylab = "Enrollment")


## ----fig.width = 7, fig.height = 4, echo = TRUE--------------------------

ggplot(enrollments, aes(x = as.character(year), y = n, group = race)) +
  geom_smooth(aes(color = race)) +
  geom_point(aes(color = race)) + 
  ggtitle("California Enrollment") +
  labs(x = "Academic Year", y = "Enrollment")


## ----fig.width = 7, fig.height = 4, echo = TRUE--------------------------

enrollments <- lookup_wiche(year = 2000,
                            location = "ca",
                            race = c("white", "asian", "hispanic", "native", "black"))

ggplot(data = enrollments, aes(race, n)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle("California Enrollment (2000)") +
  labs(x = "Academic Year", y = "Enrollment")


## ----fig.width = 7, fig.height = 4, echo = TRUE--------------------------

enrollments <- lookup_wiche(year = 2010,
                            location = "ca",
                            race = c("white", "asian", "hispanic", "native", "black"))

ggplot(data = enrollments, aes(race, n)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle("California Enrollment (2010)") +
  labs(x = "Academic Year", y = "Enrollment")


