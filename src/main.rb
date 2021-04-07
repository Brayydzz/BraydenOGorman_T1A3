require "tty-prompt"
require "tty-font"
require "colorize"
require 'csv'
require_relative 'methods'
require_relative 'classes/user_class'

$user_balance = 1000
$win_streak = 0

$users = CSV.open("user_data.csv", "r").read
$current_user = {}

p $users
# users = []
# # each user in users is 
# [username, password, streak, balance]

# after pushing each line to users 
# users = [
#     [username, password, streak, balance]
#     [username, password, streak, balance]
#     [username, password, streak, balance]
# ]
# $current_user = {
#     username: line[0],
#     steak: line[1]
# }
# $username = line[0]
# start_menu