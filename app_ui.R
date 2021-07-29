# Vis 1 - Line
# line_data <- selectInput(
#     inputId = "line_data",
#     label = "Select what data to display:",
#     choices = c(
#         farms_monthly
#     ),
#     selected="Total farms served"
# )

line_panel <- tabPanel(
    "Line Graph",
    # sidebarPanel(
    #     line_data
    # ),
    mainPanel(
        plotOutput("line")
    )
)

# Vis 2 - Map

# UI
ui <- navbarPage(
    "King County Farmers Share",
    line_panel
)
