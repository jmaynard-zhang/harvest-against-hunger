# FUNCTIONS

load_pckg <- function() {
  library(tidyverse)
  library(readxl)
  library(dplyr)
  library(zoo)
  library(rlist)
  library(data.table)
  library(stringr)
  library(stringi)
  library(ggplot2)
  library(RColorBrewer)
  library(writexl)
}

load_dfs <- function() {
  source("Dataframes.R")
}
