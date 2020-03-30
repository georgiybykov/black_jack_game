require_relative 'card'
require_relative 'cards_deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'

class Game
  BET_SIZE = 10

  def initialize(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @game_bank = 0
    @deck = CardsDeck.new
    @deck.shuffle!
  end

  def start_game
    first_deal_of_cards

    if @player.points == 21
      puts 'Black Jack!'
      game_results
    else
      game_info(:hidden)
      puts "Game bank: #{@game_bank = BET_SIZE * 2} $"
      player_step
    end
  end

  private

  def first_deal_of_cards
    2.times do
      @player.hand.add_card(@deck.take_a_card)
      @dealer.hand.add_card(@deck.take_a_card)
    end
  end

  def game_info(choise)
    puts %(
      Player hand: #{@player.hand.show_cards}
      Points: #{@player.points}
      Player bank account: #{@player.bank_account - BET_SIZE} $
    )
    puts %(
      Dealer hand: #{@dealer.show_hand_cards(choise)}
      Points: #{@dealer.show_hand_points(choise)}
      Dealer bank account: #{@dealer.bank_account - BET_SIZE} $
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
      when 1
        game_info(:hidden)
        dealer_step
        break
      when 2
        @player.hand.add_card(@deck.take_a_card) if @player.hand.cards.size < 3
        game_info(:hidden)
        dealer_step
        break
      when 3
        game_info(:open)
        game_results
      end
    end
  end

  def dealer_step
    if @dealer.points >= 17
      player_step
    elsif @dealer.points < 17 && @dealer.hand.cards.size < 3
      @dealer.hand.add_card(@deck.take_a_card)
      player_step
    end
  end

  def game_results
    if (@player.points > 21 && @dealer.points > 21) || @player.points == @dealer.points
      standoff
    elsif @player.points > 21
      winner(@dealer)
    elsif @dealer.points > 21 || @player.points > @dealer.points
      winner(@player)
    else
      winner(@dealer)
    end
  end

  def winner(player)
    puts 'Standoff!' if player.nil?
    puts "Winner is #{player.name}"
    player.take_money(@game_bank)
    @game_bank = 0
    puts "Winner bank account is #{player.bank_account} $"
  end

  def standoff
    @player.take_money(BET_SIZE)
    @dealer.take_money(BET_SIZE)
    @game_bank = 0
  end
end
