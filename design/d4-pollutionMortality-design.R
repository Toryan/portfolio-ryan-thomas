#d1-tradebalance-explore

library("tidyverse") # loads the readr package 
library("graphclassmate")

df2 <- readRDS("data/d4_pollutionMortality_data.rds")
countrylist <- c("United States")

ggplot(df2, aes(x = Year, y = MOR, group = Country)) + 
  geom_line(data = filter(df2, !(Country %in% countrylist)),
            size     = .4,
            color    = "grey45") + 
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

dff <- data.frame("percentdeath" = c(43,29,25,24), "name" = c("COPD","Lung Cancer","Ischaemic heart disease","stroke")) %>%
  mutate(name = as_factor(name)) %>% 
  mutate(name = fct_reorder(name, percentdeath, .fun = mean, .desc = FALSE))

ggplot(dff, aes(x = percentdeath, y = name)) + 
  geom_point(size = 3) +
  scale_x_continuous(
    limits = c(0,45), 
    breaks = c(0,10,20,30,40),
    label = c("0","10%", "20%", "30%","40%")) +
  labs(y = NULL,
       x = "Cases caused by air pollution (percent)",
       title   = "Diseases resulting from air pollution",
       caption = "Source: WHO") +
  theme_graphclass()

ggsave(filename = "d4-pollutionMortality-3.png",
       path    = "figures",
       width   = 4,
       height  = 2,
       units   = "in",
       dpi     = 400)
