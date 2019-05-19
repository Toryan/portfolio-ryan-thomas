#d1-tradebalance-carpentry

library("tidyverse") # loads the readr package 

df <- read_csv(file = "data-raw/d2-SFcrime-raw.csv")


df2 <- select(df,"Incident Time","Incident Category","Incident Subcategory","Incident Year") %>%
  rename(time = 'Incident Time', category = 'Incident Category', subcategory = 'Incident Subcategory', year = 'Incident Year') %>%
  filter(year == 2018) %>%
  drop_na() %>%
  mutate(category = stringr::str_replace(category, "Other Miscellaneous", "Other")) %>%
  mutate(category = stringr::str_replace(category, "Other Offenses", "Other")) %>%
  mutate(category = stringr::str_replace(category, "Suspicious Occ", 
                                         "Office of Citizen Complaints")) %>%
  mutate(category = stringr::str_replace(category, "Offences Against The Family And Children", 
                                         "Offences Against The Family"))

# df2$timeofday[df2$time <= 5*60^2] <- "night"
# df2$timeofday[df2$time > 5*60^2 & df2$time <= 11*60^2] <- "morning"
# df2$timeofday[df2$time > 11*60^2 & df2$time <= 17*60^2] <- "afternoon"
# df2$timeofday[df2$time > 17*60^2 & df2$time <= 23*60^2] <- "evening"
# df2$timeofday[df2$time > 23*60^2 & df2$time <= 24*60^2] <- "night"

df2 <- mutate(df2, hour = time/60/60) %>%
  mutate(hour = floor(hour))

df3 <- df2 %>% 
  count(category,hour) %>%
  complete(category, hour, fill = list(n = 0))

var_width = 10
df3 <- mutate(df3, category = str_wrap(category, width = var_width))

# df3 <- df2 %>% 
#   count(category,timeofday) %>%
#   complete(category, timeofday, fill = list(n = 0))
# 
# timeofday_levels <- c("morning", "afternoon", "evening", "night")
# 
df4 <- group_by(df3, category) %>%
  filter(median(n) > 30) %>%
  ungroup() %>%
  mutate(n = n/10) %>%
  mutate(category = as_factor(category)) %>%
  mutate(category = fct_reorder(category, n, .fun = mean, .desc = FALSE)) #%>%
  #mutate(timeofday = factor(timeofday, levels = timeofday_levels))
# 
# df4$timeofday <- fct_rev(df4$timeofday)


saveRDS(df4, "data/d2-SFcrime-data.rds")

