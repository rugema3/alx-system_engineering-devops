#!/usr/bin/env ruby

# Get the first command-line argument
input = ARGV[0]

# Define the regular expression pattern
pattern = /School/

# Match the pattern against the input and print the result
match_result = input.scan(pattern).join

# Print the matched result
puts match_result + "$"


