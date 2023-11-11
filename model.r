# Load required libraries
library(dplyr)
library(caret)
library(ggplot2)
library(rpart)
library(leaps)
library(psych)

# Load the data files
training <- read.csv('https://raw.githubusercontent.com/Junmingyi0112/FIN550-FA23-G7/main/historic_property_data.csv')
test <- read.csv('https://raw.githubusercontent.com/Junmingyi0112/FIN550-FA23-G7/main/predict_property_data.csv')
head(training)
head(test)

# EDA
# turn chr to factor in a loop
for (i in 1:ncol(training)) {
  if (class(training[,i]) == "character") {
    training[,i] <- as.factor(training[,i])
  }
}
# turn ture or false values into 1 or 0 for all columns
for (i in 1:ncol(training)) {
  if (class(training[,i]) == "logical") {
    training[,i] <- as.numeric(training[,i])
  }
}
# drop variables with only has one unique value
training <- training[, sapply(training, function(x) length(unique(x))) > 1]
# Check the data structure again
str(training)


# exhaustive search
search <- regsubsets(sale_price ~ ., data = training, nbest = 2, nvmax = 12, method = "exhaustive")
# summary table 
sum<-summary(search)
# show models
sum$which 
# show metrics
sum$adjr2
