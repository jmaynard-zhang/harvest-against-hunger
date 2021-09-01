# FUNCTIONS

# Installs all packages needed for the code to run.

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
