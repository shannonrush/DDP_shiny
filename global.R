library(shiny)
library(ggplot2)
library(dplyr)

load("data/titanic_data.RData")
min.age <- min(titanic.data$age)
max.age <- max(titanic.data$age)