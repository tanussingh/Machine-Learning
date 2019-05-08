# Logical Operators
# AND - &
# OR - |
# NOT - !

x <- 10
x < 20
x > 5
x < 20 & x > 5
(x < 20) & (x>5)
(x < 20) & (x>5) & (x == 10)
x==2 & x > 1
x==2 | x > 1
x==1 | x==12
(10==1)
!(10==1)
!!(10==1)

df <- mtcars
df
df[df['mpg'] >= 20,] # Notice the use of indexing with the comma
# subset(df,mpg>=20) # Could also use subset

df[(df['mpg'] >= 20) & (df['hp'] > 100),]

tf <- c(TRUE,FALSE)
tt <- c(TRUE,TRUE)
ft <- c(FALSE, TRUE)
tt & tf
tt | tf
ft && tt
tt && tf
tt || tf
tt || ft

# while loops
# while (condition){
    # Code executed here 
    # while condition is true
  #}
#
print('Just a string')
var <- 'a variable'
cat('My variable is: ',var)
var <- 25
cat('My number is:',var)
# Could also use:
print(paste0("Variable is: ", var))

x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  # add one to x
  x <- x+1
}

x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  # add one to x
  x <- x+1
  if(x==10){
    print("x is equal to 10! Terminating loop")
  }
}

# break

x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  # add one to x
  x <- x+1
  if(x==10){
    print("x is equal to 10!")
    print("I will also print, woohoo!")
  }
}

x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  # add one to x
  x <- x+1
  if(x==10){
    print("x is equal to 10!")
    break
    print("I will also print, woohoo!")
  }
}

# for loops
#  for (temporary_variable in object){
    # Execute some code at every loop
  #}

vec <- c(1,2,3,4,5)
for (temp_var in vec){
  print(temp_var)
}

for (i in 1:length(vec)){
  print(vec[i])
}

li <- list(1,2,3,4,5)
for (temp_var in li){
  print(temp_var)
}

for (i in 1:length(li)){
  print(li[[i]]) # Remember to use double brackets!
}

mat <- matrix(1:25,nrow=5)
mat
for (num in mat){
  print(num)
}

# Nested for loops
for (row in 1:nrow(mat)){
  for (col in 1:ncol(mat)){
    print(paste('The element at row:',row,'and col:',col,'is',mat[row,col]))
  }
}

# Introduction to Functions

help(sum)

hello <- function(){
  print('hello!')
}

hello()

helloyou <- function(name){
  print(paste('hello ',name))
}
helloyou('Sammy')

add_num <- function(num1,num2){
  print(num1+num2)
}
add_num(5,10)

hello_someone <- function(name='Frankie'){
  print(paste('Hello ',name))
}

hello_someone()
hello_someone('Sammy')

formal <- function(name='Sam',title='Sir'){
  return(paste(title,' ',name))
}
formal()
formal('Issac Newton')

var <- formal('Marie Curie','Ms.')
var

# Multiplies input by 5
times5 <- function(input) {
  result <- input ^ 2
  return(result)
}

# pow_two(4)

v <- "I'm global v"
stuff <- "I'm global stuff"
fun <- function(stuff){
  print(v) 
  print(stuff)
  stuff <- 'Reassign stuff inside func'
  print(stuff)
}
print(v) #print v
print(stuff) #print stuff
fun(stuff) # pass stuff to function
# reassignment only happens in scope of function
print(stuff)

# So what is happening above? The following happens
# print(v) will check for the global variable v, the outer scope
# print(stuff) will also check for the global variable stuff
# fun(stuff) will accept an argument stuff, print out v, and then 
# reassign stuff (in the scope of the function) and print out stuff. 
# Notice two things:
#  The reassignment of stuff only effects the scope of the stuff variable inside the function
#  The fun function first checks to see if v is defined at the function scope, if not (which was the case) it will then search the global scope for a variable names v, leading to it printing out "I'm global v".
#  Check out the function below and make sure you understand it:
  
double <- function(a) {
  a <- 2*a
  a
}

var <- 5
double(var)
var

#Ref: www.pieriandata.com