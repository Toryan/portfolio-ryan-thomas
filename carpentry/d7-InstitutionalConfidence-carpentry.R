
library("labelled")
library("tidyverse") # loads the readr package 
library("cdata")
library("wrapr")
library("seplyr")


df <- readRDS("data-raw/d7-InstitutionalConfidence-raw.rds") %>%
  as_tibble()


df2 <- select(df,V2)
df3 <- select(df,V108:V124)
df4 <- select(df,V126)

df5 <- bind_cols(df2,df3,df4)

df6 <- remove_labels(df5) %>%
  rename("country" = V2)

#categories <- var_label(df5, unlist = FALSE)


control_table <- wrapr::build_frame(
  "group", "confidence" |
    "The churches", "V108" |
    "The armed forces", "V109" |
    "The press", "V110" |
    "Television", "V111" |
    "Labor unions", "V112" |
    "The police", "V113" |
    "The courts", "V114" |
    "The government", "V115" |
    "Political parties", "V116" |
    "Congress / Parliment", "V117" |
    "The civil service", "V118" |
    "Universities", "V119" |
    "Major companies", "V120" |
    "Banks", "V121" |
    "Environmental organizations", "V122" |
    "Women's organizations", "V123" |
    "Charitable or humanitarian organizations", "V124" |
    "The United Nations", "V126" 
)

df7 <- rowrecs_to_blocks(
  wideTable        = df6,
  controlTable     = control_table,
  controlTableKeys = c("group"),
  columnsToCopy    = c("country")
)

df8 <- filter(df7, confidence %in% c(1,2,3,4))

df9 <- group_by(df8, group, country, confidence) %>% 
  summarise(count = n()) %>%
  ungroup()

control_table <- wrapr::build_frame(
  "confidence", "count" |
    "4", "None at all" |
    "3", "Not very much" |
    "2", "Quite a lot" |
    "1", "A great deal" 
)

df10 <- blocks_to_rowrecs(
  tallTable        = df9,
  controlTable     = control_table,
  controlTableKeys = c("confidence"), 
  keyColumns       = c("country", "group")
)


saveRDS(df10, "data/d7-InstutionalConfidence-data.rds")