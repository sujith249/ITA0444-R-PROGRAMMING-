#include or install required package
library(tidyverse)
install.packages("ggthemes")
library(ggthemes) 
#Read the data and factor the variables for gender and title
emp <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, salary > 45000)
# To determine the distribution of salaries over 45000 among employees, we'll create a histogram on the filtered salary variable. 
# The function to create a histogram in gg plot is a geom_histogram. 
# We specify binwidth to be 5000. This will result in a histogram of 13 bins.
# The color and fill arguments control the color of the histogram bins.
# Color displays the bin edges, or their border, whereas fill is responsible for the color of the bin itself.
# To be able to distinguish the different bins, we include a darkgrey color for the border and a more contrasting light green color for the actual bins.
# We set the alpha parameter to 0.7. Alpha shows transparancy and takes values between 0 and 1. 0 means completely transparent, 1 means no transparency.
# With labs we add a custome title, as well as x and y labels.
# With theme_ we choose a custom theme and include custom styling options. A font size of 15, and shrift "serif"
hist <- ggplot(emp.a, aes(salary))
hist + geom_histogram(binwidth = 5000, color = "darkslategray",
                      fill = "darkseagreen2", alpha = 0.7) +
  labs(title = "Salary distribution in the employee data",
       x = "Salary", y = "Number of employees in the salary bracket") +
  
  theme_solarized_2(light = FALSE, base_size = 15, base_family = "serif")
