#### Day 11 Exercise
#### July 14, 2021
#### Santa Barbara and Home Projections

library(ggplot2)
library(tidyverse)
library(ggthemes)
library(sf)
library(units)

homes = readr::read_csv("/Users/abbyvandenberg/github/exercise-04/data/uscities.csv") 

points = st_as_sf(homes, coords = c("lng", "lat"), crs = 4326) %>% 
  filter(city %in% c("Santa Barbara", "Albany")) 
  
l = st_distance(points)

units::set_units(l, "mile")

p = st_distance(st_transform(points, 5070))
units::set_units(p, "mile")

eqdc = "+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs"
q = st_distance(st_transform(points, eqdc))
units::set_units(q, "mile")
units::set_units(q, "kilometers")
  
