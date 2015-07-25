## These functions create an special matrix object (1) which is able to
## calculate its inverse matrix. As the computation of an inverse matrix
## can be cpu intensive, the results of the inverse computation is cached (2),
## so it does not have to be recalculated until the matrix data changes.
## A function to verify if the matrix is square has been added (3), because
## only square matrixes have an inverse matrix. Also another auxiliar function
## which tests if the matrix is invertible has been added.
##
## A separate program, cachematrixtest.R, has been provided for testing
## purposes if needed.

## Function makeCacheMatrix (1): This is the constructor for the
## special matrix object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL #inverse matrix set to NULL on new object instance
  
  ##function for setting the matrix value for the object
  set <- function(y) {
    x <<- y
    invm <<- NULL #inverse matrix set to NULL on matrix set
  }
  
  ##function for getting the original matrix
  get <- function() x
  
  ##function for setting the inverse matrix
  setinverse <- function(solve) invm <<-solve
  
  ##function for getting the inverse matrix
  getinverse <- function() invm
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Function cacheSolve (2): This function caches the object inverse matrix, so, if
## it has been already calculated, it does not calc it again.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invm <- x$getinverse()
        
        ## if inverse has been already calculated return the cached result
        if(!is.null(invm)) {
          message("getting cached inverse matrix")
          return(invm)
        }
        
        ## if inverse matrix has not been calculated, then do it
        data <- x$get() #getting original matrix data
        
        if (issquare(data)) {
          if (isinvertible(data)) {
            ## calc the inverse if original matrix is square
            invm <- solve(data, ...)
            x$setinverse(invm)
            invm            
          } else {
            ## Warning for non invertible matrix
            message("Matrix is square, but not invertible.")
          } #if isinvertible(data)
        } else {
          ## if not a square matrix, catch the error and issue a warning message
          message("Matrix must be square.")
        } #end if
} #end of cacheSolve

## Function issquare (3): This function determines if argument
## (a matrix) is square or not.
issquare <- function(mymat) { #Is this matrix square
  #Returns:
  # 0: Not a square matrix
  # 1: Square matrix
  # 2: Not a matrix
  if (is.matrix(mymat)) {
    if (nrow(mymat) == ncol(mymat)) {
      message("It is a square matrix.")
      return(1)      
    } else {
      return(0)
      message("Not a square matrix.") 
    }
  } else {
    message("Not a matrix.")
    return(2)
  }
}

## Function isinvertible (4): This function determines if matrix
## is invertible or not.
isinvertible <- function(m) class(try(solve(m),silent=T))=="matrix"