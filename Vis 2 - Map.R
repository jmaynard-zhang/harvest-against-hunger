# VISUALIZATION 2 - KCFS 2019-2021 Map Graphs

# -- Load data --
source("Data Compilation.R")


# -- Set up map --
wa <- map_data("county", "washington")


# -- Total Orders --
total_orders <- df %>%
  select(`Farm Name`, `Order Date`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total_orders=n()) %>%
  na.omit()

orders.map <- ggplot() +
  geom_polygon(data=wa,
               aes(x=long, y=lat, group=group),
               fill="grey", alpha=0.3) +
  geom_point(data=total_orders, aes(x=lon, y=lat, alpha=total_orders)) +
  theme_void() +
  coord_map() +
  ggtitle("Total Orders since 2019")


# -- Total Order Amount ($) --
total_dollars <- df %>%
  select(`Farm Name`, `Order Amount ($)`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total_order_amt=sum(`Order Amount ($)`)) %>%
  na.omit()

dollars.map <- ggplot() +
  geom_polygon(data=wa,
               aes(x=long, y=lat, group=group),
               fill="grey", alpha=0.3) +
  geom_point(data=total_dollars, aes(x=lon, y=lat, alpha=total_order_amt)) +
  theme_void() +
  coord_map() +
  ggtitle("Total Order Amount ($) since 2019")


# -- Total Pounds Purchased --
total_lbs <- df %>%
  select(`Farm Name`, `Pounds purchased`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total_lbs=sum(`Pounds purchased`)) %>%
  na.omit()

lbs.map <- ggplot() +
  geom_polygon(data=wa,
               aes(x=long, y=lat, group=group),
               fill="grey", alpha=0.3) +
  geom_point(data=total_lbs, aes(x=lon, y=lat, alpha=total_lbs)) +
  theme_void() +
  coord_map() +
  ggtitle("Total Pounds Purchased since 2019")
