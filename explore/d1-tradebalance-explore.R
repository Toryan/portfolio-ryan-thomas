#d1-tradebalance-explore

library("tidyverse") # loads the readr package 
library("graphclassmate")

df <- read_csv(file = "data-raw/d1-tradebalance-raw.csv", col_names = TRUE,skip = 2) %>%
  rename(balance = 'Balance ($US)') %>%
  drop_na() %>%
  filter(!Country %in% c('Africa','Asia','Australia and Oceania','Europe','North America',
                          'South/Central America',
                          'APEC - Asia Pacific Economic Co-operation',
                          'ASEAN - Association of Southeast Asian Nations',
                          'Central American Common Market',
                          'European Union',
                          'Euro Area',
                          'LAFTA - Latin American Free Trade Association',
                          'NATO (North Atlantic Treaty Organization) Allies',
                          'NICS - Newly Industrialized Countries',
                          'OECD - Organization for Economic Co-operation and Development',
                          'OPEC - Organization of Petroleum Exporting Countries',
                          'Pacific Rim Countries',
                          'Twenty Latin American Republics',
                          'US Trade Agreements Partners')) %>%
  filter(!Commodity %in% c('990 Other Special Classification Provisions',
                           '980 Goods Returned (exports For Canada Only)')) %>%
  mutate(Commodity = gsub('[0-9]+', '', Commodity)) %>%
  mutate(Commodity = as_factor(Commodity)) %>% 
  mutate(Commodity = fct_reorder(Commodity, balance, .fun = mean, .desc = FALSE))


df_outlier <- df %>%
  group_by(Commodity) %>%
  mutate(outlier = (balance < median(balance) - 1.5 * IQR(balance)) | (balance > median(balance) + 1.5 * IQR(balance))) %>%
  ungroup() %>% 
  filter(outlier == TRUE)




cube_trans <- scales::trans_new("Cube",
                           transform=function(x) sign(x)*(abs(x))^(1/3),
                           inverse=function(x) sign(x)*abs(x)^3)

ggplot(df, aes(x = Commodity , y = balance)) +
  geom_boxplot(outlier.shape = NA) +
  coord_flip() +
  geom_jitter(data = df_outlier) +
  labs(x = NULL,
       y = "Balance of trade (Billions of dollars), cube scale",
       title   = "Distribution of US trade of goods with foreign countries in 2018",
       caption = "Source: BEA") +
  scale_y_continuous(trans = cube_trans,
                     limits = c(-200e9,50e9), 
                     breaks = c(100e9,50e9,0,-50e9, -100e9, -150e9,-200e9),
                     label = c("$100", "$50", "$0","-$50", "-$100", "-$150","-$200"))



n_distinct(select(df, Commodity))
