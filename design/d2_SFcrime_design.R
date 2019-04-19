#d1-tradebalance-design

library("tidyverse") # loads the readr package \
library("graphclassmate")


df <- readRDS("data/d2-SFcrime-data.rds")

ggplot(df, aes(x = timeofday, y = n)) +
  geom_point() +
  
  facet_wrap(vars(category), ncol = 1, as.table = FALSE) +
  #scale_x_continuous(trans = 'log2', breaks = c(2,4,8)) +
  scale_x_log10(breaks = c(0,1, 10, 100))+
  labs(x = "Number of Incidents (Hundreds) log-10 scale", y = NULL,
       caption = "Source: San Francisco Police Department") 

ggsave(filename = "d2-SFcrime.png",
       path    = "figures",
       width   = 9,
       height  = 5.3,
       units   = "in",
       dpi     = 400)
