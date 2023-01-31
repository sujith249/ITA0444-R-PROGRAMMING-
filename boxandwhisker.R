library(tidyverse)
my.box<-ggplot(df,aes(x=Survived, y= Age))
#geom_jitter
#aesthetics can be defined anywhere in the lower layers as well. If defined in the beginning it will be inherited in all the layers
#setting the geom_jitter and the outlier withn the boxplot
my.box+geom_boxplot(outlier.colour="red",outlier.shape=4)+geom_jitter(width=0.2,aes(color=Sex))
labs(title="Sutrvival Rate on the Titanic Based on Age and Gender")+theme_light
#inherit.aes=FALSE -prohibits the given layer from inheriting aesthetics
#adding cordinates layer
my.box+geom_boxplot(outlier.colour="red",outlier.shape=4)+geom_jitter(width=0.2,aes(color=Sex))
labs(title="Sutrvival Rate on the Titanic Based on Age and Gender")+theme_light+coord_flip()
