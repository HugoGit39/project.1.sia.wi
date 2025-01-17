############################################################################################
#
#  Function for email
#
#
#############################################################################################

#fields mandatory check in server
fieldsMandatory <- c("name", "email", "message")

#create colored mandatory stars
appCSS <-
  ".mandatory_star { color: #CC6677; }"

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}
