
library("tidyverse") # loads the readr package 
library("graphclassmate")
library("GGally")
library("scagnostics")

df1 <- read.table(file = "data-raw/d6/apcsf_9x6_static_kt0979.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  # mutate(J = 0) %>%
  # mutate(eta = 0) %>%
  mutate(testype = "static")

df2 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0980_4016.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 4016) %>%
  mutate(testype = "dynamic")

df3 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0981_5022.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 5022) %>%
  mutate(testype = "dynamic")

df4 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0982_5006.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 5006) %>%
  mutate(testype = "dynamic")

df5 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0983_6017.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6017) %>%
  mutate(testype = "dynamic")

df6 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0984_6022.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6022) %>%
  mutate(testype = "dynamic")

df7 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0985_6523.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6523) %>%
  mutate(testype = "dynamic")

df8 <- read.table(file = "data-raw/d6/apcsf_9x6_kt0986_6514.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6514) %>%
  mutate(testype = "dynamic")

dfAPC <- bind_rows(df1, df2, df3, df4, df5, df6, df7, df8) %>%
  mutate(name = "APC Slow Flyer")



df1 <- read.table(file = "data-raw/d6/mas_9x6_static_2634rd.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  # mutate(J = 0) %>%
  # mutate(eta = 0) %>%
  mutate(testype = "static")

df2 <- read.table(file = "data-raw/d6/mas_9x6_2635rd_4005.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 4005) %>%
  mutate(testype = "dynamic")

df3 <- read.table(file = "data-raw/d6/mas_9x6_2636rd_5020.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 5020) %>%
  mutate(testype = "dynamic")

df4 <- read.table(file = "data-raw/d6/mas_9x6_2637rd_4998.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 4998) %>%
  mutate(testype = "dynamic")

df5 <- read.table(file = "data-raw/d6/mas_9x6_2638rd_6005.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6005) %>%
  mutate(testype = "dynamic")

df6 <- read.table(file = "data-raw/d6/mas_9x6_2639rd_6007.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6007) %>%
  mutate(testype = "dynamic")

df7 <- read.table(file = "data-raw/d6/mas_9x6_2641rd_6611.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6611) %>%
  mutate(testype = "dynamic")

df8 <- read.table(file = "data-raw/d6/mas_9x6_2642rd_6612.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
  mutate(RPM = 6612) %>%
  mutate(testype = "dynamic")

dfMA <- bind_rows(df1, df2, df3, df4, df5, df6, df7, df8) %>%
  mutate(name = "MA Scimitar")


df9 <- bind_rows(dfAPC,dfMA) %>%
  mutate(name = factor(name, labels = c("APC Slow Flyer", "MA Scimitar")))
  #mutate(testype = factor(testype, labels = c("dynamic", "static")))

dfstatic <- filter(df9, testype == "static")
dfdynamic <- filter(df9, testype == "dynamic") %>%
  filter(eta >0)


# ggplot(data = df10, aes(x = rpmk, y = CT)) +
#   geom_jitter() +
#   facet_wrap(vars(name), as.table = FALSE) +
#   labs(x = "Propeller Angular Velocity (Thousand RPM)", 
#        y = "Thrust Coefficient",
#        title = "Comparison of Small-Scale Propeller Brands", 
#        subtitle = "Static test, 9 inch diameter, 6 degree pitch", 
#        caption = "Source: UIUC Propeller Database, University of Illinois at Urbana-Champaign"
#   )

# coplot(CT ~ J | rpmk * name, 
#        data = df9,
#        overlap = .1)


my_color <- c(rcb("dark_BG"),  rcb("dark_Br"))
my_fill  <- c(rcb("light_BG"), rcb("light_Br"))
my_title <- "Comparing Swiss banknote dimensions (mm)"

ggparcoord(data = dfstatic, columns = 1:3, groupColumn  = "name",
           scale        = "robust",
           title        = "Static tests, 9 inch diameter, 6 degree pitch",
           mapping      = NULL)+
           labs(x = NULL, y = NULL) +
  theme_graphclass()
  


ggparcoord(data = dfdynamic, columns = c(1,2,3,6), groupColumn  = "name",
           scale        = "std",
           title        = "Dynamic tests, 9 inch diameter, 6 degree pitch",
           mapping      = NULL)+
           labs(x = NULL, y = NULL) +
  theme_graphclass()
  


