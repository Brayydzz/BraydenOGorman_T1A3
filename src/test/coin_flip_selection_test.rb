require "test/unit/assertions"
include Test::Unit::Assertions
require_relative "../methods"

results = ["HEADS", "TAILS"]
assert(results.include? coin_flip)
results = []
assert_false(results.include? coin_flip)
