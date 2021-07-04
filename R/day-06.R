### Abby Vandenberg
#### June 30th, 2021
#### My First Plots

url <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv"
covid <- read.csv(url)

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
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line(size = 2) +
  facet_wrap(-state) +
  ggthemes::theme_gdocs() +
  theme(legend.position = 'NA') +
  labs(title = "Cumulative Case Counts",
       subtitle = "Data Source: NY-Times",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")







