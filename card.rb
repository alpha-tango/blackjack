class Card
  attr_reader :suit, :rank

  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def is_face_card?
    if (@rank == 'K' || @rank == 'Q' || @rank == 'J')
      true
    else
      false
    end
  end

  def is_ace?
    if @rank == "A"
      true
    else
      false
    end
  end

end
