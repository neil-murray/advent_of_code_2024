# Advent of Code 2024
# Day 2:  Red-Nosed Reports
# By:     Neil Murray
# Date:   24/01/2025
# Ver:    R 4.4.1

input <- readLines("input_day2.txt") 

input <- sapply(input, 
                strsplit, 
                split = " ", 
                USE.NAMES = FALSE) |> lapply(as.integer)


# Part 1 ------------------------------------------------------------------

# Safe report has elements  all increasing or all decreasing with diffs between 1 and 3

check_safe <- function(x) {
  
  v1 <- x[-length(x)]
  v2 <- x[-1]
  
  d <- v2 - v1
  
  if((all(d > 0) || all(d < 0)) && max(abs(d)) <= 3) TRUE else FALSE

}


# How many are safe
num_safe <- sum(sapply(input, check_safe)) 



# Part 2 ------------------------------------------------------------------


