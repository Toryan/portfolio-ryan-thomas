#d1-tradebalance-explore

library("tidyverse") # loads the readr package 

df1 <- read.table(file = "data-raw/d3/apc_slowflyer_9x6_static_kt0979.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "APC Slow Flyer")

df2 <- read.table(file = "data-raw/d3/apc_sport_9x6_static_2532rd.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "APC Sport")

df3 <- read.table(file = "data-raw/d3/apc_thinelectric_9x6_static_rd0987.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "APC Thin Electric")

df4 <- read.table(file = "data-raw/d3/Graupner_CAMprop_9x6_static_pg0915.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "Graupner CAM Prop")

df5 <- read.table(file = "data-raw/d3/Graupner_CAMslim_9x6_static_pg0945.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "Graupner CAM Slim")

df6 <- read.table(file = "data-raw/d3/Graupner_supernylon_9x6_static_2577rd.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "Graupner Super Nylon")

df7 <- read.table(file = "data-raw/d3/masterairscrew_9x6_static_rd0886.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "Master Airscrew")

df8 <- read.table(file = "data-raw/d3/masterairscrew_electric_9x6_static_kj1017.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "Master Airscrew Electric")

df9 <- read.table(file = "data-raw/d3/masterairscrew_scimitar_9x6_static_2634rd.txt",
                 header = TRUE, 
                 stringsAsFactors = FALSE) %>%
  mutate(name = "Master Airscrew Scimitar")

df10 <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9) %>%
  mutate(name = as_factor(name)) %>% 
  mutate(name = fct_reorder(name, CT, .fun = mean, .desc = FALSE)) %>%
  mutate(rpmk = RPM/1000)


  ggplot(data = df10, aes(x = rpmk, y = CT)) +
  geom_jitter() +
    facet_wrap(vars(name), as.table = FALSE) +
    labs(x = "Propeller Angular Velocity (Thousand RPM)", 
         y = "Thrust Coefficient",
         title = "Comparison of Small-Scale Propeller Brands", 
         subtitle = "Static test, 9 inch diameter, 6 degree pitch", 
         caption = "Source: UIUC Propeller Database, University of Illinois at Urbana-Champaign"
    )

