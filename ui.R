#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
Perform <- read.csv("C:\Users\sahana\Documents\Shiny\Shiny\Performance.csv")
ui <- fluidPage(
  checkboxGroupInput("variable", "Variables:",
                     c("Overall Results" = "Overall",
                       "Team 1 Results" = "Team1",
                       "Team 2 Results" = "Team2",
                       "Team 3 Results" = "Team3")),
  tableOutput("data")
)

# Application title
titlePanel("Call Center Results Comparison")



# Define server logic required to draw a histogram
server <- function(input, output) {
  output$data <- renderTable({
    Perform[, c("Performance.Measures", input$variable), drop = FALSE]
  }, rownames = TRUE)
}

# Run the application 
shinyApp(ui = ui, server = server)
