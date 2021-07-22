# DATAFRAMES

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


# -- Num orders --
orders_monthly <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(order_month) %>%
  summarize(num_orders=n()) %>%
  mutate(num_orders_cum=cumsum(num_orders)) %>%
  na.omit()

total_orders <- df %>%
  select(`Farm Name`, `Order Date`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total_orders=n()) %>%
  na.omit()


# -- Order amount ($) --
dollars_monthly <- df %>%
  select(`Order Date`, `Order Amount ($)`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(order_month) %>%
  summarize(total_dollars=sum(`Order Amount ($)`, na.rm=T)) %>%
  mutate(total_dollars_cum=cumsum(total_dollars)) %>%
  na.omit()

total_dollars <- df %>%
  select(`Farm Name`, `Order Amount ($)`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total_order_amt=sum(`Order Amount ($)`)) %>%
  na.omit()


# -- Amount purchased (lb) --
lbs_monthly <- df %>%
  select(order_month, `Pounds purchased`) %>%
  group_by(order_month) %>%
  summarize(total_lbs=sum(`Pounds purchased`, na.rm=T)) %>%
  mutate(total_lbs_cum=cumsum(total_lbs)) %>%
  na.omit()

total_lbs <- df %>%
  select(`Farm Name`, `Pounds purchased`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total_lbs=sum(`Pounds purchased`)) %>%
  na.omit()


# # -- Num programs --
# progs_monthly <- df %>%
#   select(order_month, Program) %>%
#   group_by(order_month) %>%
#   summarize(total_progs=n()) %>%
#   mutate(total_progs_cum=cumsum(total_progs)) %>%
#   na.omit()
#
# total_progs <- df %>%
#   select(`Farm Name`, Program, lat, lon) %>%
#   group_by(`Farm Name`, lat, lon) %>%
#   summarize(total_progs=n()) %>%
#   na.omit()


# -- Funds disbursed --
funds_yearly <- funds %>%
  group_by(year) %>%
  summarize(total_funds=sum(funds_dispersed, na.rm = T)) %>%
  mutate(total_funds_cum=cumsum(total_funds)) %>%
  na.omit()
