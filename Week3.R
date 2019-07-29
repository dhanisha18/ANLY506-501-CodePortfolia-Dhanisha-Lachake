#Week3 - Dhanisha

library(readr)
getwd()
#sETTING MY wORKDING dIRECTORY FOR wEEK 3
setwd(dir = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio")
getwd()
# Code to read the csv file
USDATA<-read_csv("USEPAdata2017.csv")
# view the csv file
View(USDATA)

#Below will help check the number rows and columns
nrow(USDATA)
ncol(USDATA)
     
#HEre I am performing some cleaup in the removes spaces in the column names
names(USDATA)<-make.names(names(USDATA))
names(USDATA)
     
# Peek at the data
    
#The below code will give details of the dataset and helps check potential issues with the datax
str(USDATA)

#The below will help check the top of the data will show POC, LatituteParameter Code.
head(USDATA[, c(5:6, 4)])

#The below will help check the bottom of the data will show POC, Latitude and Sample Duration
tail(USDATA[, c(5:6, 10)])
     
##The below will give us the table detail for Address in USDATA dataset
table(USDATA$Address)
     
 # Find Observations measured at the above Longitude
install.packages(dplyr)
 library(dplyr)
     
 # Here Filter the USDATA  for the above Longitude and select the 3 Columns
# Observation count, State code, Sample Duration, Arithmetic Mean
     filter(USDATA, Longitude == head(USDATA$Longitude,1)) %>% 
       select(`State.Code`,
              `Sample.Duration`,`Arithmetic.Mean`)
     
     # Filter Selection for State.Code == 20 and find all Observations
     filter(USDATA, USDATA$'State.Code' == "20") %>% 
       select(`Observation.Count`,`State.Code`,
              `Sample.Duration`,`Arithmetic.Mean`) %>% 
       as.data.frame #Reached max and omitted 69 rows
     
     # Unique States in the DataSet Count and Names
     
     select(USDATA, State.Name) %>% 
       unique %>% 
       nrow #Gace 54 unique number
     
     # Display unique States
     unique(USDATA$State.Name) #Listed all the different unique states in US
     
     View(USDATA)
     
     
     # 10 % segratation of the data
     quantile(USDATA$Observation.Count, seq(0, 1, 0.1))
     
     # rank the state and counties by Arithmetic.Mean
     rankthestate <- group_by(USDATA, State.Name, County.Name) %>%
       summarize(USDATA = mean(USDATA$Arithmetic.Mean)) %>%
       as.data.frame %>%
       arrange(desc(USDATA))
     
 # view head ranking
     head(rankthestate) #Alabama
     
# View  bottom 5 tail ranking
tail(rankthestate,5) #Wyoming
     
# number of observations for Sublette county in Wyoming
     filter(USDATA, State.Name == "Wyoming" & County.Name == "Sublette") %>% 
       nrow #192
     