# Lists Basics

# Lists will allow us to store a variety of data structures under a 
# single variable. This means we could store a vecor,matrix, data frame, 
# etc. under a single list. 

v <- c(1,2,3,4,5)
m <- matrix(1:10,nrow=2)
df <- women
v
m
df

li <- list(v,m,df)
li
li <- list(sample_vec = v,sample_mat = m, sample_df = df)
li$sample_vec
li$sample_mat
li$sample_df
li[1] # By index
li['sample_vec']
class(li['sample_vec'])
li[['sample_vec']]
li$sample_vec
li[['sample_vec']][1] # Second set of indexing
li[['sample_mat']]
li[['sample_mat']][1,]
li[['sample_mat']][1:2,1:2]
li[['sample_df']]['height']

double_list <- c(li,li)
double_list$sample_vec
double_list$sample_mat
double_list$sample_df
str(double_list)

#Ref: www.pieriandata.com