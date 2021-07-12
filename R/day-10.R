#### Day 10 Exercise
##### July 12, 2021
##### USA Boundaries

library(ggplot2)
library(tidyverse)
library(ggthemes)
library(sf)

conus = USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico",
                            "Alaska",
                            "Hawaii"))

us_u_ml = conus %>%
  st_union() %>% 
  st_cast("MULTILINESTRING") 
  
plot(us_u_ml)




  
  


