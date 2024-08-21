[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

<p align="center">
  <img src="https://stress-in-action.nl/wp-content/uploads/2023/04/sia-logo.png" alt="SIA Logo">
</p>

## About

<p align="justify">
  Stress in Action capitalizes on the fast advances in technology and big data analytics to move stress research from the lab to daily life. The Consortium enables synergistic collaborations to discover 1) how responses to daily life stress arise from the temporal, dynamic interplay between context and person-specific factors, 2) how daily life stress can be reliably measured in a specific individual in real-time, and 3) how and when potential beneficial stress-response mechanisms turn into detrimental effects on mental and cardiometabolic health. This enables the development of novel monitoring and intervention strategies to track and reduce daily life stress and its health impact.
</p>

<p align="center">
  <img src="https://stress-in-action.nl/wp-content/uploads/2023/05/Measurements_3.jpg" alt="Measurements Image" width="50%">
</p>

<p align="justify">
  For research theme (RT) 2:  how daily life stress can be reliably measured in a specific individual in real-time using daily life stress assessment tools, selection and validation pipelines in our design field labs will establish their ethical and legal feasibility, user-acceptance, reliability and validity, and potential application in just-in-time adaptive stress interventions.
</p>

<p align="justify">
  This GitHub repository contains an R Shiny app developed using the <code>{golem}</code> and <code>{bd4Dash}</code> frameworks. The app showcases the results of the wearable validation pipeline, offering a robust platform for visualizing and analyzing data. Designed for efficiency and scalability, the application provides insights into the validation process, allowing users to interact with and explore the outcomes of the wearable technology assessment.
</p>

## Installation

<p align="justify">
  <strong>IMPORTANT: Only SiA researchers with access to the wearable validation pipeline database are able to run this Shiny app.</strong>
</p>

You can install the stable version of `project.1.sia.wi` like so:

```r
install.packages("remotes")
remotes::install_github("HugoGit39/project.1.sia.wi")
```

## Run the app

To launch `project.1.sia.wi`, type the following code into the R console after you have loaded the library:

```r
library(project.1.sia.wi)
```

<p align="justify">
  <strong>Add the  wearable validation pipeline database named <code>sia_df.csv</code> to the folder inst/app/extdata.</strong>
</p>

```r 
project.1.sia.wi::run_app()
```

## Live version

`Live Wearable Shiny App` website: [https://wearables.stress-in-action.nl](https://stress-in-action.nl) - Available at the end of 2024 

## Support

<p align="justify">
  If you encounter a bug, please <a href="https://github.com/HugoGit39/project.1.sia.wi/issues">submit an issue</a>.
</p>

<p align="justify">
  If you run into any problems, feel free to get in touch with the DISC via <a href="mailto:h.klarenberg@vu.nl">h.klarenberg@vu.nl</a>.
</p>

<p align="justify">
  For detailed questions about the wearable validation pipeline database, please get in touch with a member of RT2</a>.
</p>

## Authors and Citation

- <a href="https://stress-in-action.nl/hugo-klarenberg/">H. Klarenberg</a> - Author DISC, maintainer
- <a href="https://stress-in-action.nl/artemis-stefani/">A. Stefani</a> - Author RT2
- <a href="https://stress-in-action.nl/myrte-schoenmakers/">M.A. Schoenmakers</a> - Author RT2
- <a href="https://stress-in-action.nl/melisa-saygin/">M. Saygin</a> - Author RT2
- <a href="https://stress-in-action.nl/magdalena-sikora/">M. Sikora</a> - Author RT2
- <a href="https://stress-in-action.nl/matthijs-noordzij/">M. Noordzij</a> - Author RT2
- <a href="https://stress-in-action.nl/eco-de-geus/">J.C.N. de Geus</a> - Author RT2
- <a href="https://stress-in-action.nl/terms-of-use/">Stress in Action</a> - Copyright holder 


## Resources

`Stress in Action` website: [https://stress-in-action.nl](https://stress-in-action.nl)

- `{shiny}` - [https://github.com/rstudio/shiny](https://github.com/rstudio/shiny)
- `{golem}` - [https://github.com/ThinkR-open/golem](https://github.com/ThinkR-open/golem)
- `{bs4Dash}` - [https://github.com/RinteRface/bs4Dash](https://github.com/RinteRface/bs4Dash)






