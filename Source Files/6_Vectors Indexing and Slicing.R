# Vector Indexing and Slicing
# You can use bracket notation to index and access individual elements 
# from a vector:
  
v1 <- c(100,200,300)
v2 <- c('a','b','c')
v1
v2

v1[2]
v2[2]

v1[c(1,2)]
v2[c(2,3)]
v2[c(1,3)]

# Slicing
# You can use a colon (:) to indicate a slice of a vector. 
# The format is: vector[start_index:stop_index]
v <- c(11,23,36,4,5,6,7,8,9,10)
v[2:4]
v[7:10]

# Indexing with Names
v <- c(1,2,3,4)
names(v) <- c('a','b','c','d')
v
v['a']

v[c('a','c','b')]
v
v[v>2]
filter <- v>2
filter
v[filter]

#Ref: www.pieriandata.com