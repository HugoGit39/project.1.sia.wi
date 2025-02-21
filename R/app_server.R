#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import dplyr
#' @import tidyr
#' @import shinyjs
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  #mod_Filters_server("Filters_1", sia_df)

  observeEvent(input$controller, {
    updateNavbarTabs(
      session,
      inputId = "navmenu",
      selected = paste0("Tab", input$controller)
    )
  },
  ignoreInit = TRUE
  )

}
