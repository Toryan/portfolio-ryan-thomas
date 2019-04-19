#d1-tradebalance-design

library("tidyverse") # loads the readr package \
library("graphclassmate")


df10 <- readRDS("data/d3_Propeller_data.rds")

ggplot(data = df10, aes(x = rpmk, y = CT)) +
  geom_jitter() +
  facet_wrap(vars(name), as.table = FALSE) +
  theme_graphclass() +
  labs(x = "Propeller Angular Velocity (Thousand RPM)", 
       y = "Thrust Coefficient",
       title = "Comparison of Small-Scale Propeller Brands", 
       subtitle = "Static test, 9 inch diameter, 6 degree pitch", 
       caption = "Source: UIUC Propeller Database, University of Illinois at Urbana-Champaign"
  )


ggsave(filename = "d3_Propeller.png",
       path    = "figures",
       width   = 5.7,
       height  = 6,
       units   = "in",
       dpi     = 400)


