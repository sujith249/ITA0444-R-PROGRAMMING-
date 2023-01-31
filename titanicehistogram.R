library(tidyverse)
getwd()
df<-read.csv("C:/Users/hp/Documents/titanic.csv")
df<-as.tibble(df)
df$Survived <-as.factor(df$Survived)
df$Pclass <-as.factor(df$Pclass)
df$Sex <-as.factor(df$Sex)
df$Embarked <-as.factor(df$Embarked)
df
hist<-ggplot(data=df, aes(x=Age))
hist+geom_histogram()
#The warning shows up as to removed 177 rows because those rows do not have a value for age
#bin  is a range of values
#here it has picked up the bins as 30
## so we reset the bin
hist+geom_histogram(binwidth = 5)
#adding color
hist+geom_histogram(binwidth = 5,color="darkslategrey")
# adding fill and alpha. apha shows the transparency of the bins. 1 is completely solid

hist+geom_histogram(binwidth = 5,color="darkslategrey", fill ="darkslategrey",alpha=0.5)
#giving title
hist+geom_histogram(binwidth = 5,color="darkslategrey", fill ="darkslategrey",alpha=0.5)+ggtitle("Age Distribution on the Titanic")+
labs(y="Number of Passengers",x="Age")+theme_minimal()
