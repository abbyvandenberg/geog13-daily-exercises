#### Day 12 Exercise
#### July 14, 2021
#### States that touch Ohio

library(ggplot2)
library(sf)
library(raster)
library(dplyr)

states = USAboundaries::us_states() %>%
  filter(!stusps %in% c("PR", "AK", "HI")) %>% 
  select(name)

oh = filter(states, name == "Ohio")
st_filter(states, oh, .predicate = st_touches)

ggplot(states) +
  geom_sf() +
  geom_sf(data = oh, fill = "blue", alpha = .3)+
  geom_sf(data = st_filter(states, oh, .predicate = st_touches), fill = "red", alpha = .5)+
  labs(title = "States that Border Ohio")+
  theme_fivethirtyeight()

ggsave("states.png")


                  





