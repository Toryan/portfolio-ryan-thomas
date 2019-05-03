library("tidyverse")
library("graphclassmate")

df <- read_csv(file = "data-raw/d5-telecomSenate-raw.csv") 


df2 <- rename(df, DonationThou = "(,000)") %>%
  rename(Vote = "Voted for?") %>%
  glimpse()

df2 <- mutate(df2, Vote = stringr::str_replace(Vote, "Yes", "Yea")) %>%
  mutate(Vote = stringr::str_replace(Vote, "No", "Nay"))

  
  
df2$DonationThou = as.numeric(gsub("\\$", "", df2$DonationThou))



ggplot(df2, aes(x = DonationThou, y = Vote, color = Party, fill = Party)) +
  geom_jitter(width = 0, height = 0.1, shape = 21, size = 2, alpha = .5) +
  scale_x_continuous(labels = scales::dollar)+
  labs(x = "Size of donation by the Telecom Industry to senators (Thousands)", 
       y = NULL,
       title = "Telecom donations have little effect on senate vote compared with party", 
       subtitle = "Senate vote on S.J.Res. 34, by senator party and size of donation", 
       caption = "Source: National Institute on Money in State Politics"
  ) +
  theme_graphclass() +
  scale_color_manual(values = c("D" = "#232066","R" = "#E91D0E", "I" = "#458B00")) +
  scale_fill_manual(values = c("D" = "#232066","R" = "#E91D0E", "I" = "#458B00")) +
  geom_text(aes(x = 30, y = 1.85, label = "Rebublican"), color = "#E91D0E", alpha = .1) +
  geom_text(aes(x = 80, y = .85, label = "Democrat"), color = "#232066", alpha = .4) +
  geom_text(aes(x = 20, y = 1.2, label = "Independent"), color = "#458B00", alpha = .4) +
  theme(legend.position = "none")  

