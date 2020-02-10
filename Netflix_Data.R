#-------------------------------------------------------------------------------
#Kaggle Dataset
#Netflix Shows 
#https://www.kaggle.com/shivamb/netflix-shows
#-------------------------------------------------------------------------------
#Set working directory
getwd()
setwd("C:\\Users\\KOMSUN\\Documents\\Kaggle\\Netflix Shows")
library(tidyverse)
library(recommenderlab)
library(reshape2)
netflix_shows_2020 <- read_csv('netflix_titles.csv') #Note: read_csv is part of the tidyverse
options(max.print=1000000) #Increasing printing size when executing a dataframe in the console
#-------------------------------------------------------------------------------
#First task
#Understanding what content is available in different countries
#Lets group the movies' PG rating with the countries
#Data Frame Manipulation
#Filter out shows with no country data
netflix_shows_2020_backup <- netflix_shows_2020 #Create backup of the dataset
#Check rows with empty values
netflix_shows_2020[!complete.cases(netflix_shows_2020),] #Check to see which rows have empty values
netflix_shows_2020 <- netflix_shows_2020[!is.na(netflix_shows_2020$country),] #Remove shows with no country data
#Factorise show IDs and Release years
netflix_shows_2020$show_id <- factor(netflix_shows_2020$show_id)
netflix_shows_2020$release_year <- factor(netflix_shows_2020$release_year)
#Pre-Processing by Separating Genres
#Method source: https://data-flair.training/blogs/data-science-r-movie-recommendation/
netflix_genre <- as.data.frame(netflix_shows_2020$listed_in,stringsAsFactors = FALSE)
library(data.table)
netflix_genre_2<-as.data.frame(tstrsplit(netflix_genre[,1], '[,]', 
                        type.convert=TRUE), 
              stringsAsFactors=FALSE) #Split genres
colnames(netflix_genre_2) <- c(1,2,3)
for (i in 1:3){
  netflix_genre_2[,i] <- factor(netflix_genre_2[,i])
} #Loop all the columns to be factorised
str(netflix_genre_2)
genre_vectors <- c("")
#Shows in USA
library(dplyr) #To make it fail-safe if tidyverse package was not imported
USA_netflix_shows_2020 <- netflix_shows_2020 %>%
  filter(str_detect(country,"United States")) #Filter Countries with the pattern United States in the column

#---------------------------------------------------------------------
#Visualisation Part
#Create pie chart to see the number of movies and TV shows are provided in the USA
library(ggplot2) #Make it fail safe if tidyverse package was not imported
library(scales) #For formatting the pie chart with % labels
#Pie Chart
Pie_Chart <- ggplot(data=USA_netflix_shows_2020,aes(x=factor(1),fill=type))+
  geom_bar(width = 1)+
  coord_polar("y")
blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )
Pie_Chart + scale_fill_brewer("Blues") + blank_theme +
  theme(axis.text.x=element_blank())
#Bar Chart
Bar_Chart <- ggplot(data=USA_netflix_shows_2020,aes(x=type)) + 
  geom_bar(fill="LightBlue",
                 colour="Black",
                 size=1) +
  xlab("Type of Netflix Shows")+
  ylab("Number of Shows")+
  ggtitle("Type of TV shows provided in the USA")+ #Making the graph look nicer using the Theme function
  theme(axis.title.x=element_text(size=15),
        axis.title.y=element_text(size=15),
        axis.text.x=element_text(size=15,colour="black"),
        axis.text.y=element_text(size=15,colour="black"),
        plot.title=element_text(size=20),
        strip.text=element_text(size=10))
