#d1-tradebalance-design

library("tidyverse") # loads the readr package \
library("graphclassmate")


df <- readRDS("data/d1-tradebalance-data.rds")
df_outlier <- readRDS("data/d1-tradebalance-data-outlier.rds")

df <- mutate(df, Commodity = fct_reorder(Commodity, balance, .fun = min, .desc = FALSE))

df2 <- filter(df, Country %in% c('Mexico','Canada','China','Japan','Ireland')) %>%
  mutate(Country = fct_reorder(Country, balance, .fun = min, .desc = FALSE))

df2_outlier <- filter(df_outlier, Country %in% c('Mexico','Canada','China','Japan','Ireland'))

ggplot(df, aes(x = Commodity , y = balance)) +
  geom_boxplot(outlier.shape = NA) +
  coord_flip() +
  geom_jitter(data = df_outlier, width = .075, height = .075, alpha = 0.25) +
  labs(x = NULL,
       y = "Balance of trade (Billions of dollars)",
       caption = "Source: BEA") +
  scale_y_continuous(
                    limits = c(-200e9,50e9), 
                    breaks = c(100e9,50e9,0,-50e9, -100e9, -150e9,-200e9),
                    label = c("$100", "$50", "$0","-$50", "-$100", "-$150","-$200")) +
  geom_text(aes(label=ifelse(balance< -25e9,as.character(Country),'')),hjust=.9,vjust= -.7, size = 3) +
  geom_text(aes(label=ifelse(balance> 15e9,as.character(Country),'')),hjust=-.1,vjust= 0, size = 3) +
  theme_graphclass()

ggsave(filename = "d1-tradebalance.png",
       path    = "figures",
       width   = 10,
       height  = 8,
       units   = "in",
       dpi     = 400)


ggplot(df2, aes(x = Country , y = balance)) +
  geom_boxplot(outlier.shape = NA) +
  coord_flip() +
  geom_jitter(data = df2_outlier, width = .075, height = .075, alpha = 0.25) +
  labs(x = NULL,
       y = "Balance of trade (Billions of dollars)",
       caption = "Source: BEA") +
  scale_y_continuous(
    limits = c(-200e9,50e9), 
    breaks = c(100e9,50e9,0,-50e9, -100e9, -150e9,-200e9),
    label = c("$100", "$50", "$0","-$50", "-$100", "-$150","-$200")) +
    geom_text(aes(label=ifelse(balance< -25e9,as.character(Commodity),'')),hjust=.9,vjust= -.7, size = 3) +
    geom_text(aes(label=ifelse(balance> 15e9,as.character(Commodity),'')),hjust=-.1,vjust= 0, size = 3) +
    theme_graphclass()

ggsave(filename = "d1-tradebalance-2.png",
       path    = "figures",
       width   = 10,
       height  = 8,
       units   = "in",
       dpi     = 400)