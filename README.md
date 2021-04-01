# Brayden O'Gorman - T1A3 Terminal Application

## Software Development Plan

### Purpose and Scope

FlipBet:

### **Describe at a high level what app will do:**

Flip bet is a terminal base application that will allow users to make bets on whether a coin will flip on heads or tails.
The user begins at $250
Users will be able to sign-up and log in and out of the app via a username and password.
if the user guesses correctly they will be awarded with double the amount of bet.
if the user guesses incorrectly they will lose the amount they bet
each time a user guesses correctly in a row they will be awarded a multiplier
example:
if user guesses correctly 2 times in a row = 2x multiplier on bet
if user guesses correctly 3 times in a row = 3x multiplier on bet

If user balance reaches $0 they will be returned back to $50 so user can keep playing 
The goal? To beat the current record holder Jeff Bezos who is sitting on $20000. 
Can you bet correctly to reach the top of the leader board?

### **Identify the problem it will solve and explain why you are developing:**
Since the COVID-19 pandemic hit our society last year. It has lead to us to be locked down in our homes for long periods of time.
This has caused a lot of us to be stuck at home with not much to do. 
Whether you just want a break from your daily 9 - 5 grind at home or you are simply bored and want to pass some time. 
Flipbet is a great way to challenge yourself or your friends & family to a simple fun game that you can use.

### **Identify target audience:**

Because this is a Command-line interface based app. Users will need have an intermediate level of computer knowledge
to access the app. Such as computer programers, software engineers or general computer lovers.

### **Explain how a member of the target audience will use it:**

Users will need to have access to a terminal client such as Terminal on macOS or Ubuntu for Windows. 
They will also need Ruby installed on their computer along side with the knowledge to now how to run the ruby application.(Instructions will be added to Help README)
Once in the app, users will be prompted with simple instructions on how it works, along side with the easy to use UI to interact with the app.

### **Features:**

- User will be able to either sign-up or log in and out application via username and password and will be stored in csv file. This will allow the user $ balance to be stored in CSV file and can be accessed once logged in.

- Users will be able to bet a $ amount on whether a coin will flip heads or tails. Coin flip will be randomly generated. If user guesses correctly, they will be awarded with double the amount the originally bet. If user guesses incorrectly they will lose the amount the originally bet.

- User will be awarded with a multiplier bonus for having consecutive correct guesses. The bonus is calculated by multiplying the winning bet by how many.Multiplier bonus will be output and shown when user is inputting bet amount

- The current leader board can be accessed via the interactive menu. This leader board will show where the current user is placed. It will also show the "default" leaders on the leader board such as Jeff Bezos on $20000, Elon Musk on $15000 and Bill Gates on $10000. Prompts will be shown when the user has surpassed these values.

- Use of TTY-Prompt/colorize ruby gem to make the user experience more interactive and a lot more fun to play around with.
