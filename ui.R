library(shiny)
 
# Define UI for performance summary application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Performance Summary"),
  
  # Sidebar with controls to select the variable to plot
  # The value corresponds to the column in the managers data
  # For example, HAM1 is managers[, 1], HAM2 is managers[, 2], and so on
  sidebarPanel(
    checkboxGroupInput("symbol", "Select Symbol(s):",
                       c("HAM1" = 1, 
                         "HAM2" = 2,
                         "HAM3" = 3,
                         "HAM4" = 4,
                         "HAM5" = 5,
                         "HAM6" = 6,
                         "EDHEC LS EQ" = 7,
                         "SP500 TR" = 8,
                         "US 10Y TR" = 9,
                         "US 3m TR" = 10),
                       selected = "HAM1")),
  
  
  mainPanel(
    
    # Plot the performance summary
    # Tied to output$perfPlot in server.R
    plotOutput("perfPlot"),
    
    # Table of summary statistics
    # Tied to output$summary in server.R
    tableOutput("summary")
  )
))