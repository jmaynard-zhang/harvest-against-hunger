# VISUALIZATION 1 - KCFS 2019-2021 Line Graph

# -- Load packages
library(ggplot2)
library(RColorBrewer)

# -- Import dataframes --

# -- Create graph --
# numOrders <- df %>%
#   select(`Farm Name`, `Year`)
#
#
# line <- ggplot(data = numOrders) +
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
