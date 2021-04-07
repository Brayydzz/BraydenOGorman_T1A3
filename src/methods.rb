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
        menu.choice "LOGIN", -> {login}
        menu.choice "SIGN UP", -> {sign_up}
        menu.choice "BACK", -> {start_menu}
    end
end

# Allows user to login with user details
def login
    prompt = prompt_instance
    username, password = get_user_details
    user_data = find_username(username)
    if user_data[1] == password
        $current_user[:username] = user_data[0]
        $current_user[:password] = user_data[1]
        $current_user[:balance] = user_data[2]
        $current_user[:streak] = user_data[3]
        prompt.select("Succesful Login!") do |menu|
            menu.choice "CONTINUE", -> {main_menu}
        p $current_user
    end
    end
end

# signs up new user
def sign_up
    prompt = prompt_instance
    balance = 250
    streak = 0
    username, password = get_user_details
    username_taken = find_username(username)
    if username_taken == false    
        append_to_csv(username, password, balance, streak)
    else
        system('clear')
        prompt.select("The username you have entered already exists. Please try again") do |menu|
        menu.choice "TRY AGAIN", -> {sign_up}
        menu.choice "BACK TO MENU", ->{start_menu}
        end
    end
    login_menu
end

# Appends signup details to csv
def append_to_csv(username, password, balance, streak)
    CSV.open("user_data.csv", "a") do |csv|
        csv << [username,password, balance, streak]
    end
end

def find_username(username)
    $users.each do |line|
        if line[0] == username
            return line
        end
    end
    return false
end

# Allows user to input username and password to create to user/login.
def get_user_details
    prompt = prompt_instance
    system("clear")
    username = prompt.ask("Please enter username:") do |q|
    end
    password = prompt.ask("Please enter password:") do |q|
    end
    return username, password
end

# Function that runs coin face selection/Betting. Also multiplier bonus
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
    return (rand(1..2) == 1 ? "HEADS" : "TAILS")
end

# Function that allows user to select heads or tails
def coin_flip_selection
    system("clear")
    prompt = prompt_instance
    font = font_instance
    puts font.write("Heads or Tails?")
    prompt.select("Select whether you think the coin will land on Heads or Tails?") do |menu|
        menu.choice "HEADS"
        menu.choice "TAILS"
        menu.choice "BACK", -> {main_menu}
    end
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

# How to play menu selection in Start menu
def how_to
    system("clear")
    font = font_instance
    prompt = prompt_instance
    puts font.write("How To Play")
    prompt.select("", show_help: :never) do |menu|
        menu.choice "Back", -> {start_menu}        
    end
end