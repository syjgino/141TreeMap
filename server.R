library(shiny)
library(leaflet)
library(plotly)
library(ggmap)


loc1<-readRDS("loc1.rds")
shinyServer(function(input, output) {
    #reactive
    loc11<-reactive({
        loc<-loc1[loc1$month==input$month & loc1$year.y==input$year,]
        loc
    })

    #map
    output$map <- renderLeaflet({
        leaflet() %>%
            addTiles(
                attribution = 'By Gino'
            ) %>%
            setView(lng = -120.04, lat = 34.7, zoom = 14)
    })

    #add circle
    observe({

        pal<-colorNumeric(c( '#FFFF00', '#CC0000'), loc1[loc1$month==input$month & loc1$year.y==input$year,]$temp)

        leafletProxy("map", data = loc11() ) %>%
            clearShapes() %>%
            addCircles(~lon, ~lat, radius=40,
                       stroke=F, fillOpacity=0.3, fillColor=~pal(temp), popup=~paste('lon:', round(lon, 3), 'lat:', round(lat, 3), "<br>", "altitude:", round(altitude,5), "<br>", "tree#", X1_1, "<br>", "temp:", round(temp, 3) ) ) %>%
            addLegend("bottomleft", pal=pal, values = ~sort(temp), title = "Temp", labFormat = labelFormat(prefix = ""), opacity = 0.5, layerId="colorLegend")
    })



})
