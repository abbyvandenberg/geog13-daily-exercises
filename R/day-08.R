### Day 08 Exercise
#### July 6, 2021
#### Plot of Daily Covid Cases for New York State

library(ggplot2)
library(tidyverse)
library(dplyr)
library(zoo)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv'
covid = read_csv(url)

state.of.interest = "New York"

covid %>%
  filter(state == state.of.interest) %>%
  group_by(date) %>%
  summarise(cases = sum(cases)) %>%
  mutate(newCases = cases - lag(cases),
         roll7 = rollmean(newCases, 7, fill = NA, align="right")) %>%
  ggplot(aes(x = date)) +
  geom_col(aes(y = newCases), col = NA, fill = "#F5B8B5") +
  geom_line(aes(y = roll7), col = "darkred", size = 1) +
  ggthemes::theme_wsj() +
  labs(title = paste("New Reported Cases by Day in", state.of.interest)) +
  theme(plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 14, face = 'bold')) +
  theme(aspect.ratio = .5)













