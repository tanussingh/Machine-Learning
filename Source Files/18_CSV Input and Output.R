# CSV Input and Output
# CSV stands for comma separated variable and its one of the most 
# common ways we'll be working with data throughout this course. 
# The basic format of a csv file is the first line indicating the 
# column names and the rest of the rows/lines being data points 
# separated by commas. One of the most basic ways to read in csv files 
# in R is to use read.csv() which is built-in to R. 

ex <- read.csv('example.csv')

str(ex)
colnames(ex)
df <- data.frame(ex)
head(df)
help(read.csv)
read.table('example.csv')
read.table(file = 'example.csv', sep = ',')

# fread() is similar to read.table but faster and more convenient:
# fread('example.csv')

### Alternatively
write.csv(df, file = "foo.csv")
fread('foo.csv')

## or without row names
### Alternatively
write.csv(df, file = "foo.csv",row.names = FALSE)
fread('foo.csv')

#Ref: www.pieriandata.com