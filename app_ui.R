# Vis 1 - Line
# Get titles
t1 = get_title("farms_monthly")
t2 = get_title("orders_monthly")
t3 = get_title("dollars_monthly")
t4 = get_title("lbs_monthly")
t5 = get_title("funds_yearly")

line_select <- selectInput(
    inputId = "line_select",
    label = "Select what data to display:",
    choices = c(
        "Farms Served Monthly",
        t2="orders_monthly",
        t3="dollars_monthly",
        t4="lbs_monthly",
        t5="funds_yearly"
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
    line_panel#,
    #map_panel
)
