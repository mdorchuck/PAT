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
    table = table.Stats(R = plan.ret.xts,ci = .95)
    table = table[13,]*sqrt(252)
    View(table)
    table = table[13]*sqrt(252)
    table = table.Stats(R = plan.ret.xts,ci = .95)
    table[13,] = sqrt(table[13,])*sqrt(252)
  # to generate a table of summary statistics
  output$summary <- renderTable(table)
})