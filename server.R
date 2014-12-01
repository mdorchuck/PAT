library(shiny)
library(PerformanceAnalytics)
setwd(dir = "C:/Users/bloomberg/Documents/rdata")
plan.ret = read.csv("portreturnsshiny.csv")
plan.ret$X = as.Date(x = plan.ret$X,format = "%m/%d/%Y")
plan.ret.xts = as.xts(x = plan.ret[,2:14],order.by = plan.ret$X)
# Define server logic required to plot relative performance
shinyServer(function(input, output) {
  
  # Use charts.PerformanceSummary from Performance Analytics package
  # to generate a performance summary plot
  output$perfPlot <- renderPlot({
    x <- as.numeric(input$symbol)
    charts.PerformanceSummary(plan.ret.xts[, x], main="Performance Summary",
                              geometric=FALSE, wealth.index=TRUE)
  })
  
  # Use table.Stats from Performance Analytics package
  # to generate a table of summary statistics
  output$summary <- renderTable({
    table.Stats(plan.ret.xts[, as.numeric(input$symbol)])
  })
})