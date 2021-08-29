# DATA FILTERING

# -- Load data --
source("./Data/Data Compilation.R")

# ~~ LINE DATA ~~
# -- Num farms served --
`Number of Farms Served Monthly` <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  unique() %>%
  group_by(order_month) %>%
  summarize(num_farms=n()) %>%
  mutate(num_farms_cum=cumsum(num_farms)) %>%
  na.omit()


# -- Num orders --
`Number of Orders Monthly` <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(order_month) %>%
  summarize(num_orders=n()) %>%
  mutate(num_orders_cum=cumsum(num_orders)) %>%
  na.omit()


# -- Order amount ($) --
`Order Amount ($) Monthly` <- df %>%
  select(`Order Date`, `Order Amount ($)`) %>%
  mutate(order_month=lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(order_month) %>%
  summarize(`Total Order Amount ($)`=sum(`Order Amount ($)`, na.rm=T)) %>%
  mutate(cumulative=cumsum(`Total Order Amount ($)`)) %>%
  na.omit()


# -- Amount purchased (lb) --
`Pounds Purchased Monthly` <- df %>%
  select(order_month, `Pounds purchased`) %>%
  group_by(order_month) %>%
  summarize(`Total Pounds Purchased`=sum(`Pounds purchased`, na.rm=T)) %>%
  mutate(cumulative=cumsum(`Total Pounds Purchased`)) %>%
  na.omit()


# -- Funds disbursed ($) --
`Funds Disbursed ($) Yearly` <- funds %>%
  group_by(year) %>%
  summarize(total_funds=sum(funds_dispersed, na.rm = T)) %>%
  mutate(total_funds_cum=cumsum(total_funds)) %>%
  na.omit()


# ~~ MAP DATA ~~
# -- Set up map --
wa <- map_data("county", "washington")
kingco <- readOGR(dsn="Data/kingco_shapefile/King_County_Political_Boundary_(no_waterbodies)___kingco_area.shp")


# -- Total Orders --
`Total Orders` <- df %>%
  select(`Farm Name`, `Order Date`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total=n()) %>%
  na.omit()


# -- Total Order Amount ($) --
`Total Order Amount ($)` <- df %>%
  select(`Farm Name`, `Order Amount ($)`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total=sum(`Order Amount ($)`)) %>%
  na.omit()


# -- Total Pounds Purchased --
`Total Pounds Purchased` <- df %>%
  select(`Farm Name`, `Pounds purchased`, lat, lon) %>%
  group_by(`Farm Name`, lat, lon) %>%
  summarize(total=sum(`Pounds purchased`)) %>%
  na.omit()

