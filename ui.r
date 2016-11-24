library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("iWatering"),
  sidebarPanel(
    h3('Choose the Date'),
    dateInput("date", "Date:")
    ),
  mainPanel(
    h3(verbatimTextOutput("mainPanelTitle"))
    #verbatimTextOutput("mainPanelTitle")
            )
  ))