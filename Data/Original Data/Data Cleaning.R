# DATA CLEANING

# -- Load packages --
load_pckg()


# # -- Load data --
# # KCFS 2019
# X19_list <- list()
# X19_programs <- excel_sheets(path="./Data/Original Data/KCFS 2019.xlsx")
# sheets <- 3:length(X19_programs)
# for (i in sheets) {
#   temp <- read_excel("./Data/Original Data/KCFS 2019.xlsx",
#                      skip = 2,
#                      sheet = X19_programs[i])
#   X19_list[[i - 2]] <- temp
# }
#
# # KCFS 2020
# X20_list <- list()
# X20_programs <- excel_sheets(path="./Data/Original Data/KCFS 2020.xlsx")
# sheets <- 2:length(X20_programs)
# for (i in sheets) {
#   temp <- read_excel("./Data/Original Data/KCFS 2020.xlsx",
#                      skip = 3,
#                      sheet = X20_programs[i])
#   X20_list[[i - 1]] <- temp
# }
#
# # CARES
# cares.list <- list()
# cares_programs <- excel_sheets(path="./Data/Original Data/CARES.xlsx")
# sheets <- 2:length(cares_programs)
# for (i in sheets) {
#   temp <- read_excel("./Data/Original Data/CARES.xlsx",
#                      skip = 1,
#                      sheet = cares_programs[i])
#   cares.list[[i - 1]] <- temp
# }

# KCFS Funds
funds <- read_excel("./Data/Original Data/KCFS $.xlsx") %>%
  pivot_longer(!Organization,
               names_to="year",
               values_to="funds_dispersed") %>%
  mutate(year=as.Date(ISOdate(year, 1, 1)))


# # -- Select & Filter --
# # Append lists
# X19_list <- X19_list %>%
#   lapply(rename, `Order Date` = `Contract Date`)
# x <- c()
# for (i in 1:length(X19_list)) {
#   temp_cols <- colnames(X19_list[[i]])
#   temp_df <- X19_list[[i]]
#
#   if ("Contract Amount" %in% temp_cols) {
#     X19_list[[i]] <- temp_df %>%
#     rename(`Order Amount ($)` = `Contract Amount`)
#   } else if ("\r\nContract Amount" %in% temp_cols) {
#     X19_list[[i]] <- temp_df %>%
#     rename(`Order Amount ($)` = `\r\nContract Amount`)
#   } else {
#     x <- append(x, i)
#   }
# }
#
# list <- append(X19_list, X20_list)
# list <- append(list, cares.list)
# ## Select relevant columns
# list <- list %>%
#   lapply(select, `Farm Name`,
#          `Order Date`,
#          `Pounds purchased`,
#          `Order Amount ($)`
#          )
# ## Filter out "Totals"
# list <- list %>%
#   lapply(subset, `Farm Name` != "Totals")
#
#
# # -- Small Fixes --
# ## Filter out empty dfs
# list <- list[lapply(list, nrow) > 0]
# for (i in 1:length(list)) {
#   curr = list[[i]]
#
#   ## Order Date to consistent date format
#   if (typeof(curr$`Order Date`) == "character") {
#     list[[i]]$`Order Date` = as.Date(
#       as.numeric(curr$`Order Date`), origin = "1899-12-30")
#   } else {
#     list[[i]]$`Order Date` = as.Date(curr$`Order Date`)
#   }
# }
#
#
# # -- Merge lists --
# df <- rbindlist(list)
#
#
# # -- Fixing `Pounds purchased` --
# # Remove unnecessary numbers by removing everything after the '=', '(', and
# # '$' signs (inclusive)
# remove <- "\\(.*|=.*|\\$.*| +$"
# df_fix_lbs <- df %>%
#   mutate(`Pounds purchased`=gsub(pattern=remove,
#                                  replacement = "",
#                                  df$`Pounds purchased`))
# # Extract the first number of each cell
# df <- df %>%
#   mutate(`Pounds purchased`=stri_extract_first_regex(`Pounds purchased`,
#                                                      "[0-9]+"))
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
# # Add numbers together in excel!!!
# write.csv(df_fix_lbs, "./Data/fix_pounds_purchased.csv", row.names = F)

# # -- Compiled 2019-2020 KCFS + CARES data, with pounds purchased fixed --
# df <- read.csv("./Data/fix_pounds_purchased.csv") %>%
#   # Char to num type
#   mutate(Pounds.Purchased=as.numeric(Pounds.purchased)) %>%
#   # Char to date type
#   mutate(Order.Date=anydate(Order.Date)) %>%
#   # Rename Order.Date
#   rename(Order.Amount=Order.Amount....)
#
#
# # -- Fix misspelled farm names --
# farms <- df %>%
#   select(Farm.Name) %>%
#   unique() %>%
#   arrange(Farm.Name)
#
# write.csv(farms,
#           "Data/Original Data/misspelled_farm_names.csv",
#           row.names=F)
#
# correct_farms <- read.csv("./Data/Original Data/correct_farm_names.csv")
#
# # Join main df with fixed farm names
# df <- df %>%
#   left_join(correct_farms)
#
# # Remove the old farm names column
# df <- df %>%
#   select(-Farm.Name)
#
# # Rename fixed farm names column to "Farm.Name"
# df <- df %>%
#   rename(Farm.Name="Correct.Farm.Name")
#
#
# # -- Add coords to the df --
# # Record coords on excel!!!
# correct_farms <- correct_farms %>%
#   select(Correct.Farm.Name) %>%
#   rename(Farm.Name=Correct.Farm.Name) %>%
#   unique()
#
# old_coords <- read.csv("./Data/Original Data/correct_coords.csv")
#
# old_coords <- correct_farms %>%
#   full_join(old_coords)
#
# write.csv(old_coords,
#           "./Data/Original Data/old_coords.csv",
#           row.names = F)
#
# # Load new farm coord data
# farm_coords <- read.csv("./Data/Original Data/correct_coords.csv")
#
# df <- df %>%
#   left_join(farm_coords)
#
# # Separate coords into lat & long
# df <- df %>%
#   mutate(lat = as.numeric(gsub("^(.*?),.*", "\\1", Coordinates)),
#         lon = as.numeric(sub("^.*?,", "", Coordinates)))
#
#
# # -- Add Order Month column --
# df <- df %>%
#   mutate(order_month=lubridate::floor_date(Order.Date, "month"))
#
# # Rename columns
# df <- df %>%
#   rename(order_date=order_month)
#
# funds <- funds %>%
#   rename(order_date=year)

# -- DF to csv --
write.csv(df, "./Data/dataframe.csv", row.names = F)
write.csv(funds, "./Data/funds_dataframe.csv", row.names = F)

# Manually change Clean Green's lbs purchased to 5500

# Manually change date format
