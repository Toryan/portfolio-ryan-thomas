#d1-tradebalance-design

library("tidyverse") # loads the readr package \
library("graphclassmate")


df10 <- readRDS("data/d3_Propeller_data.rds")

ggplot(data = df10, aes(x = rpmk, y = CT)) +
  geom_jitter() +
  facet_wrap(vars(name), as.table = FALSE, ncol = 9) +
  theme_graphclass(font_size = 8) +
  labs(x = "Propeller Angular Velocity (Thousand RPM)", 
       y = "Thrust Coefficient",
       title = "Comparison of Small-Scale Propeller Brands", 
       subtitle = "Static test, 9 inch diameter, 6 degree pitch", 
       caption = "Source: UIUC Propeller Database, University of Illinois at Urbana-Champaign"
  ) +
  theme(text = element_text(size=8))
  #coord_fixed(60/1)


ggsave(filename = "d3_Propeller.png",
       path    = "figures",
       width   = 4.6,
       height  = 5,
       units   = "in",
       dpi     = 400)


