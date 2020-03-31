# frozen_string_literal: true

require_relative 'card'

class CardsDeck
  def initialize
    @cards_deck = cards_deck_generate
  end

  def shuffle!
    @cards_deck.shuffle!
  end

  def take_a_card
    @cards_deck.pop
  end

  private

  def cards_deck_generate
    cards_deck = []
    Card::SUITS.each do |suit|
      Card::RANKS.each { |value| cards_deck << Card.new(value, suit) }
    end
    cards_deck
  end
end
