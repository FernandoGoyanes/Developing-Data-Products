library(shiny) 

shinyUI(navbarPage("Air Quality",
                   
                   tabPanel("App", fluidPage(
                     
                     # Application title
                     titlePanel("Air Quality"),
                     
                     # Sidebar with controls to select the variable from airquality data set.
                     sidebarLayout(
                       sidebarPanel(
                         selectInput("var", "Choose a variable:", 
                                     choices = c("Ozone", "Solar Radiation", "Wind", "Temperature")),
                         br(),
                         sliderInput("bins", "Number of bins:",
                                     min = 1,
                                     max = 50,
                                     value = 30),
                         br(),
                         helpText("Note: Data contains daily air quality measurements in",
                                  "New York State (May to September).")
                        
                       ),
                                              
                       # Show a tabset that includes a plot, summary, and table view
                       # of the chosen variable.
                       
                       mainPanel(
                         tabsetPanel(type = "tabs", 
                                     tabPanel("Plot", plotOutput("plot")), 
                                     tabPanel("Summary", verbatimTextOutput("summary")), 
                                     tabPanel("Data", tableOutput("data"))
                         )
                       )
                     )
                   ))
))
