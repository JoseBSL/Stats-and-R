#Explanatory videos
#dplyr, easier to code data manipulation
install.packages("dplyr")
#load library
library(dplyr)


dat<- read.csv("femaleMiceWeights.csv")
View(dat)

controls<- filter(dat, Diet=="chow")
View(controls)

controls <- select(controls, Bodyweight)

unlist(controls)

controls<- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist

