# load the tidyr package
library(tidyr)
n = 10
# creating a data frame
tidy_dataframe = data.frame(
  S.No = c(1:n), 
  Group.1 = c(23, 345, 76, 212, 88, 
              199, 72, 35, 90, 265),
  Group.2 = c(117, 89, 66, 334, 90, 
              101, 178, 233, 45, 200),
  Group.3 = c(29, 101, 239, 289, 176,
              320, 89, 109, 199, 56))
# print the elements of the data frame
tidy_dataframe
# using gather() function on tidy_dataframe
long <- tidy_dataframe %>% 
  gather(Group, Frequency,
         Group.1:Group.3)
# print the data frame in a long format
long
# use separate() function to make data wider
separate_data <- long %>% 
  separate(Group, c("Allotment", 
                    "Number"))
# print the wider format
separate_data
# use unite() function to glue 
##unite is the reverse f separate
# Allotment and Number columns
unite_data <- separate_data %>%
  unite(Group, Allotment, 
        Number, sep = ".")
# print the new data frame
unite_data
# use unite() function to make data wider
#and transform long back to wide using spread
back_to_wide <- unite_data %>% 
  spread(Group, Frequency)
# print the new data frame
back_to_wide

df <- tidy_dataframe
# nest column Group.1 in 
# tidy_dataframe using nest()
df %>% nest(data = c(Group.1))
##nest and unnest
##iris dataset
df <- iris
names(iris)
# nesting the species column in 
# the df data frame using nest()
head(df %>% nest(data = c(Species)))
# unnesting the species column 
# in the df data frame using unnest()
head(df %>% unnest(Species,.drop = NA,
                   .preserve = NULL)) 
# import the tidyr package
df <- data.frame(Month = 1:6, 
                 Year = c(2000, rep(NA, 5)))
# print the df data frame
df                   
# use fill() to fill missing values in 
# Year column in df data frame
df %>% fill(Year)   
##full_seq
# import the tidyr package
library(tidyr)
# creating a numeric vector
num_vec <- c(1, 7, 9, 14, 19, 20)
# use full_seq() to fill missing
# values in num_vec
full_seq(num_vec, 1)


#drop_na
# create a tibble df with missing values
df <- tibble(S.No = c(1:10),
             Name = c('John', 'Smith', 'Peter',
                      'Luke', 'King', rep(NA, 5)))

# print df tibble
df                    # Output (i)

# use drop_na() to drop columns 
# in df with missing values 
df %>% drop_na(Name)

##replace_na
### import tidyr package
library(tidyr)

df <- data.frame(S.No = c(1:10),
                 Name = c('John', 'Smith', 
                          'Peter', 'Luke',
                          'King', rep(NA, 5)))

df                                      # Output (i)

# use replace_na() to replace missing values or na
df %>% replace_na(list(Name = 'Henry')) # Output (ii)
