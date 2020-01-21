#-------------------------------------------------------------------------------
#Kaggle Dataset
#https://www.kaggle.com/shivamb/netflix-shows
#-------------------------------------------------------------------------------
#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os
#-------------------------------------------------------------------------------
#Set working directory 
print(os.getcwd())
os.chdir("C:\\Users\\KOMSUN\\Documents\\Kaggle\\Netflix Shows")
netflix_shows_2020  = pd.read_csv("netflix_titles.csv")
#-------------------------------------------------------------------------------
#First task
#Understanding what content is available in different countries
netflix_shows_2020=netflix_shows_2020.dropna(subset=["country"]) #Drop na values in the column: country