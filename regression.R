getwd()
college<-read.csv("C:/Users/hp/Documents/regression_example.csv")
college
library(psych)
library(tidyverse)
library(ggplot2)
describe(college)
##saved to a variable called linmod##
##The lm() function is used to fit linear models to data frames in the R Language##
linmod<-lm(GPA~SAT, data=college)
ggplot(college,aes(SAT,GPA))+
  geom_point()+
  theme_light()+
  labs(x="SAT Scores",
       y="GPA upon graduation",
       title="SAT and GPA")
##the summary() function to summarize the results of a linear regression model##
summary(linmod)
#Save the graph
dev.off
#predict the GPA based on SAT score
linmod<-lm(GPA~SAT, data=college)
a <- data.frame(SAT = 1808)
result <-  predict(linmod,a)
result

##example 2
x<-c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y<-c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
relation <- lm(y~x)
a <- data.frame(x = 170)
result <-  predict(relation,a)
result
# Give the chart file a name.
png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")
#ab line draws a line and cex is for points

#exercise solution
### Load the libraries you will need 

library(tidyverse) 
library(psych) # good for descriptives, remember? 

# this is an additional library I have included (I want to show you something super useful :))
library(scales) # new package! we will use this to create a custom format when plotting the data

### Load the data as a tibble (readr has a function that does this directly)
getwd()
data <- read_csv("C:/Users/hp/Documents/real_estate.csv")
##install.packages("bit", type="binary") if u get an error
data

### Get the descriptives for your data so you can understand what you're dealing with a little better

describe(data) # get a sense of your data
summary(data) # get a sense of your data
### Explore the data and see if there are any interesting trends to consider
point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE)
# this helps us get rid of the scientific notation in the graph
ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)

### Define the linear model 
linmod <- lm(price~size, data = data)
### Plot the regression line
ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  stat_smooth(method = "lm", se = FALSE) +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)


### Print the results of the model

summary(linmod)
