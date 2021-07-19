# VISUALIZATION 2 - KCFS 2019-2021 Map Graphs

# -- Load dataframes --
load_dfs()


# -- Set up map --
wa <- map_data("county", "washington")


# -- Total Orders --
orders2.map <- ggplot() +
  geom_polygon(data=wa, aes(x=long, y=lat, group=group), fill="grey", alpha=0.3) +
  geom_point(data=orders_monthly, aes(x=lon, y=lat, alpha=`Number of Orders`)) +
  theme_void() +
  coord_map()


# -- Total Order Amount ($) --


# -- Total Pounds Purchased --


# -- Total Funds Disbursed --
