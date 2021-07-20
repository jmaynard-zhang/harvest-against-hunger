# DATA COMPILATION

# -- Load packages --
load_pckg()


# -- Load data --
# KCFS 2019
X19_list <- list()
X19_programs <- excel_sheets(path="./Datasets/KCFS 2019.xlsx")
sheets <- 3:length(X19_programs)
for (i in sheets) {
  temp <- read_excel("./Datasets/KCFS 2019.xlsx",
                     skip = 2,
                     sheet = X19_programs[i])
  temp$Program <- X19_programs[i]
  # temp$Year <- 2019
  X19_list[[i - 2]] <- temp
}

# KCFS 2020
X20_list <- list()
X20_programs <- excel_sheets(path="./Datasets/KCFS 2020.xlsx")
sheets <- 2:length(X19_programs)
for (i in sheets) {
  temp <- read_excel("./Datasets/KCFS 2020.xlsx",
                     skip = 3,
                     sheet = X20_programs[i])
  temp$Program <- X20_programs[i]
  # temp$Year <- 2020
  X20_list[[i - 1]] <- temp
}

# CARES
cares.list <- list()
cares_programs <- excel_sheets(path="./Datasets/CARES.xlsx")
sheets <- 2:length(cares_programs)
for (i in sheets) {
  temp <- read_excel("./Datasets/CARES.xlsx",
                     skip = 1,
                     sheet = cares_programs[i])
  temp$Program <- cares_programs[i]
  # temp$Year <- 2020
  cares.list[[i - 1]] <- temp
}

# KCFS Funds
funds <- read_excel("./Datasets/KCFS $.xlsx")
funds <- funds %>%
  pivot_longer(!Organization,
               names_to="year",
               values_to="funds_dispersed")
funds <- funds %>%
  mutate(year=as.Date(ISOdate(year, 1, 1)))


# -- Select & Filter --
# Append lists
X19_list <- X19_list %>%
  lapply(rename, `Order Date` = `Contract Date`)
# X19_list <- X19_list %>%
#   lapply(rename, `Order Amount` = `\r\nContract Amount`)
x <- c()
for (i in 1:length(X19_list)) {
  temp_cols <- colnames(X19_list[[i]])
  temp_df <- X19_list[[i]]

  if ("Contract Amount" %in% temp_cols) {
    X19_list[[i]] <- temp_df %>%
    rename(`Order Amount ($)` = `Contract Amount`)
  } else if ("\r\nContract Amount" %in% temp_cols) {
    X19_list[[i]] <- temp_df %>%
    rename(`Order Amount ($)` = `\r\nContract Amount`)
  } else {
    x <- append(x, i)
  }
}

list <- append(X19_list, X20_list)
list <- append(list, cares.list)
## Select relevant columns
list <- list %>%
  lapply(select, `Farm Name`,
         `Order Date`,
         `Pounds purchased`,
         `Program`,
         `Order Amount ($)`
         )
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


# -- Merge lists --
df <- rbindlist(list)
  # mutate(Year=as.Date(df$Year))
  # mutate(Year=as.Date(ISOdate(df$Year, 1, 1)))


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
## Type char to num
df <- df %>%
  mutate(`Pounds purchased`=as.numeric(`Pounds purchased`))


# -- Fix misspelled farm names --
farms <- df %>%
  select(`Farm Name`) %>%
  unique()

correct_farms <- read_xlsx(path="./Datasets/correct_farm_names.xlsx")

df <- df %>%
  left_join(correct_farms)

df <- df %>%
  select(-`Farm Name`)

df <- df %>%
  rename(`Farm Name`=`Correct Farm Name`)


# -- Add coords to the df --
farm_coords <- read_xlsx("./Datasets/farm_coords.xlsx")

df <- df %>%
  left_join(farm_coords)

# Separate coords into lat & long
df <- df %>%
  mutate(lat = as.numeric(gsub("^(.*?),.*", "\\1", Coordinates)),
        lon = as.numeric(sub("^.*?,", "", Coordinates)))

#
# test <- df %>%
#   full_join(funds, by=c("Program"="Organization", "Order Date"="year"))
