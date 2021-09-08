# DATA COMPILATION

# -- Load packages and data --
load_pckg()
df <- read_csv("Data/dataframe.csv")
funds <- read_csv("Data/funds_dataframe.csv")

# ~~ LINE DATA ~~
# -- Num farms served --
`Number of Farms Served Monthly` <- df %>%
  select(Farm.Name, order_date) %>%
  unique() %>%
  group_by(order_date) %>%
  summarize(num_farms = n()) %>%
  mutate(cumulative = cumsum(num_farms)) %>%
  na.omit()


# -- Num orders --
`Number of Orders Monthly` <- df %>%
  select(Farm.Name, order_date) %>%
  group_by(order_date) %>%
  summarize(num_orders = n()) %>%
  mutate(cumulative = cumsum(num_orders)) %>%
  na.omit()


# -- Order amount ($) --
`Order Amount ($) Monthly` <- df %>%
  select(order_date, Order.Amount) %>%
  group_by(order_date) %>%
  summarize(`Total Order Amount ($)` = sum(Order.Amount, na.rm = T)) %>%
  mutate(cumulative = cumsum(`Total Order Amount ($)`)) %>%
  na.omit()


# -- Amount purchased (lb) --
`Pounds Purchased Monthly` <- df %>%
  select(order_date, Pounds.Purchased) %>%
  group_by(order_date) %>%
  summarize(`Total Pounds Purchased` = sum(Pounds.Purchased, na.rm = T)) %>%
  mutate(cumulative = cumsum(`Total Pounds Purchased`)) %>%
  na.omit()


# -- Funds disbursed ($) --
`Funds Disbursed ($) Yearly` <- funds %>%
  group_by(order_date) %>%
  summarize(total_funds = sum(funds_dispersed, na.rm = T)) %>%
  mutate(cumulative = cumsum(total_funds)) %>%
  na.omit()


# ~~ MAP DATA ~~
# -- Set up map --
kingco <- readOGR(dsn = "Data/kingco_shapefile/King_County_with_Natural_Shoreline_for_Puget_Sound_and_Lake_Washington___kingsh_area.shp")
wa <- map_data("county", "washington")

# Remove farms with locations that are a) unknown or b) outside of King county.
remove_farms <- c(
  "Unknown",
  "Lily Fields",
  "High & Dry Farm",
  "Orange Star Farm",
  "Caruso Farm",
  "Skylight Farms",
  "Lowlands Farm",
  "Tangled Willows Farm"
)
df_map <- df %>%
  filter(!(Farm.Name %in% remove_farms))


# -- Total Orders --
`Total Orders` <- df_map %>%
  select(Farm.Name, order_date, lat, lon) %>%
  group_by(Farm.Name, lat, lon) %>%
  summarize(total = n()) %>%
  na.omit()


# -- Total Order Amount ($) --
`Total Order Amount ($)` <- df_map %>%
  select(Farm.Name, Order.Amount, lat, lon) %>%
  group_by(Farm.Name, lat, lon) %>%
  summarize(total = sum(Order.Amount, na.rm = T)) %>%
  na.omit()


# -- Total Pounds Purchased --
`Total Pounds Purchased` <- df_map %>%
  select(Farm.Name, Pounds.Purchased, lat, lon) %>%
  group_by(Farm.Name, lat, lon) %>%
  summarize(total = sum(Pounds.Purchased, na.rm = T)) %>%
  na.omit()
