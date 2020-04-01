# frozen_string_literal: true

# require 'pry'
require_relative 'interface'
require_relative 'cards_deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'

class Game
  BET_SIZE = 10

  ACTIONS = {
    skip_step: 1,
    add_card: 2,
    open_cards: 3
  }.freeze

  def initialize
    @interface = Interface.new
    @player = Player.new(@interface.greeting)
    @dealer = Dealer.new
    bets
    reset_cards_deck
  end

  def start_game
    first_deal_of_cards
    @interface.show_game_bank(@game_bank)

    if @player.points == 21
      @interface.black_jack?
      @interface.show_game_info(@player, @dealer, :open)
    else
      @interface.show_game_info(@player, @dealer, :hidden)
      player_step
    end
    game_results
  end

  private

  def bets
    @player.make_a_bet(BET_SIZE)
    @dealer.make_a_bet(BET_SIZE)
    @game_bank = BET_SIZE * 2
  end

  def reset_cards_deck
    @player.reset_hand
    @dealer.reset_hand
    @deck = CardsDeck.new
    @deck.shuffle!
  end

  def first_deal_of_cards
    2.times do
      @player.draw_card(@deck.take_a_card)
      @dealer.draw_card(@deck.take_a_card)
    end
  end

  def player_step
    @interface.player_step_menu
    loop do
      action = gets.chomp.to_i
      case action
      when ACTIONS[:skip_step]
        return ACTIONS[:open_cards] if @player.cards_count == 3

        @interface.show_game_info(@player, @dealer, :hidden)
        dealer_step
        break
      when ACTIONS[:add_card]
        return ACTIONS[:open_cards] unless @player.cards_count < 3

        @player.hand.add_card(@deck.take_a_card)
        @interface.show_game_info(@player, @dealer, :hidden)
        dealer_step
        break
      when ACTIONS[:open_cards]
        @interface.show_game_info(@player, @dealer, :open)
        break
      else
        @interface.not_right_step?
      end
    end
  end

  def dealer_step
    if @dealer.points >= 17
      player_step
    elsif @dealer.points < 17 && @dealer.cards_count < 3
      @dealer.draw_card(@deck.take_a_card)
      player_step
    end
  end

  def game_results
    if (@player.points > 21 && @dealer.points > 21) || @player.points == @dealer.points
      tie
    elsif @player.points > 21
      winner(@dealer)
    elsif @dealer.points > 21 || @player.points > @dealer.points
      winner(@player)
    else
      winner(@dealer)
    end
  end

  def winner(player)
    player.get_money(@game_bank)
    @game_bank = 0
    @interface.show_winner(player)
  end

  def tie
    @player.get_money(BET_SIZE)
    @dealer.get_money(BET_SIZE)
    @game_bank = 0
    @interface.show_tie(@player, @dealer)
  end
end
