#' Filter UI Function
#'
#' @description Filter Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom DT DTOutput
mod_Filters_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      bs4Card(
        title = "Location Filter",
        width = 4,
        checkboxGroupInput(ns("location"), "Location:",
                           choices = unique(sia_df$Location),
                           selected = unique(sia_df$Location))
      ),
      bs4Card(
        title = "Sensor Filter",
        width = 4,
        checkboxGroupInput(ns("sensors"), "Sensors:",
                           choices = c("PPG", "ECG", "ICG", "EMG", "GPS"),
                           selected = c("PPG", "ECG", "ICG", "EMG", "GPS"))
      ),
      bs4Card(
        title = "Slider Filters",
        width = 4,
        sliderInput(ns("costs"), "Device Costs:",
                    min = 0,
                    max = max(sia_df$DeviceCosts, na.rm = TRUE),
                    value = c(0, max(sia_df$DeviceCosts, na.rm = TRUE))),
        sliderInput(ns("weight"), "Weight (g):",
                    min = 0,
                    max = max(sia_df$Weight, na.rm = TRUE),
                    value = c(0, max(sia_df$Weight, na.rm = TRUE))),
        sliderInput(ns("sia_short"), "SiA Expert Score (Short-Term):",
                    min = 0,
                    max = 10,
                    value = c(0, 10)),
        sliderInput(ns("sia_long"), "SiA Expert Score (Long-Term):",
                    min = 0,
                    max = 10,
                    value = c(0, 10)),
        sliderInput(ns("battery_life"), "Battery Life (hours):",
                    min = 0,
                    max = max(sia_df$BatteryLife, na.rm = TRUE),
                    value = c(0, max(sia_df$BatteryLife, na.rm = TRUE)))
      )
    ),
    fluidRow(
      bs4Card(
        title = "Filtered Data",
        width = 12,
        DTOutput(ns("filtered_table")),
        downloadButton(ns("download_filtered"), "Download Filtered Data")
      )
    )
  )
}


#' Filter Server Functions
#'
#' @noRd
#' @importFrom DT datatable renderDT
mod_Filters_server <- function(id, sia_df) {
  moduleServer(id, function(input, output, session) {
    filtered_data <- reactive({
      data <- sia_df %>%
        filter(
          DeviceCosts >= input$costs[1],
          DeviceCosts <= input$costs[2],
          Weight >= input$weight[1],
          Weight <= input$weight[2],
          SiAShort >= input$sia_short[1],
          SiAShort <= input$sia_short[2],
          SiALong >= input$sia_long[1],
          SiALong <= input$sia_long[2],
          BatteryLife >= input$battery_life[1],
          BatteryLife <= input$battery_life[2]
        )

      # Fixing sensor filter logic
      if (!is.null(input$sensors) && length(input$sensors) > 0) {
        data <- data %>%
          filter(
            (("PPG" %in% input$sensors & PPG == 1) | !"PPG" %in% input$sensors) &
              (("ECG" %in% input$sensors & ECG == 1) | !"ECG" %in% input$sensors) &
              (("ICG" %in% input$sensors & ICG == 1) | !"ICG" %in% input$sensors) &
              (("EMG" %in% input$sensors & EMG == 1) | !"EMG" %in% input$sensors) &
              (("GPS" %in% input$sensors & GPS == 1) | !"GPS" %in% input$sensors)
          )
      }

      # Fixing location filter logic
      if (!is.null(input$location) && length(input$location) > 0) {
        data <- data %>%
          filter(Location %in% input$location)
      }

      # Select specific columns to show in the table
      data %>%
        select(`Device name`, DeviceCosts, Weight, SiAShort, SiALong, BatteryLife, PPG, ECG, ICG, EMG, GPS)
    })


    output$filtered_table <- renderDT({
      datatable(filtered_data())
    })

    output$download_filtered <- downloadHandler(
      filename = function() {
        paste("filtered_data", Sys.Date(), ".xlsx", sep = "")
      },
      content = function(file) {
        write.xlsx(filtered_data(), file)
      }
    )
  })
}

## To be copied in the UI
# mod_Filters_ui("Filters1")

## To be copied in the server
# mod_Filters_server("Filters_1")
