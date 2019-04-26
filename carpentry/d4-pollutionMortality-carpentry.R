library("tidyverse") # loads the readr package 
library("lubridate")

df <- read_csv(file = "data-raw/d4-pollutionMortality-raw.csv") %>%
  select("Country","VAR","Pollutant","Year","Value") %>%
  spread(VAR, Value)


df2 <- mutate(df, Pollutant = stringr::str_replace(Pollutant, "Residential Particulate Matter", "Residential P.M.")) %>%
  mutate(Pollutant = stringr::str_replace(Pollutant, "Ambient Particulate Matter", "Ambient P.M.")) %>%
  mutate(Pollutant = fct_reorder(Pollutant, MOR, .fun = max, .desc = TRUE)) %>%
  mutate(Year = make_date(year = Year))


saveRDS(df2, "data/d4_pollutionMortality_data.rds")