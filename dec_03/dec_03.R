# advent_of_code_2024
# Day 3
# 2024-12-03
# Neil Murray
# https://github.com/neil-murray/advent_of_code_2024

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Puzzle 1 ---------------
# ~~~~~~~~~~~~~~~~~~~~~~~~

# Get data

input <- readLines("input.txt")


# We want to match text according to the pattern "mul(mmm,nnn)" where mmm and 
# nnn are 1-3 digits long
matches <- gregexpr(pattern = "mul\\([1-9]([0-9]{1,2})?,[1-9]([0-9]{1,2})?\\)", text = input)
extracted <- regmatches(input, matches)

# Get data into data frame
mults <- data.frame(text = unlist(extracted))

mults$operands <- regmatches(mults$text, gregexpr(pattern = "[1-9]([0-9]{1,2})?", text = mults$text))

mults$LHS <- sapply(mults$operands, function(x) as.numeric(x[[1]])) 
mults$RHS <- sapply(mults$operands, function(x) as.numeric(x[[2]]))

# Find products and total
mults$products <- mults$LHS * mults$RHS

total_product <- sum(mults$products)


# ~~~~~~~~~~~~~~~~~~~~~~~~
# Puzzle 2 ---------------
# ~~~~~~~~~~~~~~~~~~~~~~~~

