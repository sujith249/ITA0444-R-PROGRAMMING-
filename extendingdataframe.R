#Creating a data frame
title<-c("Star Wars","The Empire Strikes Back","Return of the Jedi","The Phantom Menace","Attack of the Clones","Revenge of the Sixth")
year<-c(1922,1988,1977,1999,2000,2005)
length.min<-c(121,124,133,133,142,135)
box.office.mil<-c(787,534,572,1027,657,849)

my.data<-data.frame(title,year,length.min,box.office.mil)

my.data
#Adding a column Method 1
mark<- c(37.5,34.75,34.25,0,0,0.75)
carrie<-c(13.5,22.5,21.5,0,0,0.5)
my.data$MarkScreenTime<-mark
my.data$CarrieScreenTime<-carrie
my.data
#Adding a column Method 2
my.data[["MarkScreenTime"]]<-mark
my.data[["CarrieScreenTime"]]<-carrie
my.data

#Removing a variable from the data frame
my.data$MarkScreenTime<-NULL
my.data$CarrieScreenTime<-NULL

#using cbind to expand 
my.data<-cbind(my.data,MarkScreenTime = mark, CarrieScreenTime = carrie)
my.data

#using rbind to expand
#rogueOne<-data.frame(title="Rogue One",year= 2016,length.min=133,box.office.mil=1051,mark=2,carrie=0.25)
rogueOne
my.data
library("dplyr")
df3<-bind_rows(my.data,rogueOne)
df3S
