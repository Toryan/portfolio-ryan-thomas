#d1-tradebalance-design

library("tidyverse") # loads the readr package \
library("graphclassmate")


df <- readRDS("data/d1-tradebalance-data.rds")
df_outlier <- readRDS("data/d1-tradebalance-data-outlier.rds")

cube_trans <- scales::trans_new("Cube",
                                transform=function(x) sign(x)*(abs(x))^(1/3),
                                inverse=function(x) sign(x)*abs(x)^3)

ggplot(df, aes(x = Commodity , y = balance)) +
  geom_boxplot(outlier.shape = NA) +
  coord_flip() +
  geom_jitter(data = df_outlier, width = .075, height = .075, alpha = 0.25) +
  labs(x = NULL,
       y = "Balance of trade (Billions of dollars), cube scale",
       caption = "Source: BEA") +
  scale_y_continuous(trans = cube_trans,
                     limits = c(-200e9,50e9), 
                     breaks = c(100e9,50e9,0,-50e9, -100e9, -150e9,-200e9),
                     label = c("$100", "$50", "$0","-$50", "-$100", "-$150","-$200")) +
  geom_text(aes(label=ifelse(balance< -25e9,as.character(Country),'')),hjust=.9,vjust= -.7, size = 3) +
  geom_text(aes(label=ifelse(balance> 15e9,as.character(Country),'')),hjust=-.1,vjust= 0, size = 3) 

ggsave(filename = "d1-tradebalance.png",
       path    = "figures",
       width   = 10,
       height  = 8,
       units   = "in",
       dpi     = 400)
