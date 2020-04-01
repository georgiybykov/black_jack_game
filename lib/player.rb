# frozen_string_literal: true

require_relative 'exception'
require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank_account

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank_account = 100
  end

  def reset_hand
    @hand = Hand.new
  end

  def draw_card(card)
    @hand.add_card(card)
  end

  def make_a_bet(value)
    raise PlayerDoesntHaveMoney unless value <= @bank_account

    @bank_account -= value
  end

  def get_money(value)
    @bank_account += value
  end

  def show_hand_points(choise = :hidden)
    case choise
    when :hidden
      hidden_hand_points
    when :open
      points
    end
  end

  def show_hand_cards(choise = :hidden)
    case choise
    when :hidden
      hidden_cards
    when :open
      @hand.show_cards
    end
  end

  def points
    @hand.hand_points
  end

  def cards_count
    @hand.cards.size
  end
end
