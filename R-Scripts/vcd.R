
figure <- "vcd"

max1 <- read.csv(paste(sep = "", "data/",figure, "4.csv")) %>% 
  mutate(initial_vcd = "0.4")
max2 <- read.csv("data/default.csv") %>% 
  mutate(initial_vcd = "0.5")
max3 <- read.csv(paste(sep = "", "data/",figure, "6.csv")) %>% 
  mutate(initial_vcd = "0.6")

data <- rbind(max1, max2, max3) %>% 
  select(!c_O2)

data %>% 
  ggplot(aes(x = minutes, y = vcd, colour = initial_vcd)) + 
  geom_line() +
  labs(x = "Days",y = "VCD\n[MVC/mL min]", color = "Initial VCD") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })


ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm",
)

# FACET -------------------------------------------------------------------

data <- data %>%
  pivot_longer(!c(minutes, initial_vcd), names_to = "type", values_to = "val") %>% 
  mutate(type = factor(type, levels = vals, labels = labels))

data %>% 
  ggplot(aes(x = minutes, y = val, colour = initial_vcd)) + 
  facet_grid(rows = vars(type),scales = "free") +
  geom_line() +
  labs(x = "Days",y = "value", color = "Initial VCD") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })


ggsave(
  paste("figures/", figure, "-facet.png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm",
)

