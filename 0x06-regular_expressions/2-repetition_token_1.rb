#!/usr/bin/env ruby

def find_hbtn_matches(input)
  matches = input.scan(/hb?t?n/)
  matches.join
end

# Get the first command-line argument
input = ARGV[0]

# Call the custom method to find and print the matches
puts find_hbtn_matches(input)

