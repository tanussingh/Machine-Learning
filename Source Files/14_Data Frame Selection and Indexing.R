# Data Frame Selection and Indexing

days <- c('mon','tue','wed','thu','fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(TRUE, TRUE, FALSE, FALSE, TRUE)

df <- data.frame(days,temp,rain)
df

df[1,]
df[,1]
df[5,]
df[,'rain']
df[1:5,c('days','temp')]
df$rain
df$days
df['rain'] # same as df$rain vs it returns column
rain
df['days']
subset(df,subset=rain==TRUE)

subset(df,subset= temp>23)
sorted.temp <- order(df['temp'])
df[sorted.temp,]
sorted.temp
desc.temp <- order(-df['temp'])
df[desc.temp,]

sort.temp <- order(df$temp)
df[sort.temp,]

#Ref: www.pieriandata.com