# FUNCTIONS

# Installs all packages needed for the code to run.
install_pckg <- function() {
  # Data compilation
  install.packages("tidyverse")
  install.packages("readxl")
  install.packages("dplyr")
  install.packages("zoo")
  install.packages("rlist")
  install.packages("data.table")
  install.packages("stringr")
  install.packages("stringi")
  install.packages("anytime")

  # Data filtering
  install.packages("rgdal")

  # Visualizations
  install.packages("ggplot2")
  install.packages("RColorBrewer")
  install.packages("writexl")
  install.packages("plotly")
  install.packages("sf")
  install.packages("ggrepel")
  install.packages("maps")
  install.packages("mapproj")
  install.packages("shinythemes")

  # Coding cleanup (delete later)
  install.packages("styler")
  install.packages("lintr")
}

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
  library(anytime)

  # Data filtering
  library(rgdal)

  # Visualizations
  library(ggplot2)
  library(RColorBrewer)
  library(writexl)
  library(plotly)
  library(sf)
  library(ggrepel)
  library(maps)
  library(mapproj)
  library(shinythemes)

  # Coding cleanup (delete later)
  library(styler)
  library(lintr)
}

# Returns a list of dataframes from a given excel spreadsheet, where each
# dataframe is an excel sheet.
#
# xlsx = path to spreadsheet (ex: "./Data/Original Data/KCFS 2019.xlsx")
# start = starting sheet number (ex: 3)
# skip_row = number of top rows to ignore (ex: 2)
xlsx_to_list <- function(xlsx, start, skip_row) {
  # Set up return list
  df_list <- list()

  # Get list of sheet names
  sheet_names <- excel_sheets(path=xlsx)

  # Get number of sheets
  num_sheets <- length(sheet_names)

  # Get range of relevant sheets
  sheets <- start:num_sheets

  # Add each sheet to the return list
  for (sheet in sheets) {
    # Temporarily store sheet
    temp <- read_excel(xlsx,
                       skip = skip_row,
                       sheet = sheet_names[sheet])

    # Offset this loop's index so that it matches the current index of the
    # return list
    offset_index <- sheet - (start - 1)

    # Add sheet to proper index of return list
    df_list[[offset_index]] <- temp

    # Get the program name based off of the current sheet name
    program_name <- sheet_names[[sheet]]

    # Add program name to a new program name column in the return list
    df_list[[offset_index]][["program_name"]] <- program_name
  }

  return(df_list)
}

# Returns a list of dataframes with date columns in consistent format. DATE
# COLUMN MUST BE NAMED `order_date`
#
# df_list = list of dataframes (ex: list)
consistent_date <- function(df_list) {
  # Get number of dataframes in df list
  num_dfs <- length(df_list)

  # Fix dates in each df
  for (df in 1:num_dfs) {
    # Get current df
    curr = df_list[[df]]

    # Fix column differently based off of it's type
    if (typeof(curr$order_date) == "character") {
      df_list[[df]]$order_date = as.Date(
        as.numeric(curr$order_date), origin = "1899-12-30")
    } else {
      df_list[[df]]$order_date = as.Date(curr$order_date)
    }
  }

  return(df_list)
}

# Returns a dataframe, where a given character type column is prepared to be
# evaluable in excel (for fixing pounds purchased).
#
# df = dataframe
# col = column
# fix_lbs_purchased <- function(df, col) {
#   df <- strip_unnecessary(df, col)
#
#   df <- non_num_to_plus(df, col)
#
#   return(df)
# }
#
# # Remove unnecessary numbers by removing everything after the '=', '(', and
# # '$' signs (inclusive).
# #
# # df = dataframe
# # col = column
# strip_unnecessary <- function(df, col) {
#   remove <- "\\(.*|=.*|\\$.*| +$"
#
#   df <- df %>%
#     mutate(pounds_purchased=gsub(pattern=remove,
#                                    replacement = "",
#                                    df$pounds_purchased))
#
#   return(df)
# }
#
# # Replace non-numbers with spaces
# remove2 <- "[^0-9.-]"
# df_fix_lbs <- df_fix_lbs %>%
#   mutate(`Pounds purchased`=gsub(pattern=remove2,
#                                  replacement = " ",
#                                  df_fix_lbs$`Pounds purchased`))
# # Trim whitespace
# df_fix_lbs <- df_fix_lbs %>%
#   mutate(`Pounds purchased`=str_trim(str_squish(df_fix_lbs$`Pounds purchased`)))
# # Replace spaces with `+`
# df_fix_lbs <- df_fix_lbs %>%
#   mutate(`Pounds purchased`=gsub(pattern=" ",
#                                  replacement="+",
#                                  df_fix_lbs$`Pounds purchased`))

# Returns a dataframe, removing all characters after the '=', '(', and '$' signs
# (inclusive) from a given character type column.

# Returns a dataframe, replacing all characters between each number in a
# character type column with single '+' signs.

# Returns a dataframe with a single column of unique names from given dataframe
# column (for fixing farm names).

# Returns a dataframe with coordinates from given dataframe separated into `lon`
# and `lat` columns.

# Returns a dataframe, replacing the order date column with order month data.
