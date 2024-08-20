#' The global file is used to load the data and functions that are used in the app.

#' @importFrom data.table fread

# load functions
source("R/colours_fresh.R")

# load SiA dataframe
sia_df <- fread("inst/app/extdata/sia_df.csv")
