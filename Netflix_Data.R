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
#Shows in USA
library(dplyr) #To make it fail-safe if tidyverse package was not imported
USA_netflix_shows_2020 <- netflix_shows_2020 %>%
  filter(str_detect(country,"United States")) #Filter Countries with the pattern United States in the column
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
str(USA_netflix_shows_2020$listed_in)