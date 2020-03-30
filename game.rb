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
    @deck.shuffle! # ADD MORE SHUFFLE TO CARDS DECK    !!!
    @playing = false
  end

  def start_game
    take_start_cards
    player_hand_info
    dealer_hand_info(:hidden)
    puts "Game bank: #{@game_bank = BET_SIZE * 2} $"
  end

  private

  def take_start_cards
    2.times do
      @player.hand.add_card(@deck.take_a_card)
      @dealer.hand.add_card(@deck.take_a_card)
    end
  end

  def player_hand_info
    puts %(
      Player hand: #{@player.show_cards(:open)}
      Points: #{@player.show_hand_points(:open)}
      Player bank account: #{@player.bank_account - BET_SIZE} $
    )
  end

  def dealer_hand_info(choise)
    puts %(
      Dealer hand: #{@dealer.show_cards(choise)}
      Points: #{@dealer.show_hand_points(choise)}
      Dealer bank account: #{@dealer.bank_account - BET_SIZE} $
    )
  end

  def player_step(action = nil)
    case action
    when :skip_step
      dealer_step
    when :add_card
      @player.hand.add_card(@deck.take_a_card) if @player.hand.cards.size < 3
      dealer_step
    when :open_cards
      player_hand_info
      dealer_hand_info(:open)
      game_results
    end
  end

  def dealer_step
    if @dealer.points >= 17
      palyer_step
    elsif @dealer.points < 17 && @dealer.hand.cards.size < 3
      @dealer.hand.add_card(@deck.take_a_card)
      palyer_step
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
  end

  def standoff
    @player.take_money(BET_SIZE)
    @dealer.take_money(BET_SIZE)
    @game_bank = 0
  end
end
