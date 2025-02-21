#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import fresh
#' @import dplyr
#' @import tidyr
#' @importFrom shinySearchbar searchbar
#' @importFrom DT DTOutput
#' @import emayili
#' @import shinyjs
#' @noRd

#app ui
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),

    # Your application UI logic
    dashboardPage(
      dark = FALSE,
      freshTheme = colours_fresh(),
      title = "SiA Wearable Interface Web App",
      fullscreen = TRUE,
      skin = "light",
      help = NULL,

      #  * Header -----------------------------------------------
      header = bs4DashNavbar(
        #fixed = T,
        tagList(
          tags$style(".main-header {min-height: 75px}")
        ),
        titleWidth = 220,
        title = tagList(
          tags$span(
            class = "logo-xs",
            tags$img(title = "title",
                     src = "www/SiA_logo_square_icon.png",
                     height = "57px")),

          tags$span(
            class = "logo-xl",
            tags$img(title = "title",
                     src = "www/SiA_logo_png.png",
                     height = "55px"))
        ),
        tagList(
        navbarMenu(
          navbarTab(tabName = "Tab1", text = "Tab 1"),
          navbarTab(tabName = "Tab2", text = "Tab 2"),
          navbarTab(
            text = "Menu",
            dropdownHeader("Dropdown header"),
            navbarTab(tabName = "Tab3", text = "Tab 3"),
            dropdownDivider(),
            navbarTab(
              text = "Sub menu",
              dropdownHeader("Another header"),
              navbarTab(tabName = "Tab4", text = "Tab 4"),
              dropdownHeader("Yet another header"),
              navbarTab(tabName = "Tab5", text = "Tab 5"),
              navbarTab(
                text = "Sub sub menu",
                navbarTab(tabName = "Tab6", text = "Tab 6"),
                navbarTab(tabName = "Tab7", text = "Tab 7")
              )
            )
          )
        ),
        #  * Dropdownmenu -----------------------------------------------
        rightUi = tagList(
          tags$li(
            class = "dropdown",
            searchbar(inputId = "Search", placeholder = "Search text here...", contextId = "body_app")
          )
        )
      ),
      #  * Sidebar -----------------------------------------------
      sidebar = dashboardSidebar(
        tags$style(".brand-link {padding-bottom: 61px}"), #to align logo with lower line to header
        skin = "light",
        status = "primary",
        elevation = 1,
        collapsed = F,
        id = "sidebarmenu",
        sidebarMenu(
          sidebarHeader("App Info"),
          menuItem(
            text = "Stress in Action",
            icon = tags$i(class = "fa-solid fa-info", verify_fa = FALSE),
            tabName = "sia"
          ),
          menuItem(
            text = "User Guide",
            icon = tags$i(class = "fa-solid fa-user", verify_fa = FALSE),
            tabName = "user_guide"
          )
        ),
        sidebarMenu(
          sidebarHeader("Data"),
          menuItem(
            text = "Table",
            icon = tags$i(class = "fa-solid fa-table", verify_fa = FALSE),
            tabName = "data"
          ),
          menuItem(
            text = "Export",
            icon = tags$i(class = "fa-solid fa-file-export", verify_fa = FALSE),
            tabName = "export"
          )
        ),
        sidebarMenu(
          sidebarHeader("Filters"),
          menuItem(
            text = "Filter",
            icon = tags$i(class = "fa-solid fa-dice-one", verify_fa = FALSE),
            tabName = "filter"
          )
        ),
        sidebarMenu(
          sidebarHeader("Information"),
          menuItem(
            text = "About",
            icon = tags$i(class = "fa-solid fa-people-group", verify_fa = FALSE),
            tabName = "about"
          ),
          menuItem(
            text = "Contact",
            icon = tags$i(class = "fa-solid fa-envelope", verify_fa = FALSE),
            tabName = "contact"
          )
        )
      ),

      #  * Body -----------------------------------------------
      body = bs4DashBody(
        id = "body_app",
        # You can add your body content here
        tabItems(
          tabItem(
            #  * Tabitems Summary -----------------------------------------------
            tabName = "sia",
            mod_Info_ui("Info_1"),
          ),
          #  * Tabitems Filter-----------------------------------------------
          tabItem(
            tabName = "filter",
            mod_Filters_ui("Filters_1")
          ),
          #  * Tabitems BFM -----------------------------------------------
          tabItem(
            tabName = "contact",
            mod_Contact_ui("Contact_1")
          )
        )
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
        left = strong(HTML(" <a href='mailto:disc@stress-in-action.nl'>E-mail Us!</a>")),
        right = HTML("<span style='color:#1c75bc;'>Copyright 2025 | Stress in Action | All rights Reserved</span>")
      ),

      scrollToTop = TRUE
      )
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
    "www", app_sys("app/www"),
  )

  tags$head(
    favicon(),
    tags$link(rel = "stylesheet", type = "text/css", href = "www/custom.css"),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "project.1.sia.wi"
    )
  )
}
