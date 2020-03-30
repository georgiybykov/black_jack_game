# frozen_string_literal: true

require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank_account

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank_account = 100
  end

  # def get_card(card)
  #   @hand.add_card(card)
  # end

  # def reset_hand
  #   @hand = Hand.new
  # end

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

  # def make_a_bet(value)
  #   raise 'You do not have money to make a bet' unless value <= @bank_account

  #   @bank_account -= value
  # end

  def take_money(value)
    @bank_account += value
  end

  def points
    @hand.hand_points
  end
end
