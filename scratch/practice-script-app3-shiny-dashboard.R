#..............................SETUP.............................

# load packages ----
library(tidyverse)
library(leaflet)

# read in data ----
lake_data <- read_csv(here::here("shiny-dashboard", "data", "lake_data_processed.csv")) 
# data with a latitude column, longitude column, and our data

# ---- practice filtering
# 3 opportunities to filter, will replace these with input values in our ui widgets

filtered_lakes <- lake_data |> 
  filter(Elevation >= 8 & Elevation <= 20) |> 
  filter(AvgDepth >= 2 & AvgDepth <= 3) |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)




#..........................PRACTICE VIZ..........................
# can use this in quarto etc, a not reactive but still interactive!!!

leaflet() |> 
  
  # add tiles
  # all basemap layers all stored in "providers", we want esri world imagery
  addProviderTiles(providers$Esri.WorldImagery) |> 
  
  # set view over AK
  # set our zoom level so it starts in the right spot
  setView(lng = -152.048442, lat = 70.249234, zoom = 6) |> # sourced lat and long from google maps
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) |> 
  
  # add markers
  addMarkers(data = lake_data, 
             lng = lake_data$Longitude, lat = lake_data$Latitude, # where our lat and long are
             # text our pop-up boxes will contain
             # "<br>" is line break
             # this is kinda like the paste function in Python
             popup = paste0("Site Name: ", lake_data$Site, "<br>", 
                            "Elevation: ", lake_data$Elevation, " meters (above SL)", "<br>",
                            "Avg Depth: ", lake_data$AvgDepth, " meters", "<br>",
                            "Avg Lake Bed Temperature: ", lake_data$AvgTemp, "\u00B0C")) # NOTE: Unicode for degree symbol icon

## for the app
# can use this in quarto etc, a not reactive but still interactive!!!

leaflet() |> 
  
  # add tiles
  # all basemap layers all stored in "providers", we want esri world imagery
  addProviderTiles(providers$Esri.WorldImagery) |> 
  
  # set view over AK
  # set our zoom level so it starts in the right spot
  setView(lng = -152.048442, lat = 70.249234, zoom = 6) |> # sourced lat and long from google maps
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) |> 
  
  # add markers
  addMarkers(data = filtered_lakes, 
             lng = filtered_lakes$Longitude, lat = filtered_lakes$Latitude, # where our lat and long are
             # text our pop-up boxes will contain
             # "<br>" is line break
             # this is kinda like the paste function in Python
             popup = paste0("Site Name: ", filtered_lakes$Site, "<br>", 
                            "Elevation: ", filtered_lakes$Elevation, " meters (above SL)", "<br>",
                            "Avg Depth: ", filtered_lakes$AvgDepth, " meters", "<br>",
                            "Avg Lake Bed Temperature: ", filtered_lakes$AvgTemp, "\u00B0C")) # NOTE: Unicode for degree symbol icon