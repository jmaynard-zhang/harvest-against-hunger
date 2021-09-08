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
  list <- list()

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
    list[[offset_index]] <- temp

    # Get the program name based off of the current sheet name
    program_name <- sheet_names[[sheet]]

    # Add program name to a new program name column in the return list
    list[[offset_index]][["program_name"]] <- program_name
  }

  return(list)
}

#
