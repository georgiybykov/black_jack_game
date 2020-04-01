# frozen_string_literal: true

require_relative 'player'
require_relative 'hand'

class Dealer < Player
  def initialize(name = 'Dealer')
    super
  end

  def make_a_bet(value)
    raise DealerDoesntHaveMoney unless value <= @bank_account

    @bank_account -= value
  end

  private

  def hidden_hand_points
    '**'
  end

  def hidden_cards
    cards = []
    @hand.cards.size.times { cards << ['*', '*'] }
    cards
  end
end
