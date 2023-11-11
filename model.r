# Load required libraries
library(dplyr)
library(caret)
library(ggplot2)
library(rpart)
# Load the data files
predict_data <- read.csv("predict_property_data.csv")
historic_data <- read.csv("historic_property_data.csv")
codebook <- read.csv("codebook.csv")

