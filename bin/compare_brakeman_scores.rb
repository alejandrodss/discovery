
# Brakeman scores is a table such:
# Summary

#      Warning Type      Total
# Command Injection      5
# Cross-Site Scripting   5
# Dangerous Send         1
# Dynamic Render Path    11
# File Access            1
# Format Validation      3
# Mass Assignment        10
# Redirect               2
# Remote Code Execution  2
# SQL Injection          8


# this script expects to receive the those values separated by spaces
# Command Injection 5 Cross Site Scripting 5 Dangerous Send 1 Dynamic Render Path 11 File Access 1 Format Validation 3 Mass Assignment 10 Redirect 2 Remote Code Execution 2 SQL Injection 8

# the scripts compares the scores from the manifest in the master branch
# versus the scores on the current branch, all scores are expected to be
# lower than in the master branch or in the worst case, remain the same.

# Example
#                                         scores from master                                          scores from current branch
# `ruby bin/compare_brakeman_scores.rb    "Command Injection 5 Mass Assignment 5 SQL Injection 1"     "Command Injection 5 Mass Assignment 5 SQL Injection 2"`
#
# if the second parameter (scores from current branch) has one value higher than its pair from
# the master branch, the script will raise an exception.

current_scores = ARGV[0].scan(/\s*(\D+)\s(\d+)/).to_h
new_scores = ARGV[1].scan(/\s*(\D+)\s(\d+)/).to_h

puts "Comparing Brakeman scores"
puts current_scores.inspect
puts new_scores.inspect

new_scores.each do |key, new_value|
  if new_value.to_i > current_scores[key].to_i
    raise "New flaws were added, The are now #{new_value} warnings of #{key}"
  end
end
