# frozen_string_literal: true

require_relative 'card'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    if card.value == 'Ace'
      @cards << card
    else
      @cards.unshift(card)
    end
    @cards
  end

  def show_cards
    @cards.map(&:show)
  end

  def hand_points
    # reduce() is alias method to inject()
    @cards.reduce(0) do |sum, card|
      scr = if %w[Jack Queen King].include?(card.value)
              10
            elsif card.value == 'Ace'
              sum + 11 > 21 ? 1 : 11
            else
              card.value
            end
      sum + scr
    end
  end
end
