require "pry"

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
 rand(10) + 1
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
 gets.chomp
end
 
def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  cards = deal_card + deal_card 
  display_card_total cards
  cards
end

def hit?(total)
  prompt_user
  input = get_user_input
  
  valid_inputs = ["h", "s"]
  if !valid_inputs.find {|command| command === input}
    invalid_command
    hit?(total)
  end
  
  total += deal_card if input == "h"
  
  total
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  total = initial_round
  while total < 21 do
    total = hit? total
    display_card_total total
  end
  end_game(total)
end
    
