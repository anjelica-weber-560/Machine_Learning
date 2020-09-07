#Bike Share Linear Regression Project

# Libraries ---------------------------------------------------------------
library(ggplot2)

# Load Data ---------------------------------------------------------------
bike <- read.csv('G:/My Drive/Learning Code/UDemy R Coding/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/bikeshare.csv')

# Exploratory Data Analysis -----------------------------------------------
#Scatter Plot count vs temp
ggplot(bike, aes(temp, count)) + geom_point(alpha=0.2, aes(color=temp)) + theme_bw()
#Scatter Plot count vs datetime (color gradient of temp)
bike$datetime <- as.POSIXct(bike$datetime)
ggplot(bike, aes(datetime, count)) + geom_point(aes(color=temp), alpha=0.5) + scale_color_continuous(low='#55D8CE', high='#FF6E2E') + theme_bw()

#temp vs count correlation
cor(bike[, c('temp', 'count')])

#Seasonal Data analysis, Box plot y=count x=season
ggplot(bike, aes(factor(season), count)) + geom_boxplot(aes(color=factor(season))) + theme_bw()

# Feature Engineering -----------------------------------------------------
bike$hour <- sapply(bike$datetime, function(x)format(x, '%H'))
#scatter plot count vs hour (filter workingday==1)
library(dplyr)
pl <- ggplot ()