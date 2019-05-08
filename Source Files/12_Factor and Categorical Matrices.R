# Factor and Categorical Matrices

animal <- c('d','c','d','c','c')
id <- c(1,2,3,4,5)

# Nominal - No Order
# Ordinal - Order
factor.ani <- factor(animal)
factor.ani
ord.cat <- c('cold','med','hot')

temps <- c('cold','med','cold','med','hot','hot','cold')
fact.temp <- factor(temps,ordered=TRUE,levels=c('cold','med','hot'))
fact.temp
summary(temps)
summary(fact.temp)

#Ref: www.pieriandata.com
