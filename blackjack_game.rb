#!/usr/bin/env ruby
require_relative 'hand.rb'
require_relative 'deck.rb'

########################
# METHODS
########################

def will_hit?(hand)
 print "Hit or stand (H/S)?"
  answer = gets.chomp.downcase
  validate_input(answer, hand)
  if answer == 'h' || answer == 'hit'
    @hitstand = true
  elsif answer == 's' || answer == 'stand'
    @hitstand = false
  end
end

def hit_or_stand(hand)
  if @hitstand == true
    @game_deck.deal_card(hand)
    output_score(hand)
  else
    "The player has chosen to stand."
  end
end

def validate_input(answer, hand)
  unless answer == 'h' || answer == 'hit' || answer == 's' || answer == 'stand'
    puts "That is not a valid input."
    hit?(hand)
  end
end

def output_score(hand)
  puts "#{hand.player} score: #{hand.best_score}"
end

####################
#     Setup
###################

@game_deck = Deck.new

player_hand = Hand.new("Player")
dealer_hand = Hand.new("Dealer")

@game_deck.shuffle

puts "Welcome to Blackjack!"

####################
#   Player's turn
####################

@game_deck.deal_card(player_hand)
@game_deck.deal_card(player_hand)

output_score(player_hand)

will_hit?(player_hand)
hit_or_stand(player_hand)

while @hitstand == true && player_hand.best_score < 21
  will_hit?(player_hand)
  hit_or_stand(player_hand)
end

output_score(player_hand)

if player_hand.best_score > 21
  puts "Bust! Game over..."
  exit
end

####################
#  Dealer's turn
####################

@game_deck.deal_card(dealer_hand)
@game_deck.deal_card(dealer_hand)
output_score(dealer_hand)

while dealer_hand.best_score < 17
  "The dealer hits."
  @game_deck.deal_card(dealer_hand)
  output_score(dealer_hand)
end

if dealer_hand.best_score > 21
  puts "Dealer busts! You win!"
  exit
elsif dealer_hand.best_score > player_hand.best_score
  puts "Sorry, you lose! Better luck next time!"
elsif dealer_hand.best_score == player_hand.best_score
  puts "Push! The hand is a draw, and you keep your bet."
else
  puts "You win!"
end
