# VISUALIZATION 1 - KCFS 2019-2021 Line Graph

# -- Load packages --
library(ggplot2)
library(RColorBrewer)


# -- Load dataframes --


# -- Num farms served --
# By day
farms_daily <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  unique() %>% #* There are some misspellings that makes this inaccurate
  group_by(`Order Date`) %>%
  summarize(`Number of Farms` = n()) %>%
  na.omit()

farms_daily.line <- ggplot(data = farms_daily) +
  geom_line(
    mapping = aes(x = `Order Date`, y = `Number of Farms`),
    size = 2
  ) +
  labs(
    title = "Total Farms Served Daily",
    x = "Year",
    y = "Number of Farms" #* Get rid of decimal values
  )

# By month

# By year
farms_yearly <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(`Order Year`=as.integer(format(df$`Order Date`, format = "%Y"))) %>%
  group_by(`Order Year`) %>%
  summarize(`Number of Farms` = n()) %>%
  na.omit()

farms_yearly.line <- ggplot(data = farms_yearly) +
  geom_line(
    mapping = aes(x = `Order Year`, y = `Number of Farms`),
    size = 2
  ) +
  labs(
    title = "Total Farms Served Yearly",
    x = "Year", #* Needs to not have decimal years
    y = "Number of Farms"
  )


# -- Num orders --
# num_orders <- df %>%
#   select(`Order Date`, Year) %>%
#   group_by(Year) %>%
#   summarize(`Number of Orders` = n())
#
#
# orders.line <- ggplot(data = numOrders) +
#   geom_line(
#     mapping = aes(x = Year, y = `Num Orders` , color = `Farm Name`),
#     size = 2
#   ) +
#   scale_color_brewer(
#     palette = "Set2",
#     labels = `Farm Name`
#   ) +
#   labs(
#     title = "Prison Population over Time (1980-2015)",
#     x = "Year",
#     y = "Number of Orders",
#     color = "Farm"
#   )


# -- Num programs --


# -- Order amount ($) --


# -- Amount purchased (lb) --


# -- Funds disbursed ($) --
