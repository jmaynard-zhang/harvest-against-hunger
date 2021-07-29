server <- function(input, output) {
    # Vis 1 - Line
    output$line <- renderPlot({
        # Plot
        line.plot <- ggplot(data=farms_monthly) +
            geom_line(
                mapping = aes(x = order_month,
                              y = num_farms_cum),
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
