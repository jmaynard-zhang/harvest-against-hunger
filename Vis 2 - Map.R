# VISUALIZATION 2 - KCFS 2019-2021 Map Graphs

# -- Load dataframes --
load_dfs()


# -- Set up map --
# g <- list(
#   scope = 'usa',
#   projection = list(type = 'albers usa'),
#   showland = TRUE,
#   landcolor = toRGB("gray95"),
#   subunitcolor = toRGB("gray85"),
#   countrycolor = toRGB("gray85"),
#   countrywidth = 0.5,
#   subunitwidth = 0.5
# )

wa <- map_data("county", "washington")


# -- Total Orders --
# orders.map <- plot_geo(orders_monthly, lat=~lat, lon=~lon) %>%
#   layout(title="Monthly Orders", geo=g)

orders2.map <- ggplot() +
  geom_polygon(data = wa, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point( data=orders_monthly, aes(x=lon, y=lat, alpha=`Number of Orders`)) +
  # geom_text_repel( data=orders_monthly %>% arrange(`Number of Orders`) %>% tail(10), aes(x=lon, y=lat, label=`Farm Name`), size=5) +
  # geom_point( data=orders_monthly %>% arrange(`Number of Orders`) %>% tail(10), aes(x=lon, y=lat), color="red", size=3) +
  theme_void() +
  coord_map()


# -- Total Order Amount ($) --


# -- Total Pounds Purchased --


# -- Total Funds Disbursed --
