#' @import fresh

#create custom SiA colours

colours_fresh <- function() {

  create_theme(
    bs4dash_layout(
      control_sidebar_width = "500px"
    ),
    bs4dash_status(
      primary = "#1c75bc", #official SiA colour
      secondary = "#f15a29", #official SiA colour
      success = "#44AA99",
      info = "#88CCEE",
      warning = "#882255",
      danger = "#CC6677",
      light = "#fbf7f3", #official SiA colour
      dark = "#000000" #official SiA colour
    ),
    bs4dash_color(
      green = "#117733", #green
      teal  = "#44AA99", #teal
      red = "#CC6677", #rose
      orange = "#f15a29", #sand #official SiA colour
      fuchsia = "#882255", #whine
      navy = "#1c75bc", #indigo #official SiA colour
      purple = "#AA4499", #purple
      olive  = "#999933", #olive
      cyan  = "#88CCEE", #cyan
      gray_x_light = "#fbf7f3", #grey #official SiA colour
      gray_900  = "#000000" #text #official SiA colour
    )
  )

}



