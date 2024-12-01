# advent_of_code_2024
# Day 1
# 2024-12-01
# Neil Murray
# https://github.com/neil-murray/advent_of_code_2024

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Puzzle 1 ---------------
# ~~~~~~~~~~~~~~~~~~~~~~~~

# Import data
input <- read.delim("input.txt", 
                    sep = "", 
                    header = F, 
                    col.names = c("group1", "group2"))


# Sort individual columns in ascending order
grp1_sort <- sort(input$group1)
grp2_sort <- sort(input$group2)

# Create df from sorted data
input_sorted <- data.frame(grp1_sort, grp2_sort)

# Get distance between location_id pairs
input_sorted$distance <- abs(input_sorted$grp2_sort - input_sorted$grp1_sort)

# Total distance
total_dist <- sum(input_sorted$distance)


# ~~~~~~~~~~~~~~~~~~~~~~~~
# Puzzle 2 ---------------
# ~~~~~~~~~~~~~~~~~~~~~~~~


# For each element of grp1_sort, check for equality with elements of grp2_sort
# and total number of matches
input_sorted$num_matches <- sapply(input_sorted$grp1_sort, function(x) { sum(input_sorted$grp2_sort == x) })


# Generate similarity score
input_sorted$similarity <- input_sorted$grp1_sort * input_sorted$num_matches

# Total similarity score
total_similarity <- sum(input_sorted$similarity)
