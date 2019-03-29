library("tidyverse")
library("GDAdata")

explore <- SpeedSki %>% 
  glimpse()

# summarize the quantitative variable 
explore %>% 
  select(Speed) %>% 
  summary()

# categorical variables levels and count
explore %>% count(Sex, Event)

explore %>% 
  count(Sex, Event) %>% 
  complete(Sex, Event, fill = list(n = 0)) %>% 
  arrange(desc(n))

# add a new category with one level
explore <- explore %>% 
  mutate(allevents = "All events")

ggplot(explore, aes(x = Speed, y = allevents)) +
  geom_point()
glimpse(explore)
