# DataFrames Basics

state.x77
states <- state.x77
u <- USPersonalExpenditure
w <-women

states <- state.x77
head(states)
tail(states)
summary(states)
str(states)

# Available built in Data Frames in R
data()

days <- c('mon','tue','wed','thu','fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
df <- data.frame(days,temp,rain)
df

str(df)

#Ref: www.pieriandata.com