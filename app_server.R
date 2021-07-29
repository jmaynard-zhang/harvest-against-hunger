server <- function(input, output) {
    # Vis 1 - Line
    output$line <- renderPlot({
        # Select data widget
        data <- get(input$line_data)
        y_col <- colnames(data)[[3]]

        # Plot
        line.plot <- ggplot(data=data) +
            geom_line(
                mapping = aes(x = data$order_month,
                              y = data[[3]]),
                size = 2
            ) +
            labs(
                title = "Farms Served Monthly",
                x = "Date",
                y = "Number of Farms"
            )

        return(line.plot)
    })

    # Vis 2 - Map
}
