#' About UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_About_ui <- function(id) {
  ns <- NS(id)
  tagList(

    tabPanel(
      title = "Shiny App Information",
      value = "app_info",
      fluidRow(
        column(
          width = 6,
          offset = 1,
          tabPanel(
            title = "",
            tags$h4("Shiny App Information"),
            tableOutput("shinyinfo")
          )
        )
      )
    )


  )
}

#' About Server Functions
#'
#' @noRd
mod_About_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    output$shinyinfo <- function() {
      app_info <- data.table(
        Information = c("Shiny host","Tiles source","Tileserver","Github","Copyright","License"),
        Value = c(system("hostname", intern = TRUE), Sys.getenv("BCGOV_TILESERVER"),
                  strsplit(Sys.getenv("BCGOV_TILESERVER"), split = "data")[[1]][1],
                  as.character(tags$a(href = "https://github.com/HugoGit39/project.1.sia.wi", "bcgov/CCISS_ShinyApp")),
                  paste(format(Sys.Date(), "%Y"), "Stress in Action"),
                  as.character(tags$a(href = "http://www.apache.org/licenses/LICENSE-2.0", "Apache 2.0 LICENSE")))
      )
      knitr::kable(app_info, format = "html", table.attr = 'class="table table-hover"', escape = FALSE)
    }

  })

}

## To be copied in the UI
# mod_About_ui("About_1")

## To be copied in the server
# mod_About_server("About_1")
