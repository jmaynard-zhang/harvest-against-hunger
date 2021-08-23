# FUNCTIONS

# Loads all packages needed for the code to run.
load_pckg <- function() {
  # Data compilation
  library(tidyverse)
  library(readxl)
  library(dplyr)
  library(zoo)
  library(rlist)
  library(data.table)
  library(stringr)
  library(stringi)

  # Visualizations
  library(lubridate)
  library(ggplot2)
  library(RColorBrewer)
  library(writexl)
  library(plotly)
  library(sf)
  library(ggrepel)
  library(maps)
  library(mapproj)

  # Coding cleanup (delete later)
  library(styler)
  library(lintr)
}

# # Returns a graph's corresponding title (type character) based off of the
# # given dataframe name (type character).
# get_title <- function(df_name) {
#   if (df_name=="farms_monthly") {
#     return("Farms Served Monthly")
#   } else if (df_name=="orders_monthly") {
#     return("Number of Orders Monthly")
#   } else if (df_name=="dollars_monthly") {
#     return("Order Amount ($) Monthly")
#   } else if (df_name=="lbs_monthly") {
#     return("Pounds Purchased Monthly")
#   } else if (df_name=="funds_yearly") {
#     return("Funds Dispersed Yearly")
#   }
# }
#
# # Returns a vector of graph titles matched to corresponding dataframe names
# # based on given dataframe names.
# get_titles <- function(df_names) {
#   titles = vector()
#
#   # Go through every given dataframe name.
#   for (i in length(df_names)) {
#     df_name = df_names[i]
#
#     title = get_title(df_name)
#
#     obj = (title = df_name)
#
#     append(titles, obj)
#   }
#
#   return(titles)
# }
