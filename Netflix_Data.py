#-------------------------------------------------------------------------------
#Kaggle Dataset
#https://www.kaggle.com/shivamb/netflix-shows
#-------------------------------------------------------------------------------
#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os
import re
#-------------------------------------------------------------------------------
#Set working directory 
print(os.getcwd())
os.chdir("C:\\Users\\KOMSUN\\Documents\\Kaggle\\Netflix Shows")
netflix_shows_2020  = pd.read_csv("netflix_titles.csv")
#-------------------------------------------------------------------------------
#First task
#Understanding what content is available in different countries
with pd.option_context('display.max_rows', None, 'display.max_columns', None):  
    print(netflix_shows_2020)
#Specify which rows and columns the dataframe should be show#Specify which rows and columns the dataframe should be show
netflix_shows_2020=netflix_shows_2020.dropna(subset=["country"]) #Drop na values in the column: country
netflix_shows_2020.info()
netflix_shows_2020["show_id"] = pd.Categorical(netflix_shows_2020["show_id"])
netflix_shows_2020["release_year"] = pd.Categorical(netflix_shows_2020["release_year"]) #Convert data types to categorical
USA_filter = netflix_shows_2020["country"].str.contains('United States') #Filterto create USA dataframe
USA_netflix_shows_2020 = netflix_shows_2020[USA_filter]