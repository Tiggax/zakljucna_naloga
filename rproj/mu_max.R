library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)
library(scales)


figure <- "mu_max"
vals = c("vcd", "glucose", "glutamin", "oxygen","DO", "c_O2", "volume", "product")
labels = c("VCD", "glucose", "glutamin", "PID[02]","DO", "c_O2", "volume", "product")


max1 <- read.csv(paste(sep = "", "data/",figure, "1.csv")) %>% 
  mutate(mu_max = "0.001")
max2 <- read.csv("data/default.csv") %>% 
  mutate(mu_max = "0.002")
max3 <- read.csv(paste(sep = "", "data/",figure, "3.csv")) %>% 
  mutate(mu_max = "0.003") 

data <- rbind(max1, max2, max3) %>% 
  select(!c_O2)


data %>% 
  ggplot(aes(x = minutes, y = vcd, colour = mu_max)) + 
  geom_line() +
  labs(x = "Days",y = "VCD", color = expression(mu["max"])) +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })

ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
)

# FACET -------------------------------------------------------------------

data <- data %>%
  pivot_longer(!c(minutes, mu_max), names_to = "type", values_to = "val") %>% 
  mutate(type = factor(type, levels = vals, labels = labels))

data %>% 
  ggplot(aes(x = minutes, y = val, colour = mu_max)) + 
  facet_grid(rows = vars(type),scales = "free") +
  geom_line() +
  labs(x = "Days", y = "value", color = expression(mu["max"])) +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })


ggsave(
  paste("figures/", figure, "-facet.png", sep = ""),
  dpi = 320,
)
