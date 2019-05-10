library("tidyverse") # loads the readr package 

df1 <- read.table(file = "data-raw/d6/apcsf_9x6_static_kt0979.txt",
                  header = TRUE, 
                  stringsAsFactors = FALSE) %>%
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




saveRDS(df9, "data/d6-PropellerMultiVar-data.rds")