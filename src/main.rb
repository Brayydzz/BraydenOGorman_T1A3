require "tty-prompt"
require "tty-font"
require "colorize"
require 'csv'
require 'json'
require_relative 'methods'

$users = CSV.open("user_data.csv", "r").read
$current_user = {}
    
# leaderboard
# p $users

start_menu


