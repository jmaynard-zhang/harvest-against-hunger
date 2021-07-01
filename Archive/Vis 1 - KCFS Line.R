# VISUALIZATION 1 - KCFS 2019-2021 Line Graph

# -- Load packages --
library(tidyverse)
library(readxl)
library(dplyr)

# -- Load data --
# KCFS $
#kcfsFunds <- read.csv("./Datasets/KCFS $.csv")
funds <- read_excel("./Datasets/KCFS $.xlsx")
## KCFS 2019
X19vm <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "Vashon Maury"
)
X19pom <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "Plateau Outreach Ministries"
)
X19skcfc <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "South King County Food Coalitio"
)
X19jfs <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "Jewish Family Service"
)
X19wc <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "White Center"
)
X19rv <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "Rainier Valley"
)
X19ud <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "University District"
)
X19pm <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "Pike Market"
)
X19mp <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "Marys Place"
)
X19ssc <- read_excel("./Datasets/KCFS 2019.xlsx",
                   skip = 2,
                   sheet = "SSC"
)
X19h <- read_excel("./Datasets/KCFS 2019.xlsx",
                    skip = 2,
                    sheet = "Hopelink"
)
## KCFS 2020
X20h <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Hopelink"
)
X20jfs <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Jewish Family Service"
)
X20wcfb <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "White Center FB"
)
X20ssc <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "South Seattle College"
)
X20rvfb <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Rainier Valley FB"
)
X20pmfb <- read_excel("./Datasets/KCFS 3030.xlsx",
                  skip = 3,
                  sheet = "Pike Market FB"
)
X20udfb <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "U District FB"
)
X20skcfc <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "SKCFC"
)
X20pom <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Plateau Outreach Ministries"
)
X20vmfb <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Vashon Maury FB"
)
X20fs <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "FareStart"
)
X20mp <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Marys Place"
)
X20bb <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Byrd Barr"
)
X20pbfs <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Plant-Based FS"
)
X20lcsb <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Lifelong CSB"
)
X20acrs <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "ACRS"
)
X20bgcf <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "B&GC Fed Way 8th Ave"
)
X20bgck <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "B&GC Kirkland"
)
X20tf <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Teen Feed"
)
X20fw <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "FamilyWorks"
)
X20jr <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Jubilee Reach"
)
X20mm <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Mom & Me"
)
X20kc <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Kent Covenant"
)
X20ps <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Phenomenal She"
)
X20wlk <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "We Love Kent"
)
X20n <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Nouri"
)
X20lah <- read_excel("./Datasets/KCFS 2020.xlsx",
                  skip = 3,
                  sheet = "Lend a Hand"
)

# -- Create vector with all 2019/2020 dfs --
dfs <- c(X19h, X19jfs, X19mp)

# -- Select --
## Remove "Total" rows from 2020 data
X19h <- subset(X19h, `Farm Name`!="Totals")
X20acrs <- subset(X20acrs, `Farm Name`!="Totals")
X20bgck <- subset(X20bgck, `Farm Name`!="Totals")
X20h <- subset(X20h, `Farm Name`!="Totals")
X20jfs <- subset(X20jfs, `Farm Name`!="Totals")
## Select
X19h <- X19h %>%
  select(`Farm Name`, `\nContract Amount`, `Contract Date`, `Pounds purchased`)
X19h <- X19h[-c(21, 22, 23, 24), ] # <- quick fix get rid of unnecessary rows
X19jfs <- X19jfs %>%
  select(`Farm Name`, `\nContract Amount`, `Contract Date`, `Pounds purchased`)

# -- Fix data types columns --
## `Pounds Purchased` in 2019 to numeric
#remove all non-numerics and non-spaces <- what about "bunches"?
#add together numbers separated by 1 or more space
## Fix `Order Date`
#Fix 2020 wcfb specifically

# -- Join data --
## Program column
X19h$Program <- "Hopelink"
X19jfs$Program <- "Jewish Family Service"
X19mp$Program <- "Mary's Place"
X19pm$Program <- "Pike Market"
X19pom$Program <- "Plateau Outreach Ministries"
X19rv$Program <- "Rainier Valley"
X19skcfc$Program <- "South King County Food Coalition"
X19ssc$Program <- "South Seattle College"
X19ud$Program <- "University District"
X19vm$Program <- "Vashon Maury"
X19wc$Program <- "White Center"
X20acrs$Program <- "ACRS"
X20bb$Program <- "Byrd Barr"
X20bgcf$Program <- "B&GC: Fed Way 8th Ave"
X20bgck$Program <- "B&GC: Kirkland"
X20fs$Program <- "FareStart"
X20fw$Program <- "FamilyWorks"
X20h$Program <- "Hopelink"
X20jfs$Program <- "Jewish Family Service"
X20jr$Program <- "Jubilee Reach"
X20kc$Program <- "Kent Covenant"
X20lah$Program <- "Lend A Hand"
X20lcsb$Program <- "Lifelong CSB"
X20mm$Program <- "Mom & Me"
X20mp$Program <- "Mary's Place"
#...
df <- X19skcfc %>%
  full_join(X19jfs)
df2 <- X20acrs %>%
  full_join(X20bgck)
## Year/date column
df$Year <- 2019
df2$Year <- 2020
## Join years
df <- df %>%
  full_join(df2)
## Funds

# -- Rename columns -- SKIP FOR NOW
## `Produce type...11` to `Donations Produce Type`
## `Produce type...13` to `Gleaning Produce Type`
## `Amount (lb)...12` to `Donations Amount (lb)`
## `Amount (lb)...14` to `Gleaning Amount (lb)`
## Capitalize
## Units
## `(Pre-harvest...` to `Purchasing Model`
## Add row 3 labels to column names

# Create graph
