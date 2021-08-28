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
  library(shinythemes)

  # Coding cleanup (delete later)
  library(styler)
  library(lintr)
}
