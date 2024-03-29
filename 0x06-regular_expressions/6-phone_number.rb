#!/usr/bin/env ruby

def match_phone_number(input)
  matches = input.match(/^\d{10,10}$/)
  matches ? matches[0] : ""
end

# Get the first command-line argument
input = ARGV[0]

# Call the custom method to find and print the matched result
puts match_phone_number(input)

