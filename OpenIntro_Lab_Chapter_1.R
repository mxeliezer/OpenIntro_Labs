# OpenIntro Lab - Chapter 1 #

# Introduction to data #
  
# OpenIntro labs
# Introductory Statistics with Randomization and Simulation
# Lab available from: 
# https://htmlpreview.github.io/?https://github.com/andrewpbray/oiLabs-base-R/blob/master/intro_to_data/intro_to_data.html

# Data set: Centers for Disease Control and Prevention (CDC)
# The Behavioral Risk Factor Surveillance System (BRFSS)
# Available from: http://www.cdc.gov/brfss

# We will focus on a random sample of 20,000 people
# from a small subset of the BRFSS survey.


source("http://www.openintro.org/stat/data/cdc.R")


# **Exercise 1** # 
# How many cases are there in this data set? 
# How many variables? For each variable, identify its data type. 

names(cdc)

head(cdc)

tail(cdc)

str(cdc)


# Answer: 
# There are 20000 cases and 9 variables in this data set. 
# We can see the types of each variable in the output.


# **Exercise 2** # 
# Create a numerical summary for `height` and `age`, 
# and compute the interquartile range for each. 
# Compute the relative frequency distribution for `gender` and `exerany`. 
# How many males are in the sample? 
# What proportion of the sample reports being in excellent health?
  
summary(cdc$height)

# interquartile range = 3rd Qu - 1st Qu
IQR_height <- 70-64

IQR_height

summary(cdc$age)

# interquartile range = 3rd Qu - 1st Qu
IQR_age <- (57-31)

IQR_age

table(cdc$gender)

table(cdc$gender)/20000

table(cdc$exerany)/20000

# Answer: 
# There are 9569 males. 
# The frequency distribution for `gender` and `exerany`, 
# can be seen int the output.

summary(cdc$genhlth) / 20000


# Answer: 
# The proportion of the sample reports being 
# in excellent health = 0.23285 or 23%.

# **Exercise 3** # 
# What does the mosaic plot reveal about smoking habits and gender?
  
gender_smoke <- table(cdc$gender,cdc$smoke100)

gender_smoke

mosaicplot(gender_smoke) #  column labels: 0 and 1. 1 indicates a respondent has smoked at least 100 cigarettes.

# Answer: 
# It seems that men smoke more often than women.