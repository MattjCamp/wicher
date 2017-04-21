
# WI

wb %>% filter(STABR == "WI", SURVYEAR == 2003, TYPE == "G") %>%
  as.data.frame()

w1 %>% filter(location == "wi", year == 2004,
              type == "p", grade == "g") %>%
  as.data.frame()

d <- w1 %>% filter(location == "wi", year == 2004,
              grade == "g") %>%
  as.data.frame()


# P,NP, All
# a.	Example: Alabama graduates for AY2011_2012 for Race_Ethnicity = ‘All’ and PubType = ‘All’
# i.	I have 50,263 whereas you have 45,394. 45,394 is the value for Public graduates for Alabama.
# 4,869 is the value for Non-Public graduates. Therefore, All graduates would be 45,394 + 4,869 = 50,263.
# It appears the Public values are being copied as the All values in your file.

w2 %>% filter(location == "al", year == 2012,
              type %in% c("all","p","np"), grade == "g") %>%
  as.data.frame()

# CHECK ACTUAL FLAG CALC

wb %>% filter(STABR == "WI", SURVYEAR %in% c(2012,2013,2014), TYPE == "G") %>%
  as.data.frame()

w1 %>% filter(location == "wi", year %in% c(2013,2014,2015),
              grade == "12", type == "p") %>%
  as.data.frame()


wb %>% filter(STABR == "WI", SURVYEAR %in% c(2012,2013,2014), TYPE == "G") %>%
  as.data.frame()

w1 %>% filter(location == "wi", year %in% c(2013,2014,2015),
              grade == "g", type == "p") %>%
  as.data.frame()

w1 %>% filter(location == "wi", year %in% c(2010),
              grade == "g", type == "np") %>%
  as.data.frame()

