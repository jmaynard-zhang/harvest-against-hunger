# Vis 1 - Line
line_select <- selectInput(
    inputId = "line_select",
    label = "Select what data to display:",
    choices = c(
        "Number of Farms Served Monthly",
        "Number of Orders Monthly",
        "Order Amount ($) Monthly",
        "Pounds Purchased Monthly",
        "Funds Disbursed ($) Yearly"
    )
)

line_panel <- tabPanel(
    "Line Plot",
    sidebarPanel(
        line_select
    ),
    mainPanel(
        plotlyOutput("line")
    )
)

# Vis 2 - Map
map_select <- selectInput(
    inputId = "map_select",
    label = "Select what data to display:",
    choices = c(
        "Total Orders",
        "Total Order Amount ($)",
        "Total Pounds Purchased"
    )
)

map_shape_select <- selectInput(
    inputId="map_shape_select",
    label="Select the map shape:",
    choices=c(
        "Washington State"="wa",
        "King County"="kingco"
    )
)

map_panel <- tabPanel(
    "Map Plot",
    sidebarPanel(
        map_select,
        map_shape_select
    ),
    mainPanel(
        plotlyOutput("map")
    )
)

# UI
ui <- navbarPage(
    "KCFS Data",
    theme = shinytheme("cosmo"),
    line_panel,
    map_panel
)
