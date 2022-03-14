# library
library(usethis)

# import data (from local .csv file)
USA_Annual_GDP <- read.csv("USA_GDP_Annual.csv")

# remove commas & convert columns of interest to numeric
USA_Annual_GDP$GDP <- as.numeric(gsub("," ,"" , USA_Annual_GDP$GDP))
USA_Annual_GDP$Consumption <- as.numeric(gsub("," ,"" , USA_Annual_GDP$Consumption))
USA_Annual_GDP$Investment <- as.numeric(gsub("," ,"" , USA_Annual_GDP$Investment))
USA_Annual_GDP$Net.Exports <- as.numeric(gsub("," ,"" , USA_Annual_GDP$Net.Exports))
USA_Annual_GDP$Government.Spending <- as.numeric(gsub("," ,"" , USA_Annual_GDP$Government.Spending))

# add proportion of each component to data frame
# round each proportion to 5 digits
USA_Annual_GDP <- USA_Annual_GDP %>% mutate(
  Consumption.prop = Consumption / GDP,
  Investment.prop = Investment / GDP,
  Net.Exports.prop = Net.Exports / GDP,
  Government.Spending.prop = Government.Spending / GDP,
  Consumption.prop = round(Consumption.prop, 5),
  Investment.prop = round(Investment.prop, 5),
  Net.Exports.prop = round(Net.Exports.prop, 5),
  Government.Spending.prop = round(Government.Spending.prop, 5)
)

# add to package
usethis::use_data(USA_Annual_GDP)
