require_relative 'card.rb'

class Hand
attr_accessor :cards, :player
  def initialize(player)
    @cards = []
    @player = player
  end

  def non_ace_score
    score = 0

    @cards.each do |card|
      if card.rank.is_a? Fixnum
        score += card.rank
      elsif card.is_face_card?
        score += 10
      end
    end

    score
  end

  def ace_count
    ace_count = 0

    @cards.each do |card|
      if card.is_ace?
        ace_count += 1
      end
    end

    ace_count
  end

  def ace_score
    case
    when ace_count == 0
      0
    when non_ace_score < (11) - (ace_count - 1)
     11 + (ace_count - 1)
    when non_ace_score >= (11) - (ace_count - 1)
      ace_count
    end
  end

  def best_score
    non_ace_score + ace_score
  end

end
