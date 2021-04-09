require "tty-prompt"
require "tty-font"
require "colorize"
require 'csv'
require 'json'
require_relative 'methods'

$users = CSV.open("user_data.csv", "r").read
$current_user = {}

if ARGV.include? "help"
    file = File.read('how_to_play.json')
    how_to=JSON.parse(file)
    puts how_to 
    abort
end

start_menu
