###Central limit theorem in practice week 2


#Foor loop

#null distribution mean(treatment)-mean(control)

#mean(abs(null>obs))

#qqnorm(nulls) Which makes a qqplot comparin obs data to the theoretical null distribution
#qqline 



# T test in practice


obs<- mean(treatment)-mean(control)

se<- sqr(var/N+var/N)

tstat <- obs/se

#1-tstat (one tail), to know 
#We will use a t approximation when we think that the original data
#follow a normal distribution but our sample data doesn't fit a normal

#t test in practice II

library(dplyr)
dat<- read.csv("data/femaleMiceWeights.csv")

control<- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist

treatment <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist


ttest<- t.test(treatment, control)

#When we use ttest we assume that the original data is normally distributed

qqnorm(control)
qqline(control)

#load data
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)
#Exercises

#Exercise 1)

#Second paragrap
n<- 100
 x<- sample(1:6,n, replace=T)
mean(x==6)

#3rd paragraph

n<-10000
p<-1/6
var<-p*(1-p)/n
z = (mean(x==6) - p) / sqrt(p*(1-p)/n)

#No I have to set.seed to 1 and replicate it to permorm simulation

set.seed(1)
n <- 100
p <- 1/6
z <- replicate(10000,{
  x <- sample(1:6,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(z)
qqline(z)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

#Exercise 2)

set.seed(1)
n <- 5
p <- 0.5
z <- replicate(10000,{
  x <- sample(1:6,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 

qqnorm(z)
qqline(z)

set.seed(1)
n <- 30
p <- 0.5
z <- replicate(10000,{
  x <- sample(1:6,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(z)
qqline(z)

set.seed(1)
n <- 30
p <- 0.01
z <- replicate(10000,{
  x <- sample(1:6,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(z)
qqline(z)

set.seed(1)
n <- 100
p <- 0.01
z <- replicate(10000,{
  x <- sample(1:6,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(z)
qqline(z)


library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist


mux<- mean(X)
