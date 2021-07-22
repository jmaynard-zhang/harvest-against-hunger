# VISUALIZATION 1 - KCFS 2019-2021 Line Graphs

# -- Load packages --
load_pckg()


# -- Load dataframes --
load_dfs()


# -- Num farms served --
# # By day
# farms_daily.line <- ggplot(data=farms_daily) +
#   geom_line(
#     mapping = aes(x=`Order Date`, y = num_farms_cum),
#     size = 2
#   ) +
#   labs(
#     title = "Farms Served Since 2019",
#     x = "Date",
#     y = "Number of Farms"
#   )
#
# # By month
farms.line <- ggplot(data=farms_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = num_farms_cum),
    size = 2
  ) +
  labs(
    title = "Farms Served Monthly Since 2019",
    x = "Date",
    y = "Number of Farms"
  )
#
# # By year
# farms_yearly.line <- ggplot(data = farms_yearly) +
#   geom_line(
#     mapping = aes(x = `Order Year`, y = `Number of Farms`),
#     size = 2
#   ) +
#   labs(
#     title = "Total Farms Served Yearly",
#     x = "Year", #* Needs to not have decimal years
#     y = "Number of Farms"
#   )


# -- Num orders --
# # By day
# orders_daily.line <- ggplot(data = orders_daily) +
#   geom_line(
#     mapping = aes(x = `Order Date`, y = `Number of Orders`),
#     size = 2
#   ) +
#   labs(
#     title = "Total Orders Daily",
#     x = "Date",
#     y = "Number of Orders"
#   )
#
orders.line <- ggplot(data=orders_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = num_orders_cum),
    size = 2
  ) +
  labs(
    title = "Orders Monthly Since 2019",
    x = "Date",
    y = "Number of Orders"
  )


# -- Order amount ($) --
# dollars_daily.line <- ggplot(data = dollars_daily) +
#   geom_line(
#     mapping = aes(x = `Order Date`, y = `Total Order Amount ($)`),
#     size = 2
#   ) +
#   labs(
#     title = "Total Order Amount ($) Daily",
#     x = "Date",
#     y = "Order Amount ($)"
#   ) #* Looks like there's an outlier
dollars.line <- ggplot(data=dollars_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = total_dollars_cum),
    size = 2
  ) +
  labs(
    title = "Order Amount Monthly Since 2019",
    x = "Date",
    y = "Order Amount ($)"
  )


# -- Amount purchased (lb) --
# lbs_daily.line <- ggplot(data = lbs_daily) +
#   geom_line(
#     mapping = aes(x = `Order Date`, y = `Total Pounds Purchased`),
#     size = 2
#   ) +
#   labs(
#     title = "Total Pounds Purchased Daily",
#     x = "Date",
#     y = "Pounds Purchased"
#   )
lbs.line <- ggplot(data=lbs_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = total_lbs_cum),
    size = 2
  ) +
  labs(
    title = "Amount Purchased Monthly Since 2019",
    x = "Date",
    y = "Amount Purchased (Lbs)"
  )


# -- Num programs --
# # By day
# programs_daily.line <- ggplot(data = programs_daily) +
#   geom_line(
#     mapping = aes(x = `Order Date`, y = `Number of Programs`),
#     size = 2
#   ) +
#   labs(
#     title = "Total Program Partnerships Daily",
#     x = "Date",
#     y = "Number of Programs"
#   )
progs.line <- ggplot(data=progs_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = total_progs_cum),
    size = 2
  ) +
  labs(
    title = "Program Partnerships Monthly Since 2019",
    x = "Date",
    y = "Number of Partnerships"
  )


# -- Funds disbursed ($) --
funds_yearly.line <- ggplot(data=funds_yearly) +
  geom_line(
    mapping=aes(x=year, y=total_funds_cum),
    size=2
  ) +
  labs(
    title="Total Funds Dispersed Yearly",
    x="Year",
    y="Funds Dispersed ($)"
  )
