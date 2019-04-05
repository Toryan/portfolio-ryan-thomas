#d1-tradebalance-explore

library("tidyverse") # loads the readr package 
library("graphclassmate")

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
                                         "Offences Against The Family (Non-violent"))

df2$timeofday[df2$time <= 5*60^2] <- "night"
df2$timeofday[df2$time > 5*60^2 & df2$time <= 11*60^2] <- "morning"
df2$timeofday[df2$time > 11*60^2 & df2$time <= 17*60^2] <- "afternoon"
df2$timeofday[df2$time > 17*60^2 & df2$time <= 23*60^2] <- "evening"
df2$timeofday[df2$time > 23*60^2 & df2$time <= 24*60^2] <- "night"

df3 <- df2 %>% 
  count(category,timeofday) %>%
  complete(category, timeofday, fill = list(n = 0))

timeofday_levels <- c("morning", "afternoon", "evening", "night")

df4 <- group_by(df3, category) %>%
  filter(median(n) > 100) %>%
  ungroup() %>%
  mutate(n = n/100) %>%
  mutate(category = as_factor(category)) %>% 
  mutate(category = fct_reorder(category, n, .fun = mean, .desc = FALSE)) %>%
  mutate(timeofday = factor(timeofday, levels = timeofday_levels))
df4$timeofday <- fct_rev(df4$timeofday)

ggplot(df4, aes(x = n, y = timeofday)) +
  geom_point() +
  facet_wrap(vars(category), as.table = FALSE) +
  #scale_x_continuous(trans = 'log2', breaks = c(2,4,8)) +
  scale_x_log10(breaks = c(0,1, 10, 100))+
  labs(x = "Population (Hundreds) log-10 scale", y = NULL,
       caption = "Source: San Francisco Police Department") 

