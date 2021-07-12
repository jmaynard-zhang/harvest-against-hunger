# VISUALIZATION 1 - KCFS 2019-2021 Line Graphs

# -- Load packages --
library(ggplot2)
library(RColorBrewer)

# -- Num farms served --
# By day
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
programs_daily.line <- ggplot(data = programs_daily) +
  geom_line(
    mapping = aes(x = `Order Date`, y = `Number of Programs`),
    size = 2
  ) +
  labs(
    title = "Total Program Partnerships Daily",
    x = "Date",
    y = "Number of Programs"
  )


# -- Order amount ($) --
dollars_daily.line <- ggplot(data = dollars_daily) +
  geom_line(
    mapping = aes(x = `Order Date`, y = `Total Order Amount ($)`),
    size = 2
  ) +
  labs(
    title = "Total Order Amount ($) Daily",
    x = "Date",
    y = "Order Amount ($)"
  ) #* Looks like there's an outlier


# -- Amount purchased (lb) --
lbs_daily.line <- ggplot(data = lbs_daily) +
  geom_line(
    mapping = aes(x = `Order Date`, y = `Total Pounds Purchased`),
    size = 2
  ) +
  labs(
    title = "Total Pounds Purchased Daily",
    x = "Date",
    y = "Pounds Purchased"
  )


# -- Funds disbursed ($) --
