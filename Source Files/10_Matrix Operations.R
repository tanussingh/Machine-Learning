# Matrix Operations

goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)

# Put vectors into matrix
stocks <- c(goog,msft)
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)

days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

stock.matrix
colSums(stock.matrix)

rowSums(stock.matrix)
rowMeans(stock.matrix)
# row std?

FB <- c(111,112,113,120,145)
tech.stocks <- rbind(stock.matrix,FB)
tech.stocks
avg <- rowMeans(tech.stocks)
avg
tech.stocks <- cbind(tech.stocks,avg)
tech.stocks

#Ref: www.pieriandata.com
