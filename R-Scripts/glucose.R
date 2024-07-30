
figure <- "glucose"

max1 <- read.csv(paste(sep = "", "data/",figure, "09.csv")) %>% 
  mutate(initial_vcd = "0.00009")
max2 <- read.csv("data/default.csv") %>% 
  mutate(initial_vcd = "0.0001")
max3 <- read.csv(paste(sep = "", "data/",figure, "2.csv")) %>% 
  mutate(initial_vcd = "0.0002")

data <- rbind(max1, max2, max3) %>% 
  select(!c_O2)

data %>% 
  ggplot(aes(x = minutes, y = glucose, colour = initial_vcd)) + 
  geom_line() +
  labs(x = "Days", color = "Constant", y = "glucose\n[g/L]") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })

ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm"
)


# FACET -------------------------------------------------------------------

data <- data %>%
  pivot_longer(!c(minutes, initial_vcd), names_to = "type", values_to = "val") %>% 
  mutate(type = factor(type, levels = vals, labels = labels))

data %>% 
  ggplot(aes(x = minutes, y = val, colour = initial_vcd)) + 
  facet_grid(rows = vars(type),scales = "free") +
  geom_line() +
  labs(x = "Days", y = "value",  color = "Constant") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })


ggsave(
  paste("figures/", figure, "-facet.png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm"
)

