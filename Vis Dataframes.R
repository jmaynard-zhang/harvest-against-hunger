# VISUALIZATION 1 - KCFS 2019-2021 Line Graph

# -- Load packages --
library(tidyverse)
library(readxl)
library(dplyr)
library(zoo)
library(rlist)
library(data.table)
library(stringr)


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

  ## Add together pounds purchased (remove all non-numeric characters and add
  ## remaining numbers; there will be some errors, but it's the best solution)
  # <- Replace all whitespace with a single plus sign
  # <- Remove all non-numeric characters
  # <- Add numbers together
  # <- Convert column to numeric data type
}


# -- Testing purposes --
fix_lbs_purchased <- list[[1]]
## Add together pounds purchased (remove all non-numeric characters and add
## remaining numbers; there will be some errors, but it's the best solution)
fix_lbs_purchased <- fix_lbs_purchased %>%  # <- Remove everything after the '='
                                            # and '(' signs (uninclusive)
  select(`Pounds purchased`) %>%
  gsub(pattern = "\\(.*", replacement = "")
# <- Remove all non-numeric characters
# <- Add numbers together
# <- Convert column to numeric data type


# -- Merge --
df <- rbindlist(list)
# df <- list[[1]]
# for (i in 2:length(list)) {
#   df <- df %>%
#     full_join(list[[i]])
# }


# -- Line df --


# -- Map df --
# VISUALIZATION 1 - KCFS 2019-2021 Line Graph

# -- Load packages --
library(tidyverse)
library(readxl)
library(dplyr)
library(zoo)
library(rlist)
library(data.table)


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


# -- Testing purposes --
## Add together pounds purchased (remove all non-numeric characters and add
## remaining numbers; there will be some errors, but it's the best solution)
# 1. Remove unnecessary numbers by removing everything after the '=', '(', and
# '$' signs (uninclusive).
remove <- "\\(.*|=.*|\\$.*| +$"
fix_pp <- df
fix_pp$`Pounds purchased` <- fix_pp %>%
  select(`Pounds purchased`) %>%
  apply(2, gsub, pattern=remove, replacement = "")

fix_pp <- fix_pp %>%
  mutate(`Pounds purchased`=gsub(pattern=remove,
                                    replacement = "",
                                    fix_pp$`Pounds purchased`))

# 2. Extract numbers
fix_pp <- fix_pp %>%
  select(`Pounds purchased`) %>%
  mutate()
# 3. Add numbers together
# X19_vm <- X19_list[[1]]
# X19_pom <- X19_list[[2]]
# X20_h <- X20_list[[1]]
# X20_jfs <- X20_list[[2]]
# X19_vm <- list[[1]]
# X20_mp <- list[[22]]


# -- Merge --
df <- rbindlist(list)

# -- More fixes --
## Add together pounds purchased (remove all non-numeric characters and add
## remaining numbers; there will be some errors, but it's the best solution)
# <- Replace all whitespace with a single plus sign
# <- Remove all non-numeric characters
# <- Add numbers together
# <- Convert column to numeric data type

# -- Line df --


# -- Map df --
