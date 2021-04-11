require "test/unit/assertions"
include Test::Unit::Assertions
require_relative "../methods"

# This test is to check to see if the find_username method works correctly

$users = [
    ["user1", "pass1"],
    ["user2", "pass2"],
    ["user3", "pass3"]
]

assert_equal(find_username("user2"), ["user2", "pass2"])
assert_equal(find_username("user3"), ["user3", "pass3"])
assert_equal(find_username("user4"), false)
assert_equal(find_username("user5"), false)

