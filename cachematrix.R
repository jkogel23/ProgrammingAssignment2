#### This function creates a special "matrix" object that can cache its inverse.
## found framework for function doing a google search


makeCacheMatrix <- function(x = matrix()) {

	  inv = NULL
        message("in makecacheMatrix")

## store matrix in cache

        set = function(y) {
                # use `<<-` to assign a value to an object in an environment 
                # different from the current environment. 
                x <<- y
                inv <<- NULL
		    message("storing matrix in cache")
        }
## create a generic vector of functions to get and set a matrix and inverse matrix
        get = function() x
        setinv = function(inverse) inv <<- inverse 
        getinv = function() inv
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}
