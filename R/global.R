#' The global file is used to load the data and functions that are used in the app.

#' @importFrom data.table fread

# # load functions
# source("R/colours_fresh.R")
#
# # load SiA dataframe
# sia_df <- readxl::read_excel("inst/app/extdata/database_maar_dan_goed.xlsx")
#
# # Preprocess the data to extract the first type of data before the ";"
# sia_df <- sia_df %>%
#   mutate(
#     DeviceCosts = as.numeric(sub(";.*", "", `Device costs`)),
#     Weight = as.numeric(sub(";.*", "", Weight)),
#     SiAShort = as.numeric(sub(";.*", "", `SiA Expert score (short-term)`)),
#     SiALong = as.numeric(sub(";.*", "", `SiA Expert score (long-term)`)),
#     BatteryLife = as.numeric(sub(";.*", "", `Battery life (hours)`)),
#     PPG = ifelse(grepl("^1;", PPG), 1, 0),
#     ECG = ifelse(grepl("^1;", ECG), 1, 0),
#     ICG = ifelse(grepl("^1;", ICG), 1, 0),
#     EMG = ifelse(grepl("^1;", EMG), 1, 0),
#     GPS = ifelse(grepl("^1;", GPS), 1, 0)
#   )



