# DATAFRAMES

# -- Load packages --
load_pckg()

# -- Num farms served --
# By day
farms_daily <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  unique() %>% #* There are some misspellings that makes this inaccurate
  group_by(`Order Date`) %>%
  summarize(`Number of Farms` = n()) %>%
  na.omit()

# By month

# By year
farms_yearly <- df %>%
  select(`Farm Name`, `Order Date`) %>%
  mutate(`Order Year`=as.integer(format(df$`Order Date`, format = "%Y"))) %>%
  group_by(`Order Year`) %>%
  summarize(`Number of Farms` = n()) %>%
  na.omit()


# -- Num orders --
# By day
orders_daily <- df %>%
  select(`Order Date`) %>%
  group_by(`Order Date`) %>%
  summarize(`Number of Orders` = n()) %>%
  na.omit()


# -- Num programs --
# By day
programs_daily <- df %>%
  select(`Program`, `Order Date`) %>%
  unique() %>% #* There are some misspellings that makes this inaccurate
  group_by(`Order Date`) %>%
  summarize(`Number of Programs` = n()) %>%
  na.omit()


# -- Order amount ($) --
dollars_daily <- df %>%
  select(`Order Amount ($)`, `Order Date`) %>%
  group_by(`Order Date`) %>%
  summarize(`Total Order Amount ($)` = sum(`Order Amount ($)`, na.rm = t))


# -- Amount purchased (lb) --
lbs_daily <- df %>%
  select(`Pounds purchased`, `Order Date`) %>%
  group_by(`Order Date`) %>%
  summarize(`Total Pounds Purchased` = sum(`Pounds purchased`, na.rm = T))


# -- Funds disbursed ($) --
