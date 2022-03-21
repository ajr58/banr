require(dplyr)
require(tidyverse)

# import data
races <- read.csv("races.csv")
status <- read.csv("status.csv")
results <- read_csv("results.csv", col_types = cols(number = col_character()))

# join datasets
F1racing <- left_join(status, results, by='statusId') %>%
  left_join(races, results, by='raceId')

# wrangle data
F1racing <- F1racing %>%
  mutate(status = if_else((status == "Accident") |
                            (status == "Mechanical"),
                          "Accident/Mechanical",
                          status)) %>%                  # Mutate new a new category
  filter(status == "Accident/Mechanical" |
           status == "Finished") %>%                    # Filter 2 categories
  group_by(status, year) %>%
  summarise(status_sum = n())

# add to package
usethis::use_data(F1racing, overwrite = TRUE)
