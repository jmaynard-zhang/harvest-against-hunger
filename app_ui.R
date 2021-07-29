# Vis 1 - Line
line_data <- selectInput(
    inputId = "line_data",
    label = "Select what data to display:",
    choices = c(
        "farms_monthly",
        "orders_monthly",
        "dollars_monthly",
        "lbs_monthly"
    ),
    selected="farms_monthly"
)

line_panel <- tabPanel(
    "Line Graph",
    sidebarPanel(
        line_data
    ),
    mainPanel(
        plotlyOutput("line")
    )
)

# Vis 2 - Map

# UI
ui <- navbarPage(
    "King County Farmers Share",
    line_panel
)
