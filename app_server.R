server <- function(input, output) {
    # Vis 1 - Line
    output$line <- renderPlotly({
        # Select data widget
        data <- get(input$line_data)
        y_col <- colnames(data)[[3]]

        # Plot
        line.plot <- ggplot(data=data) +
            geom_line(
                mapping = aes(x = order_month,
                              y = data[[3]]),
                size = 2
            ) +
            labs(
                title = input$line_data,
                x = "Date",
                y = "Number of Farms"
            )

        return(ggplotly(line.plot))
    })

    # Vis 2 - Map
}
