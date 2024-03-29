#### Preamble ####
# Purpose: Cleans the raw plane data recorded to only include QB stats from the 2023 season weeks 1-9
# Author: Aryaman Suri
# Date: 28 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

library(dplyr)

# Read raw data
raw_data <- read.csv("data/raw_data/raw_data.csv")

# Filter data for 2023 season weeks 1-9
analysis_data <- raw_data %>%
  filter(season == 2023 & week >= 1 & week <= 9) %>%
  select(player_id, player_name, recent_team, season, week, passing_yards, passing_tds, interceptions, sacks, passing_epa)

# Write cleaned data to CSV
write.csv(analysis_data, "data/analysis_data/analysis_data.csv", row.names = FALSE)
