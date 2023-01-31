##view first six rows of mtcars dataset
head(mtcars)
##Use Pipe Operator to Summarize One Variable
library(dplyr)

#summarize mean mpg grouped by cyl
mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean_mpg = mean(mpg))
##Use Pipe Operator to Group & Summarize Multiple Variables
mtcars %>% 
  group_by(cyl, am) %>% 
  summarise(mean_mpg = mean(mpg),
            sd_hp = sd(hp))
##Use Pipe Operator to Create New Variables
#add two new variables in mtcars
new_mtcars <- mtcars %>%
  mutate(mpg2 = mpg*2,
         mpg_root = sqrt(mpg))

#view first six rows of new data frame
head(new_mtcars)
