#### Preamble ####
# Purpose: Simulate data for NFL quarterbacks for the 2023 regular season
# Author: Aryaman Suri
# Date: March 28, 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Data sources: NFL quarterback statistics

#### Data expectations ####
# Quarterback performance may vary based on factors such as team, opponent, and season week

# Set seed for reproducibility
set.seed(123)

#### Simulate NFL Quarterback Data ####
# Define the number of quarterbacks and teams
num_qbs <- 100
num_teams <- 32

# Generate player IDs
player_ids <- 1:num_qbs

# Create a vector of NFL team names
nfl_teams <- c("Arizona Cardinals", "Atlanta Falcons", "Baltimore Ravens", "Buffalo Bills", "Carolina Panthers",
               "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns", "Dallas Cowboys", "Denver Broncos",
               "Detroit Lions", "Green Bay Packers", "Houston Texans", "Indianapolis Colts", "Jacksonville Jaguars",
               "Kansas City Chiefs", "Las Vegas Raiders", "Los Angeles Chargers", "Los Angeles Rams", "Miami Dolphins",
               "Minnesota Vikings", "New England Patriots", "New Orleans Saints", "New York Giants", "New York Jets",
               "Philadelphia Eagles", "Pittsburgh Steelers", "San Francisco 49ers", "Seattle Seahawks",
               "Tampa Bay Buccaneers", "Tennessee Titans", "Washington Football Team")

# Generate random team assignments for each quarterback
qb_teams <- sample(nfl_teams, num_qbs, replace = TRUE)

# Generate simulated quarterback statistics
passing_yards <- round(rnorm(num_qbs, mean = 250, sd = 50), digits = 0)
passing_tds <- rpois(num_qbs, lambda = 2)
interceptions <- rpois(num_qbs, lambda = 1)
sacks <- rpois(num_qbs, lambda = 3)

# Create a data frame to store the simulated data
qb_data <- data.frame(
  player_id = player_ids,
  team = qb_teams,
  passing_yards = passing_yards,
  passing_tds = passing_tds,
  interceptions = interceptions,
  sacks = sacks
)

# Display simulated data
print(head(qb_data))
