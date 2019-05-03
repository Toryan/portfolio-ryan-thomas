library("tidyverse") # loads the readr package 

df <- read_csv(file = "data-raw/d5-telecomSenate-raw.csv") 


df2 <- rename(df, DonationThou = "(,000)") %>%
  rename(Vote = "Voted for?") %>%
  glimpse()

df2 <- mutate(df2, Vote = stringr::str_replace(Vote, "Yes", "Yea")) %>%
  mutate(Vote = stringr::str_replace(Vote, "No", "Nay"))



df2$DonationThou = as.numeric(gsub("\\$", "", df2$DonationThou))


saveRDS(df2, "data/d5-telecomSenate-data.rds")