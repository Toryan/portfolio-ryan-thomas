#d1-tradebalance-explore

library("tidyverse") # loads the readr package 
library("graphclassmate")
library("magick")


df <- read_csv(file = "data-raw/d4-pollutionMortality-raw.csv") %>%
  select("Country","VAR","Pollutant","Year","Value") %>%
  spread(VAR, Value)

glimpse(df)


  

countrylist <- c("United States")


df2 <- mutate(df, Pollutant = stringr::str_replace(Pollutant, "Residential Particulate Matter", "Residential P.M.")) %>%
  mutate(Pollutant = stringr::str_replace(Pollutant, "Ambient Particulate Matter", "Ambient P.M.")) %>%
  mutate(Pollutant = fct_reorder(Pollutant, MOR, .fun = max, .desc = TRUE))
  

ggplot(df2, aes(x = Year, y = MOR, group = Country)) + 
  geom_line(data = filter(df2, !(Country %in% countrylist)),
            size     = .5,
            color    = "#C7EAE5") + 
 # geom_point(data = filter(df2, !(Country %in% countrylist)),
             # size     = 1,
             # color    = "#C7EAE5")+
  geom_line(data = filter(df2, Country %in% countrylist),
            size     = .75,
            color    = "#01665E") + 
  geom_point(data = filter(df2, Country %in% countrylist),
             size     = 1,
             color    = "#01665E")+ 
  labs(y = "Mortality Rate per One Million",
       title   = "Death by Air Pollution in the United States",
       caption = "Source: OECD") +
  theme_graphclass() +
  facet_wrap(vars(Pollutant),ncol = 5, as.table = FALSE)

ggsave(filename = "d4-pollutionMortality-1.png",
       path    = "figures",
       width   = 7,
       height  = 5,
       units   = "in",
       dpi     = 400)



# the_graph <- image_read("figures/d4-pollutionMortality-1.png")
# 
# # headline box same wiodth as figure 
# width  <- (image_info(the_graph)[["width"]])/2
# 
# # select a height (pixels) by trial and error
# height <- 60
# 
# # create the box 
# text_box <- image_blank(width = width, height = height, color = rcb("pale_Gray"))
# 
# # add the headline text to the box 
# text_box <- image_annotate(text_box, 
#                            text     = "Test Test", 
#                            gravity  = "NorthEast", 
#                            #location = "-10+0", 
#                            size     = 40, 
#                            color    = rcb("dark_Gray"), 
#                            font     = "Georgia")
# # join the headline to the image 
# final_img <- image_append(c(text_box, the_graph), stack = TRUE)
# 
# # and write to file
# image_write(final_img, 
#             path = "figures/d4-pollutionMortality-2.png", 
#             format = "png")


# 
# 
# the_graph <- image_read("figures/d4-pollutionMortality-1.png")
# final_img <- image_annotate(the_graph, "Globally, air pollution is estimated to cause about 29% of lung cancer deaths,\n
#                             43% of COPD deaths, about 25% of ischaemic heart disease deaths and 24% of stroke deaths.", 
#                             size = 40, 
#                             boxcolor = "white",
#                             location = "+1400+250")
# 
# image_write(final_img, 
#             path = "figures/d4-pollutionMortality-2.png", 
#             format = "png")
# 


