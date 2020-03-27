# frozen_string_literal: true

require_relative 'hand'

class Player
  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank_account = 100
  end

  def get_card(card)
    @hand << card
  end

  def reset_hand
    @hand = Hand.new
  end

  def show_hand_points(choise = :close)
    case choise
    when :close
      hidden_hand_points
    when :open
      @hand.hand_points
    end
  end

  def show_cards(choise = :close)
    case choise
    when :close
      hidden_cards
    when :open
      @hand.show_cards
    end
  end

  def make_a_bet(value)
    raise 'You do not have money to make a bet' unless value <= @bank_account

    @bank_account -= value
  end

  def take_money(value)
    @bank_account += value
  end

  private

  def hidden_hand_points
    @hand.hand_points
  end

  def hidden_cards
    @hand.show_cards
  end
end
