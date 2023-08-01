#!/usr/bin/env ruby

def match_capital_letters(input)
  matches = input.scan(/[A-Z]*/).join
end

# Get the first command-line argument
input = ARGV[0]

# Call the custom method to find and print the matched result
puts match_capital_letters(input)

