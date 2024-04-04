## Put comments here that give an overall description of what your
## functions do
## This function creates a special "matrix" object that can cache its inverse.
## It provides methods to set and get the matrix, as well as to compute and
## cache its inverse. The inverse is computed using the solve function in R.


## Write a short comment describing this function
# Function to create a special "matrix" object that caches its inverse
makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        #set the matrix
        set <- function(matrix) {
                x <<- matrix
                inverse <<- NULL  # Invalidate cache when the matrix is set
        }
        # get function
        get <- function() {
                x
        }
        # computing the inverse of the matrix
        cacheSolve <- function(...) {
                if (!is.null(inverse)) {
                        message("Getting cached inverse.")
                        return(inverse)
                }
                inv <- solve(x, ...)
                inverse <<- inv
                inv
        }
        list(set = set, get = get, cacheSolve = cacheSolve)

}


## Write a short comment describing this function
## Function to compute the inverse of the cached matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        x$cacheSolve(...)
}
