library(shiny)
library(leaflet)
library(plotly)
library(ggmap)


loc1<-readRDS("loc1.rds")
shinyUI(
    navbarPage( 'Tree Project', id='nav',
                # map pan
                tabPanel("Tree Map",
                         div(class="outer",

                             tags$head(
                                 includeCSS("styles.css")
                             ),

                             leafletOutput("map", width="100%", height="100%"),

                             absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE, draggable = F, top = 60, left = "auto", right = 20, bottom = "auto",
                                           width = 300, height = "auto",

                                           h2("Time Explorer"),
                                           #month input
                                           selectInput("month", label = h3("Month"), choices = list("Jan" = 1, "Feb" = 2, "Mar" = 3, "Apr"=4, "May"=5, "June"=6, "July"=7, "Aug"=8, "Sept"=9, "Oct"=10, "Nov"=11, "Dec"=12), selected = 1),
                                           #year
                                           selectInput("year", label = h3("Year"),
                                                       choices = list('2009' = 2009, '2010' = 2010, '2011'=2011, '2012'=2012, '2013'=2013, '2014'=2014, '2015'=2015, '2016'=2016), selected = 2010)

                             )
                         )
                )
    )
)


