#d1-tradebalance-explore

library("tidyverse") # loads the readr package 
library("graphclassmate")

df2 <- readRDS("data/d4_pollutionMortality_data.rds")
countrylist <- c("United States")

ggplot(df2, aes(x = Year, y = MOR, group = Country)) + 
  geom_line(data = filter(df2, !(Country %in% countrylist)),
            size     = .4,
            color    = "indianred1") + 
  geom_line(data = filter(df2, Country %in% countrylist),
            size     = .75,
            color    = "black") + 
  geom_point(data = filter(df2, Country %in% countrylist),
             size     = 1,
             color    = "black")+ 
  labs(y = "Mortality Rate per One Million",
       x = "Year (2000's)",
       title   = "Death by Air Pollution in the United States Compared with the World",
       caption = "Source: OECD") +
  theme_graphclass() +
  facet_wrap(vars(Pollutant),ncol = 5, as.table = FALSE) +
  scale_x_date(date_breaks = "4 years", date_labels = "'%y")

ggsave(filename = "d4-pollutionMortality-1.png",
       path    = "figures",
       width   = 7,
       height  = 5,
       units   = "in",
       dpi     = 400)
