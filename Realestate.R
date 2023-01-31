# Task 1: What are the types of data and the levels of measurement of the following variables: Cust ID, Mortgage, Year of sale. 
# Task 2: Create a histogram which represents the Price variable. Use the default binwidth values first and then set bins of length $100,000. 
          #Use the data on all apartments, no matter if sold or not.
# Task 3: Interpret the results.
# Task 4: Create a scatter plot showing the relationship between Price and Area. Use the data on all apartments, no matter if sold or not. Interpret the results.
# Task 5: Calculate the mean, median, mode, skewness, and standard deviation of Price for all apartments, no matter if sold or not.
# Task 6: Interpret the measures.
# Task 7: Calculate the correlation between Price and Area. Is the result in line with the scatterplot?

library(tidyverse)
library(scales)
getwd()
product <- read.csv("C:/Users/hp/Documents/practical_product.csv", sep = ",")
customer <- read.csv("C:/Users/hp/Documents/practical_customer.csv", sep = ",")

# Task 1

# Cust ID - Categorical/Nominal. This variable has the same properties as ID.
# Mortgage - Categorical/Nominal.	This is a Binary variable. Like a Yes/No question or Gender.
# Year of sale - Numerical, discrete/Interval.	Year is a numerical variable. 
##It is always discrete. The level of measurement is questionable, but we would treat it as interval, as the 0 year would be the time when the Big Bang happened.
##The current BC-AD calendar was arbitrary chosen (similarly to degrees Celsius and Fahrenheit).

# Task 2
##ggplot2 is a plotting package##
##that provides helpful commands to create complex plots from data in a data frame##
##install library tidyverse before running ggplot##
hg <- ggplot(data=product, aes(x = Price))
##The + in the ggplot2 package allows you to modify existing ggplot objects##
##Histograms ( geom_histogram() ) display the counts with bars##
##The alpha argument specifies the transparency of our histograms ##
##It allows to display multiple histograms overlaying each other##
hg + geom_histogram(binwidth = 100000, 
                    color = "darkslategray", 
                    fill = "darkslategray4", 
                    alpha = 0.5) + 
  ggtitle("House Prices Frequency Distribution") + 
  labs(y = "Number of Houses", 
       x = "Price") + 
  theme_minimal() +
  scale_x_continuous(labels =  comma) # this gets rid of the scientific notation on the x axis

# Task 3

# The two histograms point to similar insights##
##most of the apartment prices are concentrated in the interval ($217,000 to 317,000)##

# Task 4

sp <- ggplot(product, aes(`Area..ft..`, Price))
sp + geom_point() + 
  theme_light() + 
  labs(x = "Area in Square Feet", 
       y = "Price in USD", 
       title = "Relationship between Price and Area") +
  scale_y_continuous(labels = comma) # this gets rid of the scientific notation on the y axis

# The scatter plot shows a very strong linear relationship between Price and Area. This was to be expected as often Real Estate companies price their property per square foot.	
# Notice how for cheaper apartments (lower areas respectively), the points are closer so the variance is smaller.
##However, the bigger the apartment, the bigger the difference in the price.	

# Task 5 

library(psych)
# either of these gives you a decent summary and the mean, median, skew, and standard deviation of the data of interest
describe(product$Price)
summary(product$Price)
# create a function that returns the mode
mode <- function(x){ 
  ta <- table(x)
  tam <- max(ta)
  ##all() function in R Language will check in a vector##
  ##whether all the values are true or not##
  ##the is. numeric() function returns a logical value, TRUE or FALSE##
  if (all(ta == tam))
    mod <- NA
  else
    if(is.numeric(x))
      ##as.numeric() function in R##
      ##is used to convert a character vector into a numeric vector##
      mod <- as.numeric(names(ta)[ta == tam])
  else
    mod <- names(ta)[ta == tam]
  return(mod)
}

mode(product$Price)

# Task 6

# We will only comment on the skew, as it is a bit tougher. 
# The skew is right (positive). This means that most aparments are relatively cheap with a tiny portion that is more expensive.														

# Task 7

cor.test(product$Area, product$Price)

# Yes, the result is in line with the scatter plot. The two variables are strongly correlated.
