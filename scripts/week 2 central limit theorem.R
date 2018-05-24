####Week 2 central limit theorem

#### Normal distribution video

#### Gaussian distribution, bell curve

#average  mu
#sd  sigma
#If teh distribution has a normal distribution, we can know almost everything

#quantile quantile plot
#x axes percentiles of normal distribution
#y axes the percentiles of our data
#If these points fall on the same line it means that they have the same distribution

###Standadized units
#How many standards deviations am I away from the mean
#It helps to avoid units
#Formula Z(i)=Xi-X(mean)/sd(x)

#When the data is not normally distributed sd and mean won't be as meaningful

#load data

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

n<- 1000
vec<-vector("numeric", n)

for (i in 1:n) {
  sam<- sample(x,5)
  vec[i]<- mean(sam)
}
  
  
  set.seed(1)
n<-1000
vec1 <- vector("numeric", n)

for (i in 1:n) {

  sam<- sample(pnorm(x),50)
  vec1[i]<- mean(sam)
}
#2)
mean(vec1>23&vec1<25)
mean(vec1)
sd(vec1)

?pnorm
pnorm((25-23.9)/0.43) - pnorm((23 - 23.9)/0.43)

#3) Same question but with normal distribution with mean=23.9 and sd=0.43
pnorm(23, mean =23.9 , sd = 0.43)
pnorm(25, mean =23.9 , sd = 0.43)

#pnorm(25,23.9,0.43)
#pnorm((25-23.9)/0.43)

#same outcome, basically we are calculating the probability of being 
#Because is a Z statistic what I obrtain is the proability of being at the left of the first number
#Probability of being less than 25 minus the probability of being less than 23 is the P of being between 25 and 23

#POPULATION, PARAMETERS AND SAMPLE ESTIMATES

#population that we havent seen before and we want to know if men are 
#taller than women
#How many people do we need
#Random sample
#Differences in mean
#Statistical inference helps with that


#How close is the population sample to the sample average
#Next module will describe central limit theorem


library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 
#remove missing values
dat <- na.omit( dat )

library(dplyr)
View(dat)

#Exercise 1) body weight of all males on the control (chow) diet

x<- filter(dat, Sex=="M" & Diet=="chow" ) %>% select(Bodyweight) %>% unlist
mean(x)


#Exercise 2) use the popsd function to compute the population standard deviation 
library(rafalib)

?popsd
# Pop sd basically divides by N (population sd) instead of n-1 (sample sd)
popsd(x)


#Exercise 3) Set the seed at 1. Take a random sample X of size 25 from x. What is the sample average? 

set.seed(1)
 X<- sample(x,25)

mean(X)
# 32.0956 This is the sample average

#Exercise 4)  Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet. What is this population's average? 

#load library
library(dplyr)

y<- filter(dat, Sex=="M"& Diet=="hf") %>% select(Bodyweight) %>% unlist

mean(y)


#Exercise 5) Now use the rafalib package and use the popsd function to compute the population standard deviation. 

#load library
library(rafalib)
popsd(y)

#Exercise 6) Set the seed at 1. Take a random sample Y of size 25 from y. What is the sample average?

set.seed(1)
Y <- sample(y, 25)
mean(Y)
mean(y)

#Exercise 7) What is the difference in absolute value between y−x and Y−X?

abs((mean(y)-mean(x))-(mean(Y)-mean(X)))

#Exercise 8) 

x<- filter(dat, Sex=="F" & Diet=="chow" ) %>% select(Bodyweight) %>% unlist
set.seed(1)
X<- sample(x,25)
y<- filter(dat, Sex=="F"& Diet=="hf") %>% select(Bodyweight) %>% unlist
set.seed(1)
Y <- sample(y, 25)
abs((mean(y)-mean(x))-(mean(Y)-mean(X)))

####Central limit theorem video

#sample average follow a normal distribution

#X~N(mux,sdx/sqr(M))

#With higher number of sample the spread is smaller


#####Centrali limit theorem exercises

#Exercise 1) and exercise 2)

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

# For every distribution there are four commands
#d”	returns the height of the probability density function
#“p”	returns the cumulative density function
#“q”	returns the inverse cumulative density function (quantiles)
#“r”	returns randomly generated numbers

pnorm(1)-pnorm(-1)
#0.6826895
pnorm(2)-pnorm(-2)
#0.9544997

#Exercise 3)

pnorm(3)-pnorm(-3)
#0.9973002


#Exercise 4) Define y to be the weights of males on the control diet.
#What proportion of the mice are within one standard deviation away from the average weight 
#(remember to use popsd for the population sd)? 

library(dplyr)
View(dat)

y<- filter(dat, Sex=="M", Diet=="chow" ) %>% select(Bodyweight) %>% unlist

z<- (y-mean(y))/popsd(y)

mean(abs(z)<=3)


#)Exercise 5,6,7

#)Exercise 8

#)Exercise 9

y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

mean(avgs)
sd(avgs)
