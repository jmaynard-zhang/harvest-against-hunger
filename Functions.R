# FUNCTIONS

load_pckg <- function() {
  # Data Wrangling
  library(tidyverse)
  library(readxl)
  library(dplyr)
  library(zoo)
  library(rlist)
  library(data.table)
  library(stringr)
  library(stringi)

  # Visualizations
  library(ggplot2)
  library(RColorBrewer)
  library(writexl)
  library(plotly)
  library(sf)
}

load_dfs <- function() {
  source("Dataframes.R")
}
