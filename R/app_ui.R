#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import fresh
#' @import dplyr
#' @import tidyr
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),

    # Your application UI logic
    dashboardPage(
      dark = NULL,
      freshTheme = "",
      title = "SiA Wearable Interface Web App",
      fullscreen = TRUE,
      skin = "light",
      help = NULL,

      #  * Header -----------------------------------------------
      header = dashboardHeader(
        tagList(
          tags$style(".main-header {min-height: 75px}")
        ),
        titleWidth = 220,
        title = tagList(
          tags$span(
            class = "logo-xs",
            tags$img(title = "title",
                     src = "https://bitnify.app/wp-content/uploads/2023/03/Bitnify_logo-e1678532699322.png",
                     height = "57px")),

          tags$span(
            class = "logo-xl",
            tags$img(title = "title",
                     src = "https://bitnify.app/wp-content/uploads/2023/02/cropped-Bitnify-Logo-Full-tr.png",
                     height = "55px"))
        ),

        #  * Dropdownmenu -----------------------------------------------
        leftUi = NULL
      ),

      #  * Sidebar -----------------------------------------------
      sidebar = dashboardSidebar(
        tags$style(".brand-link {padding-bottom: 61px}"), #to align logo with lower line to header
        skin = "light",
        status = "primary",
        elevation = 1,
        collapsed = TRUE,
        id = "sidebarmenu",
        sidebarMenu(
          sidebarHeader("Information"),
          menuItem(
            text = "Pipeline",
            icon = tags$i(class = "fa-solid fa-user", verify_fa = FALSE),
            tabName = "pipeline"
          )
        )
      ),

      #  * Body -----------------------------------------------
      body = bs4DashBody(
        # You can add your body content here
      ),

      #  * Controlbar -----------------------------------------------
      controlbar = dashboardControlbar(
        tags$style(HTML(".control-sidebar { overflow-y: auto;}")), # add scrollbar
        skin = "light",
        pinned = FALSE,
        collapsed = TRUE,
        overlay = TRUE
      ),

      #  * Footer -----------------------------------------------
      footer = dashboardFooter(
        left = strong(HTML(" <a href='mailto:h.klarenberg@vu.nl'>DASC</a>"), HTML('&nbsp;'),
                      a(target="_blank", href = 'https://twitter.com/bitnifyapp/',
                        img(src = 'https://bitnify.app/wp-content/uploads/2023/02/Bitnify_twitter_logo.png'))),
        right = "© 2024 Stress in Action. All Rights Reserved."
      ),

      scrollToTop = TRUE
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "project.1.sia.wi"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
