#' @importFrom usethis use_data

# import data
races <- read_csv("data/races.csv")
status <- read_csv("data/status.csv")
results <- read_csv("data/results.csv", col_types = cols(number = col_character()))

# join datasets
F1racing <- left_join(status, results, by='statusId') %>%
  left_join(races, results, by='raceId')

# wrangle data
status_data <- F1racing %>%
  mutate(status = if_else((status == "Accident") |
                            (status == "Mechanical"),
                          "Accident/Mechanical",
                          status)) %>%                  # Mutate new a new category
  filter(status == "Accident/Mechanical" |
           status == "Finished") %>%                    # Filter 2 categories
  group_by(status, year) %>%
  summarise(status_sum = n())

# add to package
usethis::use_data(F1racing)
