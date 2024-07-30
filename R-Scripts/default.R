
figure <- "default"

simple_fit <- read.csv(paste(sep = "", "data/",figure, ".csv")) %>% 
  select(!c_O2)

simple_fit %>% 
  pivot_longer(cols = !minutes, names_to = "type", values_to = "Value") %>% 
  mutate(type = factor(type, levels = vals, labels = labels)) -> data

data %>% 
  ggplot(aes(x = minutes, y = Value, color = type)) + 
  geom_line() +
  labs(x = "Days") +
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


data %>% 
  ggplot(aes(x = minutes, y = Value, color = type)) + 
  facet_grid(rows = vars(type), scales = "free") +
  geom_line() +
  labs(x = "Days") +
  guides(color = "none") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })


ggsave(
  paste("figures/", figure, "-facet.png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm",
)

