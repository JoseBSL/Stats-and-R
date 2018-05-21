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

