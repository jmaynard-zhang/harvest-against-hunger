# VISUALIZATION 1 - KCFS 2019-2021 Line Graph

# -- Load packages --
library(tidyverse)
library(readxl)
library(dplyr)
library(zoo)
library(rlist)
library(data.table)
library(stringr)
library(stringi)


# -- Load data --
## KCFS Funds
funds <- read_excel("./Datasets/KCFS $.xlsx")
## KCFS 2019
X19_list <- list()
X19_programs <- excel_sheets(path="./Datasets/KCFS 2019.xlsx")
sheets <- 3:length(X19_programs)
for (i in sheets) {
  temp <- read_excel("./Datasets/KCFS 2019.xlsx",
                     skip = 2,
                     sheet = X19_programs[i])
  temp$Program <- X19_programs[i]
  temp$Year <- 2019
  X19_list[[i - 2]] <- temp
}
## KCFS 2020
X20_list <- list()
X20_programs <- excel_sheets(path="./Datasets/KCFS 2020.xlsx")
sheets <- 2:length(X19_programs)
for (i in sheets) {
  temp <- read_excel("./Datasets/KCFS 2020.xlsx",
                     skip = 3,
                     sheet = X20_programs[i])
  temp$Program <- X20_programs[i]
  temp$Year <- 2020
  X20_list[[i - 1]] <- temp
}


# -- Select & Filter --
# Append lists
X19_list <- X19_list %>%
  lapply(rename, `Order Date` = `Contract Date`)
list <- append(X19_list, X20_list)
## Select relevant columns
list <- list %>%
  lapply(select, `Farm Name`,
         `Order Date`,
         `Pounds purchased`,
         `Program`,
         `Year`)
## Filter out "Totals"
list <- list %>%
  lapply(subset, `Farm Name` != "Totals")


# -- Small Fixes --
## Filter out empty dfs
list <- list[lapply(list, nrow) > 0]
for (i in 1:length(list)) {
  curr = list[[i]]

  ## Order Date to consistent date format
  if (typeof(curr$`Order Date`) == "character") {
    list[[i]]$`Order Date` = as.Date(
      as.numeric(curr$`Order Date`), origin = "1899-12-30")
  } else {
    list[[i]]$`Order Date` = as.Date(curr$`Order Date`)
  }
}


# -- Merge --
df <- rbindlist(list)


# -- Fixing `Pounds purchased` --
# Temporary solution: just take the first number in each cell.
## Remove unnecessary numbers by removing everything after the '=', '(', and
## '$' signs (uninclusive).
remove <- "\\(.*|=.*|\\$.*| +$"
df <- df %>%
  mutate(`Pounds purchased`=gsub(pattern=remove,
                                 replacement = "",
                                 df$`Pounds purchased`))
## Extract the first number of each cell
df <- df %>%
  mutate(`Pounds purchased`=stri_extract_first_regex(`Pounds purchased`,
                                                     "[0-9]+"))

# Eventually... Add together pounds purchased (remove all non-numeric
## characters and add remaining numbers; there will be some errors, but it's
## the best solution).
# 2. Extract numbers & add together
  # For every row in `Pounds purchased`
  # Extract numbers
  # Unlist and add together
# fix_pp$`Pounds purchased` <- fix_pp %>%
#   select(`Pounds purchased`) %>%
#   apply(2, stri_extract_first_regex, "[0-9]+")

# gregexpr("[[:digit:]]+", fix_pp$`Pounds purchased`)
