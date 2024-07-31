
figure <- "data-fit"


data <- read.csv(paste(sep = "", "data/",figure, ".csv"))
fit_points <- read.csv("podatki/data.csv")

lvls <- c("vcd", "gluc", "gln","do_50", "product")
lvl_labels <- c("VCD\n[MVC/mL]","glucose\n[g/L]","glutamine\n[g/L]", "DO\n[%]", "product\n[g/L]")

fit_points %>% 
  pivot_longer(!minutes, names_to = "type", values_to = "Value") %>% 
  mutate( type = factor(type, levels = lvls, labels = lvl_labels)) -> fit

data %>% 
  select(!c_O2) %>% 
  pivot_longer(!minutes, names_to = "type", values_to = "Value") %>% 
  mutate( type = factor(type, levels = vals, labels = labels)) %>% 
  ggplot(aes(x = minutes, y = Value, color = type)) +
  facet_grid(rows = vars(type), scales = "free") +
  geom_line() +
  geom_point(data = fit, aes( x = minutes, y = Value)) +
  labs(x = "Days") +
    guides(color = "none") +
    scale_x_continuous(labels = \(x) {
      floor(x / 60 / 24)
    })

ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm",
)