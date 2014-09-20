rm(list=ls())
setwd("D:/Dev/Courses/programmingassignment2/")
source("cachematrix.R")
a <- matrix(c(2, 2, 3, 2), nrow=2)
b <- solve(a)
c <- makeCacheMatrix(a)
d <- cacheSolve(c)


e <- makeCacheMatrix()
e$set(a)
f <- cacheSolve(e)
f