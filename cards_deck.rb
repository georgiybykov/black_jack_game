# frozen_string_literal: true

require_relative 'card'

class CardsDeck
  def inititalize
    @cards_deck = cards_deck_generate
  end

  def shuffle!
    @cards_deck.shuffle!
    nil
  end

  def pop!
    @cards_deck.pop
  end

  private

  def cards_deck_generate
    cards_deck = []
    Card::SUITS.each do |suit|
      cards_deck.concat(Card::RANKS.map { |value| Card.new(value, suit) })
    end
    cards_deck
  end
end
