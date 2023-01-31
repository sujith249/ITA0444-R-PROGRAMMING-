library(tidyverse)
getwd()
hdi<-read.csv("C:/Users/hp/Documents/hdi-cpi.csv",stringsAsFactors = FALSE)
hdi<-as.tibble(hdi)
#tibble is nothing but a dataframe that shows the first 10 rows of a data frame
hdi
# Simple Scatter Plot 
sc<-ggplot(hdi)
sc 
#the previous graph is empty because we need 3 layers
sc<-ggplot(hdi,aes(CPI.2015,HDI.2015))
sc
sc + geom_point()
#Adding my Facets layer
#Region- Discrete Variable in our data set
sc+geom_point()+facet_grid(Region~.)
#Adding my Statistics layer
sc+geom_point(aes(color=Region),size=3) + facet_grid(Region~.)+stat_smooth()
#Coordinates
sc+geom_point(aes(color=Region),size=3) + facet_grid(Region~.)+stat_smooth()+
  coord_cartesian(xlim=c(0.75,1))
#Theme
#can also expand using ggthemes package
sc+geom_point(aes(color=Region),size=3)+stat_smooth()+theme_minimal()
