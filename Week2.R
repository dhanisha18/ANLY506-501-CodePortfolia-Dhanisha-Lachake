#This shows me my current working directory
getwd()

#I am Changing my working directory to the following path
setwd(dir = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio")

#This will print all the objects defined in my workspace
ls()

# This below code is to create new objects
study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))
score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study1.df)
study1.htest <- t.test(score ~ sex, 
                       data = study1.df)
Dhanisha.df <- data.frame(id = 1:5, 
                        sex = c("m", "f", "m", "f", "m"), 
                        score = c(21, 70, 17, 42, 42))
score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = Dhanisha.df)
study1.htest <- t.test(score ~ sex, 
                       data = Dhanisha.df)
# I will save  the data folder of my current working directory
save(study1.df, score.by.sex, study1.htest,
     file = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio/study1.RData")
# Save complete_image.RData in the  folder of my working directory

# THis will load objects in study1.RData into my workspace
load(file = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio/study1.RData")

# This will load objects in projectimage.RData into my workspace
load(file = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio/projectimage.RData")

#Remove Study1.df from workspace
rm(study1.df)

# This will remove ALL objects from workspace
rm(list = ls())

#Write the Dhanisha dataframe object to a comma separated
#  text file called dhanisha.txt in my working directory

write.table(x = Dhanisha.df,
            file = "dhanisha.txt",  # This will save the file as dhanisha.txt
            sep = ",")            # Make the columns comma separated
#Save object Study1.df as a new .RData file in the data folder of my current working directory
save(Dhanisha.df, score.by.sex, study1.htest,
     file = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio/Dhanisha.RData")

# Read a comma separated text file called NPAT.txt from the data folder in my working directory into R and store as a new object called mydata

Dhanishadata <- read.table(file = 'C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio/dhanisha.txt',    # file is in a data folder in my working directory
                     sep = ',',                  # file is comma separated
                     header = TRUE,               # the first row of the data is a header row
                     stringsAsFactors = FALSE)    # DOT NOT convert strings to factors
Dhanishadata


# Read a text file from the Internet
fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)
fromweb
setwd(dir = "C:/Users/dlachake/Desktop/HU Studies/506/CodePortfolio/MyRProject")
