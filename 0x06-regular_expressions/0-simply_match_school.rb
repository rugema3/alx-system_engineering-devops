#!/usr/bin/env ruby

def find_school_occurrences(input)
  matches = input.scan(/School/)
  matches.join
end

# Get the first command-line argument
input = ARGV[0]

# Call the custom method to find and print the occurrences of "School"
puts find_school_occurrences(input)
