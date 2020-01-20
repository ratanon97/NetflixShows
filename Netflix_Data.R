#-------------------------------------------------------------------------------
#Kaggle Dataset
#Netflix Shows 
#https://www.kaggle.com/shivamb/netflix-shows
#-------------------------------------------------------------------------------
#Set working directory
getwd()
setwd("C:\\Users\\KOMSUN\\Documents\\Kaggle\\Netflix Shows")
dataset <- read.delim('netflix_titles_nov_2019.txt',
                      quote = '', 
                      stringsAsFactors = FALSE)
