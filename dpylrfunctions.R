##Using the filter function
# Create a data frame with missing data
data1 <- data.frame(name=c("Abhi", "Bhavesh",
                        "Chaman", "Dimri"),
                 age=c(7, 5, 9, 16),
                 ht=c(46, NA, NA, 69),
                 school=c("yes", "yes", "no", "no"))
data1
library(dplyr)
# Finding rows with NA value
data1 %>% filter(is.na(ht))

# Finding rows with no NA value
data1 %>% filter(! is.na(ht))

##Using the arrange function
# Create a data frame with missing data
d <- data.frame( name = c("Abhi", "Bhavesh", "Chaman", "Dimri"),
                 age = c(7, 5, 9, 16),
                 ht = c(46, NA, NA, 69),
                 school = c("yes", "yes", "no", "no") )

# Arranging name according to the age
d.name<- arrange(d, age)
print(d.name)

##select and arrange
# startswith() function to print only ht data
select(d, starts_with("ht"))
# -startswith() function to print
# everything except ht data
select(d, -starts_with("ht"))
# Printing column 1 to 2
select(d, 1: 2)
# Printing data of column
# heading containing 'a'
select(d, contains("a"))
# Printing data of column
# heading which matches 'na'
select(d, matches("na"))

##mutate and transmute
# Create a data frame with missing data
d <- data.frame( name = c("Abhi", "Bhavesh",
                          "Chaman", "Dimri"),
                 age = c(7, 5, 9, 16),
                 ht = c(46, NA, NA, 69),
                 school = c("yes", "yes", "no", "no") )

# Calculating a variable x3 which is sum of height
# and age printing with ht and age
mutate(d, x3 = ht + age)

# Calculating a variable x3 which is sum of height
# and age printing without ht and age
transmute(d, x3 = ht + age)

##summarise
# Calculating mean of age
summarise(d, mean = mean(age))
# Calculating min of age
summarise(d, med = min(age))
# Calculating max of age
summarise(d, med = max(age))
# Calculating median of age
summarise(d, med = median(age))
##sample
#Printing three rows
sample_n(d, 3)
#Printing 50 % of the rows
sample_frac(d, 0.80)
