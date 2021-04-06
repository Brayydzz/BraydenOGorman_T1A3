require "tty-prompt"
require "tty-font"

def prompt_instance
    TTY::Prompt.new
end

def font_instance
    TTY::Font.new(:doom)
end

# Start menu selection
def start_menu
    system("clear")
    font = font_instance
    prompt = prompt_instance
    puts font.write("WELCOME TO FLIP BET")
    prompt.select("Select option!") do |menu|
        menu.choice "START", -> {login_menu}
        menu.choice "HOW TO PLAY", -> {how_to}
        menu.choice "EXIT"
    end
end

# Main terminal menu
def main_menu
    system("clear")
    font = font_instance
    prompt = prompt_instance
    puts font.write("MAIN MENU")
    prompt.select("Select option!") do |menu|
        menu.choice "PLAY", -> {play}
        menu.choice "LEADERBOARD"
        menu.choice "LOG OUT", -> {start_menu}
    end
end

# LOGIN/SIGN UP menu selection
def login_menu
    system("clear")
    prompt = prompt_instance
    prompt.select("Select option!") do |menu|
        menu.choice "LOGIN", -> {main_menu}
        menu.choice "SIGN UP", -> {main_menu}
        menu.choice "BACK", -> {start_menu}
    end
end

# Function that runs coin face selection/Betting
def play
    font = font_instance
    if coin_flip == coin_flip_selection
        system("clear")
        $win_streak += 1
        if $win_streak >= 2
            $user_balance += ((user_bet_amount) * $win_streak) 
            system("clear")
            puts "YOU WON!!! New Balance: $#{$user_balance} || Current Win Streak Multipier: #{$win_streak}x"
        else
            $user_balance += user_bet_amount
            system("clear")
            puts "YOU WON!!! New Balance: $#{$user_balance} || Current Win Streak: #{$win_streak}"
        end
    else 
        $user_balance -= user_bet_amount
        $win_streak -= $win_streak
        system("clear")
        puts "ooof, sorry that was incorrect. NEW BALANCE: $#{$user_balance} || Current Win Streak: #{$win_streak}"
        if $user_balance == 0
            system("clear")
            $user_balance += 50
            puts "I can see you ran out of money. Here is $50 on the house. Goodluck! NEW BALANCE: $#{$user_balance}"
        end
    end
    play_again
end

# Generate coin flip output
def coin_flip
font = font_instance
    if rand(1..2) == 1
        coin = "Heads"
    else 
        coin = "Tails"
    end    
    return coin
end

# Fuction that allows user to input bet amount via input
def user_bet_amount
    system("clear")
    font = font_instance
    puts font.write("Current Balance: $#{$user_balance}")
    prompt = prompt_instance
    prompt.ask("How much you would like to bet? Please only input a number: $", convert: :int) do |q|
        q.in 0..$user_balance
        q.messages[:convert?] = "Please input a number value only"
        q.messages[:range?] = "Insufficient funds, Please try again"
    end
end

# Function that allows user to select heads or tails
def coin_flip_selection
    system("clear")
    prompt = prompt_instance
    font = font_instance
    puts font.write("Heads or Tails?")
    prompt.select("Select whether you think the coin will land on Heads or Tails?") do |menu|
        menu.choice "Heads"
        menu.choice "Tails"
    end
end

# Play again menu selection
def play_again
    puts "-----------------------------------------------------------------------"
    font = font_instance
    prompt = prompt_instance
    puts font.write("Play again?")
    prompt.select("Would you like to play again?") do |menu|
        menu.choice "YES", -> {play}
        menu.choice "NO", -> {main_menu}
    end
end

def how_to
    system("clear")
    font = font_instance
    prompt = prompt_instance
    puts font.write("How To Play")
    prompt.select("", show_help: :never) do |menu|
        menu.choice "Back", ->{start_menu}        
    end
end