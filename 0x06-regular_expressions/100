#!/usr/bin/env ruby

def extract_data(input)
  matches = input.scan(/(?:\G\[|\s)\w+:(.*?)(?=\]|\s|$)/)
  matches.map { |match| match[0] }.join(",")
end

# Get the first command-line argument
input = ARGV[0]

# Call the custom method to find and print the extracted data
puts extract_data(input)
