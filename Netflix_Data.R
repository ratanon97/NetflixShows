#-------------------------------------------------------------------------------
#Kaggle Dataset
#Netflix Shows 
#https://www.kaggle.com/shivamb/netflix-shows
#-------------------------------------------------------------------------------
#Set working directory
getwd()
setwd("C:\\Users\\KOMSUN\\Documents\\Kaggle\\Netflix Shows")
library(tidyverse)
netflix_shows_2020 <- read_csv('netflix_titles.csv') #Note: read_csv is part of the tidyverse
#-------------------------------------------------------------------------------
#First task
#Understanding what content is available in different countries
#Lets group the movies' PG rating with the countries
#Data Frame Manipulation
#Filter out shows with no country data
netflix_shows_2020_backup <- netflix_shows_2020 #Create backup of the dataset
options(max.print=1000000) #Increasing printing size when executing a dataframe in the console
#Check rows with empty values
netflix_shows_2020[!complete.cases(netflix_shows_2020),] #Check to see which rows have empty values
netflix_shows_2020 <- netflix_shows_2020[!is.na(netflix_shows_2020$country),] #Remove shows with no country data
#Factorise show IDs and Release years
netflix_shows_2020$show_id <- factor(netflix_shows_2020$show_id)
netflix_shows_2020$release_year <- factor(netflix_shows_2020$release_year)

#Shows in USA
library(dplyr) #To make it fail-safe if tidyverse package was not imported
USA_netflix_shows_2020 <- netflix_shows_2020 %>%
  filter(str_detect(country,"United States")) #Filter Countries with the pattern United States in the column
#Visualise (ratings and country) using geom_count 
library(ggplot2) #To make it fail-safe if tidyverse package was not imported
Rating_Country <- ggplot(data=netflix_shows_2020)
#Use the geom_count
Rating_Country + geom_count(aes(x=country,y=rating))