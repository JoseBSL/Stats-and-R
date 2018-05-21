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

install.packages("downloader")
library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

#Creating foler and moving files to it
#dir.create("data")
file.rename("msleep_ggplot2.csv", "data/msleep_ggplot2.csv")
file.rename("femaleControlsPopulation.csv", "data/femaleControlsPopulation.csv")
file.rename("femaleMiceWeights.csv", "data/femaleMiceWeights.csv")
file.rename("mice_pheno.csv", "data/mice_pheno.csv")


dat<- read.csv("data/msleep_ggplot2.csv")
View(dat)
class(dat)
#load library dplyr
library(dplyr)
?filter
dat_primates<- filter(dat, order=="Primates")
nrow(dat_primates)
View(dat_primates)
dat_primates_sleep<- select(dat_primates, sleep_total) %>% unlist

class(dat_primates_sleep)
mean(dat_primates$sleep_total)
mean(dat_primates_sleep)
?summarize
#another different way to unlist
dat_primates %>% summarise(mean= mean(sleep_total))


