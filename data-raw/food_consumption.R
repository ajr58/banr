if (file.exists("food_consumption.csv")) {
  food_consumption <- read_csv("food_consumption.csv")
} else {
food_consumption <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-18/food_consumption.csv')

tuesdata <- tidytuesdayR::tt_load('2020-02-18')
tuesdata <- tidytuesdayR::tt_load(2020, week = 8)

food_consumption <- tuesdata$food_consumption

write_csv(food_consumption, "food_consumption.csv")
}
