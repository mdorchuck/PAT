library(shiny)
library(PerformanceAnalytics)
data(managers)
 
 
# Define server logic required to plot relative performance
shinyServer(function(input, output) {
  
  # Use charts.PerformanceSummary from Performance Analytics package
  # to generate a performance summary plot
  output$perfPlot <- renderPlot({
    x <- as.numeric(input$symbol)
    charts.PerformanceSummary(managers[, x], main="Performance Summary",
                              geometric=FALSE, wealth.index=TRUE)
    })
  
  # Use table.Stats from Performance Analytics package
  # to generate a table of summary statistics
  output$summary <- renderTable({
       table.Stats(managers[, as.numeric(input$symbol)])
    })
})