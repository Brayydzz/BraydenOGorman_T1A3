require "tty-prompt"
require "tty-font"
require "colorize"
require 'csv'
require_relative 'methods'

$users = CSV.open("user_data.csv", "r").read
$current_user = {}


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

# update_user_data
start_menu

# update_user_data
# overwrite users.csv with $users



