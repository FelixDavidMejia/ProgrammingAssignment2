#Creating test matrixes
squarematrix <- matrix(c(1,1,1,3,4,3,3,3,4), nrow=3, ncol=3) #this matrix is the initial data to be passed to the makeCacheMatrix function
anothersquarematrix <- matrix(c(1,0,5,2,1,6,3,4,0), nrow=3, ncol=3) #this matrix is the initial data to be passed to the makeCacheMatrix function
notasquarematrix <- matrix(c(1,1,1,3,4,3), nrow=3, ncol=2) #this matrix is the initial data to be passed to the makeCacheMatrix function
squarematrixnoinv <- matrix(c(4,6,-6,-9), nrow=2, ncol=2)

#Test with a square matrix (1)
m <- makeCacheMatrix(squarematrix) #using makeCacheMatrix as a constructor for object "m"
m$get() #getting data
m$setinverse(cacheSolve(m)) #setting inverse and caching it
m$setinverse(cacheSolve(m)) #setting inverse from cache, note message
m$getinverse() #get the inverse
m$set(anothersquarematrix) #change data in matrix
m$getinverse() #get inverse matrix, which has not been calculated yet
m$setinverse(cacheSolve(m)) #setting inverse and caching it
m$getinverse() #get the inverse
m$setinverse(cacheSolve(m)) #setting inverse from cache, note message

#Test with a square matrix with no inverse (2)
m <- makeCacheMatrix(squarematrixnoinv) #using makeCacheMatrix as a constructor for object "m"
m$get() #getting data
m$setinverse(cacheSolve(m)) #setting inverse and caching it
             
#Test with a not square matrix (3)
m <- makeCacheMatrix(notasquarematrix) #using makeCacheMatrix as a constructor for object "m"
m$get() #getting data
m$setinverse(cacheSolve(m)) #setting inverse and caching it
m$setinverse(cacheSolve(m)) #setting inverse from cache, note message
m$getinverse() #get the inverse