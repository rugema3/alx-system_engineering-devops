#!/usr/bin/env ruby
#

def match_beginning_and_end(input)
  matches = input.match(/^h.n$/)
  matches ? matches[0] : ""
end

# Get the first command-line argument
input = ARGV[0]

# Call the custom method to find and print the matched result
puts match_beginning_and_end(input) + "$"
