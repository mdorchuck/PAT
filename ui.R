# Define UI for performance summary application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("South Carolina Historical Performance Summary"),
  
  # Sidebar with controls to select the variable to plot
  # The value corresponds to the column in the managers data
  # For example, HAM1 is managers[, 1], HAM2 is managers[, 2], and so on
  sidebarPanel(
    checkboxGroupInput("symbol", "Select Symbol(s):",
                       c("Global Public Equity" = 1, 
                         "GTAA" = 2,
                         "Commodities" = 3,
                         "EMD Estate" = 4,
                         "Real Estate" = 5,
                         "Core Fixed Income" = 6,
                         "Private Equity" = 7,
                         "Low Beta Hedge Funds" = 8,
                         "Mixed Credit" = 9,
                         "Private Debt" = 10,
                         "Global Fixed Income" = 11,
                         "Short Duration" = 12,
                         "Cash Equivalents" = 13,
                         "Large Cap Equity" = 14,
                         "S-Mid Cap Equity" = 15,
                         "Developed International Equity" = 16,
                         "Emerging Market Equity" = 17,
                         "Total US Equity" = 18),
                       selected = "Public Equity")),
  
  
  mainPanel(
    
    # Plot the performance summary
    # Tied to output$perfPlot in server.R
    plotOutput("perfPlot"),
    
    # Table of summary statistics
    # Tied to output$summary in server.R
    tableOutput("summary")
  )
))
