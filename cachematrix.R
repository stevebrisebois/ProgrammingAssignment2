## makeCacheMatrix and cacheSolve are a pair of functions that allows caching of 
## expensive computation on a matrix.
## 
## Example: 
##    mat <- matrix(c(2, 2, 3, 2), nrow=2)
##    specialMat <- makeCacheMatrix(mat)
##    inverse <- cacheSolve(specialMat)
## 
## Example 2:
##    mat <- makeCacheMatrix()
##    mat$set(matrix(c(2, 2, 3, 2), nrow=2))
##    inverse <- cacheSolve(mat)

## makeCacheMatrix encapsulate a matrix and returns functions that will be used 
## get: Get the source matrix
## set: Set the source matrix
## (private) getinverse: 
##    Returns the cached inverse of the source matrix. 
##    Do not use directly since it can return null.
## (private) setinverse: set the inverse matrix, 
makeCacheMatrix <- function(x = matrix()) {
        
        ##
        inverseCache <- NULL
        
        ## set source matrix
        set <- function(y) {
                x <<- y
                inverseCache <<- NULL ## clear cache
        }
        
        ## returns source matrix
        get <- function() x
        
        ## 
        setinverse <- function(inverse) inverseCache <<- inverse
        
        ## 
        getinverse <- function() inverseCache
        
        ## 
        list(set = set, 
             get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
        
}

## cacheSolve takes an object built with makeCacheMatrix and returns the cached inverse matrix. 
## Verify that a cached value exists, otherwise it will create the cached inverse matrix.
## Once you use created a special matrix with makeCacheMatrix, you should access the 
## inverse via cacheSolve instead of directly calling getinverse/setinverse on the special matrix.
cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        
        if(!is.null(m)){
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
