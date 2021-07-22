# VISUALIZATION 1 - KCFS 2019-2021 Line Graphs

# -- Load packages --
load_pckg()


# -- Load dataframes --
load_dfs()


# -- Num farms served --
farms.line <- ggplot(data=farms_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = num_farms_cum),
    size = 2
  ) +
  labs(
    title = "Farms Served Monthly",
    x = "Date",
    y = "Number of Farms"
  )


# -- Num orders --
orders.line <- ggplot(data=orders_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = num_orders_cum),
    size = 2
  ) +
  labs(
    title = "Orders Monthly",
    x = "Date",
    y = "Number of Orders"
  )


# -- Order amount ($) --
dollars.line <- ggplot(data=dollars_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = total_dollars_cum),
    size = 2
  ) +
  labs(
    title = "Order Amount Monthly",
    x = "Date",
    y = "Order Amount ($)"
  )


# -- Amount purchased (lb) --
lbs.line <- ggplot(data=lbs_monthly) +
  geom_line(
    mapping = aes(x = order_month, y = total_lbs_cum),
    size = 2
  ) +
  labs(
    title = "Amount Purchased Monthly",
    x = "Date",
    y = "Amount Purchased (Lbs)"
  )

#
# # -- Num programs* -- don't need
# progs.line <- ggplot(data=progs_monthly) +
#   geom_line(
#     mapping = aes(x = order_month, y = total_progs_cum),
#     size = 2
#   ) +
#   labs(
#     title = "Program Partnerships Monthly",
#     x = "Date",
#     y = "Number of Partnerships"
#   )


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
