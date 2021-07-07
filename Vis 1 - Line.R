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
    x = "Date",
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
# By day
orders_daily <- df %>%
  select(`Order Date`) %>%
  group_by(`Order Date`) %>%
  summarize(`Number of Orders` = n()) %>%
  na.omit()

orders_daily.line <- ggplot(data = orders_daily) +
  geom_line(
    mapping = aes(x = `Order Date`, y = `Number of Orders`),
    size = 2
  ) +
  labs(
    title = "Total Orders Daily",
    x = "Date",
    y = "Number of Orders"
  )


# -- Num programs --
# By day
programs_daily <- df %>%
  select(`Program`, `Order Date`) %>%
  unique() %>% #* There are some misspellings that makes this inaccurate
  group_by(`Order Date`) %>%
  summarize(`Number of Programs` = n()) %>%
  na.omit()

programs_daily.line <- ggplot(data = programs_daily) +
  geom_line(
    mapping = aes(x = `Order Date`, y = `Number of Programs`),
    size = 2
  ) +
  labs(
    title = "Total Program Partnerships Daily",
    x = "Date",
    y = "Number of Programs" #* Get rid of decimal values
  )


# -- Order amount ($) --


# -- Amount purchased (lb) --


# -- Funds disbursed ($) --
