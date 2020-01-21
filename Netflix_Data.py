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
dataset = pd.read_csv("netflix_titles.txt",
                       delimiter="\t",
                       quoting=3)
#Cleaning the texts