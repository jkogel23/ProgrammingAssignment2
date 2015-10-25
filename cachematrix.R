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

## for checking if cache exist.. if not, build matrix inverse

cacheSolve <- function(x, ...) {
        ## @x: output of makeCacheMatrix()
        ## return: inverse of the original matrix input to makeCacheMatrix()
        
        inv = x$getinv()
        
        # if the inverse has already been calculated
        if (!is.null(inv)){
                # get it from the cache and skips the computation. 
                message("Getting data from cache")
                return(inv)
        }
        
        # otherwise, calculates the inverse 
        mat.data = x$get()
	  message("calculating inverse")
        inv = solve(mat.data, ...)
        
        # sets the value of the inverse in the cache via the setinv function.
        x$setinv(inv)
        
        return(inv)

