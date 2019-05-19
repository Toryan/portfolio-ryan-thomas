#d1-tradebalance-design

library("tidyverse") # loads the readr package \
library("graphclassmate")
library("stringr")


df4 <- readRDS("data/d2-SFcrime-data.rds")



ggplot(df4, aes(x = hour, y = n)) +
  geom_point() +
  facet_wrap(vars(category), ncol = 11, as.table = FALSE) +
  scale_x_continuous(breaks = c(0,8,16)) +
  scale_y_continuous(trans = 'log2') +
  labs( x = "Hour of the day", y = "Number of Incidents (tens) log-2 scale",
        title = "San Fracisco Police Incidents by Time of Day, 2018",
       caption = "Source: San Francisco Police Department") +
  theme_graphclass()

ggsave(filename = "d2-SFcrime.png",
       path    = "figures",
       width   = 11.8,
       height  = 5.3,
       units   = "in",
       dpi     = 400)
