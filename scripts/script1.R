# how has av june temp changes body size?

# relationship btwn increasing av june temp and body size?
# may be inportant co-varient that are important and may have an impact the varibales.
# - M + F
# rain fall

# dont include yr 

# what might have suitable interactions 
# - M+F respond fiff to temp + growth?
#interaction btwn rain and temp

# - makes biological sense for an interaction  models show a pattern for interaction


# linear models
# wing size vs rain colour for sex ect


#__________________________----


# simple bar chart of n males and n females 

#577 to 57.7  exclude! safe options to assumptions  or repace with variable av 
#exlude with filter  anything less than 200  into new data f?

# re run histograms

#use ggally to produce paired plots to see effects
#- length and rain - little evidence to suggest
#- can see females bigger than males but no evidnece this is related to rain (sex interaction not diff with rain )
#-


#- sex respodes diff to temp  (slopes diff but weak diff)
#- further needed 


# add interaciton term btwn sex and length in model_beta_variables(

# go thru and define all models + tests

# heterogenaity  homogenaity of variance

# car packages has qq polt function whihc adds inetervals -


#ues emmeans to produce == plots  

#________________________ ----
# SET UP ----

rm(list=ls())


library(tidyverse)
library(janitor)
library(GGally)
library(emmeans)
library(performance)


## LOADING DATA ----

butterfly <- read_csv ("data/univoltine_butterfly.csv")


head(butterfly)
glimpse(butterfly)



##________________________----
# DATA CLEANING ----

## Column names ----
colnames(butterfly) 

# Auto clean column names
butterfly <- janitor::clean_names(butterfly) # clean the column names

# Manual clean column names
# shorten the variable names for N and C isotope blood samples

butterfly <- rename(butterfly,
                    "jun_temp_mean"="jun_mean",  # use rename from the dplyr package
                    "jun_rain"="rain_jun")



## Checking for errors ----

# Check for duplications
butterfly %>% 
  duplicated() %>% # produces a list of TRUE/FALSE statements for duplicated or not
  sum() # sums all the TRUE statements

# # Get a sum of how many observations are missing in our dataframe
butterfly %>% 
  is.na() %>% 
  sum()


# use summarise to check data range is as expected
butterfly %>% 
  summarise(min=min(forewing_length, na.rm=TRUE), 
            max=max(forewing_length, na.rm=TRUE))



butterfly %>% 
  group_by(sex) %>%
  summarise(min=min(forewing_length, na.rm=TRUE), 
            max=max(forewing_length, na.rm=TRUE))


# check for errors in categorical data
butterfly %>% 
  distinct(sex)


# use mutate and case_when for a statement that conditionally changes the names of the values in a variable
butterfly <- butterfly %>% 
  mutate(sex = case_when(sex == "Females" ~ "Female", # change typosg
                         sex == "Maes" ~ "Male", # change typos
                         sex == "Males" ~ "Male", # make singular
                         sex == "Female" ~ "Female")) # include non typos to prevent NAs)) 

butterfly %>% 
  distinct(sex)


# produce a summary of our data
summary(butterfly)


butterfly %>% 
  ggplot(aes(x = jun_rain)) +
  geom_histogram()
# outlier at 600 - remove?


butterfly %>% 
  ggplot(aes(x = forewing_length)) +
  geom_histogram()
# No outliers

butterfly %>% 
  ggplot(aes(x = jun_temp_mean)) +
  geom_histogram()
# No outliers




#__________________________----


# simple bar chart of n males and n females 

#577 to 57.7  exclude! safe options to assumptions  or repace with variable av 
#exlude with filter  anything less than 200  into new data f?

# re run histograms

#use ggally to produce paired plots to see effects
#- length and rain - little evidence to suggest
#- can see females bigger than males but no evidnece this is related to rain (sex interaction not diff with rain )
#-


#- sex respodes diff to temp  (slopes diff but weak diff)
#- further needed 


# add interaciton term btwn sex and length in model_beta_variables(

# go thru and define all models + tests

# heterogenaity  homogenaity of variance

# car packages has qq polt function whihc adds inetervals -


#ues emmeans to produce == plots  
