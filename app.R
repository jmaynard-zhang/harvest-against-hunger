source("Functions.R")
source("Static_Scripts/Vis 1 - Line.R")
source("Static_Scripts/Vis 2 - Map.R")
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)
