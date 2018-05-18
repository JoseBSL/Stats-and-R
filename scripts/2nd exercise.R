#Example video

x<- 1:10
y<- rnorm(10)
plot(x,y)
fit<- lm(y~x)
#It is possible to save it directly to Rmd

#textbookvideo-> Already donloaded

#Rstudio for organization

dat<- read.csv("femaleMiceWeights.csv")

#1)

colnames(dat)[2]

#2) entry for row 12 and column 2

dat[12,2]


#3) weight column 

dat$Bodyweight[11]

#4) vector length

length(dat$Diet)
length(dat$Bodyweight)

#5) 

mean(dat$Bodyweight[13:24])

#two different ways of doing it
hf<- dat[13:24,]
mean(hf$Bodyweight)

#6) sample function

?sample

set.seed(1)

sample(hf$Bodyweight,1)

