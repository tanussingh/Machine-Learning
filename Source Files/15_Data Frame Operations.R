# Data Frame Operations

c1 <- 1:10 # vector of integers
c2 <- letters[1:10] # vector of strings
df <- data.frame(col.name.1=c1,col.name.2=c2)
df

d2 <- read.csv("example.csv")
d2 <- read.csv('some.file.name.csv')

# For Excel Files
# Load the readxl package
install.packages("readxl")
library(readxl)

# Call info from the sheets using read.excel
df <- read_excel('Sample-Sales-Data.xlsx',sheet='Sheet1')

# Output to csv
write.csv(df, file='some.file.csv')
nrow(df)
ncol(df)
colnames(df)
rownames(df)

nrow(d2)
ncol(d2)
colnames(d2)
rownames(d2)

df <- read.csv("911.csv")

vec <- df[[5, 2]] # get cell by [[row,col]] num
newdf <- df[1:5, 1:2] # get multiplt cells in new df

c1 <- 1:10 # vector of integers
c2 <- letters[1:10] # vector of strings
df <- data.frame(col.name.1=c1,col.name.2=c2)
df[[2, 'col.name.1']] <- 99999 # reassign a single cell
df

rowdf <- df[1, ]
rowdf

vrow <- as.numeric(as.vector(df[1,]))
vrow

cars <- mtcars
head(cars)
colv1 <- cars$mpg # returns a vector
colv1

colv2 <- cars[, 'mpg'] # returns vector
colv2

colv3<- cars[, 1] # a is int or string
colv3

colv4 <- cars[['mpg']] # returns a vector
colv4

mpgdf <- cars['mpg'] # returns 1 col df
head(mpgdf)

mpgdf2 <- cars[1] # returns 1 col df
head(mpgdf2)

mpgdf3 <- cars[c('mpg', 'cyl')] # returns 1 col df
head(mpgdf3)

df2 <- data.frame(col.name.1=2000,col.name.2='new' )
df2
df

# use rbind to bind a new row!
dfnew <- rbind(df,df2)
dfnew

c1 <- 1:10 # vector of integers
c2 <- letters[1:10] # vector of strings
df <- data.frame(col.name.1=c1,col.name.2=c2)
df
df$newcol <- 2*df$col.name.1
df

df$newcol <- rep(NA, nrow(df)) # NA column
df
df[, 'copy.of.col2'] <- df$col.name.2 # copy a col
df
df[['col1.times.2']] <- df$col.name.1 * 2
df

df3 <- cbind(df, df$col.name.1)
df3
colnames(df)[2] <- 'SECOND COLUMN NEW NAME'
df

colnames(df) <- c('col.name.1', 'col.name.2', 'newcol', 'copy.of.col2' ,'col1.times.2')
df

first.ten.rows <- df[1:10, ] # Same as head(df, 10)
first.ten.rows
everything.but.row.two <- df[-2, ]
everything.but.row.two

# Conditional Selection
sub1 <- df[ (df$col.name.1 > 8 & df$col1.times.2 > 10), ]
sub1

sub2 <- subset(df, col.name.1 > 8 & col1.times.2 > 10)
sub2

df[, c(1, 2, 3)] #Grab cols 1 2 3
df[, c('col.name.1', 'col1.times.2')] # by name
df[, -1] # keep all but first column
df[, -c(1, 3)] # drop cols 1 and 3

# Dealing with Missing Data
any(is.na(df)) # detect anywhere in df
any(is.na(df$col.name.1)) # anywhere in col

# delete selected missing data rows
df <- df[!is.na(df$col), ]

# replace NAs with something else
df[is.na(df)] <- 0 # works on whole df
df$col[is.na(df$col)] <- 999 # For a selected column

#Ref: www.pieriandata.com