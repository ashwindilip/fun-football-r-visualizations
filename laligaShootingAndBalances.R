library(tidyverse)
library(worldfootballR)
library(ggplot2)
library(xlsx)

laliga_2021_shooting <- fb_season_team_stats(country = "ESP", gender = "M", season_end_year = "2021", tier = "1st", stat_type = "shooting")
glimpse(prem_2021_shooting)

write.csv(x = laliga_2021_shooting, file = "laliga_shooting_2021_season.csv", row.names = FALSE)
write.xlsx(x = laliga_2021_shooting, file = "laliga_shooting_2021_season.xlsx", row.names = FALSE)

# get our data ready for plotting
laliga_2021_shooting %>% 
  # filter out only the team shooting data, not their opponents also
  filter(Team_or_Opponent == "team") %>% 
  # create a new column that removes penalties from the team's goal total
  mutate(non_P_Gls = Gls_Standard - PK_Standard) %>% 
  # start plotting:
  ggplot(aes(x= npxG_Expected, y= non_P_Gls)) +
  # add a line through the plot with slope =  1 and the yintercept = 0
  geom_abline(slope = 1, intercept = 0, colour = "darkred", linetype=2, size = 2) +
  # we want to make it a scatter plot
  geom_point(size=6, colour="darkblue", fill="darkblue", alpha = 0.6, shape=21) +
  # lets also add team name labels
  ggrepel::geom_text_repel(aes(label = Squad), colour = "darkblue", size=4) + 
  # limit the x and y-axis to start at 10 and finish at 100
  scale_x_continuous(limits = c(10,100), name = "Non-Pen xG") +
  scale_y_continuous(limits = c(10,100), "Non-Pen Goals") +
  # create a title and subtitle - all plots should have this
  ggtitle("Did the Teams score as expected?", 
          subtitle = "Teams above the dashed line exceeded their xG for the\nseason, while teams below didn't") +
  # apply a pre-programmed general theme:
  theme_minimal() +
  # but then we can customize our plot even more - first we make the background black:
  # change the title and subtitle format
  theme(plot.title = element_text(size=20, face="bold", family = 'Geneva'), plot.subtitle = element_text(size=18, colour="grey30", family = 'Geneva'),
        # and change where the plot is aligned - in this case it's left-aligned
        plot.title.position = "plot", plot.caption.position = "plot",
        # change the size of axis titles and text
        axis.title = element_text(size=16, color = 'darkblue', family = 'Geneva'), axis.text = element_text(size = 14, color = 'darkblue', family = 'Geneva'))

team_balances <- tm_team_transfer_balances(country_name = "Spain", start_year = 2020)
glimpse(team_balances)

write.csv(x= team_balances, file = "laliga_transfer_balances2020_2021.csv", row.names = FALSE)
write.xlsx(x= team_balances, file = "laliga_transfer_balances2020_2021.xlsx", row.names = FALSE)

team_balances %>% 
  # the new two lines use 'mutate()' from the dplyr package to create or change new columns
  # here, we create a net_transfer_income column that subtracts the expenditure form income
  mutate(net_transfer_income = income_euros - expenditure_euros) %>% 
  # and we can also come up with a flag for if the income is above or below 0
  mutate(green = net_transfer_income > 0) %>% 
  # ggplot is how we visualise our data
  ggplot(aes(x=net_transfer_income, y= squad, fill = green)) +
  geom_col() +
  # manually select colours to use:
  scale_fill_manual(values = c("darkred", "darkgreen"), name = "Made\nMoney?") +
  # change the data labels on the x-axis to be formatted to currency:
  scale_x_continuous(labels = scales::dollar, name = "Net Transfer Income") +
  # add a caption that sources the data:
  labs(caption = "Source: transfermarkt.com") +
  # we also want a title and subtitle:
  ggtitle("LALIGA SPENDING IN THE 2020/21 SEASON",
          subtitle = "Real Madrid and Valencia are big net spenders,\nwhile Sevilla is the side with the worst net spend this season.") +
  # apply a pre-programmed general theme:
  theme_minimal() +
  # but then we can customise our plot even more - first we make the background black:
  theme(plot.background = element_rect(fill = "black"),
        # play around with the x and y gridlines:
        panel.grid.major.x = element_line(colour = "grey20", linetype = 2), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_blank(),
        # change the title and subtitle format
        plot.title = element_text(size=18, colour = "white", face="bold"), plot.subtitle = element_text(size=15, colour = "white"),
        # and change where the plot is aligned - in this case it's left-aligned
        plot.title.position = "plot", plot.caption.position = "plot",
        # change the colour and size of aixs titles and text, remove the y-axis title
        axis.title.x = element_text(colour = "white", size=16), axis.title.y = element_blank(), axis.text = element_text(colour = "white", size = 10),
        # remove the legend
        legend.position = "none",
        #format the plot caption:
        plot.caption = element_text(size = 12, colour = "white"))

