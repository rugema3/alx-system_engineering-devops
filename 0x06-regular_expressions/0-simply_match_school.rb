#!/usr/bin/env ruby
ARGV.each do |arg|
  match_result = arg.match(/School/)
  puts match_result ? "Match found: #{match_result}" : "No match found."
end

