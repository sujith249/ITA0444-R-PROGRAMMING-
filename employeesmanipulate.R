library(tibble)
library(dplyr)
#If you have saved the data set outside the default R library, make sure you include the path using \ slashes. Example:
#employee.data <- read.csv("c:\users\documents\employee-data.csv", skip = 23, stringsAsFactors = FALSE)
getwd()
employee.data <- read.csv("C:/Users/hp/Documents/employee_data.csv", skip = 23, stringsAsFactors = FALSE)
#Convert the data frame into a tibble
#Tibble is a package in R programming that is used to manipulate and print data frames
employee.data <- as_tibble(employee.data)
#Covert gender and title variables to factors. 
employee.data$gender <- as.factor(employee.data$gender)
employee.data$title <- as.factor(employee.data$title)

#Checking for missing values -> the Answer is FALSE, so there are no missing values in our data
any(is.na(employee.data))

#Create data frame of high earning employees. Check if the salary column is larger than 70 000.
employee.a <- employee.data %>% 
  select(ends_with("name"), gender, everything()) %>%
  filter(salary >= 70000) %>% 
  arrange(gender, last_name)
#Check the resulting data frame
employee.a
#Save the good earners employee numbers in a seperate data frame.
good.earners <- employee.a["emp_no"]

#Earnings by job position and gender. We group the data by job title, as well as gender. 
# For each we calculate the average salary, and then divide the number by 12, to get an average monthly salary
employee.b <- employee.data %>% 
  group_by(title, gender) %>% 
  summarise(avg.salary = mean(salary)) %>% 
  mutate(monthly = avg.salary/12) %>% 
  arrange(gender, desc(monthly))
# Resulting data frame. 
# Overall the salary for different job positions is comparable between female and male workers.
# What we can observe is that the highest paid female employees are members of the senior staff with an yearly salary of over 60025 dollars.
# The highest paid position among male employees is staff, with around 57500 dollars yearly salary. Senior male staff members receive almost the same amount as yearly pay.
# The lowest paid position based on the data is Senior Engineer. Both female and male employees in that category receive an average yearly salary of under 50000 dollars.
# Male Senior engineers have slightly higher salaries, compared to their female counterparts.
employee.b
