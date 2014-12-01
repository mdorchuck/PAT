# Define UI for performance summary application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("South Carolina Plan Performance Summary"),
  
  # Sidebar with controls to select the variable to plot
  # The value corresponds to the column in the managers data
  # For example, HAM1 is managers[, 1], HAM2 is managers[, 2], and so on
  sidebarPanel(
    checkboxGroupInput("symbol", "Select Symbol(s):",
                       c("Public Equity" = 1, 
                         "Private Equity" = 2,
                         "Commodities" = 3,
                         "Real Estate" = 4,
                         "GTAA/Risk Parity" = 5,
                         "Low Beta Hedge Funds" = 6,
                         "Mixed Credit" = 7,
                         "EMD" = 8,
                         "Private Debt" = 9,
                         "Core FI" = 10,
                         "Global FI" = 11,
                         "Short Duration" = 12,
                         "Cash Equivalents" = 13),
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