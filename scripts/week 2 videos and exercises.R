#Week 2

#Example from a paper

# Body weight was higher in mice fed the high fat diet

#16.3+- 0.1 What doe it means

#P value concept

library(dplyr)

dat <- read.csv("data/femaleMiceWeights.csv")


control<- filter(dat, Diet=="chow") %>% select (Bodyweight) %>%unlist 

#I can do unlist directly or not

treatment <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>%unlist
#Checking treatments
control
treatment
#When we compare average we could say hf produe heavier mice

mean(control)
mean(treatment)

#These two variables, are what we called in stats random variables

#We have acces to the entire population of mice

population <- read.csv("data/femaleControlsPopulation.csv")
population
population <- unlist(population)

mean(sample(population, 12))
mean(treatment)
mean(control)
#High fat diet does male the difference?
# Can we see a difference like this by chance

mean(population)

set.seed(1)
sam <- sample(population, 5)
?abs
abs(mean(sam)- mean(population))

?set.seed

set.seed(5)
sam <- sample(population, 5)
abs(mean(sam)- mean(population))

# Introduction to null distributions
####

####

### Introduction to null distributions
library(dplyr)

dat <- read.csv("data/femaleMiceWeights.csv")


control<- filter(dat, Diet=="chow") %>% select (Bodyweight) %>%unlist 

#I can do unlist directly or not

treatment <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>%unlist
#Checking treatments
control
treatment

obs <- mean(treatment)- mean(control)

population <- read.csv("data/femaleControlsPopulation.csv")

population <- unlist(population)

#null hypothesis: Is no difference
#Often called as H0
#Analogous to presumption of innocence principle

control <- (sample(population, 12))

treatment <-(sample(population, 12))

 mean(treatment)-mean(control)

n <- 10000
nulls<- vector("numeric", n)
for(i in 1:n){
  control <- (sample(population, 12))
  
  treatment <-(sample(population, 12))
  nulls[i] <- mean(treatment)-mean(control)
}

max(nulls)

hist(nulls)

mean(nulls>obs)

mean(abs(nulls)>obs)
#This is a p-value
#Small p- values reject the null hypothesis
#Fixed arbitrary tresshold (alpha)
#p value [0,1]
#p-value less than the significance level, reject null hypothesis
#however, it doesnt prove that the tested hypothesis is true
#alpha level is related to the confidence intervals and is selected by us
#if we want to 95% confident, 

######Exercises
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
#1 and 2(adding one 0 to n))

set.seed(1)
n<- 1000
vec<- vector("numeric", n)
for(i in 1:n){
  sam <- (sample(x, 5))
vec[i]<- mean(sam)
  
}

mean(abs(vec - mean(x))  > 1)
#This is the other way that I was trying but I wasn't to put in place

mean(vec>(mean(x)+1)|vec<(mean(x)-1))

#3) 

set.seed(1)
n<- 1000
vec<- vector("numeric", n)
for(i in 1:n){
  sam <- (sample(x, 50))
  vec[i]<- mean(sam)}

mean(abs(vec - mean(x))  > 1)


#The interaction number almost doesn't change the random variable
#Changes in sample size, change random variable and its distribution

###Video Probability distributios

#1078 heights of adult men
#histogram with the heights->summarize of the data

#F(a)=Pr(Height<=a)

##### Exercises

install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)

#Now we create a vector with year 1952 and lifeExp
library(dplyr)
x<- filter(gapminder, year=="1952") %>% select(lifeExp) %>% unlist
#Now hist
#without unlist hist(x$lifeExp)
hist(x)

mean(x<=40)

a<- mean(x<=60)
b<-mean(x<=40)
a-b

#plot ecdf R 
plot(ecdf(gapminder$lifeExp)) 
?ecdf
#The probability of having values lower or equal than x for a given x
#Now we create the function

prop = function(q) {
  mean(x <= q)
}
prop(10)
qs = seq(from=min(x), to=max(x), length=20)
qs
props = sapply(qs, prop)
props = sapply(qs, function(q) mean(x <= q))
plot(ecdf(x))
plot(props)


