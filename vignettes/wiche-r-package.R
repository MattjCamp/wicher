## ----warning = FALSE, message = FALSE, echo = TRUE-----------------------

library(wicher)
library(tidyverse)

head(wiche_graduate_projections)


## ----fig.width = 7, fig.height = 4, echo = TRUE--------------------------

library(ggplot2)

enrollments <- 
  wiche_graduate_projections %>% 
  filter(year %in% 2000:2010,
         location %in% "ca",
         race %in% c("white", "hispanic"),
         grade == "g") %>% 
  arrange(year, race)

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

enrollments <- 
  wiche_graduate_projections %>% 
  filter(year %in% 2005,
         location %in% "ca",
         race %in% c("white", "asian", "hispanic", "native", "black"),
         grade == "g") %>% 
  arrange(year, race)

ggplot(data = enrollments, aes(race, n)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("California Enrollment (2005)") +
  labs(x = "Academic Year", y = "Enrollment")


