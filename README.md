# **Visualizing Football Using R**

This is a fun little project that I undertook in R. This project was born out of my love for the game of football and my desire to get better at R, a language I was learning at the time.

There are two different R programs in this repository.

- The program **clFinal2012\_13.R** constructs three maps of the 2012/13 UEFA Champions League Final between Borussia Dortmund and Bayern Munich.
  - The first is a Passing Map of the game for Thomas Müller, a Bayern Munich player.

![](RackMultipart20240119-1-qttiax_html_51d4a1bd3e7f5728.png)

  - Next in line is a Shots Map from the game for the two teams. ![](RackMultipart20240119-1-qttiax_html_3a6a9579c9b78f2c.png)
  - The final visualization is a Pressure Heat Map from the game for Bayern Munich.
  - ![](RackMultipart20240119-1-qttiax_html_fc478040cf94597d.png)

- The program **laligaShootingAndBalances.R** presents two visualizations from the 2020/21 LaLiga season.
  - The first is a scatterplot that compares teams on the metrics of Non-Penalty xG (x-axis) and Non-Penalty Goals (y-axis). ![](RackMultipart20240119-1-qttiax_html_fdf7a64553e43db2.png)
  - Then a bar graph is presented that compares the net spends of teams during the season and makes some cursory inferences.

![](RackMultipart20240119-1-qttiax_html_f8a7f6d6bd0a343d.png)

The **worldfootballR** and **StatsBombR** packages were used to obtain the relevant data.

The **ggsoccer** package has also been used to facilitate visualization.

The installations of these packages in addition to **tidyverse** , **ggplot2** and **xlsx** will be necessary.
