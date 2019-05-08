# Matrix Selection and Indexing
# matrix[rows,columns]

mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

# Grab first row
mat[1,]

#Grab first column
mat[,1]

# Grab first 3 rows
mat[1:3,]

mat[1:2,1:3]
mat[,9:10]
mat[2:3,5:6]

#Ref: www.pieriandata.com