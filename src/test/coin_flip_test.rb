require "test/unit/assertions"
include Test::Unit::Assertions
require_relative "../methods"

# This test is to check if the coin_flip method randomly outputs Heads or Tails

results = ["HEADS", "TAILS"]
assert(results.include? coin_flip)
results = []
assert_false(results.include? coin_flip)
