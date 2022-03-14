if (file.exists("food_consumption.csv")) {

  food_consumption <- read_csv("food_consumption.csv")

} else {

  food_consumption <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-18/food_consumption.csv')

  tuesdata <- tidytuesdayR::tt_load('2020-02-18')
  tuesdata <- tidytuesdayR::tt_load(2020, week = 8)

  food_consumption <- tuesdata$food_consumption

  write_csv(food_consumption, "food_consumption.csv")

}

food_consumption_total <- food_consumption %>%
  group_by(food_category) %>%
  summarize(total_consumption = sum(consumption),
            total_emission = sum(co2_emmission)) %>%
  mutate(food_type = case_when(food_category == "Pork" ~ "Animal Product",
                               food_category == "Poultry" ~ "Animal Product",
                               food_category == "Beef" ~ "Animal Product",
                               food_category == "Fish" ~ "Animal Product",
                               food_category == "Eggs" ~ "Animal Product",
                               food_category == "Milk - inc. cheese" ~ "Animal Product",
                               food_category == "Lamb & Goat" ~ "Animal Product",
                               TRUE ~ "Non-Animal Product")) %>%
  mutate(food_category = case_when(food_category == "Milk - inc. cheese" ~ "Dairy",
                                   food_category == "Nuts inc. Peanut Butter" ~ "Nuts",
                                   food_category == "Wheat and Wheat Products" ~ "Wheat",
                                   TRUE ~ food_category)) %>%
  arrange(desc(food_type), total_consumption)

food_consumption_grouped <- food_consumption_total %>%
  group_by(food_type) %>%
  summarize(total_consumption = sum(total_consumption),
            total_emission = sum(total_emission)) %>%
  mutate(perc_consumption = (total_consumption / sum(total_consumption)) * 100,
         perc_emission = (total_emission / sum(total_emission)) * 100,
         "% of Total" = "")

usethis::use_data(food_consumption_total)
usethis::use_data(food_consumption_grouped)


