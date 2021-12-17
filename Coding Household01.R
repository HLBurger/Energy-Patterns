library("readxl") #Used for loading in excel files



House2019_path <- "C:/Users/hendr/OneDrive/Documenten/TW studie jaar 3/Blok 2/Energy patterns project/NZEBHousehold01_2019_data.xlsx"
House2020_path <- "C:/Users/hendr/OneDrive/Documenten/TW studie jaar 3/Blok 2/Energy patterns project/NZEBHousehold01_2020_data.xlsx"
Weather_path <- "C:/Users/hendr/OneDrive/Documenten/TW studie jaar 3/Blok 2/Energy patterns project/Weatherdata.xlsx"
data_env <- new.env(parent = baseenv())



#Creates sheet names and optionally adds a date
Create_sheetnames <- function(location, date){
  sheetnames <- excel_sheets(location)
  if (!missing(date)) {
    sheetnames <- paste(sheetnames, date, sep = "_")
  }
  return(sheetnames)
}
#Calls the sheetname function
Household01_sheetnames2019 <- Create_sheetnames(House2019_path, 2019)
Household01_sheetnames2020 <- Create_sheetnames(House2020_path, 2020)
Weatherdata_sheetnames <- Create_sheetnames(Weather_path)



#Creates a list of dataframes for a single excel file
Sheet_to_dataframe <- function(sheetnames, location) {
  for (val in seq(1, length(sheetnames))){
    print(val)
    df <- read_excel(path = location , sheet = val)
    print(sheetnames[val])
    assign(sheetnames[val], df, envir = data_env)
  }
}



#Calls the function for all three excel files
Sheet_to_dataframe(Household01_sheetnames2019, House2019_path)
Sheet_to_dataframe(Household01_sheetnames2020, House2020_path)
Sheet_to_dataframe(Weatherdata_sheetnames, Weather_path)



#Merges the sheets together based on measured timestamps
#test_merge <- merge(x = waterFlow, y = ventilation, by = "Timestamp", all = TRUE)



for (dataset_num in 1:length(ls(data_env))) {
  if (nrow(get(ls(data_env)[dataset_num], envir = data_env)) == 0) {
    
  }
}