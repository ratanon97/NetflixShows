#-------------------------------------------------------------------------------
#Kaggle Dataset
#Netflix Shows 
#https://www.kaggle.com/shivamb/netflix-shows
#-------------------------------------------------------------------------------
#Set working directory
getwd()
setwd("C:\\Users\\KOMSUN\\Documents\\Kaggle\\Netflix Shows")
netflix_shows_2020 <- read.csv('netflix_titles.csv',
                               na.strings=c(""))
#-------------------------------------------------------------------------------
#First task
#Understanding what content is available in different countries
levels(netflix_shows_2020$rating)
#Lets group the movies' PG rating with the countries
#Filter out shows with no country data
netflix_shows_2020_backup <- netflix_shows_2020
options(max.print=1000000)
#Check rows with empty values
netflix_shows_2020[!complete.cases(netflix_shows_2020),]
netflix_shows_2020 <- netflix_shows_2020[!is.na(netflix_shows_2020$country),]