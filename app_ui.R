# Vis 1 - Line
line_select <- selectInput(
    inputId = "line_select",
    label = "Select what data to display:",
    choices = c(
        "farms_monthly",
        "orders_monthly",
        "dollars_monthly",
        "lbs_monthly"
    )
)

line_panel <- tabPanel(
    "Line Graph",
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
        "total_orders",
        "total_dollars",
        "total_lbs"
    )
)

map_panel <- tabPanel(
    "Map Graph",
    sidebarPanel(
        map_select
    ),
    mainPanel(
        plotlyOutput("map")
    )
)

# UI
ui <- navbarPage(
    "King County Farmers Share",
    line_panel,
    map_panel
)
