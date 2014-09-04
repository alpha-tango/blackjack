require_relative 'card.rb'
require_relative 'hand.rb'

class Deck

  def initialize
    @deck = make #self?
  end

  def make #self?
    deck = []

    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        deck << Card.new(suit, rank)
      end
    end
    deck
  end

  def shuffle
    @deck.shuffle!
  end

  def deal_card(a_hand)
    dealt_card = @deck.pop
    a_hand.cards << dealt_card
    puts "#{a_hand.player} was dealt #{dealt_card.suit} #{dealt_card.rank}."
  end

end
