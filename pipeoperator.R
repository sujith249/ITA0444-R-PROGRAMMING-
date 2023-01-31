data("mtcars")
head(mtcars)
##Example 1
##to filter, group, and summarize the data from the mtcars dataset without the pipe operator
summarize(
  group_by(
    filter(mtcars, mtcars$cyl >4),
    cyl
  ),
  mpg_mean = mean(mpg)
)
##using the pipe operator -
##the group_by() function takes the output of it as an argument, 
##and finally, the summarize() function takes the output of the previous execution as an argument
mtcars %>%
  filter(carb > 1)%>%
  group_by(cyl) %>%
  summarize(Avg_mpg = mean(mpg))
##Example 2
##the pipe operator with graphical functions that are a part of the well known ggplot2 function.
library(ggplot2)
###Here, the pipeline operator is used to create a pipeline of filtered carb values which are grouped by gear values 
##and summarized by avg_mpg (average value of mpg) 
##and then plotted with gear on x-axis and avg_mpg on the y-axis
##the bar plot will be created against the avg-mpg values with respect to the no. of gears
mtcars %>% 
  filter(carb > 1) %>% 
  group_by(gear) %>% 
  summarize(avg_mpg = mean(mpg)) %>% 
  ggplot(aes(x = gear, y = avg_mpg)) + 
  geom_bar(stat = "identity")
  
