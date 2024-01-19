library(StatsBombR)
library(worldfootballR)
library(tidyverse)
library(ggsoccer)
library(ggplot2)

Comp <- FreeCompetitions()
ucl_german <- Comp %>% filter(competition_id == 16 & season_name == "2012/2013")
matches <-  FreeMatches(ucl_german)
events_df <- get.matchFree(matches)
clean_df <- allclean(events_df)

muller_pass <- clean_df %>% filter(player.name == "Thomas Müller") %>% filter(type.name == "Pass")
ggplot(muller_pass) +
  annotate_pitch(dimensions = pitch_statsbomb, fill='#021e3f', colour='#DDDDDD') +
  geom_segment(aes(x = location.x, y = location.y, xend = pass.end_location.x, yend = pass.end_location.y),
               color = "coral",
               arrow = arrow(length = unit(0.15, "cm"), type = "closed")) +
  labs(title = "Thomas Müller's Passing Map", subtitle = "UEFA Champions League Final 12/13", caption = "Data Source: StatsBomb") +
  theme(
    plot.background = element_rect(fill='#021e3f', color='#021e3f'),
    panel.background = element_rect(fill='#021e3f', color='#021e3f'),
    plot.title = element_text(hjust=0.5, vjust=0, size=14),
    plot.subtitle = element_text(hjust=0.5, vjust=0, size=8),
    plot.caption = element_text(hjust=0.5),
    text = element_text(family="Geneva", color='white'),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.text = element_blank()
  )

dortmund_shot <- clean_df %>%
  filter(type.name == "Shot") %>%
  filter(team.name == "Borussia Dortmund") %>%
  select(player.name, location.x, location.y, shot.end_location.x, shot.end_location.y, shot.statsbomb_xg)

bayern_shot <- clean_df %>%
  filter(type.name == "Shot") %>%
  filter(team.name == "Bayern Munich") %>%
  select(player.name, location.x, location.y, shot.end_location.x, shot.end_location.y, shot.statsbomb_xg)

ggplot() +
  annotate_pitch(dimensions = pitch_statsbomb, colour='white', fill='#021e3f') +
  geom_point(data=dortmund_shot, aes(x=location.x, y=location.y, size=shot.statsbomb_xg), color="red") +
  geom_point(data=bayern_shot, aes(x=120-location.x, y=location.y, size=shot.statsbomb_xg), color="yellow") +
  labs(
    title="Borussia Dortmund vs Bayern Munich",
    subtitle = "Shots Map | UEFA Champions League Final 2012/2013",
    caption="Data Source: StatsBomb"
  ) + 
  theme(
    plot.background = element_rect(fill='#021e3f', color='#021e3f'),
    panel.background = element_rect(fill='#021e3f', color='#021e3f'),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    text = element_text(family="Geneva", color='white'),
    plot.title = element_text(hjust=0.5, vjust=0, size=14),
    plot.subtitle = element_text(hjust=0.5, vjust=0, size=8),
    plot.caption = element_text(hjust=0.5),
    plot.margin = margin(2, 2, 2, 2),
    legend.position = "none"
  )

bayern_pressure <- clean_df %>%
  filter(team.name == 'Bayern Munich') %>%
  filter(type.name == 'Pressure')

ggplot(bayern_pressure) +
  annotate_pitch(dimensions = pitch_statsbomb, fill='#021e3f', colour='#DDDDDD') +
  geom_density2d_filled(aes(location.x, location.y, fill=..level..), alpha=0.4, contour_var='ndensity') +
  scale_x_continuous(c(0, 120)) +
  scale_y_continuous(c(0, 80)) +
  labs(title="Bayern Munich's Pressure Heat Map",
       subtitle="UEFA Champions League Final 12/13",
       caption="Data Source: StatsBomb") + 
  theme_minimal() +
  theme(
    plot.background = element_rect(fill='#021e3f', color='#021e3f'),
    panel.background = element_rect(fill='#021e3f', color='#021e3f'),
    plot.title = element_text(hjust=0.5, vjust=0, size=14),
    plot.subtitle = element_text(hjust=0.5, vjust=0, size=8),
    plot.caption = element_text(hjust=0.5),
    text = element_text(family="Geneva", color='white'),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.text = element_blank(),
    legend.position = "none"
  )










