# LOAD LIBRARIES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)

###### avoid using "here" inside of your apps!!!!!

# The file path specified for reading in our data is relative to the app files (ui.R, server.R). 
# It’s important to note, however, that you won’t be able to run your code line-by-line (like in a typical script; the file path won’t be recognized) – this is expected!
# "relative to your global.r" for this app

# read in data
lake_data <- read_csv("data/lake_data_processed.csv")


