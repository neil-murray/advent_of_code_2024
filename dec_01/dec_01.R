# Advent of Code 2024
# Day 1:  Historian Hysteria
# By:     Neil Murray
# Date:   24/01/2025
# Ver:    R 4.4.1


# Load input file
input <- read.table("input_day1.txt", col.names = c("group1", "group2"))

# Part 1 ------------------------------------------------------------------

# Pair numbers in groups 1 and 2 in size order
paired <- data.frame(group1 = sort(input$group1), group2 = sort(input$group2))


paired$dist <- abs(paired$group1 - paired$group2)

total_dist <- sum(paired$dist)



# Part 2 ------------------------------------------------------------------

# How many times are elements in group1 matched in group2
paired$num_matches <- sapply(paired$group1, function(x) sum(paired$group2 == x))

paired$similarity <- paired$num_matches * paired$group1


total_similarity <- sum(paired$similarity)
