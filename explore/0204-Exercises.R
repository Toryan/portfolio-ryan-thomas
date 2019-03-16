library("tidyverse")

ggplot(data = mpg,mapping = aes(x = displ, y = hwy)) + 
  geom_point()

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)
