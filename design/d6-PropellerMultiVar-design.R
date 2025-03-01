
library("tidyverse") # loads the readr package 
library("graphclassmate")
library("GGally")
library("scagnostics")

df9 <- readRDS("data/d6-PropellerMultiVar-data.rds") %>%
  mutate(name = stringr::str_replace(name, "MA Scimitar", "MAScimitar")) %>%
  mutate(name = stringr::str_replace(name, "APC Slow Flyer", "APCSlowFlyer")) %>%
  mutate(testype = factor(testype)) %>%
  mutate(name = factor(name))


dfstatic <- filter(df9, testype == "static")
dfdynamic <- filter(df9, testype == "dynamic") %>%
  filter(eta >0)

my_color <- c(rcb("dark_BG"),  rcb("dark_Br"))
my_fill  <- c(rcb("light_BG"), rcb("light_Br"))
my_title <- "Comparing Swiss banknote dimensions (mm)"

ggparcoord(data = dfstatic, columns = 1:3, groupColumn  = "name",
           scale        = "robust",
           title        = "Static tests, 9 inch diameter, 6 degree pitch",
           mapping      = NULL)+
  labs(x = NULL, y = NULL) +
  theme_graphclass() +
  scale_color_manual(values = c(rcb("dark_Br"), rcb("light_BG")))

ggsave(filename = "d6-PropellerMultiVar-1.png",
       path    = "figures",
       width   = 6,
       height  = 4,
       units   = "in",
       dpi     = 400)

dfdynamic <- mutate(dfdynamic, velocity = J*RPM*2*3.14156/60*9*.0254) %>%
  mutate(velocity = velocity)

ggparcoord(data = dfdynamic, columns = c(1,2,3,8,6), groupColumn  = "name",
           scale        = "std",
           title        = "Dynamic tests, 9 inch diameter, 6 degree pitch",
           missing      = "exclude",
           mapping      = NULL)+
  labs(x = NULL, y = NULL) +
  theme_graphclass() +
  scale_color_manual(values = c(rcb("dark_Br"), rcb("light_BG")))

ggsave(filename = "d6-PropellerMultiVar-2.png",
       path    = "figures",
       width   = 6,
       height  = 4,
       units   = "in",
       dpi     = 400)

