df <- read.csv('student-mat.csv', sep=';')
head(df)
summary(df)
any(is.na(df))    #are there any null values?
str(df)           #check for data types, factors(categories), etc

install.packages('corrgram')
install.packages('corrplot')
install.packages('ggthemes')
install.packages('dplyr')

library(ggplot2)
library(ggthemes)
library(dplyr)

#Understand the correlation and consider only numberic columns
num.cols <- sapply(df, is.numeric)
print(num.cols)

cor.data <- cor(df[, num.cols])
print(cor.data)

library(corrgram)
library(corrplot)

print(corrplot(cor.data, method = 'color'))

corrgram(df)

help("corrgram")

corrgram(df, order=TRUE, lower.panel = panel.shade, 
         upper.panel = panel.pie, text.panel = text)
