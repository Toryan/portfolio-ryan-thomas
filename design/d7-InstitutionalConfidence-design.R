library("HH")
library("tidyverse") # loads the readr package 

df10 <- readRDS("data/d7-InstutionalConfidence-data.rds")

df11 <- filter(df10,country == 840) %>%
  select(-country)

likert(group ~ .,data=df11,ylab=NULL, ReferenceZero=2.5,
       as.percent=TRUE, positive.order=TRUE,
       main = list("American Reported Level of Confidence in Various Institutions, 2014",x=unit(.55, "npc")),
       xlim=c(-100,-80,-60,-40,-20,0,20,40,60,80,100), strip=FALSE,
       par.strip.text=list(cex=.7))

ggsave(filename = "d7-InstitutionalConfidence-1.png",
       path    = "figures",
       width   = 6,
       height  = 4,
       units   = "in",
       dpi     = 400)


df12 <- filter(df10,country == 156) %>%
  select(-country)

likert(group ~ .,data=df12,ylab=NULL, ReferenceZero=2.5,
       as.percent=TRUE, positive.order=TRUE,
       main = list("Chinese Reported Level of Confidence in Various Institutions, 2014",x=unit(.55, "npc")),
       xlim=c(-100,-80,-60,-40,-20,0,20,40,60,80,100), strip=FALSE,
       par.strip.text=list(cex=.7))


df13 <- filter(df10,country == 276) %>%
  select(-country)

likert(group ~ .,data=df13,ylab=NULL, ReferenceZero=2.5,
       as.percent=TRUE, positive.order=TRUE,
       main = list("German Reported Level of Confidence in Various Institutions, 2014",x=unit(.55, "npc")),
       xlim=c(-100,-80,-60,-40,-20,0,20,40,60,80,100), strip=FALSE,
       par.strip.text=list(cex=.7))




