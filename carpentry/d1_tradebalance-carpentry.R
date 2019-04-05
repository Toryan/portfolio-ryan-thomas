#d1-tradebalance-carpentry

library("tidyverse") # loads the readr package 

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
  mutate(Commodity = fct_reorder(Commodity, balance, .fun = max, .desc = FALSE))


saveRDS(df, "data/d1-tradebalance-data.rds")

df_outlier <- df %>%
  group_by(Commodity) %>%
  mutate(outlier = (balance < median(balance) - 1.5 * IQR(balance)) | (balance > median(balance) + 1.5 * IQR(balance))) %>%
  ungroup() %>% 
  filter(outlier == TRUE)

saveRDS(df_outlier, "data/d1-tradebalance-data-outlier.rds")