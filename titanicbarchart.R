library(tidyverse)
bar<-ggplot(df,aes(x=Survived))
#To plot the number of people who survived on the Titanic
bar+geom_bar() +theme_light()+ labs(y="Passenger Count",title="Surival Rate on the Titanic")
#Adding aesthetics using fill for the Survived variable
bar<-ggplot(df,aes(x=Survived, fill= factor(Survived)))
bar+geom_bar() +theme_light()+ labs(y="Passenger Count",title="Surival Rate on the Titanic")
#Same way if we wish to find the gender of people who survived
bar<-ggplot(df,aes(x=Sex, fill= factor(Survived)))
bar+geom_bar() +theme_light()+ labs(y="Passenger Count",title="Surival Rate by Gender on the Titanic")
#Adding a facet layer to categorize as class
bar+geom_bar() +theme_light()+ labs(y="Passenger Count",title="Surival Rate by Gender on the Titanic")+
  facet_wrap(~Pclass)
#facet_grid is also available but it is better suitable to work with two discrete variables
# ~ means 'by'
#To categorize based on Gender by Passenger Class
bar+geom_bar() +theme_light()+ labs(y="Passenger Count",title="Surival Rate by Gender on the Titanic")+
  facet_wrap(Sex~Pclass)
# Three classes - Class 1,2,3
