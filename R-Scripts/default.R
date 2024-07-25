library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)
library(scales)


figure <- "default"

vals = c("vcd", "glucose", "glutamin", "oxygen","DO", "c_O2", "volume", "product")
labels = c("VCD", "glucose", "glutamin", "PID[02]","DO", "c_O2", "volume", "product")

simple_fit <- read.csv(paste(sep = "", "data/",figure, ".csv")) %>% 
  select(!c_O2)

simple_fit %>% 
  pivot_longer(cols = !minutes, names_to = "type", values_to = "value") %>% 
  mutate(type = factor(type, levels = vals, labels = labels)) -> data

data %>% 
  ggplot(aes(x = minutes, y = value, color = type)) + 
  geom_line() +
  labs(x = "Days") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })
  
ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
)


# FACET -------------------------------------------------------------------


data %>% 
  ggplot(aes(x = minutes, y = value, color = type)) + 
  facet_grid(rows = vars(type), scales = "free") +
  geom_line() +
  labs(x = "Days") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })


ggsave(
  paste("figures/", figure, "-facet.png", sep = ""),
  dpi = 320,
)

