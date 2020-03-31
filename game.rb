# frozen_string_literal: true

# require 'pry'
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

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    bets
    reset_cards_deck
  end

  def start_game
    first_deal_of_cards
    puts "Game bank: #{@game_bank} $"

    if @player.points == 21
      puts 'Black Jack!'
      game_info(:open)
    else
      game_info(:hidden)
      player_step
    end
    game_results
  end

  private

  def reset_cards_deck
    @player.reset_hand
    @dealer.reset_hand
    @deck = CardsDeck.new
    @deck.shuffle!
  end

  def bets
    @player.make_a_bet(BET_SIZE)
    @dealer.make_a_bet(BET_SIZE)
    @game_bank = BET_SIZE * 2
  end

  def first_deal_of_cards
    2.times do
      @player.draw_card(@deck.take_a_card)
      @dealer.draw_card(@deck.take_a_card)
    end
  end

  def game_info(choise)
    puts %(
      #{@player.name}'s hand: #{@player.hand.show_cards}
      Points: #{@player.points}
      #{@player.name}'s bank account: #{@player.bank_account} $
    )
    puts %(
      Dealer hand: #{@dealer.show_hand_cards(choise)}
      Points: #{@dealer.show_hand_points(choise)}
      Dealer bank account: #{@dealer.bank_account} $
    )
  end

  def player_step
    puts %(
      Type number to make a step:
        1. Skip step
        2. Add card
        3. Open cards
    )
    loop do
      action = gets.chomp.to_i
      case action
      when ACTIONS[:skip_step]
        return ACTIONS[:open_cards] if @player.cards_count == 3

        game_info(:hidden)
        dealer_step
        break
      when ACTIONS[:add_card]
        return ACTIONS[:open_cards] unless @player.cards_count < 3

        @player.hand.add_card(@deck.take_a_card)
        game_info(:hidden)
        dealer_step
        break
      when ACTIONS[:open_cards]
        game_info(:open)
        break
      else
        puts 'It is a mistake. Type right step number!'
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
    puts 'It is a tie!' if player.nil?
    puts "Winner is #{player.name}"
    player.get_money(@game_bank)
    @game_bank = 0
    puts "Winner bank account is #{player.bank_account} $"
  end

  def tie
    puts "It is a tie between #{@player.name} and #{@dealer.name}!"
    @player.get_money(BET_SIZE)
    @dealer.get_money(BET_SIZE)
    @game_bank = 0
    puts "#{@player.name} bank account is #{@player.bank_account} $"
    puts "#{@dealer.name} bank account is #{@dealer.bank_account} $"
  end
end
