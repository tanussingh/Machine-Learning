# Matrix Arithmetic

mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat
2*mat
1/mat
mat/2
# Power
mat ^ 2
mat > 17
mat + mat
mat / mat
mat ^ mat

# This is not the same as Matrix Multiplication.
mat*mat
mat

mat2 <- matrix(1:9, nrow=3)
mat2
mat3 %*% mat2

mat3 <- matrix(1:12, nrow=3)
mat3
# True Matrix Multiplication from Linear Algebra
mat3 %*% mat2 # WILL not WORK
mat2 %*% mat3 # WILL WORK

#Ref: www.pieriandata.com