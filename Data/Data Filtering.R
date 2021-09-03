# DATA FILTERING

# -- Load data --
source("./Data/Data Compilation.R")

# -- Create an order_month column (the year and month that an order was made)
df <- df %>%
  mutate(order_month=lubridate::floor_date(Order.Date, "month"))

# ~~ LINE DATA ~~
# -- Num farms served --
`Number of Farms Served Monthly` <- df %>%
  select(Farm.Name, order_month) %>%
  unique() %>%
  group_by(order_month) %>%
  summarize(num_farms=n()) %>%
  mutate(num_farms_cum=cumsum(num_farms)) %>%
  na.omit()


# -- Num orders --
`Number of Orders Monthly` <- df %>%
  select(Farm.Name, order_month) %>%
  group_by(order_month) %>%
  summarize(num_orders=n()) %>%
  mutate(num_orders_cum=cumsum(num_orders)) %>%
  na.omit()


# -- Order amount ($) --
`Order Amount ($) Monthly` <- df %>%
  select(order_month, Order.Amount) %>%
  group_by(order_month) %>%
  summarize(`Total Order Amount ($)`=sum(Order.Amount, na.rm=T)) %>%
  mutate(cumulative=cumsum(`Total Order Amount ($)`)) %>%
  na.omit()


# -- Amount purchased (lb) --
`Pounds Purchased Monthly` <- df %>%
  select(order_month, Pounds.Purchased) %>%
  group_by(order_month) %>%
  summarize(`Total Pounds Purchased`=sum(Pounds.Purchased, na.rm=T)) %>%
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
kingco <- readOGR(dsn="Data/kingco_shapefile/King_County_with_Natural_Shoreline_for_Puget_Sound_and_Lake_Washington___kingsh_area.shp")
wa <- map_data("county", "washington")

# Remove farms with locations that are a) unknown or b) outside of King county.
remove_farms <- c("Lily Fields",
                  "High & Dry Farm",
                  "Orange Star Farm",
                  "Caruso Farm",
                  "Skylight Farms",
                  "Lowlands Farm")
df_map <- df %>%
  filter(!(Farm.Name %in% remove_farms))


# -- Total Orders --
`Total Orders` <- df_map %>%
  select(Farm.Name, Order.Date, lat, lon) %>%
  group_by(Farm.Name, lat, lon) %>%
  summarize(total=n()) %>%
  na.omit()


# -- Total Order Amount ($) --
`Total Order Amount ($)` <- df_map %>%
  select(Farm.Name, Order.Amount, lat, lon) %>%
  group_by(Farm.Name, lat, lon) %>%
  summarize(total=sum(Order.Amount)) %>%
  na.omit()


# -- Total Pounds Purchased --
`Total Pounds Purchased` <- df_map %>%
  select(Farm.Name, Pounds.Purchased, lat, lon) %>%
  group_by(Farm.Name, lat, lon) %>%
  summarize(total=sum(Pounds.Purchased)) %>%
  na.omit()

