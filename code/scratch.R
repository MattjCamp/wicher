# CHECK NULL

wb %>% filter(STABR == "WI",
              SURVYEAR == 2028,
              TYPE == "G") %>%
  as.data.frame()

w1 %>% filter(location == "wi",
              year == 2029,
              grade %in% c("8","9"),
              type == "p") %>%
  as.data.frame()

w2 %>% filter(location == "wi",
              year == 2029,
              grade %in% c("8","9"),
              type == "p") %>%
  as.data.frame()

w3 %>% filter(location == "wi",
              year == 2029,
              grade %in% c("8","9"),
              type == "p") %>%
  as.data.frame()

w4 %>% filter(location == "wi",
              year == 2029,
              grade %in% c("8","9"),
              race == "all",
              sector == "p") %>%
  as.data.frame()

wicher::wiche_graduate_projections %>%
  filter(location == "wi",
              year == 2029,
              grade %in% c("8","9"),
              race == "all",
              sector == "p") %>%
  as.data.frame()

wicher::wiche_graduate_projections %>%
  filter(location == "al",
              year == 2025,
              grade %in% c("1"),
              race == "all",
              sector == "p") %>%
  as.data.frame()


# WI

wb %>% filter(STABR == "WI",
              SURVYEAR == 2003,
              TYPE == "G") %>%
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

# CHECK LATER YEARS THAT SHOULD BE NULL

w1 %>% filter(location == "al",
              year %in% c(2025),
              grade == "1",
              type %in% c("all","p","np")) %>%
  as.data.frame()

w4 %>% filter(location == "al",
              year %in% c(2025),
              grade == "1",
              sector %in% c("all","p","np")) %>%
  as.data.frame()

