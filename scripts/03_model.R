#### Preamble ####
# Purpose: Predict passing_epa for NFL teams for Weeks 10-18 of the 2023 season using a linear regression model.
# Author: Aryaman Suri
# Date: 28th March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: rstanarm
# Data sets: analysis_data.csv (contains data for Weeks 1-9), raw_data.csv (contains raw data for all the seasons)

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
linear_model <- lm(passing_epa ~ passing_yards + passing_tds + interceptions + sacks, data = analysis_data)

#### Save model ####
saveRDS(linear_model, "models/linear_model.rds")

#### Read raw data for the remainder of the 2023 season ####
remainder_data <- read_csv("data/raw_data/raw_data.csv") %>%
  filter(season == 2023, week >= 10 & week <= 18) %>%
  select(player_name, recent_team, player_id, week, passing_yards, passing_tds, interceptions, sacks)

#### Predict passing_epa for remaining weeks ####
predicted_epa <- remainder_data %>%
  mutate(predicted_epa = predict(linear_model, .))

#### Save predictions ####
write_csv(predicted_epa, "data/prediction_data/prediction_data.csv")
