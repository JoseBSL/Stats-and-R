

#######First assesment

# Exercise 1  R version

Version

# Exercise 2  Average of this vector

mean(c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23))

# Exercise 3  For loop to do

result<- vector()
for (i in 1:25) {
  result <- c(result, i^2)
}
sum(result)

# Exercise 4 cars function, number of rows

class(cars)

nrow(cars)

# Exercise 5

colnames(cars)[2]

# Exercise 6

mean(cars[,2])

mean(cars$dist)

#42.98

# Exercise 7

which((cars$dist==85))


