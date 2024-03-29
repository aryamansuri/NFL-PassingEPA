#### Preamble ####
# Purpose: Downloads and saves the data from the nflverse package
# Author: Aryaman Suri
# Date: 28 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

# Install and load the nflverse package
# install.packages("nflverse")
library(nflverse)

# Load quarterback statistics data for the regular season
raw_data <- load_player_stats(seasons = TRUE) %>%
  filter(position == "QB" & season_type == "REG")

#### Save data ####
write_csv(raw_data, "data/raw_data/raw_data.csv")
