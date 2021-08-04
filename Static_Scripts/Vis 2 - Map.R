# VISUALIZATION 2 - KCFS 2019-2021 Map Graphs

# -- Total Orders --
orders.map <- ggplot() +
  geom_polygon(data=wa,
               aes(x=long, y=lat, group=group),
               fill="grey", alpha=0.3) +
  geom_point(data=total_orders, aes(x=lon, y=lat, alpha=total_orders)) +
  theme_void() +
  coord_map() +
  ggtitle("Total Orders since 2019")


# -- Total Order Amount ($) --
dollars.map <- ggplot() +
  geom_polygon(data=wa,
               aes(x=long, y=lat, group=group),
               fill="grey", alpha=0.3) +
  geom_point(data=total_dollars, aes(x=lon, y=lat, alpha=total_order_amt)) +
  theme_void() +
  coord_map() +
  ggtitle("Total Order Amount ($) since 2019")


# -- Total Pounds Purchased --
lbs.map <- ggplot() +
  geom_polygon(data=wa,
               aes(x=long, y=lat, group=group),
               fill="grey", alpha=0.3) +
  geom_point(data=total_lbs, aes(x=lon, y=lat, alpha=total_lbs)) +
  theme_void() +
  coord_map() +
  ggtitle("Total Pounds Purchased since 2019")
