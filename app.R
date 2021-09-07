source("Functions.R")
source("Data/Data Compilation.R")
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)
