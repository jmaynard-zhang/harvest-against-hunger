# VISUALIZATION 1 - KCFS 2019-2021 Line Graphs

# -- Load packages --
load_pckg()


# -- Load data --
source("Data Compilation.R")


# -- Num farms served --
farms_monthly <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  unique() %>%
  group_by(order_month) %>%
  summarize(num_farms=n()) %>%
  mutate(num_farms_cum=cumsum(num_farms)) %>%
  na.omit()

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
orders_monthly <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(order_month) %>%
  summarize(num_orders=n()) %>%
  mutate(num_orders_cum=cumsum(num_orders)) %>%
  na.omit()

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
dollars_monthly <- df %>%
  select(`Order Date`, `Order Amount ($)`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(order_month) %>%
  summarize(total_dollars=sum(`Order Amount ($)`, na.rm=T)) %>%
  mutate(total_dollars_cum=cumsum(total_dollars)) %>%
  na.omit()

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
lbs_monthly <- df %>%
  select(order_month, `Pounds purchased`) %>%
  group_by(order_month) %>%
  summarize(total_lbs=sum(`Pounds purchased`, na.rm=T)) %>%
  mutate(total_lbs_cum=cumsum(total_lbs)) %>%
  na.omit()

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


# -- Funds disbursed ($) --
funds_yearly <- funds %>%
  group_by(year) %>%
  summarize(total_funds=sum(funds_dispersed, na.rm = T)) %>%
  mutate(total_funds_cum=cumsum(total_funds)) %>%
  na.omit()

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
