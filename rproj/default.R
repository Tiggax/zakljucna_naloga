library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)


figure <- "default"

simple_fit <- read.csv(paste(sep = "", "data/",figure, ".csv"))

simple_fit %>% 
  #mutate(DO = DO * 10000) %>% 
  pivot_longer(cols = !minutes, names_to = "type", values_to = "val") %>% 
  filter(type != "product")-> data

data %>% 
  ggplot(aes(x = minutes, y = val, colour = type)) + 
  geom_line() 


ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
)