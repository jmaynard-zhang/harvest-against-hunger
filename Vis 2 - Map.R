# VISUALIZATION 2 - KCFS 2019-2021 Map Graphs

# -- Load packages --
load_pckg()


# -- Load dataframes --


# -- Total Order Amount ($) --
farm_dollars <- df %>%
  select(`Farm Name`, `Order Amount ($)`) %>%
  group_by(`Farm Name`) %>%
  summarize(`Total Order Amount ($)`=sum(`Order Amount ($)`, na.rm=T))

farm_dollars.map <- ggplot(data = farm_dollars) +
  geom_map(
    mapping = aes(x = `Order Date`, y = `Number of Farms`),
    size = 2
  ) +
  labs(
    title = "Total Farms Served Daily",
    x = "Date",
    y = "Number of Farms" #* Get rid of decimal values
  )


# -- Total Pounds Purchased --


# -- Total Funds Disbursed --


# -- Total Orders --
