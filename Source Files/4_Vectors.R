# Vector Basics
# A vector is a 1 dimensional array that can hold character, 
# numeric, or logical data elements.

# combine function c(). 
# pass in the elements we want in the array, with each individual 
# element separated by a comma.

nvec <- c(1,2,3,4,5)
class(nvec)

cvec <- c('U','S','A')
class(cvec)

lvec <- c(TRUE,FALSE)
lvec
class(lvec)

# We can't mix data types of the elements in an array, 
# R will convert the other elements in the array to force 
# everything to be of the same data type. Later on we will 
# learn about the list  data structure that can take on 
# multiple data types!
  
v <- c(FALSE,2)
v
class(v)

v <- c('A',1)
v
class(v)

# Vector Names
temps <- c(72,71,68,73,69,75,71)
temps

names(temps) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps

days <- c('','Tue','Wed','Thu','Fri','Sat','Sun')
temps2 <- c(1,2,3,4,5,6,7)
names(temps2) <- days
temps2

#Ref: www.pieriandata.com