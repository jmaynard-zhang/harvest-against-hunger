server <- function(input, output) {
    # Vis 1 - Line
    output$line <- renderPlotly({
        # Select data widget
        line_data <- get(input$line_select)
        y_col <- colnames(data)[[3]]

        # Plot
        line.plot <- ggplot(data=line_data) +
            geom_line(
                mapping = aes(x = order_month,
                              y = line_data[[3]]),
                size = 2
            ) +
            labs(
                title = input$line_select,
                x = "Date",
                y = "Number of Farms"
            )

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
                       fill = "grey",
                       aes(x=map_data$lon,
                           y=map_data$lat,
                           alpha=map_data[[4]])) +
            theme_void() +
            coord_map() +
            ggtitle("Total Orders since 2019")
    })
}
