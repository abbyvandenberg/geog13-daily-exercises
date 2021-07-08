### Abby Vandenberg
#### June 30th, 2021
#### My First Plots

library(ggplot2)
library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv'
covid = readr::read_csv(url)

covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state) ->
  top_states

covid %>%
  filter(state %in% top_states) %>%
  group_by(state, date) %>%
  summarize(cases = sum(cases)) %>%
  ungroup() %>%
  ggplot(aes(x = date, y = cases, color = states)) +
  geom_line(size = 2) +
  facet_wrap(states) +
  ggthemes::theme_gdocs() +
  theme(legend.position = 'NA') +
  labs(title = "Cumulative Case Counts",
       subtitle = "Data Source: NY-Times",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")


covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(aes(x = date, y = cases)) +
  geam_col(fill = "blue", color = "blue", alpha = .25) +
  geam_line(coloe = "blue", size = 3) +
  ggthemes::theme_gdocs() +
  labs(title = "National Cummulative Case Counts",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")




