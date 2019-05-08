# Comparison Operators
# In R we can use comparison operators to compare variables 
# and return logical values. 
5 > 6
6 > 5

v1 <- c(1,2,3)
v2 <- c(10,20,30)
v1 < v2

6 >= 6
6 >= 5
6 >= 7
3 < 2
2 <= 2

# Be very careful with comparison operators and negative numbers! Use spacing to keep things clear. 
# An example of a dangerous situation:
var <- 1
var
var < -2
var <- 2
var

5 != 2
5 != 5
5 == 5
2 == 3

# Vector Comparisons
# We can apply a comparison of a single number to an entire vector
v <- c(1,2,3,4,5)
v < 2
v == 3

#Ref: www.pieriandata.com
