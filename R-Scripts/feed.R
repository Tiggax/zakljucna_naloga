
figure <- "feed"

max0 <- read.csv(paste(sep = "", "data/",figure, "0.csv")) %>% 
  mutate(feed_rate = "0%")
max1 <- read.csv(paste(sep = "", "data/",figure, "2.csv")) %>% 
  mutate(feed_rate = "2%")
max2 <- read.csv("data/default.csv") %>% 
  mutate(feed_rate = "3%")
max3 <- read.csv(paste(sep = "", "data/",figure, "4.csv")) %>% 
  mutate(feed_rate = "4%")

raw_data <- rbind(max0, max1, max2, max3) %>% 
  select(!c_O2)

raw_data %>% 
  ggplot(aes(x = minutes, y = vcd, colour = feed_rate)) + 
  geom_line() +
  labs(x = "Days", y = "VCD\n[MVC/mL min]", color = "Feed rate") +
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

data <- raw_data %>%
  pivot_longer(!c(minutes, feed_rate), names_to = "type", values_to = "val") %>% 
  mutate(type = factor(type, levels = vals, labels = labels))

data %>% 
  ggplot(aes(x = minutes, y = val, colour = feed_rate)) + 
  facet_grid(rows = vars(type),scales = "free") +
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

raw_data %>% 
  mutate(product = volume * product) %>% 
  select(minutes, product, feed_rate) %>% 
ggplot(aes(x = minutes, y = product, color = feed_rate)) +
  geom_line() +
  labs(x = "Days", y= "Value",  color = "Feed rate") +
  scale_x_continuous(labels = \(x) {
    floor(x / 60 / 24)
  })
