# **Visualizing Football Using R**

This is a fun little project that I undertook in R. This project was born out of my love for the game of football and my desire to get better at R, a language I was learning at the time.

There are two different R programs in this repository.

- The program **clFinal2012\_13.R** constructs three maps of the 2012/13 UEFA Champions League Final between Borussia Dortmund and Bayern Munich.
  
  - The first is a Passing Map of the game for Thomas Müller, a Bayern Munich player.

   ![](https://lh3.googleusercontent.com/drive-viewer/AEYmBYTytnTqwMdlEU5QMBWFWPDOuky9h9kCWoZfY3pQi4rGpI-SrFsQkWy4zirs1brJHroFd6RIUbqzty0EXh6y1tU45uzX=s1600)
    
  - Next in line is a Shots Map from the game for the two teams.
  
   ![](https://lh3.googleusercontent.com/drive-viewer/AEYmBYTNQddtCoLKp1gH7pvQfPpNZgrrWz1ZzCGeBp3Zqk7AYKbsBalYivjK-c-EdSOUW7tGbJ4kEbF_V_1iFT-D7eWrE87pDA=s1600)
    
  - The final visualization is a Pressure Heat Map from the game for Bayern Munich.
  
   ![](https://lh3.googleusercontent.com/drive-viewer/AEYmBYQFNbnuRmk8btnxCEEFADScqsirGuYFxymw_E9N_bSeLMvekEENaAnvxyyyyzCkHZLv1okDCn7qFsUtI5RlskrM11odGw=s1600)

- The program **laligaShootingAndBalances.R** presents two visualizations from the 2020/21 LaLiga season.
  
  - The first is a scatterplot that compares teams on the metrics of Non-Penalty xG (x-axis) and Non-Penalty Goals (y-axis).

   ![](https://lh3.googleusercontent.com/drive-viewer/AEYmBYSob-DIBMLnCE6DtClcMA8xSSjJ8Pw8KKm918-G0GfHrBFc8ll4CPEyXmDEQQW5LI2z_W_Y7UvAgILcNy_IiaZNmUB0=s1600)

  - Then a bar graph is presented that compares the net spends of teams during the season and makes some cursory inferences.

  ![](https://lh3.googleusercontent.com/drive-viewer/AEYmBYTvnGveM9aBgoil9w6RrzoP3v3Y_82Ccdbzg2jwTGciU6dgkmpUM1_YfUPrZImyFtEiNr_Eo0ngJV1CLDNLrf6mwF7S=s1600)

The **worldfootballR** and **StatsBombR** packages were used to obtain the relevant data.

The **ggsoccer** package has also been used to facilitate visualization.

The installations of these packages in addition to **tidyverse**, **ggplot2** and **xlsx** will be necessary.
