## Inversing a big matrix is time-consuming process
## Below functions are used to calulate inverse of matrix just once
## thus avoiding repeated calculations.

## Clear the environment
rm(list = ls())

makeCacheMatrix <- function(x = matrix()) {

## cacheSolve takes the list(returned by makeCacheMatrix) and 
## returns mean of matrix
## The mean is calculated first time and cached using setInverse()
## Next time the value is fetched from getInverse()
## thus saving time
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}


## sample example
##    Create a big matrix
##    x is a matrix of dimension 2000 X 2000
x <- matrix(ceiling(runif(4000000, -4000000, 4000000)),2000,2000)

##    makeCacheMatrix takes x(the matrix) and returns a list of functions
f <- makeCacheMatrix(x)

##    cacheSolve takes the list returned by makeCacheMatrix 
##    and returns mean
##    first time executing takes time, as mean is actually 
##    calculated and cached
g <- cacheSolve(f)

##    next time you ask to return mean of the matrix 
##    using cachemean it instanly return the result
g <- cacheSolve(f)
