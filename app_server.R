server <- function(input, output) {
    # Vis 1 - Line
    output$line <- renderPlotly({
        # Select data widget
        line_data <- get(input$line_select)
        y_col <- colnames(data)[[3]]

        # Plot
        line.plot <- plot_ly(line_data,
                             x = line_data[[1]],
                             y = line_data[[3]],
                             type='scatter',
                             mode="lines",
                             line=list(color="#89ce61")) %>%
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
        map_shape <- get(input$map_shape_select)

        # Plot
        map.plot <- ggplot() +
            geom_polygon(data=map_shape,
                         aes(x=long, y=lat, group=group),
                         alpha=0.3,
                         fill="#89ce61") +
            geom_point(data=map_data,
                       aes(x=lon,
                           y=lat,
                           alpha=total,
                           text=paste("farm:", Farm.Name)),
                       color="dark green") +
            theme_void() +
            coord_map() +
            ggtitle(paste(input$map_select, "since 2019"))
    })
}
