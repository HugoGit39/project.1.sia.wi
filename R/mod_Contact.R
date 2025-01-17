#' Contact UI Function
#'
#' @description Contact Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_Contact_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(width = 4,
             bs4Card(title = div("Contact Us", style='color:black; font-size:18px;'),
                     id = "contact", width = NULL, height = "auto", inline = F, collapsible = F, maximizable = F,
                     div(
                       textInput("name", labelMandatory("Name"), ""),
                       textInput("email", labelMandatory("Email"), ""),
                       textInput("telephone", "Telephone"),
                       textAreaInput("message", labelMandatory("Message"), ""),

                       # Submit button
                       actionButton("submit", "Submit")
                     )

             )
      )
    )
  )
}

#' Contact Server Functions
#'
#' @noRd
#' @import emayili
mod_Contact_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    #observe if all inputs are filled
    observe({
      mandatoryFilled <-
        vapply(fieldsMandatory,
               function(x) {
                 !is.null(input[[x]]) && input[[x]] != ""
               },
               logical(1))
      mandatoryFilled <- all(mandatoryFilled)

      toggleState(id = "submit", condition = mandatoryFilled)
    })

    #function to send mail
    send_email <- function() {
      #Get values from input fields
      name <- input$name
      email <- input$email
      telephone <- input$telephone
      message <- input$message

      # Create email body
      body <- paste("Name: ", name, "\nEmail: ", email, "\nTelephone: ", telephone, "\nMessage: ", message)

      #smtp settings
      smtp <- emayili::server(
        host = Sys.getenv("SMTP_HOST"),
        port = Sys.getenv("SMTP_PORT"),
        username = Sys.getenv("MAIL_NAME_ID"),
        password = Sys.getenv("MAIL_KEY_ID")
      )

      #create message
      msg <- envelope(
        to = "disc@stress-in-action.nl",
        from = "disc@stress-in-action.nl"
      ) %>%
        subject("Wearable Shiny App message") %>%
        text(body)

      #send
      smtp(msg, verbose = F)

      # Reset input fields to empty strings
      updateTextInput(session, "name", value = "")
      updateTextInput(session, "email", value = "")
      updateTextInput(session, "telephone", value = "")
      updateTextAreaInput(session, "message", value = "")
    }

    # Call send_email function when Submit button is clicked
    observeEvent(input$submit, {
      send_email()
      showModal(
        modalDialog(
          title = "Form Submitted",
          "Thank you for submitting the form!"
        )
      )
    })

  })
}

## To be copied in the UI
# mod_Contact_ui("Contact_1")

## To be copied in the server
# mod_Contact_server("Contact_1")
