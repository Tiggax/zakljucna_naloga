
figure <- "feed_process" 

p_vals <- c(5, 10, 15)


data <- read.csv(paste(sep = "", "data/",figure, "0.csv")) %>% 
  mutate(feed_rate = "0 %")
for (x in p_vals) {
  data <- read.csv(paste(sep = "", "data/",figure, x, ".csv")) %>% 
    mutate(feed_rate = paste(x,"%")) %>% 
    rbind(data)
}
data %>% 
  mutate(feed_rate = factor(feed_rate,labels = paste(append(0, p_vals), "%"))) -> data

data %>% 
  pivot_longer(!c(minutes, feed_rate), names_to = "type", values_to = "Value") %>% 
  mutate(type = factor(type, levels = vals, labels = labels)) %>% 
ggplot(aes(x = minutes, y = Value, colour = feed_rate)) +
  facet_grid(rows = vars(type), scales = "free" ) +
  geom_line() +
  labs(x = "Days", y= "Value",  color = "Feed rate") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })

ggsave(
  paste("figures/", figure, "-facet.png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm"
)

lvls <- c("vcd", "glucose", "glutamin", "product")
lvl_labels <- c("VCD\n[MVC]","glucose\n[g]", "glutamine\n[g]", "product\n[g]")


data %>% 
  filter( minutes == max(data["minutes"])) %>% 
  mutate(vcd = vcd * 10^-3 * volume, glutamin = glutamin * volume, glucose = glucose * volume, product = product * volume ) %>% 
  select(vcd, glutamin, glucose, product, feed_rate) %>% 
  pivot_longer(!feed_rate, values_to = "Value", names_to = "type") %>% 
  mutate( type = factor(type, levels = lvls, labels = lvl_labels)) %>% 
  ggplot(aes( x = feed_rate, y = Value, fill = feed_rate)) + 
  facet_wrap(facets = vars(type), scales = "free") +
  geom_col() +
  labs(x = "Feed rate", y= "Value") +
  guides(fill = "none")

ggsave(
  paste("figures/", figure, ".png", sep = ""),
  dpi = 320,
  width = 15.5,
  units = "cm"
)
  