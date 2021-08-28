server <- function(input, output) {
    # Vis 1 - Line
    output$line <- renderPlotly({
        # Select data widget
        line_data <- get(input$line_select)
        y_col <- colnames(data)[[3]]

        # Plot
        line.plot <- plot_ly(line_data, x = line_data[[1]]) %>%
            add_lines(y = line_data[[3]],
                      name = input$line_select) %>%
            layout(
                title = input$line_select,
                xaxis = list(
                    rangeslider = list(type = "date"),
                    title = "Date"),
                yaxis = list(title = ""))

        return(ggplotly(line.plot))
    })

    # Vis 2 - Map
    output$map <- renderPlotly({
        # Select data widget
        map_data <- get(input$map_select)

        # Plot
        map.plot <- ggplot() +
            geom_polygon(data=wa,
                         aes(x=long, y=lat, group=group),
                         alpha=0.3) +
            geom_point(data=map_data,
                       fill = "light grey",
                       aes(x=map_data$lon,
                           y=map_data$lat,
                           alpha=map_data[[4]])) +
            theme_void() +
            coord_map() +
            ggtitle(paste(input$map_select, "since 2019"))
    })
}
