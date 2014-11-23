## These functions work together to:
      ## Create a matrix
      ## Calculate the inverse of the matrix
      ## Cache the inverse of the matrix
      ## Recall the matrix or its inverse

## The makeCacheMatrix function creates a list of functions for a given matrix
      ## These functions can be used to set or retrieve a matrix or its inverse

makeCacheMatrix <- function(x = matrix()) {
      i <- NULL
      set <- function(y) {
            x <<- y
            i <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) i <<- inverse
      getinverse <- function() i
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## The cacheSolve function retrieves a cached value for the inverse of a matrix
      ## If the inverse is not yet cached, it calculates and caches it

cacheSolve <- function(x, ...) {
      i <- x$getinverse()
      if(!is.null(i)) {
            message("getting cached data")
            return(i)
      }
      
      i <- solve(x$get())
      x$setinverse(i)
      i
}
