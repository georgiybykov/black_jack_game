# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def show
    [@suit, @value]
  end
end
