library(tidyverse)
star<-starwars
star
View(star)
filter(star,species=="Droid")
filter(star,species=="Droid",homeworld=="Tatooine")
##filter with a logical operator &,|,!
filter(star,eye_color=="red"|eye_color=="yellow"|eye_color=="orange",species=="Human")
#select function
#select keeps the variables you mention
select(star,name,birth_year,homeworld,species,starships)
select(star,name,homeworld:starships)
select(star,ends_with("color"))
select(star,name,vehicls,starships,everything)
#mutate adds a new variable and preserves the rest
star<-mutate(star,bmi=mass/(height/100)^2)
select(star,name:bmi)
#transmute adds a new variabe and drops the rest
star.trans<-transmute(star,bmi2=mass/((height/100)^2))
star.trans

#arrange
arrange(star,mass)
#desc- descending order
arrange(star,desc(mass))
#grouping and summarizing
#we take the data and split into groups and put the info into 1 row
#group by function
star.species<-group_by(star,species)
summarize(star.species,avg.height=mean(height,na.rm=T))

#sampling data
sample_n(star,10)
sample_frac(star,0.1)
