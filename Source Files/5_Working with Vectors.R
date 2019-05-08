# Working with Vectors
v1 <- c(1,2,3)
v2 <- c(5,6,7)
v1 <- v1+v2
v1-v2
v1-v1
v1*v2
v1/v2

# Functions with Vectors
v1
sum(v1)

# https://en.wikipedia.org/wiki/Standard_deviation
# Standard Deviation - is a measure that is used to quantify the amount 
# of variation or dispersion of a set of data values.
# A low standard deviation indicates that the data points tend to be 
# close to the mean (also called the expected value) of the set, 
# while a high standard deviation indicates that the data points are 
# spread out over a wider range of values.
# The standard deviation of a random variable, statistical population, 
# data set, or probability distribution is the square root of its variance. 
# It is algebraically simpler, though in practice less robust, than the 
# average absolute deviation.A useful property of the standard 
# deviation is that, unlike the variance, it is expressed in the same 
# units as the data.

v <- c(12,45,100,2)
mean(v)
sd(v)

# https://en.wikipedia.org/wiki/Variance
# Variance is the expectation of the squared deviation of a random variable
# from its mean. Informally, it measures how far a set of (random) numbers 
# are spread out from their average value. Variance has a central role in 
# statistics, where some ideas that use it include descriptive statistics, 
# statistical inference, hypothesis testing, goodness of fit, and 
# Monte Carlo sampling. Variance is an important tool in the sciences, 
# where statistical analysis of data is common.

sd(v) ^ 2
var(v)

max(v)
min(v)
prod(v1)
prod(v2)

#Ref: www.pieriandata.com