#dplyr Exercises #1
#Read in the msleep_ggplot2.csv file with the function read.csv() and use the function class() 
#to determine what type of object is returned.

dat <- read.csv("msleep_ggplot2.csv")
class(dat)

#dplyr Exercises #2
#Now use the filter() function to select only the primates.
#How many animals in the table are primates?
#Hint: the nrow() function gives you the number of rows of a data frame or matrix.

library(dplyr)
head(dat)    # inspect to find column name and text for filtering
dat2 <- filter(dat, order=="Primates")
nrow(dat2)

#dplyr Exercises #3
#What is the class of the object you obtain after subsetting the table to only include primates?

dat2 <- filter(dat, order=="Primates")
class(dat2)

#dplyr Exercises #4
#Now use the select() function to extract the sleep (total) for the primates.

#What class is this object?

y <- filter(dat, order=="Primates") %>% select(sleep_total)
class(y)

#dplyr Exercises #5

#Now we want to calculate the average amount of sleep for primates (the average of the numbers computed above). 
#One challenge is that the mean() function requires a vector so, if we simply apply it to the output above, we get an error. Look at the help file for unlist() and use it to compute the desired average.

#What is the average amount of sleep for primates?

y <- filter(dat, order=="Primates") %>% select(sleep_total) %>% unlist
mean(y)

#dplyr Exercises #6

#For the last exercise, we could also use the dplyr summarize() function. 
#We have not introduced this function, but you can read the help file and repeat exercise 5, 
#this time using just filter() and summarize() to get the answer.

#What is the average amount of sleep for primates calculated by summarize()

filter(dat, order=="Primates") %>% summarize( mean( sleep_total) )