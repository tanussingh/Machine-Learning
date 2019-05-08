# Creating a Matrix
# A matrix will allow us to have a 2-dimensional data 
# structure which contains elements consisting of the same 
# data type.

v <- 1:10
v

matrix(v)
matrix(v,nrow=2)

matrix(1:12, byrow = FALSE, nrow=4)
matrix(1:12, byrow = TRUE,  nrow=4)
matrix(1:12, nrow=4) # default byrow is FALSE

# Creating Matrices from Vectors
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)
stocks <- c(goog,msft)
stocks
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)
stock.matrix

days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
stock.matrix

#Ref: www.pieriandata.com
