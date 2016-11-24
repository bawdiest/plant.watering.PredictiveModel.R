# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
#pumpLog <<- read.table("data/pumpLog", header=TRUE);
#weatherLog <<- read.table("data/weatherLog", header=TRUE);
param <<- read.table("data/result", header=TRUE);


shinyServer(function(input, output) {
  xMin <- param[1,];
  xMax <- param[2,];
  theta <- param[3,];
  
  x <- reactive({as.numeric((cbind(input$temperature, input$pression, 0, 0, input$humidity) - xMin) / xMax)});
  
  output$pumpDuration <- renderPrint((sum(x()*theta) * 1218));
  
})