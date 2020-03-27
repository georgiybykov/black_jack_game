# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze


  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def show
    [@value, @suit]
  end
end
